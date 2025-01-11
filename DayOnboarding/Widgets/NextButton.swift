import SwiftUI

struct NextButton: View {
    var body: some View {
        NavigationLink(destination: SwitchView()) {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        .shadow(.inner(color: .darkBlue.opacity(0.5), radius: 10, x: 10, y: 10))
                    )
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.dark, .darkBlue]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(10)
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.darkBlue, lineWidth: 2)
                
                RoundedRectangle(cornerRadius: 16)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.dark, .darkBlue]), startPoint: .top, endPoint: .bottom))
                    .shadow(color: .dark, radius: 5, x: 5, y: 5)
                    .shadow(color: .darkBlue, radius: 5, x: -5, y: -5)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 10)
                
                Text("Next")
                    .font(.system(size: 30))
                    .foregroundStyle(.white.opacity(0.4))
            }
            .frame(width: 220, height: 80)
        }
    }
}
