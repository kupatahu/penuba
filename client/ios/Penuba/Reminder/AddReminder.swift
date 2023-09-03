import ComposableArchitecture
import Foundation

struct AddReminder: Reducer {
    struct State: Equatable {
        var reminder: Reminder
    }
    
    enum Action: Equatable {
        case setTitle(String)
        case setNextSchedule(Date)
        case submitButtonTapped
        case cancelButtonTapped
        case delegate(Delegate)
        
        enum Delegate: Equatable {
            case saveReminder(Reminder)
        }
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .setTitle(let title):
                state.reminder.title = title
                return .none
                
            case .setNextSchedule(let nextSchedule):
                state.reminder.nextSchedule = nextSchedule
                return .none
                
            case .submitButtonTapped:
                return .run { [reminder = state.reminder] send in
                    await send(.delegate(.saveReminder(reminder)))
                }
                
            case .cancelButtonTapped:
                return .none
                
            case .delegate(_):
                return .none
            }
        }
    }
}
