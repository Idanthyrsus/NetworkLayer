
import Foundation

struct FruitDatum: Codable {
    let genus, name: String?
    let id: Int?
    let family, order: String?
    let nutritions: Nutritions?
}

struct Nutritions: Codable {
    let carbohydrates, protein, fat: Double?
    let calories: Int?
    let sugar: Double?
}


