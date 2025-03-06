import SwiftUI

struct AddTaskView: View {
    
    @StateObject var vm = ViewModel()
    let colors: [Color] = [.kGreen, .kRed, .kIndigo, .kYellow]
    
    var body: some View {
        ZStack{
            if vm.isAddViewOpen{
                VStack(spacing: 12){
                    HStack{
                        Spacer()
                        Button{
                            vm.isAddViewOpen = false
                        }label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundColor(.kGrayLight)
                        }
                    }
                    
                    TextField("Name", text: $vm.taskName)
                                .padding()
                                .frame(height: 36)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal, 18)
                    TextField("Info", text: $vm.taskInfo)
                                .padding()
                                .frame(height: 36)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal, 18)
                    HStack {
                        ForEach(colors, id: \.self){color in
                                RoundedRectangle(cornerRadius: 12)
                                .frame(width: 30, height: 30)
                                .foregroundColor(color)
                                .shadow(color: color.opacity(0.4), radius: 5, x: 2, y: 2)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 12)
                                        .stroke(vm.taskColor == color  ? .white : .clear, lineWidth: 2)
                                )
                                .onTapGesture {
                                    withAnimation{
                                        vm.taskColor = color
                                    }
                                }
                        }
                    }
                    
                    HStack {
                        ForEach(vm.icons, id: \.self){icon in
                                RoundedRectangle(cornerRadius: 12)
                                .frame(width: 30, height: 30)
                                .foregroundColor(.kDark)
                                .shadow(color: .white.opacity(0.4), radius: 5, x: 2, y: 2)
                                .overlay(
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 12)
                                            .stroke(vm.taskIcon == icon  ? .white : .clear, lineWidth: 2)
                                        Image(systemName: icon)
                                            .resizable()
                                            .scaledToFit()
                                            .foregroundColor(.white)
                                            .frame(width: 18, height: 18)
                                    }
                                )
                                .onTapGesture {
                                    withAnimation{
                                        vm.taskIcon = icon
                                    }
                                }
                        }
                    }
                    
                    HStack {
                        Slider(
                            value: $vm.taskDays,
                            in: 15...180,
                            step: 15
                        )
                        .tint(vm.taskColor)
                        .padding()
                        Text("Days: \(Int(vm.taskDays))")
                            .font(.headline)
                            .foregroundColor(.kGrayLight)
                            .shadow(color: .kGrayLight.opacity(0.6), radius: 5)
                    }
                    
                    Button{
                        vm.isAddViewOpen = false
                    }label: {
                        RoundedRectangle(cornerRadius: 12)
                            .frame(width: 100, height: 40)
                            .foregroundColor(.kDark)
                            .shadow(color: .white.opacity(0.4), radius: 2, y: 2)
                            .overlay{
                                Image(systemName: "rectangle.stack.fill.badge.plus")
                                    .foregroundColor(vm.taskColor)
                                    .shadow(color: .white.opacity(0.4), radius: 5)
                            }
                    }
                    
                }
                .padding()
                .frame(width: UIScreen.main.bounds.width - 36, height: 360)
                .background(.kDark)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(color: .white.opacity(0.4), radius: 2)
                .offset(y: -320)
            }else{
                RoundedRectangle(cornerRadius: 8)
                    .foregroundColor(.kDark)
                    .shadow(color: .white.opacity(0.4), radius: 2, y: 2)
                    .overlay{
                        VStack(spacing: 3){
                            ForEach(1...4, id: \.self){_ in
                                HStack(spacing: 4){
                                    ForEach(1...4, id: \.self){_ in
                                            RoundedRectangle(cornerRadius: 3)
                                            .frame(width: 8, height: 8)
                                            .foregroundColor(.kRed)
                                            .shadow(color: .white.opacity(0.4), radius: 1, x: 0.5, y: 0.5)
                                    }
                                }
                            }
                        }
                    }
                    .onTapGesture {
                        vm.isAddViewOpen = true
                    }
            }
        }
        .frame(width: 60, height: 50)
        .background(.kDark)
        .animation(.spring(response: 0.7, dampingFraction: 0.8, blendDuration: 0.7), value: vm.isAddViewOpen)
    }
}

