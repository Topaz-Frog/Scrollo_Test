import Foundation

struct Generator {
    var name: String
    var image: String
    var description: String
    var content: String
    var isImplemented: Bool = false
    
    init(name: String, image: String, description: String, content: String, isImplemented: Bool) {
        self.name = name
        self.image = image
        self.description = description
        self.content = content
        self.isImplemented = isImplemented
    }
    
    init() {
        self.init(name: "", image: "", description: "", content: "", isImplemented: false)
    }
}
