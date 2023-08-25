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
                state: \.$destination,
                action: { .destination($0) }
            ),
            state: /ContactsDomain.Destination.State.addContact,
            action: ContactsDomain.Destination.Action.addContact
        ) { addContactStore in
            NavigationStack {
                AddContactView(store: addContactStore)
            }
        }
        .alert(
            store: self.store.scope(
                state: \.$destination,
                action: { .destination($0) }
            ),
            state: /ContactsDomain.Destination.State.alert,
            action: ContactsDomain.Destination.Action.alert
        )
    }
}

struct RootView_Previews: PreviewProvider {
    static var previews: some View {
        RootView()
    }
}
