import SwiftUI

struct ComponentsView: View {
   
    var body: some View {
        VStack {
            DaySwitch()
            
            TodaysPlansView()
            
            HabitView()
            
            HStack {
                AddTaskView()
            }
            .frame(maxWidth: .infinity)
            .background(.kDark)

        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.kDark)
        
    }
        
}

#Preview {
    ComponentsView()
}

