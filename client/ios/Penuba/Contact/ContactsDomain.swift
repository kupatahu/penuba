import ComposableArchitecture
import Foundation

struct ContactsDomain: Reducer {
    struct State: Equatable {
        @PresentationState var addContact: AddContactDomain.State?
        var contacts: IdentifiedArrayOf<Contact> = []
    }
    
    enum Action: Equatable {
        case addButtonTapped
        case addContact(PresentationAction<AddContactDomain.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce {  state, action in
            switch action {
            case .addButtonTapped:
                state.addContact = AddContactDomain.State(
                    contact: Contact(id: UUID(), name: "")
                )
                return  .none
                
            case .addContact(.presented(.cancelButtonTapped)):
                state.addContact = nil
                return .none
                
            case .addContact(.presented(.saveButtonTapped)):
                guard let contact = state.addContact?.contact
                else { return .none}
                state.contacts.append(contact)
                state.addContact = nil
                return .none
                
            case .addContact:
                return .none
            }
        }.ifLet(\.$addContact, action: /Action.addContact) {
            AddContactDomain()
        }
    }
}
