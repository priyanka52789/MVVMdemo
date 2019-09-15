
//
//  UserVM.swift
//  designPattern
//
//  Created by Priyanka Sen on 15/09/19.
//  Copyright © 2019 Priyanka Sen. All rights reserved.
//

import Foundation

struct UserViewModel {
    let userId: Int!
    let title: String!
    let userName: String!
    let name: String!
    let email: String!
    let phone: String!
    let company: String!
    let website: String!
    let address: String!
    let latlong: (String,String)!
    
    init(user: User) {
        self.userId = user.id ?? 0
        self.title = (user.name != nil && user.email != nil) ? user.name! + "(" + user.email! + ")" : ""
        self.userName = user.username ?? ""
        self.name = user.name ?? ""
        self.email = user.email ?? ""
        self.phone = (user.phone ?? "" + "(M)")
        self.company = (user.company!.name != nil && user.company!.bs != nil) ? user.company!.name! + " (" + user.company!.bs! + ")" : ""
        self.website = user.website ?? ""
        self.address = user.address?.city ?? ""
        self.latlong = (user.address?.geo?.lat ?? "0",user.address?.geo?.lng ?? "0")
    }
}
