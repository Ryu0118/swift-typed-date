import SwiftCompilerPlugin
import SwiftSyntax
import SwiftSyntaxBuilder
import SwiftSyntaxMacros
import SwiftDiagnostics
import TypedDateCore
import Foundation

// Note: This macro does not generate a detailed DiagnosticError because it is only used in TypedDate package.
package struct FillInContextMacro: MemberMacro {
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
            DeclSyntax(try generateFillContext(of: baseComponents)),
        ]
    }

    /// Each target is a computed property, so a call to `fill` builds only the closure it uses.
    private static func generateFillContext(of baseComponents: [String]) throws -> StructDeclSyntax {
        StructDeclSyntax(
            name: .identifier("_\(baseComponents.last ?? "")FillInContext"),
            memberBlock: try MemberBlockSyntax {
                try MemberBlockItemListSyntax {
                    let convertComponents = allUnitNames.allSubarrays().filter({ !($0.count == 1 && $0.first == baseComponents.first ?? "") })
                    for subarray in convertComponents {
                        if let property = try generateUnitProperty(baseComponents: baseComponents, to: subarray) {
                            MemberBlockItemSyntax(decl: property)
                        }
                    }

                    try MemberBlockItemSyntax(
                        decl: VariableDeclSyntax("private let base: Components")
                    )

                    try MemberBlockItemSyntax(
                        decl: InitializerDeclSyntax("init(base: Components)") {
                            "self.base = base"
                        }
                    )
                }
            }
        )
    }

    private static func generateNecessaryArgumentTypes(
        baseComponents: [String],
        to convertComponents: [String]
    ) -> [String] {
        var convertComponents = convertComponents
        convertComponents.removeAll { baseComponents.contains($0) }
        return convertComponents
    }

    private static func generateClosure(
        baseComponents: [String],
        to convertComponents: [String]
    ) -> String {
        let bases: String = baseComponents.count == 1 ? "base" : baseComponents.indices.map { "base.\($0)" }.joined(separator: ", ")
        let diff = convertComponents.count - baseComponents.count
        let passedArguments: String = diff == 1 ? "data" : (0..<diff).map { "data.\($0)" }.joined(separator: ", ")
        return "{ [base] data in (\(bases), \(passedArguments)) }"
    }

    private static func generateUnitProperty(
        baseComponents: [String],
        to convertComponents: [String]
    ) throws -> VariableDeclSyntax? {
        let types = generateNecessaryArgumentTypes(baseComponents: baseComponents, to: convertComponents)
        guard types.count >= 1, convertComponents.count > baseComponents.count else {
            return nil
        }
        return try VariableDeclSyntax(
            """
            public var \(raw: convertComponents.last!.lowercased()): \(raw: types.closureParameter) -> \(raw: convertComponents.returnType) {
                \(raw: generateClosure(baseComponents: baseComponents, to: convertComponents))
            }
            """
        )
    }
}

extension TupleTypeSyntax {
    var argumentTypes: [String] {
        elements.compactMap { $0.type.as(IdentifierTypeSyntax.self)?.name.text }
    }
}

extension [String] {
    var closureParameter: String {
        if indices.count == 1 {
            "(\(self[0]))"
        } else {
            "((\(joined(separator: ", "))))"
        }
    }

    var returnType: String {
        if indices.count == 1 {
            self[0]
        } else {
            "(\(self.joined(separator: ", ")))"
        }
    }
}

extension Array {
    func allSubarrays() -> [[Element]] {
        var result: [[Element]] = []
        for end in 1...self.count {
            result.append(Array(self.prefix(end)))
        }
        return result
    }
}
