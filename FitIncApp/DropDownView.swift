import SwiftUI

struct DropDownView<T: DropdownItemProtocol>: View {
    @Binding var viewModel: T
    var body: some View {
        VStack {
            HStack {
                Text(viewModel.headerTitle)
                    .font(.system(size: 22, weight: .semibold))
                Spacer()
            }.padding(.vertical, 10)
            Button(action: {
                self.viewModel.isSelected = true
            }) {
                HStack {
                    Text(viewModel.dropdownTitle)
                        .font(.system(size: 28, weight: .semibold))
                    Spacer()
                    Image(systemName: "arrowtriangle.down.circle")
                    .font(.system(size: 28, weight: .medium))
                }
            }.buttonStyle(PrimaryButtonStyle(fillColor: .primaryButton))
        }.padding(20)
    }
}
//
//struct DropDownView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            NavigationView {
//                DropDownView()
//            }.environment(\.colorScheme, .light)
//            NavigationView {
//                DropDownView()
//            }.environment(\.colorScheme, .dark)
//            
//        }
//    }
//}
