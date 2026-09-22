import Foundation

struct Craft: Identifiable, Hashable {
    let id: UUID
    let name: String
    let englishName: String
    let imageName: String
    let description: String

    init(
        id: UUID = UUID(),
        name: String,
        englishName: String,
        imageName: String,
        description: String
    ) {
        self.id = id
        self.name = name
        self.englishName = englishName
        self.imageName = imageName
        self.description = description
    }
}

