
import SwiftUI

struct HabitInfoWidget: View {
    
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 12)
                    .foregroundColor(color)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.kDark, lineWidth: 1)
                    )
                
                Text("15")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black.opacity(0.5), radius: 1)
            }
            HStack{
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 12)
                    .foregroundColor(.kDark)
                    
                Text("120")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black.opacity(0.5), radius: 1)
            }
            Text("135/180 days")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .bold()
                .shadow(color: .black.opacity(0.5), radius: 1)
        }
    }
}
