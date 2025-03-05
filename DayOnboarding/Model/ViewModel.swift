import SwiftUI

class ViewModel: ObservableObject{
    
    @Published var name: String = ""
    @Published var info: String = ""
    @Published var icon: String = ""
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
    @Published var isRecomendationOpen: Bool = false
    
    @Published var text: String = ""
    @Published var description: String = ""
    @Published var image: String = "Placeholder"
    @Published var selectedTime = Date()
    
    @Published var calendarList: [CalendarList] = []
    
    func addToCalendar() {
        let newItem = CalendarList(date: date, name: name, icon: icon)
            calendarList.append(newItem)
        info = ""
        date = Date()
        icon = ""
        }
    
    func formattedTime(_ date: Date, format: String) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
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
    
    @Published var events = [
        CalendarList(date: Calendar.current.date(byAdding: .day, value: +1, to: Date.now)!, name: "Meditation", icon: "star.square.fill"),
        CalendarList(date: Calendar.current.date(byAdding: .day, value: +2, to: Date.now)!, name: "Play with kids", icon: "figure.and.child.holdinghands"),
        CalendarList(date: Calendar.current.date(byAdding: .day, value: +3, to: Date.now)!, name: "Programming", icon: "desktopcomputer"),
    ]
    
    @Published var tasks = [
        Model(name: "Meditation", description: "Morning", image: "Meditation"),
        Model(name: "Walking", description: "City park", image: "Globe"),
        Model(name: "Sport", description: "Running", image: "Ball"),
    ]
    
    @Published var recomendations = [
        RecomendedTask(name: "Cooking at Home, No Fast Food", info: "Cook at least one healthy meal at home each day to improve your cooking skills and maintain a nutritious diet. Watch a recipe video at least once a week to learn new techniques and dishes. Avoid fast food and prioritize homemade meals for better health"),
        RecomendedTask(name: "Morning-Evening Routine", info: "Start and end your day with consistency. Establish healthy morning and evening habits, such as waking up at the same time, practicing mindfulness, and preparing for the next day"),
        RecomendedTask(name: "Bad Habits", info: "Identify and reduce negative habits that affect your health, productivity, or mindset. Replace them with positive alternatives that improve your well-being"),
        RecomendedTask(name: "Work", info: "Enhance your productivity and work-life balance. Set clear goals, maintain focus, and avoid burnout by managing your time effectively"),
        RecomendedTask(name: "Education", info: "Never stop learning. Read books, take online courses, and explore new skills to expand your knowledge and career opportunities"),
        RecomendedTask(name: "Creation and Hobby", info: "Engage in creative activities that bring joy and fulfillment. Whether it’s painting, writing, coding, or playing an instrument, make time for hobbies that inspire you"),
        RecomendedTask(name: "Your Body Care", info: "Take care of your body with proper hygiene, skincare, and self-care routines. Prioritize your physical well-being to feel fresh and confident"),
        RecomendedTask(name: "People Around You and Relationships", info: "Surround yourself with supportive and inspiring people. Nurture meaningful relationships and set healthy boundaries when needed"),
        RecomendedTask(name: "Finances and Budget Management", info: "Manage your money wisely. Track expenses, save for the future, and build good financial habits for stability and independence"),
        RecomendedTask(name: "Rest and Relaxation", info: "Give your mind and body the rest they need. Prioritize quality sleep, practice relaxation techniques, and take breaks when necessary"),
        RecomendedTask(name: "Family", info: "Spend quality time with your family. Strengthen your bond through shared activities, deep conversations, and mutual support"),
        RecomendedTask(name: "Exercises and Sport", info: "Stay active and strong with regular exercise. Choose workouts you enjoy, whether it’s gym sessions, yoga, or outdoor sports"),
    ]
}
