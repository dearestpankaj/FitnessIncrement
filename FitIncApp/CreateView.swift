import SwiftUI

struct CreateView: View {
    @ObservedObject var viewModel = CreateChallengeViewModel()
    @State private var isActive = false
    
    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
            DropDownView(viewModel: self.$viewModel.dropdowns[index])
        }
    }
    
    var actionsheet: ActionSheet {
        ActionSheet(title: Text("Select"), message: nil,
                    buttons: viewModel.displayedOptions.indices.map { index in
                        let option = viewModel.displayedOptions[index]
                        return .default(Text(option.formatted)){
                            self.viewModel.send(action: .selectOption(index: index))
                        }
        })
    }
    
    var body: some View {
        ScrollView {
            VStack {
                dropdownList
                Spacer()
                NavigationLink(destination: RemindView(), isActive: $isActive) {
                    Button(action: {
                        self.isActive = true
                    }) {
                        Text("Next")
                            .font(.system(size: 24, weight: .medium))
                    }
                }
            }
            .actionSheet(
                isPresented: Binding<Bool>(
                    get: {
                        self.viewModel.hasSelectedDropdown
                }, set: { _ in })){
                    actionsheet
            }
            .navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
        }
    }
}

//struct CreateView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            DropDownView()
//                .previewDevice("iPhone 11 Pro Max")
//                .previewDisplayName("iPhone 11 Pro Max")
//            
//            DropDownView()
//                .previewDevice("iPhone SE")
//                .previewDisplayName("iPhone SE")
//                .environment(\.colorScheme, .dark)
//            
//            DropDownView()
//                .previewDevice("iPhone 11 Pro")
//                .previewDisplayName("iPhone 11 Pro")
//                .environment(\.colorScheme, .dark)
//        }
//    }
//}
