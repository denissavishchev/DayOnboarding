import SwiftUI

struct TodaysPlansView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack{
            if vm.isTodaysPlansOpen {
                VStack {
                    HStack{
                        Spacer()
                        Button{
                            withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                                vm.isTodaysPlansOpen = false
                            }
                        }label: {
                            Image(systemName: "xmark.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 30)
                                .foregroundColor(.kGrayLight)
                        }
                    }
                    TextField("Name", text: $vm.name)
                                .padding()
                                .frame(height: 36)
                                .background(Color.gray.opacity(0.2))
                                .cornerRadius(8)
                                .padding(.horizontal, 18)
                    VStack {
                        DatePicker("Select a date", selection: $vm.date, displayedComponents: .date)
                            .datePickerStyle(WheelDatePickerStyle())
                            .padding()
                    }
                    Button{
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                            vm.addToCalendar()
                            vm.isTodaysPlansOpen = false
                        }
                    }label: {
                        Image(systemName: "plus.rectangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30)
                            .foregroundColor(.kGrayLight)
                    }
                }
                .frame(height: 350)
            } else{
                HStack {
                    if vm.calendarList.isEmpty{
                        Text("You have no tasks for today. Want to add?")
                            .font(.system(size: 14, weight: .semibold, design: .rounded))
                            .foregroundColor(.kGrayLight)
                    }else{
                        ScrollView(.vertical, showsIndicators: false){
                            VStack{
                                ForEach(vm.calendarList){item in
                                    HStack{
                                        Image(systemName: "star.square.fill")
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(width: 24, height: 24)
                                        Text(vm.formattedTime(item.date, format: "dd-MM-yyyy"))
                                        Text(item.name)
                                    }
                                    .foregroundColor(.kGrayLight)
                                }
                            }
                        }
                        .fixedSize(horizontal: false, vertical: true)
                        
                    }
                    Spacer()
                    Button{
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)){
                            vm.isTodaysPlansOpen = true
                        }
                    }label: {
                        Image(systemName: "plus.message.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.kGrayLight)
                    }
                }
            }
        }
        .padding()
        .frame(width: UIScreen.main.bounds.width - 36)
        .background(.kBlue.opacity(0.5))
        .clipShape(RoundedRectangle(cornerRadius: 8))
    }
}
