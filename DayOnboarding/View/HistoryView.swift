import SwiftUI


struct HistoryView: View {
    
    @StateObject var vm = ViewModel()
    let columns = Array(repeating: GridItem(.flexible()), count: 15)
    @State var isDone: Bool = false
    let size: Int = 120
    
    var body: some View {
        VStack{
            
            BackButton()
            
            Spacer()
            HStack {
                ZStack{
                    Circle()
                        .fill(
                            .shadow(.inner(color: .black.opacity(0.8), radius: 5, y: 5))
                        )
                        .foregroundColor(.white)
                    Circle()
                        .foregroundColor(.green)
                        .frame(width: 8, height: 8)
                }
                .frame(width: 10, height: 10)
                
                ZStack{
                    Circle()
                        .fill(
                            .shadow(.inner(color: .black.opacity(0.8), radius: 5, y: 5))
                        )
                        .foregroundColor(.white)
                    Circle()
                        .stroke(.green, lineWidth: 1)
                        .frame(width: 8, height: 8)
                }
                .frame(width: 10, height: 10)
            }
            
            Spacer()
            
            HStack {
                LazyVGrid(columns: columns, spacing: 4){
                    ForEach(Array(vm.randomList.enumerated()), id: \.offset){_, item in
                        if item == 0{
                            ZStack{
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.kBlue)
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 2)
                                            .stroke(.kDark, lineWidth: 1)
                                    )
                            }
                            .frame(width: 12, height: 12)
                        }else if item == 1{
                            ZStack{
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.kDark)
                                RoundedRectangle(cornerRadius: 2)
                                    .stroke(.pink, lineWidth: 1)
                            }
                            .frame(width: 12, height: 12)
                        }else if item == 2{
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.green)
                                    .frame(width: 12, height: 12)
                        }
                    }
                    
                }
                .padding(.leading, 12)
                .padding(.trailing, 8)
                
                VStack{
                    ZStack(alignment: isDone ? .trailing : .leading){
                        RoundedRectangle(cornerRadius: 20)
                            .fill(
                                .shadow(.inner(color: .kBlue, radius: 7))
                            )
                            .foregroundColor(.white)
                            .frame(width: 90, height: 40)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 2)
                            .frame(width: 90, height: 40)
                        
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: 55, height: 36)
                            .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.kBlue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .overlay(
                                Circle()
                                    .frame(width: 20, height: 20)
                                    .foregroundColor(.kBlue)
                            )
                            .padding(.horizontal, 4)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(.black, lineWidth: 1.5)
                            .frame(width: 54, height: 33)
                            .padding(.horizontal, 4)
                    }
                    .onTapGesture {
                        withAnimation{
                            isDone.toggle()
                        }
                    }
                        
                    HStack(spacing: 0){
                        RoundedRectangle(cornerRadius: 2)
                           .frame(width: 12, height: 12)
                           .foregroundColor(.green)
                           .overlay(
                               RoundedRectangle(cornerRadius: 2)
                                   .stroke(.kDark, lineWidth: 1)
                           )
                        Text("  \(vm.randomList.filter { $0 == 2 }.count) / ")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                            .bold()
                        RoundedRectangle(cornerRadius: 2)
                           .frame(width: 12, height: 12)
                           .foregroundColor(.kBlue)
                           .overlay(
                               RoundedRectangle(cornerRadius: 2)
                                   .stroke(.kDark, lineWidth: 1)
                           )
                        Text("  \(vm.randomList.filter { $0 == 1 }.count)")
                            .font(.system(size: 14))
                            .foregroundColor(.white)
                        .bold()
                    }
                    Text("\((vm.randomList.filter { $0 == 2 }.count) + (vm.randomList.filter { $0 == 1 }.count)) / \(size) days")
                        .font(.system(size: 14))
                        .foregroundColor(.white)
                        .bold()
                }
                .padding(.trailing, 12)
            }
            Spacer()
            HStack{
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
                .padding(.leading, 12)
                .padding(.trailing, 8)
                Spacer()
                    .frame(maxWidth: .infinity)
            }
            
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.kBlue, .kDark]), startPoint: .top, endPoint: .bottom))
        .onAppear {
            vm.generateRandomList(size: size)
        }
    }
}

#Preview {
    HistoryView()
}
