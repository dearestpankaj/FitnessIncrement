import SwiftUI

struct CreateView: View {
    @ObservedObject var viewModel = CreateChallengeViewModel()
    
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
                
                Button(action: {
                    self.viewModel.send(action: .createChallenge)
                }) {
                    Text("Next")
                        .font(.system(size: 24, weight: .medium))
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
