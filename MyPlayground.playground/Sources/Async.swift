import Foundation

public struct Async {
    static let lock1 = "playground.lock1"
    let queue1 = DispatchQueue(label: Async.lock1)

    func dispatch1() {
        DispatchQueue.global(qos: .default).async {
            objc_sync_enter(self)
            //DispatchQueue(label: self.lock1).sync {
                print("1")
            //}
            objc_sync_exit(self)
        }
    }

    func dispatch2() {
        DispatchQueue.global(qos: .default).async {
            objc_sync_enter(self)
            //DispatchQueue(label: self.lock1).sync {
            print("222222")
            //}
            objc_sync_exit(self)
        }
    }

    func dispatch(message: String) {
        //DispatchQueue(label: self.lock1).async {
        DispatchQueue.global(qos: .default).async {
            //DispatchQueue.global().sync(flags: .barrier) {
            //objc_sync_enter(self)
            self.queue1.sync() {
                print(message)
                print(message)
                print(message)
                print(message)
                print(message)
            }
            //objc_sync_exit(self)
        }
    }

    public func test() {
        for i in 0 ..< 100 {
//            dispatch1()
//            dispatch2()
            dispatch(message: String(i))
        }
    }

    public init() { }
}
