import SwiftUI

struct Model: Identifiable{
    var id = UUID().uuidString
    var name: String
    var description: String
    var image: String
}
