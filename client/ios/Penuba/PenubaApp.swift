import SwiftUI
import ComposableArchitecture

@main
struct PenubaApp: App {
    var body: some Scene {
        WindowGroup {
            CoordinatorView(
                store: Store(
                    initialState: Coordinator.State(
                        routes: [.root(.dashboard(.init()))]
                    )
                ) {
                    Coordinator()
                }
            )
        }
    }
}
