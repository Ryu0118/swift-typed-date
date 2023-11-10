import Foundation
import SwiftCompilerPlugin
import SwiftSyntaxMacros

@main
struct TypedDatePlugin: CompilerPlugin {
    let providingMacros: [Macro.Type] = [
        FillInContextMacro.self,
        EraseContextMacro.self,
        ModifyContextMacro.self
    ]
}
