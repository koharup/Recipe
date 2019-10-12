//
//  User.swift
//  RealmTodo
//
//  Created by kohari on 2019/09/27.
//  Copyright © 2019 kohari. All rights reserved.
//

import Foundation
import RealmSwift

class User: Object{
    @objc dynamic var title = ""
    
    @objc  dynamic var id = 0
    @objc dynamic var name = ""
    @objc dynamic var createdAt: Double = 0
    
    
}
