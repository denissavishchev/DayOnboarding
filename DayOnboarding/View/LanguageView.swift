import SwiftUI

struct LanguageView: View {

    var body: some View {
        NavigationStack {
            VStack {
                Image("Planet")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200)
                    .shadow(color: .dark, radius: 10, x: 10, y: 10)
                    .padding(.top, 50)
                    .padding(.bottom, 80)
                FlagsButtons()
                
                Spacer()
                
                NextButton()
            }
            .background(LinearGradient(gradient: Gradient(colors: [.darkBlue, .dark]), startPoint: .top, endPoint: .bottom))
        }
    }
}


#Preview {
    LanguageView()
}


