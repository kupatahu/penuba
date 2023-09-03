import Foundation

struct Reminder: Equatable, Identifiable {
    let id: UUID
    var title: String
    var nextSchedule: Date
}

extension Reminder {
    init() {
        self.id = UUID()
        self.title = ""
        self.nextSchedule = Date()
    }
}
