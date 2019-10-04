//
//  Todo.swift
//  RealmTodo
//
//  Created by kohari on 2019/09/27.
//  Copyright © 2019 kohari. All rights reserved.
//

import Foundation
import RealmSwift

class Todo: Object {
     @objc dynamic var title = ""
    @objc dynamic var text = ""
    
}
