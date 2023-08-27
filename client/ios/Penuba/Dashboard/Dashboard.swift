import ComposableArchitecture

struct Dashboard: Reducer {
    struct State {
        var reminders: IdentifiedArrayOf<Reminder> = []
    }
    
    enum Action {}
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            default:
                return .none
            }
        }
    }
}
