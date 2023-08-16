import ComposableArchitecture
import SwiftUI

struct ContentView: View {
    let store: StoreOf<ContactReducer> = Store(initialState: ContactReducer.State()) {
        ContactReducer()
    }
    
    var body: some View {
        NavigationStack {
            ContactView(store: self.store)
        }
        .sheet(
            store: self.store.scope(
                state: \.$addContact,
                action: { .addContact($0) }
            )
        ) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
