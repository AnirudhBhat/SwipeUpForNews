
import Foundation

struct TwitterUserDataCollection : Codable {
    var id: String
    var text: String
    var created_at:String

}

struct TwitterData: Codable {
    var data: [TwitterUserDataCollection]
}


//struct Response: Codable
//{
//    struct TwitterUserData : Codable {
//        var id: String
//        var text: URL
//
//    }
//
//    var TwitterData: [TwitterUserData]
//}
