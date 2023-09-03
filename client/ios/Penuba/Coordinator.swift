import ComposableArchitecture
import TCACoordinators
import FlowStacks

struct Coordinator: Reducer {
    struct State: Equatable, IndexedRouterState {
        var routes: [Route<Screen.State>]
    }
    
    enum Action: Equatable, IndexedRouterAction {
        case routeAction(Int, action: Screen.Action)
        case updateRoutes([Route<Screen.State>])
    }
    
    var body: some ReducerOf<Self> {
        Reduce { state, action in
            switch action {
            case .routeAction(_, action: .dashboard(.addButtonTapped(let reminder))):
                state.routes.presentSheet(.addReminder(.init(reminder: reminder)))
                return .none
                
            case .routeAction(_, action: .addReminder(.cancelButtonTapped)):
                state.routes.goBack()
                return .none
                
            case .routeAction(_, action: .addReminder(.delegate(.saveReminder(_)))):
                state.routes.goBack()
                return .none
                
            default:
                return .none
            }
        }
        .forEachRoute {
            Screen()
        }
    }
}
