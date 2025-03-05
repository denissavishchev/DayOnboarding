import SwiftUI

struct Model: Identifiable{
    var id = UUID().uuidString
    var name: String
    var description: String
    var image: String
}

struct CalendarList: Identifiable{
    var id = UUID().uuidString
    var date: Date
    var name: String
    var icon: String
}

struct RecomendedTask: Identifiable{
    var id = UUID().uuidString
    var name: String
    var info: String
}
