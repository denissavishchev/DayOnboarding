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
                                    .foregroundColor(.white)
                                    .frame(width: 100, height: 2)
                                Text(rec.info)
                                    .font(.system(size: 14, weight: .bold, design: .rounded))
                                    .foregroundColor(.kGrayLight)
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
