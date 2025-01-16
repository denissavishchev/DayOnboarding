import SwiftUI

class ViewModel: ObservableObject{
    
    @Published var tasks = [
        Model(name: "Meditation", description: "Morning", image: "Meditation"),
        Model(name: "Walking", description: "City park", image: "Globe"),
        Model(name: "Sport", description: "Running", image: "Ball"),
    ]
    
    @Published var isDay: Bool = false
    @Published var text: String = ""
    @Published var description: String = ""
    @Published var image: String = "Placeholder"
    @Published var selectedTime = Date()
    @Published var isNext: Bool = true
    
    func formattedTime(_ date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter.string(from: date)
    }
    
    @Published var randomList: [Int] = []
    
    func generateRandomList(size: Int) {
        let halfSize = size / Int.random(in: 1...5)
            let randomPart = (0..<halfSize).map { _ in Int.random(in: 1...2) }
            let zerosPart = Array(repeating: 0, count: size - halfSize)
            randomList = randomPart + zerosPart
        }
}
