import SwiftUI

struct SingleTaskView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        ZStack{
            if !vm.showPopup {
                HStack(spacing: 0){
                    ZStack{
                        Button{
                            withAnimation {
                                vm.showPopup.toggle()
                            }
                        }label: {
                            Image(systemName: "plus.app.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 40)
                                .foregroundColor(.kGray)
                        }
                    }
                    .frame(width: 60, height: 80)
                    .background(.kBlue)
                    
                    ZStack{
                        ScrollView(.horizontal, showsIndicators: false) {
                            HStack(spacing: 8) {
                                ForEach(vm.topItems, id: \.id) { item in
                                    RoundedRectangle(cornerRadius: 8)
                                        .fill(.white.opacity(0.4))
                                        .frame(width: 100, height: 70)
                                        .overlay(
                                            VStack {
                                                Text(item.name).foregroundColor(.white)
                                                HStack{
                                                    Text("\(item.amount)").foregroundColor(.white)
                                                    Text("/").foregroundColor(.white)
                                                    Text("\(item.total)").foregroundColor(.white)
                                                }
                                            }
                                        )
                                        .onTapGesture{
                                            print(item.name)
                                        }
                                }
                            }
                            .padding()
                        }
                    }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .frame(height: 80)
                    .background(.kGrayDark)
                }
                .frame(width: UIScreen.main.bounds.width, height: 80)
                .background()
            }
            
            AddPopUp(vm: vm)
            
        }

    }
}

