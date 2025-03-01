
import SwiftUI

struct DaySwitch: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ZStack(alignment: vm.isDay ? .leading : .trailing){
            Image(vm.isDay ? "Day" : "Night")
                .resizable()
                .scaledToFit()
                .frame(width: 300)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            
            RoundedRectangle(cornerRadius: 50)
                .stroke(.white, lineWidth: 1)
                .frame(width: 300, height: 100)
            
            Image(vm.isDay ? "Sun" : "Moon")
                .resizable()
                .scaledToFit()
                .frame(width: 80)
                .shadow(color: .kDark.opacity(0.6), radius: 5, x: vm.isDay ? 5 : -5, y: 5)
                .padding(.horizontal, 14)
                .onTapGesture {
                    withAnimation(.linear(duration: 0.4)){
                        vm.isDay.toggle()
                    }
                }
        }
        .padding(.bottom, 4)
    }
}
