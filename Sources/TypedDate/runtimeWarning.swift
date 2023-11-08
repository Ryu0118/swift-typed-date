import Foundation
import os

func runtimeWarning(_ message: StaticString) {
    #if DEBUG
    var info = Dl_info()
    dladdr(
        dlsym(
            dlopen(nil, RTLD_LAZY),
            "$s10Foundation15AttributeScopesO7SwiftUIE05swiftE0AcDE0D12UIAttributesVmvg"
        ),
        &info
    )
    os_log(
        .fault,
        dso: info.dli_fbase,
        log: OSLog(
            subsystem: "com.apple.runtime-issues",
            category: "TypedDate"
        ),
        message
    )
    #endif
}
