import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    var body: some View {
        CounterView(
            store: Store(initialState: CounterReducer.State()) {
                CounterReducer()
            }
        )
    }
}
