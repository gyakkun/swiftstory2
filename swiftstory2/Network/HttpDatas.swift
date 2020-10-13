//
// Created by gyakkun on 2020/7/19.
// Copyright (c) 2020 gyakkun. All rights reserved.
//

import UIKit
import Alamofire

private let httpShareInstance = HttpDatas()

enum MethodType {
    case get
    case post
}

class HttpDatas: NSObject {
    // Single Instance
    class var shareInstance: HttpDatas {
        return httpShareInstance
    }
}

extension HttpDatas {
    /// HTTP Request Encap
    ///
    /// - Parameters:
    ///   - type: get / post
    ///   - URLString: String
    ///   - parameters: Params to get/post
    ///   - finishCallBack: What to do after request processed
    func requestData(_ type: MethodType, URLString: String, parameters: [String: Any]?,
                     finishCallBack: @escaping (_ response: Any) -> ()) {

        // get or post
        let method = type == .get ? HTTPMethod.get : HTTPMethod.post

        AF.request(URLString, method: method, parameters: parameters, encoding: URLEncoding.default,
                        headers: nil)
                .responseJSON {
                    (response) in

//                    guard responseJSON.result.value != nil else{
//                        print(responseJSON.result.error)
//                        print(responseJSON.toString())
//                        return
//                    }
//
//                    guard responseJSON.result.isSuccess else {
//                        print(responseJSON.toString())
//                        return
//                    }
//
//                    if let value = responseJSON.result.value {
//                        finishCallBack(value)
//                    }

                    print(response)

                    switch response.result {
                    case .success(let value):
                        if let JSON = value as? [String: Any] {
                            let id = JSON["id"]
                            print(id)
                        }
                    case .failure(let error): break
                            // error handling
                    }

                }

    }
}