import SwiftUI

struct RecomendationsView: View {
    
    @StateObject var vm = ViewModel()
    @State private var selectedIndex: Int? = nil
    
    var body: some View {
        VStack(alignment: .leading){
            BackButton()
            ScrollView(.vertical, showsIndicators: false){
                VStack{
                    ForEach(1...10, id: \.self){index in
                            RoundedRectangle(cornerRadius: 12)
                            .frame(width: UIScreen.main.bounds.width - 36, height: selectedIndex == index ? 200 : 100)
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
