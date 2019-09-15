//
//  Service.swift
//  MVVMdemo
//
//  Created by Priyanka Sen on 15/09/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import UIKit

class ApiManager: NSObject {
    
    static let shared = ApiManager()
    let session = URLSession(configuration: .default)
    var request : NSMutableURLRequest = NSMutableURLRequest()
    
    func getUserData(_ complition: @escaping ([User]?)->()) {
        
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {return}
        request.url = url
        request.httpMethod = "GET"
        request.timeoutInterval = 30
        
        let task = session.dataTask(with: url) { (data, response, error) in
            guard let userData = data, error == nil else  {
                print(error?.localizedDescription ?? "Response error")
                return
            }
            let userArray = try? JSONDecoder().decode([User].self, from: userData)
            complition(userArray)
        }
        task.resume()
    }
    
}


