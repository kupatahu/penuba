import ComposableArchitecture
import SwiftUI

struct RootView: View {
    let store: StoreOf<ContactsDomain> = Store(initialState: ContactsDomain.State()) {
        ContactsDomain()
    }
    
    var body: some View {
        NavigationStack {
            ContactsView(store: self.store)
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

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
