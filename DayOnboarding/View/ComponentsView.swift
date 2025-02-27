import SwiftUI

struct ComponentsView: View {
    
    @StateObject var vm = ViewModel()
    
    var body: some View {
        VStack {
            SingleTaskView()
            
            Spacer()
                .frame(height: 20)
            
            HabitView()
        }
        
    }
        
}



#Preview {
    ComponentsView()
}




struct HabitView: View {
    
    @State var isDoneList: [Bool] = [false, false, false, false, false]
    @StateObject var vm = ViewModel()
    
    var body: some View {
        HStack(spacing: 0){
            ZStack{
                Button{
                    withAnimation {
                    
                    }
                }label: {
                    Image(systemName: "plus.app.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40)
                        .foregroundColor(.kGray)
                }
            }
            .frame(width: 60, height: 350)
            .background(.kBlue)
            
            ZStack{
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 8) {
                        ForEach(isDoneList.indices, id: \.self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white.opacity(0.4))
                                    .frame(width: 240, height: 340)
                                VStack {
                                    GridView()
                                        .frame(width: 240)
                                    
                                    Spacer()
                                    
                                    HabitInfoButton()
                                    
                                    Spacer()
                                        .frame(height: 20)
                                    
                                    HStack {
                                        HabitInfoView()
                                        
                                        Spacer()
                                        
                                        HabitSwitch(isDone: $isDoneList[index])
                                    }
                                    .padding(.horizontal, 12)
                                    
                                    Spacer()
                                        .frame(height: 20)
                                }
                                .padding(.top, 12)
                            }
                        }
                    }
                    .padding()
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width)
            .frame(height: 350)
            .background(.kGrayDark)
        }
    }
}

struct GridView: View {
    
    @StateObject var vm = ViewModel()
    let columns = Array(repeating: GridItem(.flexible(), spacing: 5), count: 15)
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: .center, spacing: 3){
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
        .padding(.leading, 8)
        .padding(.trailing, 8)
        .onAppear {
            vm.generateRandomList(size: vm.randomNumber)
        }
    }
}

struct HabitSwitch: View {
    
    @Binding var isDone: Bool
    
    var body: some View {
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
    }
}

struct HabitInfoView: View {
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 12)
                    .foregroundColor(.green)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.kDark, lineWidth: 1)
                    )
                Text("15")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
            }
            HStack{
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 12)
                    .foregroundColor(.kBlue)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.kDark, lineWidth: 1)
                    )
                Text("120")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
            }
            Text("135/180 days")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .bold()
        }
    }
}

struct HabitInfoButton: View {
    var body: some View {
        ZStack{
            Button{
                withAnimation {
                    
                }
            }label: {
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40)
                    .foregroundColor(.kGray)
            }
        }
        .frame(width: 60, height: 60)
        .background(.kBlue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
