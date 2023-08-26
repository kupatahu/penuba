import SwiftUI
import ComposableArchitecture

struct ContactsView: View {
    let store: StoreOf<ContactsDomain>
    
    var body: some View {
        NavigationStackStore(self.store.scope(state: \.path, action: { .path($0) })) {
            WithViewStore(self.store, observe: \.contacts) { viewStore in
                List {
                    ForEach(viewStore.state) { contact in
                        NavigationLink(state: ContactDetailDomain.State(contact: contact)) {
                            Text(contact.name)
                        }
                        .buttonStyle(.borderless)
                    }
                }
                .navigationTitle("Contacts")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewStore.send(.addButtonTapped)
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        } destination: { store in
            ContactDetailView(store: store)
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
    }
}

struct ContactsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactsView(
                store: Store(
                    initialState: ContactsDomain.State(
                        contacts: [
                            Contact(id: UUID(), name: "Blob"),
                            Contact(id: UUID(), name: "Blob Jr"),
                            Contact(id: UUID(), name: "Blob Sr"),
                        ]
                    )
                ) {
                    ContactsDomain()
                }
            )
        }
    }
}
