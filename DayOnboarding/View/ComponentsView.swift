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



