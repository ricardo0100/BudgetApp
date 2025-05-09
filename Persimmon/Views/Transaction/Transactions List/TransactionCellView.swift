import SwiftUI
import SwiftData

struct TransactionCellView: View {
    @EnvironmentObject var transaction: Transaction
    
    var body: some View {
        HStack(spacing: .spacingSmall) {
            VStack(alignment: .leading) {
                Text(transaction.name)
                    .font(.headline)
                Text(transaction.value.toCurrency(with: transaction.account.currency))
                    .font(.subheadline)
                HStack(spacing: .spacingSmall) {
                    Image(systemName: transaction.type.iconName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 12, height: 12)
                    Text(transaction.type.text)
                        .font(.caption2)
                }
            }
            Spacer()
            VStack(alignment: .trailing) {
                HStack(spacing: .spacingSmall) {
                    Text("\(transaction.account.name)")
                        .font(.subheadline)
                    LettersIconView(text: transaction.account.name.firstLetters(),
                                    color: Color(hex: transaction.account.color),
                                    size: 12)
                }
                if let category = transaction.category {
                    HStack(spacing: .spacingSmall) {
                        Text(category.name)
                            .font(.caption2)
                        if let icon = transaction.category?.icon {
                            ImageIconView(image: Image(systemName: icon),
                                          color: Color(hex: category.color),
                                          size: 14)
                        } else {
                            LettersIconView(text: category.name.firstLetters(),
                                            color: Color(hex: category.color),
                                            size: 16)
                        }
                    }
                }
                Text(transaction.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption2)
            }
        }
    }
}

#Preview {
    List {
        TransactionCellView().environmentObject(DataController.createRandomTransaction())
        TransactionCellView().environmentObject(DataController.createRandomTransaction())
        TransactionCellView().environmentObject(DataController.createRandomTransaction())
        TransactionCellView().environmentObject(DataController.createRandomTransaction())
    }
}
