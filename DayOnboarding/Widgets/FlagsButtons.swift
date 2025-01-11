import SwiftUI

struct FlagsButtons: View {
    
    let flags: [String] = ["GB", "PL", "RU", "DE"]
    @State var selectedFlag: String = "GB"
    
    var body: some View {
        HStack(spacing: 20){
            ForEach(flags, id: \.self){flag in
                Image(flag)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 70)
                    .cornerRadius(10)
                    .colorMultiply(selectedFlag == flag ? .white : .gray)
                    .background(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(selectedFlag == flag ? .white : .clear, lineWidth: 5)
                    )
                    .shadow(color: selectedFlag == flag ? .dark : .clear, radius: 10, x: 10, y: 10)
                    .onTapGesture {
                        withAnimation{
                            selectedFlag = flag
                        }
                    }
            }
        }
        .frame(maxWidth: .infinity)
    }
}
