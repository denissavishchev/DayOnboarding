
import SwiftUI

struct HabitSwitch: View {
    
    @Binding var isDone: Bool
    let color: Color
    
    var body: some View {
        ZStack(alignment: isDone ? .trailing : .leading){
            RoundedRectangle(cornerRadius: 20)
                .fill(
                    .shadow(.inner(color: .kBlue, radius: 7))
                )
                .foregroundColor(.white)
                .frame(width: 90, height: 40)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 2)
                .frame(width: 90, height: 40)
            
            RoundedRectangle(cornerRadius: 20)
                .frame(width: 55, height: 36)
                .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.kBlue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                .overlay(
                    Circle()
                        .frame(width: 20, height: 20)
                        .foregroundColor(isDone ? color : .kBlue)
                )
                .padding(.horizontal, 4)
            RoundedRectangle(cornerRadius: 20)
                .stroke(.black, lineWidth: 1.5)
                .frame(width: 54, height: 33)
                .padding(.horizontal, 4)
        }
        .onTapGesture {
            withAnimation{
                isDone.toggle()
            }
        }
    }
}
