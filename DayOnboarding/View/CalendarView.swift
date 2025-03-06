import SwiftUI

struct CalendarView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
            VStack{
                BackButton()
                    
                HStack{
                    BasicButton(text: "Create event", width: 120)
                        .onTapGesture {
                            withAnimation{
                                vm.isCreateEvent = true
                                vm.isTemplates = false
                            }
                        }
                    Spacer()
                    BasicButton(text: "Templates", width: 120)
                        .onTapGesture {
                            withAnimation{
                                vm.isTemplates = true
                                vm.isCreateEvent = false
                            }
                        }
                }
                .padding(.horizontal, 18)
                .padding(.vertical, 16)
                ZStack {
                    ScrollView(.vertical, showsIndicators: false){
                        VStack(spacing: 0){
                            ForEach(Array(vm.events.enumerated()), id: \.element.id){index, event in
                                ZStack(alignment: .leading){
                                    Rectangle()
                                        .fill(Color.gray.opacity(0.8))
                                        .frame(width: 2, height: 70)
                                        .padding(.leading, 19)
                                    VStack{
                                        Text(event.name)
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                            .foregroundColor(.kGrayLight)
                                        Text(vm.formattedTime(event.date, format: "dd-MM-yyyy"))
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                            .foregroundColor(.kGrayLight)
                                        
                                    }
                                    .padding(EdgeInsets(top: 18, leading: 25, bottom: 18, trailing: 18))
                                    .frame(width: UIScreen.main.bounds.width - 36, height: 50)
                                    .background(LinearGradient(colors: [.kBlue, .kBlue.opacity(0.5), .kGray.opacity(0.2), .kGray.opacity(0.2)], startPoint: .leading, endPoint: .trailing))
                                    .clipShape(RoundedRectangle(cornerRadius: 12))
                                    ZStack{
                                        Image(systemName: event.icon)
                                            .resizable()
                                            .frame(width: 25, height: 25)
                                            .scaledToFit()
                                            .foregroundColor(.kGrayLight)
                                    }
                                    .frame(width: 40, height: 60)
                                    .background(
                                        Capsule()
                                    )
                                    .overlay{
                                        Capsule()
                                            .stroke(.kGrayLight.opacity(0.8), lineWidth: 2)
                                            .frame(width: 38, height: 58)
                                    }
                                    .shadow(color: .kDark, radius: 8, x: 2)
                                }
                                .frame(height: 70)
                            }
                        }
                    }
                    
                    TemplatesView(vm: vm)
                    CreateEventView(vm: vm)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.kDark)
            .navigationBarHidden(true)
        }
        
    
}

#Preview {
    CalendarView()
}



struct CreateEventView: View {
    
    @StateObject var vm: ViewModel
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button{
                    withAnimation{
                        vm.isCreateEvent = false
                    }
                }label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.kGrayLight)
                }
            }

        }
        .padding(18)
        .frame(width: UIScreen.main.bounds.width - 36, height: 650)
        .background(LinearGradient(colors: [.kDark, .kBlue], startPoint: .topLeading, endPoint: .bottomTrailing))
        .clipShape(RoundedRectangle(cornerRadius: 18))
        .overlay{
            RoundedRectangle(cornerRadius: 18)
                .stroke(.kBlue.opacity(0.7), lineWidth: 1)
        }
        .offset(y: vm.isCreateEvent ? 0 : 700)
        .animation(.spring(response: 0.5, dampingFraction: 0.7), value: vm.isCreateEvent)
    }
}
