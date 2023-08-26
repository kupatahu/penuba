import SwiftUI
import ComposableArchitecture

struct ContactDetailView: View {
    let store: StoreOf<ContactDetailDomain>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            Form {
                Button("Delete") {
                    viewStore.send(.deleteButtonTapped)
                }
            }
            .navigationBarTitle(Text(viewStore.contact.name))
        }
        .alert(
            store: self.store.scope(
                state: \.$alert,
                action: { .alert($0) }
            )
        )
    }
}

struct ContactDetailPreview: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            ContactDetailView(
                store: Store(
                    initialState: ContactDetailDomain.State(
                        contact: Contact(id: UUID(), name: "Blob")
                    )
                ) {
                    ContactDetailDomain()
                }
            )
        }
    }
}
