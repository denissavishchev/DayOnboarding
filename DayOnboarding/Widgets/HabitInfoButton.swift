
import SwiftUI

struct HabitInfoButton: View {
    var body: some View {
        ZStack{
            Button{
                withAnimation {
                    
                }
            }label: {
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20)
                    .foregroundColor(.kGray)
            }
        }
        .frame(width: 40, height: 40)
        .background(.kBlue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
