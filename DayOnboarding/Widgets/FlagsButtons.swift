import SwiftUI

struct FlagsButtons: View {
    
    @Binding var selectedFlag: String
    
    var body: some View {
        VStack (spacing: 20){
            HStack(spacing: 20){
                    Flag(flag: "GB", selectedFlag: $selectedFlag)
                    Flag(flag: "PL", selectedFlag: $selectedFlag)
            }
            HStack(spacing: 20){
                    Flag(flag: "DE", selectedFlag: $selectedFlag)
                    Flag(flag: "RU", selectedFlag: $selectedFlag)
            }
        }
        .padding(.horizontal, 24)
        .frame(maxWidth: .infinity)
    }
}

struct Flag: View {
    
    var flag: String
    
    @Binding var selectedFlag: String
    
    var body: some View {
        Image(flag)
            .resizable()
            .scaledToFit()
            .frame(maxWidth: .infinity)
            .cornerRadius(10)
            .colorMultiply(selectedFlag == flag ? .white : .gray)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(selectedFlag == flag ? .white : .clear, lineWidth: 5)
            )
            .shadow(color: selectedFlag == flag ? .kDark : .clear, radius: 10, x: 10, y: 10)
            .onTapGesture {
                withAnimation{
                    selectedFlag = flag
                }
                print(selectedFlag)
                print(flag)
            }
    }
}
