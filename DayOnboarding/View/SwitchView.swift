import SwiftUI

struct SwitchView: View {
    
    @State var isDay: Bool = true
    
    var body: some View {
        VStack {
            BackButton()
            
            Spacer()
            
            ZStack(alignment: isDay ? .leading : .trailing){
                Image(isDay ? "Day" : "Night")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 50))
                
                RoundedRectangle(cornerRadius: 50)
                    .stroke(.white, lineWidth: 1)
                    .frame(width: 300, height: 100)
                
                Image(isDay ? "Sun" : "Moon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 80)
                    .shadow(color: .dark.opacity(0.6), radius: 5, x: isDay ? 5 : -5, y: 5)
                    .padding(.horizontal, 14)
                    .onTapGesture {
                        withAnimation(.linear(duration: 0.4)){
                            isDay.toggle()
                        }
                    }
            }
            Spacer()
            
            NextButton(toView: AddTaskView())
        
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.dark, .dark]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    SwitchView()
}


