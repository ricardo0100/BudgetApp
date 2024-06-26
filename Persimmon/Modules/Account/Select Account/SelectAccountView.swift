import SwiftUI

struct SelectAccountView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel: SelectAccountViewModel
    
    var body: some View {
        List(viewModel.accounts, id: \.self, selection: viewModel.account) { account in
            HStack {
                LettersIconView(text: account.name, color: Color(hex: account.color))
                Text(account.name)
                Spacer()
                if viewModel.account.wrappedValue?.id == account.id {
                    Image(systemName: "checkmark")
                }
            }
            .contentShape(Rectangle())
            .onTapGesture {
                viewModel.didSelect(account: account)
                dismiss()
            }
        }
    }
}

struct SelectAccountView_Previews: PreviewProvider {
    static var previews: some View {
        SelectAccountView(viewModel: SelectAccountViewModel(selectedAccount: .constant(nil)))
    }
}
