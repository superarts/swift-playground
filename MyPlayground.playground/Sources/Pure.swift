import UIKit

//struct TestStruct {
//
//    private var _cv = false
//    var cv: Bool {
//        set {
//            _cv = newValue
//        }
//        get {
//            _cv
//        }
//    }
//    static var staticVar = 1
//    static func staticFunc() {
//        staticVar = 2
//    }
//    let v: Int
//    func test() {
//        //v = 1
//        print("xx2")
//    }
//}
//
//struct User {
//    let username: String
//    let password: String
//}
//
//extension User {
//    func password(_ password: String) -> User {
//        return User(username: self.username, password: password)
//    }
//}
//
//// TestStruct(v: 1).test()
//
//protocol PureEnumProtocol {
//    func test()
//}
//
//enum PureEnum: PureEnumProtocol {
//
//    static var v = 1    // Still possible
//    //var v = 1         // Enums must not contain stored properties
//    func test() {
//        //v = 2         // Impossible
//        print("PureTest", PureEnum.v)
//    }
//
//    // Redundant stub initializer is needed
//    case pure
//    init() {
//        self = .pure
//    }
//}
//
//enum MyError: Error {
//    case runtimeError(String)
//}
//
//func someFunction() throws {
//    throw MyError.runtimeError("some message")
//}

//

//var user = User(username: "usr", password: "pwd")
//user = user.password("passwd")
//User(username: "usr")
//
//let pureEnum: PureEnumProtocol = PureEnum()
//pureEnum.test()
//
//do {
//    try someFunction()
//} catch {
//    print(error)
//}
//
//print(UUID().uuidString)
//print(UUID().uuidString)
//
//let lastVersion = "0.1"
//let version = "0"
//print(lastVersion.compare(version, options: .numeric) != .orderedDescending)
//
