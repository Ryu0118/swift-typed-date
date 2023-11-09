import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics
import TypedDateCore
import Foundation

// Note: This macro does not generate a detailed DiagnosticError because it is only used in TypedDate package.
package struct EraseContextMacro: MemberMacro {
    package static func expansion(
        of node: SwiftSyntax.AttributeSyntax,
        providingMembersOf declaration: some SwiftSyntax.DeclGroupSyntax,
        in context: some SwiftSyntaxMacros.MacroExpansionContext
    ) throws -> [SwiftSyntax.DeclSyntax] {
        guard let extensionDecl = declaration.as(ExtensionDeclSyntax.self),
              let genericArgument = extensionDecl.extendedType.as(IdentifierTypeSyntax.self)?.genericArgumentClause?.arguments.first?.argument
        else {
            throw DiagnosticsError.init(diagnostics: [])
        }
        
        let baseComponents = if let identifierType = genericArgument.as(IdentifierTypeSyntax.self) {
            [identifierType.name.text]
        } else if let tupleType = genericArgument.as(TupleTypeSyntax.self) {
            tupleType.argumentTypes
        } else {
            throw DiagnosticsError.init(diagnostics: [])
        }

        return [
            try generateEraseContext(of: baseComponents).as(DeclSyntax.self),
            try generateEraseFunc(of: baseComponents).as(DeclSyntax.self)
        ].compactMap { $0 }
    }

    private static func generateEraseContext(of baseComponents: [String]) throws -> StructDeclSyntax {
        StructDeclSyntax(
            name: .identifier("_\(baseComponents.last ?? "_")EraseContext"),
            memberBlock: try MemberBlockSyntax {
                try MemberBlockItemListSyntax {
                    try MemberBlockItemSyntax(
                        decl: VariableDeclSyntax("private let base: Components")
                    )
                    let erasedComponents = baseComponents.allSubarrays().dropLast()
                    for components in erasedComponents {
                        let type = components.returnType
                        let typeName = components.last?.lowercased() ?? ""
                        MemberBlockItemSyntax(
                            decl: DeclSyntax("public let \(raw: typeName): (TypedDate<\(raw: type)>.Type, \(raw: type))")
                        )
                    }
                    try MemberBlockItemSyntax(
                        decl: InitializerDeclSyntax("init(base: Components)") {
                            """
                            self.base = base
                            \(raw: erasedComponents.map { generateInitializerCodeBlockList(of: $0) }.joined(separator: "\n"))
                            """
                        }
                    )
                }
            }
        )
    }

    private static func generateInitializerCodeBlockList(of erasedComponents: [String]) -> String {
        let type = erasedComponents.returnType
        let arguments = erasedComponents
            .enumerated()
            .map { i, _ in "base.\(i)" }
            .returnType
        return "\(erasedComponents.last!.lowercased()) = (TypedDate<\(type)>.self, \(arguments))"
    }

    private static func generateEraseFunc(of baseComponents: [String]) throws -> FunctionDeclSyntax {
        let typeName = "_\(baseComponents.last ?? "")EraseContext"
        return try FunctionDeclSyntax(
            """
             func erase<T>(
                 to keyPath: KeyPath<\(raw: typeName), (TypedDate<T>.Type, T)>,
                 calendar: Calendar = .current
             ) -> TypedDate<T> {
                 let context = \(raw: typeName)(base: components)[keyPath: keyPath]
                 return context.0.init(context.1, calendar: calendar)
             }
            """
        )
    }
}
