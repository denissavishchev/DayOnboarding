import SwiftUI

struct BasicButton: View {
    
    var text: String = ""
    var width: Double = 60
    var icon: String = ""
    
    var body: some View {
        ZStack{
            RoundedRectangle(cornerRadius: 8)
                .foregroundColor(.kDark)
                .shadow(color: .white.opacity(0.4), radius: 2, y: 2)
                .overlay(
                    Group {
                        if icon.isEmpty {
                            Text(text)
                                .font(.system(size: 14, weight: .bold, design: .rounded))
                                .foregroundColor(.kGrayLight)
                        } else {
                            Image(systemName: icon)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 18, height: 18)
                                .foregroundColor(.kGrayLight)
                        }
                    }
                )
        }
        .frame(width: width, height: 30)
    }
}
