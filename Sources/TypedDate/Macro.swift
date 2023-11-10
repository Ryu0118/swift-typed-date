@attached(member, names: arbitrary)
internal macro FillInContext() = #externalMacro(module: "TypedDateMacros", type: "FillInContextMacro")

@attached(member, names: arbitrary)
internal macro EraseContext() = #externalMacro(module: "TypedDateMacros", type: "EraseContextMacro")

@attached(member, names: arbitrary)
internal macro ModifyContext() = #externalMacro(module: "TypedDateMacros", type: "ModifyContextMacro")
