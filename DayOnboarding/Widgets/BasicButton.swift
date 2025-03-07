import SwiftUI

struct BasicButton: View {
    
    var text: String
    var width: Double = 60
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.kDark)
                .shadow(color: .white.opacity(0.4), radius: 2, y: 2)
                .overlay{
                    Text(text)
                        .font(.system(size: 14, weight: .bold, design: .rounded))
                        .foregroundColor(.kGrayLight)
                }
        }
        .frame(width: width, height: 30)
    }
}
