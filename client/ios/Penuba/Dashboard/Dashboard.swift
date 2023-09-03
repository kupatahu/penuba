import ComposableArchitecture

struct Dashboard: Reducer {
    struct State: Equatable {
        var reminders: IdentifiedArrayOf<Reminder> = []
    }
    
    enum Action: Equatable {
        case addButtonTapped(Reminder)
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
