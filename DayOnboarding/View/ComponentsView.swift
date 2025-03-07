import SwiftUI

struct ComponentsView: View {
   
    var body: some View {
        NavigationStack{
            VStack {
                DaySwitch()
                
                TodaysPlansView()
                
                HabitView()
                
                HStack(alignment: .bottom, spacing: 15){
                    NavigationButton(text: "fossil.shell.fill", destination: AnyView(RecomendationsView()))
                    NavigationButton(text: "calendar", destination: AnyView(CalendarView()))
                    AddTaskView()
                    NavigationButton(text: "list.bullet.clipboard.fill", destination: AnyView(RecomendationsView()))
                    NavigationButton(text: "gear", destination: AnyView(RecomendationsView()))
                }
                .background(.kDark)
                    
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.kDark)
        }
        
    }
        
}

#Preview {
    ComponentsView()
}


struct NavigationButton: View {
    
    let text: String
    let destination: AnyView
    
    var body: some View {
        NavigationLink(destination: destination){
            BasicButton(icon: text)
        }
        
    }
}
