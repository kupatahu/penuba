import SwiftUI
import ComposableArchitecture

struct ContactView: View {
    let store: StoreOf<ContactReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: \.contacts) { viewStore in
            List {
                ForEach(viewStore.state) { contact in
                    Text(contact.name)
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
    }
}

struct ContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactView(
                store: Store(
                    initialState: ContactReducer.State(
                        contacts: [
                            Contact(id: UUID(), name: "Blob"),
                            Contact(id: UUID(), name: "Blob Jr"),
                            Contact(id: UUID(), name: "Blob Sr"),
                        ]
                    )
                ) {
                    ContactReducer()
                }
            )
        }
    }
}
