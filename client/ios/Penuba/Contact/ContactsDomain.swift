import ComposableArchitecture
import Foundation

extension ContactsDomain {
    struct Destination: Reducer {
        enum State: Equatable {
            case addContact(AddContactDomain.State)
            case alert(AlertState<ContactsDomain.Action.Alert>)
        }
        
        enum Action: Equatable {
            case addContact(AddContactDomain.Action)
            case alert(ContactsDomain.Action.Alert)
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
    }
    
    enum Action: Equatable {
        case addButtonTapped
        case destination(PresentationAction<Destination.Action>)
        case deleteButtonTapped(id: Contact.ID)
        enum Alert: Equatable {
            case confirmDeletion(id: Contact.ID)
        }
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
                
            case let .destination(.presented(.alert(.confirmDeletion(id: id)))):
                state.contacts.remove(id: id)
                return .none
                
            case .destination:
                return .none
            
            case let .deleteButtonTapped(id: id):
                state.destination = .alert(
                    AlertState {
                        TextState("Are you sure?")
                    } actions: {
                        ButtonState(role: .destructive, action: .confirmDeletion(id: id)) {
                            TextState("Delete")
                        }
                    }
                )
                return .none
            }
        }
        .ifLet(\.$destination, action: /Action.destination) {
            Destination()
        }
    }
}
