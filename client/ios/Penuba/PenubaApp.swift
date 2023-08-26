import SwiftUI
import ComposableArchitecture

@main
struct PenubaApp: App {
    var body: some Scene {
        WindowGroup {
            RootView(
                store: Store(initialState: RootDomain.State()) {
                    RootDomain()
                }
            )
        }
    }
}
