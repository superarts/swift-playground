import Foundation

public class Escape {
    var handler: ((@escaping () -> Void) -> Void)?
    public func register(handler: @escaping (@escaping () -> Void) -> Void) {
        self.handler = handler
    }
    public init() {
        handler = nil
    }
}

extension String {
    var testDate: String {
        get {
            return "Test date \(self): \(Date())"
        }
    }
}

/*
 let s = "1"
 print(s.testDate)
 sleep(2)
 print(s.testDate)
 */

class ClosureDispatcher {
    func dispatch(_ ref: Any, _ closure: @escaping () -> Void) {
        DispatchQueue.init(label: "test").async {
            sleep(1)
            print("dispatcher dispatching:", ref, self)
            closure()
        }
    }
    func dispatch(_ closure: @escaping () -> Void) {
        DispatchQueue.init(label: "test").async {
            sleep(1)
            print("dispatcher dispatching:", self)
            closure()
        }
    }
}

class Container {
    var dispatcher = { return ClosureDispatcher() }
    func getDispatcher() -> ClosureDispatcher {
        return dispatcher()
    }
}

class ClosureHolder {
    func test() {
        // Get dispatch from a local instance
        // This should be the same with resolving dependency with Swinject

        Container().getDispatcher().dispatch() {
            //Container().getDispatcher().dispatch(self) {
            // `self` is not `nil` from playground
            print("holder dispatching:", self)
        }
    }
}

/*
typealias Credential = String
let Username = "daddy"
let Password = "asdf"

protocol UserRequired {
    var username: Credential { get }
}

extension UserRequired {
    var username: Credential { return Username }
}

protocol PassRequired {
    var password: Credential { get }
}

extension UserRequired {
    var password: Credential { return Password }
}

protocol CredentialWrapper {
    var credential: Credential { get }
}

protocol AuthRequired {
    associatedtype auth: CredentialWrapper
}

//typealias UsernameRequired = AuthRequired where auth = Username

struct AuthViewModel: UserRequired, PassRequired {
    func test() {
        print("username:", username)
        print("password:", password)
    }
}

AuthViewModel().test()
*/

enum Team: CaseIterable
{
    case team1, team2
}

// interface

protocol MultiState {
}

protocol MultiStateSuccess: MultiState {
    var id: Int { get }
}

protocol MultiStateFailure: MultiState {
    var reason: String { get }
}

// implementation

struct MultiStateSuccessModel: MultiStateSuccess {
    var id: Int
}

struct MultiStateFailureModel: Error, MultiStateFailure {
    var reason: String
}

// API

struct MultiStateModel {
    var id: Int?
    var reason: String?
}

// suppose we get some models from API

func apiModelTest() {
    let modelSuccess = MultiStateModel(id: 1, reason: nil)
    let modelFailure = MultiStateModel(id: nil, reason: "fire")
    let apiModels = [modelSuccess, modelFailure]

    // then we put them inside an array, and pass `models` to client
    var models = [MultiState]()
    apiModels.forEach { apiModel in
        if let id = apiModel.id {
            models.append(MultiStateSuccessModel(id: id))
        }
        if let reason = apiModel.reason {
            models.append(MultiStateFailureModel(reason: reason))
        }
    }

    // client side
    models.forEach { model in
        if let model = model as? MultiStateSuccess {
            print("success id:", model.id)
        }
        if let model = model as? MultiStateFailure {
            print("failure reason:", model.reason)
        }
    }

    var results = [Result<MultiStateSuccessModel, MultiStateFailureModel>]()
    apiModels.forEach { apiModel in
        if let id = apiModel.id {
            results.append(Result.success(MultiStateSuccessModel(id: id)))
        }
        if let reason = apiModel.reason {
            results.append(Result.failure(MultiStateFailureModel(reason: reason)))
        }
    }
}
