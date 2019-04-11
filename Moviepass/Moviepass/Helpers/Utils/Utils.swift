import Foundation

typealias ResponseCallback<T> = (_ response: T) -> ()
typealias APIErrorCallback = (String) -> ()
typealias SimpleCallback = () -> ()
