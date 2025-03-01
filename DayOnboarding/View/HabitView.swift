import SwiftUI

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
                                        GridWidget(color: colors[index])
                                            .frame(width: 240)
                                        
                                        VStack {
                                            HabitSwitch(isDone: $isDoneList[index], color: colors[index])
                                            HabitInfoWidget(color: colors[index])
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
                    .background(.kDark)
    }
}
