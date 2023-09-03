import ComposableArchitecture
import SwiftUI

struct AddReminderView: View {
    let store: StoreOf<AddReminder>
    
    var body: some View {
        WithViewStore(self.store, observe: { $0 }) { viewStore in
            NavigationView {
                Form {
                    TextField(
                        "Title",
                        text: viewStore.binding(get: \.reminder.title, send: { .setTitle($0) })
                    )
                    DatePicker(
                        "Schedule",
                        selection: viewStore.binding(get: \.reminder.nextSchedule, send: { .setNextSchedule($0) })
                    )
                    Button("Submit") {
                        viewStore.send(.submitButtonTapped)
                    }
                }
                .toolbar {
                    Button("Cancel") {
                        viewStore.send(.cancelButtonTapped)
                    }
                }
            }
        }
    }
}

struct AddReminderView_Previews: PreviewProvider {
    static var previews: some View {
        AddReminderView(
            store: Store(
                initialState: AddReminder.State(
                    reminder: Reminder(
                        id: UUID(),
                        title: "Call Fulan",
                        nextSchedule: Date()
                    )
                )
            ) {
                AddReminder()
            }
        )
    }
}
