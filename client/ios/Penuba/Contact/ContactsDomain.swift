import ComposableArchitecture
import Foundation

extension ContactsDomain {
    struct Destination: Reducer {
        enum State: Equatable {
            case addContact(AddContactDomain.State)
        }
        
        enum Action: Equatable {
            case addContact(AddContactDomain.Action)
        }
        
        var body: some ReducerOf<Self> {
            Scope(state: /State.addContact, action: /Action.addContact) {
                AddContactDomain()
            }
        }
    }
}

struct ContactsDomain: Reducer {
    struct State: Equatable {
        var contacts: IdentifiedArrayOf<Contact> = []
        @PresentationState var destination: Destination.State?
        var path = StackState<ContactDetailDomain.State>()
    }
    
    enum Action: Equatable {
        case addButtonTapped
        case destination(PresentationAction<Destination.Action>)
        case path(StackAction<ContactDetailDomain.State, ContactDetailDomain.Action>)
    }
    
    var body: some ReducerOf<Self> {
        Reduce {  state, action in
            switch action {
            case .addButtonTapped:
                state.destination = .addContact(
                    AddContactDomain.State(
                        contact: Contact(id: UUID(), name: "")
                    )
                )
                return  .none
                
            case let .destination(.presented(.addContact(.delegate(.saveContact(contact))))):
                state.contacts.append(contact)
                return .none
                
            case .destination:
                return .none
                
            case let .path(.element(id: id, action: .delegate(.confirmDeletion))):
                guard let detailState = state.path[id: id] else { return .none }
                state.contacts.remove(id: detailState.contact.id)
                return .none
                
            case .path:
                return .none
            }
        }
        .ifLet(\.$destination, action: /Action.destination) {
            Destination()
        }
        .forEach(\.path, action: /Action.path) {
            ContactDetailDomain()
        }
    }
}
