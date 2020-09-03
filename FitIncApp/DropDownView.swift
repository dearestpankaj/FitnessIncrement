import SwiftUI

struct DropDownView<T: DropdownItemProtocol>: View {
    @Binding var viewModel: T
    
    var actionsheet: ActionSheet {
        ActionSheet(title: Text("Select"), message: nil,
                    buttons: viewModel.options.map { option in
                        return .default(
                            Text(option.formatted)){
                                viewModel.selectedOption = option
                        }
        })
    }
    
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
        }
        .actionSheet(isPresented: $viewModel.isSelected){
                actionsheet
        }
        .padding(20)
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
