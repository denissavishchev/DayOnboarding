import SwiftUI

struct NextButton<Content: View>: View {
    
    var toView: Content
    var text: String
    
    var body: some View {
        NavigationLink(destination: toView) {
            ZStack {
                RoundedRectangle(cornerRadius: 30)
                    .foregroundStyle(.kDark)
                    .shadow(color: .white, radius: 2, y: -2)
                    .shadow(color: .kBlue, radius: 10, y: -7)
                Text(text)
                    .font(.system(size: 30))
                    .bold()
                    .foregroundStyle(.white)
                Text(text)
                    .font(.system(size: 30))
                    .bold()
                    .foregroundStyle(.kBlue.opacity(0.6))
            }
            .frame(maxWidth: .infinity, maxHeight: 60)
            .padding(.horizontal, 24)
        }
    }
}
