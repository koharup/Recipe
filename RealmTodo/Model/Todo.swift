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
    /// PrimaryKey用 ... 投稿一つ一つを区別するために用いる値
    @objc dynamic var id = 0
    @objc dynamic var title = ""
    @objc dynamic var memo = ""
    @objc dynamic var url = ""
    //画像
    @objc dynamic var imageData: Data?
    
   
    
   
    /// PrimaryKey
    override static func primaryKey() -> String? {
        return "id"
    }

    
    /// 新しい投稿を作る
    static func create() -> Todo {
        // インスタンス化
        let todo = Todo()
        // lastId()を使ってidを設定
        todo.id = lastId()
        return todo
    }
    
    /// 最後のIDを取ってくる
    static func lastId() -> Int {
        let realm = try! Realm()
        // 投稿のうち最新のもののidを取ってくる
        if let latestTodo = realm.objects(Todo.self).last {
            return latestTodo.id + 1
        } else {
            return 1
        }
    }
    
    /// すべての投稿を取ってくる
    static func loadAll() -> [Todo] {
        let realm = try! Realm()
        // 投稿をidでソートして取得する
        let todos = realm.objects(Todo.self).sorted(byKeyPath: "id", ascending: false)
        // 簡単のため配列に変換して返している（場合による）
        return todos.map { $0 }
    }
    
    /// 自分自身を保存する
    func save() {
        let realm = try! Realm()
        try! realm.write {
            realm.add(self)
        }
    }

    /// 更新の場合
    func update(_ method: () -> Void) {
        let realm = try! Realm()
        try! realm.write {
            method()
        }
    }
    
}
/// データの読み込み用
/// structを使うとイニシャライザを自分で書かなくてよくなり少し便利
struct PostData {
    var title: String
    var memo: String
    var url: String
    var imagePath: URL?
    var userId: String
}
