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
            DeclSyntax(try generateModifyContext(of: baseComponents)),
        ]
    }

    /// Each unit is a computed property, so a call to `modify` builds only the closure for the unit it uses.
    private static func generateModifyContext(of baseComponents: [String]) throws -> StructDeclSyntax {
        StructDeclSyntax(
            name: .identifier("_\(baseComponents.last ?? "_")ModifyContext"),
            memberBlock: try MemberBlockSyntax {
                try MemberBlockItemListSyntax {
                    try MemberBlockItemSyntax(
                        decl: VariableDeclSyntax("private let base: Components")
                    )
                    for (rowIndex, component) in baseComponents.enumerated() {
                        let typeName = component.lowercased()
                        MemberBlockItemSyntax(
                            decl: DeclSyntax(
                                """
                                public var \(raw: typeName): (\(raw: component), (\(raw: component)) -> Components) {
                                    \(raw: generateGetterBody(of: baseComponents, at: rowIndex))
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

    private static func generateGetterBody(of baseComponents: [String], at rowIndex: Int) -> String {
        let typeName = baseComponents[rowIndex].lowercased()
        let argument = baseComponents.count == 1 ? "base" : "base.\(rowIndex)"
        let closureReturnValue = baseComponents
            .indices
            .map { closureIndex in
                rowIndex == closureIndex ? typeName : "base.\(closureIndex)"
            }
            .joined(separator: ", ")
        return "(\(argument), { [base] \(typeName) in (\(closureReturnValue)) })"
    }
}
