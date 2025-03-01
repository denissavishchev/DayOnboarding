import SwiftUI

struct GridWidget: View {
    
    @StateObject var vm = ViewModel()
    let columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 15)
    let color: Color
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 3){
            ForEach(Array(vm.randomList.enumerated()), id: \.offset){_, item in
                if item == 0{
                    ZStack{
                        RoundedRectangle(cornerRadius: 2)
                            .foregroundColor(.kBlue.opacity(0.5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(.kDark.opacity(0.1), lineWidth: 1)
                            )
                    }
                    .frame(width: 12, height: 12)
                }else if item == 1{
                    ZStack{
                        RoundedRectangle(cornerRadius: 2)
                            .foregroundColor(.kDark.opacity(0.5))
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.kDark.opacity(0.1), lineWidth: 1)
                    }
                    .frame(width: 12, height: 12)
                }else if item == 2{
                    RoundedRectangle(cornerRadius: 2)
                        .foregroundColor(color)
                        .frame(width: 12, height: 12)
                }
            }
            
        }
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .onAppear {
            vm.generateRandomList(size: vm.randomNumber)
        }
    }
}
