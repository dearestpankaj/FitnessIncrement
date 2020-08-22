import SwiftUI

struct CreateView: View {
    @ObservedObject var viewModel = CreateChallengeViewModel()
    @State private var isActive = false
    
    var dropdownList: some View {
        ForEach(viewModel.dropdowns.indices, id: \.self) { index in
            DropDownView(viewModel: self.$viewModel.dropdowns[index])
        }
    }
    var body: some View {
        ScrollView {
            VStack {
                dropdownList
//                DropDownView()
//                DropDownView()
//                DropDownView()
//                DropDownView()
                Spacer()
                NavigationLink(destination: RemindView(), isActive: $isActive) {
                    Button(action: {
                        self.isActive = true
                    }) {
                        Text("Next")
                            .font(.system(size: 24, weight: .medium))
                    }
                }
            }.navigationBarTitle("Create")
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