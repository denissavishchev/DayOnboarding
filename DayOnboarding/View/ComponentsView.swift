import SwiftUI

struct ComponentsView: View {
    
    var body: some View {
        VStack {
            DaySwitch()
            
            TodaysPlansView()
            
            HabitView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.kDark)
        
    }
        
}

#Preview {
    ComponentsView()
}


struct TodaysPlansView: View {
    
    @StateObject var vm = ViewModel()
    
//    vm.addToCalendar(date: Date, name: String, info: String)
    
    var body: some View {
        VStack{
            HStack {
                Text("You have no tasks for today. Want to add?")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
                    .foregroundColor(.kGrayLight)
                Spacer()
                Button{
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                        vm.isTodaysPlansOpen = true
                    }
                }label: {
                    Image(systemName: "plus.message.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.kGrayLight)
                    
                }
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 36, height: vm.isTodaysPlansOpen ? 200 : nil)
        .background(.kBlue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
