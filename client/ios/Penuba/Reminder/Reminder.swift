import Foundation

protocol Reminder: Equatable, Identifiable {
    var id: UUID { get }
    var type: ReminderType { get }
    var title: String { get }
    var nextSchedule: Date { get }
}

enum ReminderType {
    case catchUp
}

struct CatchupReminder: Reminder {
    var id: UUID
    var type: ReminderType
    var title: String
    var nextSchedule: Date
    
    init(title: String, nextSchedule: Date) {
        id = UUID()
        type = .catchUp
        self.title = title
        self.nextSchedule = nextSchedule
    }
}
