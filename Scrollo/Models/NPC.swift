import Foundation

struct NPC {
    var id: Int
    var name: String
    var template: Int
    var is_male: Bool
    var race: Int
    var ac: Int
    var hit_points: Int
    var hit_dice: Int
    var num_HD: Int
    var speed: Int = 30
    var proficiency: Int
    var stats = [Int]()
    var skills = [Int]()
    var spells = [Int]()
    
    init(id:Int, name:String, template:Int, is_male:Bool, race:Int, ac:Int, hit_points:Int, hit_dice:Int, num_HD:Int, speed:Int, proficiency:Int, stats:[Int], skills:[Int], spells:[Int]) {
        self.id = id
        self.name = name
        self.template = template
        self.is_male = is_male
        self.race = race
        self.ac = ac
        self.hit_points = hit_points
        self.hit_dice = hit_dice
        self.num_HD = num_HD
        self.speed = speed
        self.proficiency = proficiency
        self.stats = stats
        self.skills = skills
        self.spells = spells
    }
    
    init() {
        self.init(id:0, name:"", template:0, is_male:false, race:0, ac:0, hit_points:0, hit_dice:0, num_HD:1, speed:30, proficiency: 1, stats:[10,10,10,10,10,10], skills:[Int](), spells:[Int]())
    }
}
