import SwiftUI

struct AddPopUp: View {
    
    @StateObject var vm: ViewModel
    @State private var name: String = ""
    @State private var total: Int = 1
    
    var body: some View {
        if vm.showPopup {
            VStack {
                TextField("Enter name...", text: $name)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                
                Picker("Total", selection: $total) {
                       ForEach(1..<6, id: \.self) { number in
                           Text("\(number)").tag(number)
                       }
                   }
                   .pickerStyle(WheelPickerStyle())
                   .frame(height: 100)
                   .clipped()
        
                Button("Add") {
                    withAnimation {
                        vm.addToTopItems(name: name, amount: 0, total: total)
                        name = ""
                        vm.showPopup.toggle()
                    }
                }
                .padding()
            }
            .frame(width: 300, height: 300)
            .background(.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            .transition(.scale)
        }
    }
}
