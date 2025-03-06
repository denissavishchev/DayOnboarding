import SwiftUI

struct TemplatesView: View {
    
    @StateObject var vm: ViewModel
    
    var body: some View {
        VStack{
            HStack {
                Spacer()
                Button{
                    withAnimation{
                        vm.isTemplates = false
                    }
                }label: {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 30)
                        .foregroundColor(.kGrayLight)
                }
            }
            HStack {
                ForEach(vm.icons, id: \.self){icon in
                        RoundedRectangle(cornerRadius: 12)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.kDark)
                        .shadow(color: .white.opacity(0.4), radius: 5, x: 2, y: 2)
                        .overlay(
                            ZStack {
                                RoundedRectangle(cornerRadius: 12)
                                    .stroke(vm.templatesIcon == icon  ? .white : .clear, lineWidth: 2)
                                Image(systemName: icon)
                                    .resizable()
                                    .scaledToFit()
                                    .foregroundColor(.white)
                                    .frame(width: 24, height: 24)
                            }
                        )
                        .onTapGesture {
                            withAnimation{
                                vm.templatesIcon = icon
                            }
                        }
                }
            }
            HStack {
                TextField("Name", text: $vm.templatesName)
                            .padding()
                            .frame(height: 36)
                            .background(Color.gray.opacity(0.2))
                            .cornerRadius(8)
                            .padding(.vertical, 18)
                Button{
                    vm.addTemplate()
                }label: {
                    RoundedRectangle(cornerRadius: 12)
                        .frame(width: 40, height: 40)
                        .foregroundColor(.kDark)
                        .shadow(color: .white.opacity(0.4), radius: 2, y: 2)
                        .overlay{
                            Image(systemName: "rectangle.stack.fill.badge.plus")
                                .foregroundColor(.kGrayLight)
                                .shadow(color: .white.opacity(0.4), radius: 5)
                        }
                    }
                }
                ScrollView(.vertical, showsIndicators: false){
                    VStack {
                        ForEach(vm.templates, id: \.id){template in
                            HStack {
                                Text(template.name)
                                    .font(.system(size: 16, weight: .bold, design: .rounded))
                                    .foregroundColor(.kGrayLight)
                                Spacer()
                                Image(systemName: template.icon)
                                    .foregroundColor(.kGrayLight)
                                    .shadow(color: .white.opacity(0.4), radius: 5)
                            
                            }
                            .padding(.horizontal, 12)
                            .frame(width: 300, height: 30, alignment: .leading)
                            .background(.kDark)
                            .cornerRadius(12)
                            
                        }
                    }
                    .frame(maxWidth: .infinity)
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
            .offset(y: vm.isTemplates ? 0 : 700)
            .animation(.spring(response: 0.5, dampingFraction: 0.7), value: vm.isTemplates)
    }
}
