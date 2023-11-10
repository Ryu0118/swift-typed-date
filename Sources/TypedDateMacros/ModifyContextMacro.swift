import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics
import TypedDateCore
import Foundation

// Note: This macro does not generate a detailed DiagnosticError because it is only used in TypedDate package.
package struct ModifyContextMacro: MemberMacro {
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
            try generateModifyContext(of: baseComponents).cast(DeclSyntax.self),
            try generateModifyingFunc(of: baseComponents).cast(DeclSyntax.self),
            try generateModifyFunc(of: baseComponents).cast(DeclSyntax.self),
        ]
    }

    private static func generateModifyContext(of baseComponents: [String]) throws -> StructDeclSyntax {
        StructDeclSyntax(
            name: .identifier("_\(baseComponents.last ?? "_")ModifyContext"),
            memberBlock: try MemberBlockSyntax {
                try MemberBlockItemListSyntax {
                    try MemberBlockItemSyntax(
                        decl: VariableDeclSyntax("private let base: Components")
                    )
                    for component in baseComponents {
                        let typeName = component.lowercased()
                        MemberBlockItemSyntax(
                            decl: DeclSyntax("public let \(raw: typeName): (\(raw: component), (\(raw: component)) -> Components)")
                        )
                    }
                    try MemberBlockItemSyntax(
                        decl: InitializerDeclSyntax("init(base: Components)") {
                            """
                            self.base = base
                            \(raw: generateInitializerCodeBlockList(of: baseComponents))
                            """
                        }
                    )
                }
            }
        )
    }

    private static func generateInitializerCodeBlockList(
        of baseComponents: [String]
    ) -> String {
        var codeBlock = [String]()
        for (rowIndex, component) in baseComponents.enumerated() {
            let typeName = component.lowercased()
            let argument = baseComponents.count == 1 ? "base" : "base.\(rowIndex)"
            let closureReturnValue = baseComponents
                .enumerated()
                .map { closureIndex, closureComponent in
                    if rowIndex == closureIndex {
                        typeName
                    } else {
                        "base.\(closureIndex)"
                    }
                }
                .joined(separator: ", ")
            codeBlock.append(
                """
                self.\(typeName) = (\(argument), { \(typeName) in (\(closureReturnValue)) })
                """
            )
        }
        return codeBlock.joined(separator: "\n")
    }

    private static func generateModifyingFunc(of baseComponents: [String]) throws -> FunctionDeclSyntax {
        try FunctionDeclSyntax(
            """
             func modifying<T>(
                 _ keyPath: KeyPath<_\(raw: baseComponents.last ?? "_")ModifyContext, (T, (T) -> Components)>,
                 modify: (inout T) -> Void,
                 calendar: Calendar = .current
             ) -> TypedDate<Components> {
                 let context = _\(raw: baseComponents.last ?? "_")ModifyContext(base: components)
                 var (target, transform) = context[keyPath: keyPath]
                 modify(&target)
                 return .init(components: transform(target), calendar: calendar)
             }
            """
        )
    }

    private static func generateModifyFunc(of baseComponents: [String]) throws -> FunctionDeclSyntax {
        try FunctionDeclSyntax(
            """
            mutating func modify<T>(
                _ keyPath: KeyPath<_\(raw: baseComponents.last ?? "_")ModifyContext, (T, (T) -> Components)>,
                modify: (inout T) -> Void,
                calendar: Calendar = .current
            ) {
                self = modifying(keyPath, modify: modify, calendar: calendar)
            }
            """
        )
    }
}
