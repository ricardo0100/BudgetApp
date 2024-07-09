//import Foundation
//import Combine
//
//class TransactionsListViewModel: ObservableObject {
//    @Published var transactions: [TransactionModel] = []
//    @Published var isShowingEditingView = false
//    @Published var isShowingDeleteAlert = false
//    
//    var editingTransaction: TransactionModel?
//    var cancellables: [AnyCancellable] = []
//    var deletingTransaction: TransactionModel?
//    let interactor = TransactionInteractorFactory.newInstance()
//    
//    init() {
//        interactor.fetchedObjects
//            .map { $0 }
//            .replaceError(with: [])
//            .assign(to: \.transactions, on: self)
//            .store(in: &cancellables)
//    }
//    
//    func didTapDelete(transaction: TransactionModel) {
//        deletingTransaction = transaction
//        isShowingDeleteAlert = true
//    }
//    
//    func didTapEdit(transaction: TransactionModel) {
//        editingTransaction = transaction
//        isShowingEditingView = true
//    }
//    
//    func didConfirmDelete() {
//        Just(deletingTransaction)
//            .compactMap { $0 }
//            .flatMap {
//                self.interactor.delete($0)
//            }
//            .sink { _ in } receiveValue: { _ in }
//            .store(in: &cancellables)
//
//    }
//    
//    func didTapAdd() {
//        isShowingEditingView = true
//    }
//    
//    func didDismissActionsPopover() {
//        print("didDismissActionsPopover")
//    }
//}
