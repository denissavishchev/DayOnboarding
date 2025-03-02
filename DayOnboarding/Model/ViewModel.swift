import SwiftUI

class ViewModel: ObservableObject{
    
    @Published var tasks = [
        Model(name: "Meditation", description: "Morning", image: "Meditation"),
        Model(name: "Walking", description: "City park", image: "Globe"),
        Model(name: "Sport", description: "Running", image: "Ball"),
    ]
    
    
    
    func addToCalendar() {
        let newItem = CalendarList(date: date, name: name, info: info)
            calendarList.append(newItem)
        name = ""
        info = ""
        date = Date()
        }
    
    @Published var name: String = ""
    @Published var info: String = ""
    @Published var date: Date = Date()
    
    @Published var taskName: String = ""
    @Published var taskInfo: String = ""
    @Published var taskColor: Color = .kGreen
    @Published var taskIcon: String = "note.text"
    @Published var taskDays: Double = 30
    
    @Published var isNext: Bool = true
    @Published var showPopup: Bool = false
    @Published var isTodaysPlansOpen: Bool = false
    @Published var isDay: Bool = false
    @Published var isAddViewOpen: Bool = false
    
    @Published var text: String = ""
    @Published var description: String = ""
    @Published var image: String = "Placeholder"
    @Published var selectedTime = Date()
    
    @Published var calendarList: [CalendarList] = []
    
    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter.string(from: date)
    }
    
    @Published var randomList: [Int] = []
    
    let randomNumber = Int.random(in: 1...12) * 15
    
    func generateRandomList(size: Int) {
        let halfSize = size / Int.random(in: 1...5)
            let randomPart = (0..<halfSize).map { _ in Int.random(in: 1...2) }
            let zerosPart = Array(repeating: 0, count: size - halfSize)
            randomList = randomPart + zerosPart
        }
}
