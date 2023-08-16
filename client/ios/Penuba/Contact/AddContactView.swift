import ComposableArchitecture
import SwiftUI

struct AddContactView: View {
    let store: StoreOf<AddContactReducer>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form {
                TextField(
                    "Name",
                    text: viewStore.binding(get: \.contact.name, send: { .setName($0) })
                )
                Button("Save") {
                    viewStore.send(.saveButtonTapped)
                }
            }
            .toolbar {
                Button("Cancel") {
                    viewStore.send(.cancelButtonTapped)
                }
            }
        }
    }
}

struct AddContactView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            AddContactView(
                store: Store(
                    initialState: AddContactReducer.State(
                        contact: Contact(id: UUID(), name: "Blob")
                    )
                ) {
                    AddContactReducer()
                }
            )
        }
    }
}
