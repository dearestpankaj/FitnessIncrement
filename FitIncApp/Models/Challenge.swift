import Foundation

struct Challenge: Codable {
    let extercise: String
    let startAmount: Int
    let increase: Int
    let length: Int
    let userId: String
    let startDate: Date
}
