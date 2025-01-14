import SwiftUI

struct AddTaskView: View {
    var body: some View {
        VStack{
            
            BackButton()
            
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.kBlue, .kDark]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    AddTaskView()
}
