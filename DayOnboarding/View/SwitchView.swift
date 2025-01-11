import SwiftUI

struct SwitchView: View {
    var body: some View {
        VStack {
            BackButtonView()
                .padding(.leading)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .ignoresSafeArea()
                .navigationBarHidden(true)
        }
    }
}

#Preview {
    SwitchView()
}


