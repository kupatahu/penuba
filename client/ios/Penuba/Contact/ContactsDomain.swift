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
                
            case let .addContact(.presented(.delegate(.saveContact(contact)))):
                state.contacts.append(contact)
                return .none
                
            case .addContact:
                return .none
            }
        }.ifLet(\.$addContact, action: /Action.addContact) {
            AddContactDomain()
        }
    }
}
