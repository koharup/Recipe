//
//  Todo.swift
//  
//
//  Created by kohari on 2019/10/10.
//

import Foundation
import RealmSwift

class Todo: Object{
    @objc dynamic var title = ""
    @objc dynamic var id = 0
    @objc dynamic var memo = ""
    @objc dynamic var url = ""
    @objc dynamic var rate = 0
    //画像
    @objc dynamic var imageData: Data?
    
    
}
