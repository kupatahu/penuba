import ComposableArchitecture
import SwiftUI

struct DashboardView: View {
    let store: StoreOf<Dashboard>
    
    var body: some View {
        WithViewStore(self.store, observe: \.reminders) { viewStore in
            NavigationView {
                List {
                    ForEach(viewStore.state) { reminder in
                        Text(reminder.title)
                    }
                }
                .navigationTitle("Dashboard")
                .toolbar {
                    ToolbarItem {
                        Button {
                            viewStore.send(.addButtonTapped(Reminder()))
                        } label: {
                            Image(systemName: "plus")
                        }
                    }
                }
            }
        }
    }
}
