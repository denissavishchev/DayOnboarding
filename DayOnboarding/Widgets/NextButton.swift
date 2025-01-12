import SwiftUI

struct NextButton<Content: View>: View {
    
    var toView: Content
    
    var body: some View {
        NavigationLink(destination: toView) {
            ZStack {
                RoundedRectangle(cornerRadius: 25)
                    .fill(
                        .shadow(.inner(color: .darkBlue.opacity(0.5), radius: 10, x: 10, y: 10))
                    )
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.dark, .darkBlue]), startPoint: .top, endPoint: .bottom))
                    .cornerRadius(10)
                
                RoundedRectangle(cornerRadius: 25)
                    .stroke(.white.opacity(0.4), lineWidth: 1)
                    
                
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
            .shadow(color: .dark, radius: 10, x: 10, y: 10)
            .frame(width: 220, height: 80)
        }
    }
}
