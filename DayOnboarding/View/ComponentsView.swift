import SwiftUI

struct ComponentsView: View {
    
    var body: some View {
        VStack {
            DaySwitch()
            
            TodaysPlansView()
            
            HabitView()
                .padding(.bottom, 12)
            
            HStack{
                ZStack{
                    
                }
                .frame(width: 80, height: 60)
                .background(.kRed)
            }
            .ignoresSafeArea()
            .frame(width: UIScreen.main.bounds.width, height: 40)
            .background(.white)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.kDark)
        
    }
        
}

#Preview {
    ComponentsView()
}
