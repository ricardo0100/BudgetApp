import Foundation
import SwiftData

@Model class Category {
    @Attribute(.unique) var id: UUID
    var name: String
    var color: String
    var icon: String?
    
    @Relationship(deleteRule: .cascade) var transactions: [Transaction] = []
    
    @Attribute(.ephemeral) var total: Double {
        transactions.map { $0.value }.reduce(0, +)
    }
    
    init(id: UUID, name: String, color: String, icon: String?) {
        self.id = id
        self.name = name
        self.color = color
        self.icon = icon
    }
}
