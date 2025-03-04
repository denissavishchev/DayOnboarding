import SwiftUI

struct RecomendationsView: View {
    
    @StateObject var vm = ViewModel()
    @State private var selectedIndex: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            BackButton()
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ForEach(Array(vm.recomendations.enumerated()), id: \.element.id){index, rec in
                        VStack{
                            Text(rec.name)
                                .font(.system(size: 18, weight: .bold, design: .rounded))
                                .foregroundColor(.kGrayLight)
                            if selectedIndex == index{
                                RoundedRectangle(cornerRadius: 2)
                                    .foregroundColor(.kGrayLight)
                                    .frame(width: 100, height: 2)
                                Text(rec.info)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundColor(.kGrayLight)
                                HStack {
                                    Slider(
                                        value: $vm.taskDays,
                                        in: 15...180,
                                        step: 15
                                    )
                                    .tint(.kDark)
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
                                        .foregroundColor(.kBlue)
                                        .shadow(color: .white.opacity(0.4), radius: 2, y: 2)
                                        .overlay{
                                            Image(systemName: "rectangle.stack.fill.badge.plus")
                                                .foregroundColor(.kDark)
                                                .shadow(color: .white.opacity(0.4), radius: 5)
                                        }
                                }
                            }
                        }
                        .padding(18)
                        .frame(width: UIScreen.main.bounds.width - 36, height: selectedIndex == index ? nil : 50)
                        .background(.kBlue)
                        .clipShape(RoundedRectangle(cornerRadius: 12))
                            .onTapGesture {
                                withAnimation{
                                    if selectedIndex == index {
                                            selectedIndex = nil
                                        } else {
                                            selectedIndex = index
                                        }
                                        vm.isRecomendationOpen = true
                                }
                            }
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.kDark)
        .navigationBarHidden(true)
    }
    
}

#Preview {
    RecomendationsView()
}
