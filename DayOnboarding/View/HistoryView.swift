import SwiftUI


struct HistoryView: View {
    
    @StateObject var vm = ViewModel()
    let columns = Array(repeating: GridItem(.flexible()), count: 15)
    
    var body: some View {
        VStack{
            
            BackButton()
            
            Spacer()
            
            HStack {
                LazyVGrid(columns: columns, spacing: 4){
                    ForEach(Array(vm.randomList.enumerated()), id: \.offset){_, item in
                         RoundedRectangle(cornerRadius: 2)
                            .frame(width: 12, height: 12)
                            .foregroundColor(item == 0 ? .kDark.opacity(0.1) : (item == 1 ? .kBlue : .green))
                            .overlay(
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(.kDark, lineWidth: 1)
                            )
                    }
                }
                .padding(.leading, 24)
                .padding(.trailing, 12)
                
                VStack{
                    
                }
                .frame(width: 100, height: 80)
                .background()
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.kBlue, .kDark]), startPoint: .top, endPoint: .bottom))
        .onAppear {
            vm.generateRandomList(size: 60)
        }
    }
}

#Preview {
    HistoryView()
}
