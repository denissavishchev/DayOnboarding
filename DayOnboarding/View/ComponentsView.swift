import SwiftUI

struct ComponentsView: View {
    
    var body: some View {
        VStack {
            SingleTaskView()
            
            Spacer()
                .frame(height: 20)
            
            HabitView()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.kDark)
        
    }
        
}

#Preview {
    ComponentsView()
}


struct HabitView: View {
    
    @StateObject var vm = ViewModel()
    @State var isDoneList: [Bool] = [false, false, false, false, false]
    let colors: [Color] = [.kGreen, .kRed, .kIndigo, .kYellow, .kRed]
    let texts: [String] = [
        "Drink a cup of tea",
        "Read a book",
        "Programming",
        "Gym",
        "Walking with kids"]
    
    
    var body: some View {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 8) {
                        ForEach(isDoneList.indices, id: \.self) { index in
                            ZStack {
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.kBlue.opacity(0.5))
                                    .padding(.horizontal, 18)
                                    .frame(width: UIScreen.main.bounds.width, height: 250)
                                    
                                VStack {
                                    
                                    HStack(alignment: .top){
                                        HabitInfoButton()
                                        Text(texts[index])
                                            .font(.system(size: 18, weight: .bold, design: .rounded))
                                            .foregroundColor(.kGrayLight)
                                        Spacer()
                                    }
                                    .padding(.horizontal, 12)
                                    
                                    HStack(alignment: .top){
                                        GridView(color: colors[index])
                                            .frame(width: 240)
                                        
                                        VStack {
                                            HabitSwitch(isDone: $isDoneList[index], color: colors[index])
                                            HabitInfoView(color: colors[index])
                                        }
                                    }
                                    
                                    Spacer()
                                }
                                .padding(.top, 12)
                                .padding(.horizontal, 18)
                            }
                        }
                    }
                }
                    .frame(maxWidth: UIScreen.main.bounds.width)
                    .frame(height: 600)
                    .background(.kDark)
    }
}

struct GridView: View {
    
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

struct HabitSwitch: View {
    
    @Binding var isDone: Bool
    let color: Color
    
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
                        .foregroundColor(isDone ? color : .kBlue)
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
    
    let color: Color
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 12)
                    .foregroundColor(color)
                    .overlay(
                        RoundedRectangle(cornerRadius: 2)
                            .stroke(.kDark, lineWidth: 1)
                    )
                
                Text("15")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black.opacity(0.5), radius: 1)
            }
            HStack{
                RoundedRectangle(cornerRadius: 2)
                    .frame(width: 12, height: 12)
                    .foregroundColor(.kDark)
                    
                Text("120")
                    .font(.system(size: 14))
                    .foregroundColor(.white)
                    .bold()
                    .shadow(color: .black.opacity(0.5), radius: 1)
            }
            Text("135/180 days")
                .font(.system(size: 14))
                .foregroundColor(.white)
                .bold()
                .shadow(color: .black.opacity(0.5), radius: 1)
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
                    .frame(width: 20)
                    .foregroundColor(.kGray)
            }
        }
        .frame(width: 40, height: 40)
        .background(.kBlue)
        .clipShape(RoundedRectangle(cornerRadius: 12))
    }
}
