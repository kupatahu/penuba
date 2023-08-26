import ComposableArchitecture

struct RootDomain: Reducer {
    struct State: Equatable {
        var contacts = ContactsDomain.State()
    }
    
    enum Action: Equatable {
        case contacts(ContactsDomain.Action)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
        
        Scope(state: \.contacts, action: /Action.contacts) {
            ContactsDomain()
        }
    }
}
