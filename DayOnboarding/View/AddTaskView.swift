import SwiftUI

struct AddTaskView: View {
    var body: some View {
        VStack{
            
            BackButton()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.darkBlue, .dark]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    AddTaskView()
}
