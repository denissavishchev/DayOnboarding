import SwiftUI

struct SwitchView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            BackButton()
            
            Spacer()
            
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
            .padding(.bottom, 24)
            
            ZStack {
                Image("Blank")
                    .resizable()
                    .frame(maxWidth: .infinity, maxHeight: 150)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                RoundedRectangle(cornerRadius: 20)
                .frame(maxWidth: .infinity, maxHeight: 150)
                .foregroundColor(.kBlue.opacity(0.9))
                
                HStack{
                    Image(vm.image)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 120, height: 120)
                        .clipShape(RoundedRectangle(cornerRadius: 6))
                    
                    Spacer()
                    
                    VStack(alignment: .leading){
                        Text(vm.text)
                            .font(.system(size: 20))
                            .bold()
                            .foregroundColor(.white)
                        
                        vm.text == "" ? nil : Divider()
                            .frame(width: 130, height: 2)
                            .background(.white)
                        
                        Text(vm.description)
                             .font(.system(size: 16))
                             .bold()
                             .foregroundColor(.white.opacity(0.7))
                             .padding(.bottom, 50)
                        
                    }
                    
                    RoundedRectangle(cornerRadius: 15)
                        .frame(width: 60, height: 130)
                        .foregroundColor(.kDark.opacity(0.6))
                        .overlay(
                        Image(systemName: "alarm")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 35)
                            .foregroundColor(.white.opacity(0.5))
                            .shadow(color: .white.opacity(0.2), radius: 3)
                        )
                }
                .gesture(
                    TapGesture(count: 2)
                        .onEnded{
                            withAnimation{
                                vm.text = ""
                                vm.description = ""
                                vm.image = "Placeholder"
                            }
                        }
                )
                .padding(.horizontal, 12)
            }
            .padding(.horizontal, 18)
            .padding(.bottom, 20)
            
            HStack(spacing: 20){
                ForEach(vm.tasks, id: \.id){task in
                        RoundedRectangle(cornerRadius: 10)
                        .frame(width: 100, height: 80)
                        .foregroundColor(.kBlue)
                        .overlay(
                            VStack{
                                Text(task.name)
                                     .font(.system(size: 18))
                                     .bold()
                                     .foregroundColor(.white)
                                 Divider()
                                     .frame(width: 80, height: 2)
                                     .background(.white)
                                 
                                Text(task.description)
                                      .font(.system(size: 16))
                                      .bold()
                                      .foregroundColor(.white.opacity(0.7))
                            }
                        )
                        .gesture(
                            TapGesture(count: 2)
                                .onEnded{
                                    withAnimation{
                                        vm.text = task.name
                                        vm.description = task.description
                                        vm.image = task.image
                                    }
                                }
                        )
                }
            }
            
            Spacer()
            
            NextButton(toView: AddTaskView(), text: "Next")
        
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarHidden(true)
        .background(LinearGradient(gradient: Gradient(colors: [.kDark, .kDark]), startPoint: .top, endPoint: .bottom))
    }
}

#Preview {
    SwitchView()
}


