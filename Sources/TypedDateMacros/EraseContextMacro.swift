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
            DeclSyntax(try generateEraseContext(of: baseComponents)),
        ]
    }

    /// Each erased type is a computed property, so a call to `erase` builds only the tuple it uses.
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
                        let arguments = components.indices.map { "base.\($0)" }.returnType
                        MemberBlockItemSyntax(
                            decl: DeclSyntax(
                                """
                                public var \(raw: typeName): (TypedDate<\(raw: type)>.Type, \(raw: type)) {
                                    (TypedDate<\(raw: type)>.self, \(raw: arguments))
                                }
                                """
                            )
                        )
                    }
                    try MemberBlockItemSyntax(
                        decl: InitializerDeclSyntax("init(base: Components)") {
                            "self.base = base"
                        }
                    )
                }
            }
        )
    }
}
