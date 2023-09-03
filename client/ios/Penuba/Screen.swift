import ComposableArchitecture

struct Screen: Reducer {
    enum State: Equatable {
        case dashboard(Dashboard.State)
        case addReminder(AddReminder.State)
    }
    
    enum Action: Equatable {
        case dashboard(Dashboard.Action)
        case addReminder(AddReminder.Action)
    }
    
    var body: some ReducerOf<Self> {
        Scope(state: /State.dashboard, action: /Action.dashboard) {
            Dashboard()
        }
        Scope(state: /State.addReminder, action: /Action.addReminder) {
            AddReminder()
        }
    }
}
