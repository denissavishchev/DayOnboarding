import SwiftUI

struct LanguageView: View {
    
    @State private var selectedFlag: String = "GB"

    var body: some View {
        NavigationStack {
            VStack {
                Spacer()
                ZStack{
                    FlagsButtons(selectedFlag: $selectedFlag)
                    
                    Image("Planet")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 180)
                        .shadow(color: .dark, radius: 10, x: 10, y: 10)
                }
                Spacer()
                
                NextButton(toView: SwitchView(), text: languageText(text: selectedFlag))
                    .padding(.bottom, 100)
            }
            .background(LinearGradient(gradient: Gradient(colors: [.darkBlue, .dark]), startPoint: .top, endPoint: .bottom))
        }
    }
    
    func languageText(text: String) -> String{
        switch text{
        case "GB":
            return "Next"
        case "PL":
            return "Zaczynamy"
        case "DE":
            return "Veiter"
        case "Ru":
            return "Поехали"
        default:
            return "Next"
        }
    }
    
}


#Preview {
    LanguageView()
}



