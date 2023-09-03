import SwiftUI
import TCACoordinators
import ComposableArchitecture

struct CoordinatorView: View {
    let store: StoreOf<Coordinator>
    
    var body: some View {
        TCARouter(store) { screen in
            SwitchStore(screen) { screen in
                switch screen {
                case .dashboard:
                    CaseLet(
                        /Screen.State.dashboard,
                         action: Screen.Action.dashboard,
                         then: DashboardView.init
                    )
                case .addReminder:
                    CaseLet(
                        /Screen.State.addReminder,
                         action: Screen.Action.addReminder,
                         then: AddReminderView.init
                    )
                }
            }
        }
    }
}

struct CoordinatorView_Previews: PreviewProvider {
    static var previews: some View {
        CoordinatorView(
            store: Store(
                initialState: Coordinator.State(
                    routes: [.root(.dashboard(.init(reminders: [
                        Reminder(
                            id: UUID(),
                            title: "Call Fulan",
                            nextSchedule: Date()
                        ),
                        Reminder(
                            id: UUID(),
                            title: "Text Barlan",
                            nextSchedule: Date()
                        ),
                    ])))]
                )
            ) {
                Coordinator()
            }
        )
    }
}
