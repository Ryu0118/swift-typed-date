@attached(member, names: arbitrary, named(fill))
internal macro FillInContext() = #externalMacro(module: "TypedDateMacros", type: "FillInContextMacro")

@attached(member, names: arbitrary, named(erase))
internal macro EraseContext() = #externalMacro(module: "TypedDateMacros", type: "EraseContextMacro")
