import SwiftUI

struct CreateView: View {
    @ObservedObject var viewModel = CreateChallengeViewModel()
    
    var dropdownList: some View {
        Group {
            DropDownView(viewModel: $viewModel.exerciseDropdown)
            DropDownView(viewModel: $viewModel.startAmountDropdown)
            DropDownView(viewModel: $viewModel.increaseDropdown)
            DropDownView(viewModel: $viewModel.lengthDropdown)
        }
    }
    
    var mainContentView: some View {
        ScrollView {
            VStack {
                dropdownList
                Spacer()
                Button(action: {
                    self.viewModel.send(action: .createChallenge)
                }) {
                    Text("Create")
                        .font(.system(size: 24, weight: .medium))
                }
                
            }
        }
    }
    
    var body: some View {
        ZStack {
            if viewModel.isLoading {
                ProgressView()
            } else {
                mainContentView
            }
        }.alert(isPresented: Binding<Bool>.constant($viewModel.error.wrappedValue != nil)){
            Alert(title: Text("Error!"), message: Text($viewModel.error.wrappedValue?.localizedDescription ?? ""), dismissButton: .default(Text("OK"), action: {
                viewModel.error = nil
            }))
        }
        
//        ScrollView {
//            VStack {
//                dropdownList
//                Spacer()
//
//                Button(action: {
//                    self.viewModel.send(action: .createChallenge)
//                }) {
//                    Text("Next")
//                        .font(.system(size: 24, weight: .medium))
//                }
//
//            }
            .navigationBarTitle("Create")
            .navigationBarBackButtonHidden(true)
            .padding(.bottom, 15)
//        }
    }
}
