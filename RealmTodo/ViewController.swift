//
//  ViewController.swift
//  RealmTodo
//
//  Created by kohari on 2019/09/27.
//  Copyright © 2019 kohari. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITableViewDataSource{
    
    var todoItems: Results<Todo>!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
     super.viewDidLoad()
        //一覧の実行時にエラー
        table.dataSource = self
      let realm = try! Realm()
     todoItems = realm.objects(Todo.self)
        
        table.reloadData()
    }
    
    //画面が表示される前に実行される処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    
     
    //セル数の宣言
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count //総todo数を返している
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = todoItems[indexPath.row]
        cell.textLabel?.text = object.title
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //先にrealmの該当データを消してからリロード
            deleteTodo(at: indexPath.row)
            table.reloadData()
        }
    }
   func deleteTodo(at index: Int){
        
        let realm = try! Realm()
        try! realm.write {
            realm.delete(todoItems[index])
        
    }
    
    
    
    
    
    
   // private var realm: Realm!
    
  
        
        /*作成
        let tanaka = User()
        tanaka.id = 1
        tanaka.name = "田中"
        tanaka.createdAt = NSDate().timeIntervalSince1970
        try! realm.write {
            realm.add(tanaka)
        }
        //作成2
        let yamada = User()
        yamada.id = 2
        yamada.name = "山田"
        yamada.createdAt = NSDate().timeIntervalSince1970
        try! realm.write {
            realm.add(yamada)
        }
        //参照
        let users = realm.objects(User.self).filter("id != 0").sorted(byKeyPath: "id")
        for user in users {
            print(user.name)
        }
        //更新
        let hoge = realm.objects(User.self).last!
        try! realm.write {
            hoge.name = "ほげ"
        }
        //参照
        for user in realm.objects(User.self).filter("id != 0").sorted(byKeyPath: "id"){
            print(user.name)
        }
        //削除
        let lastUser = realm.objects(User.self).last!
        try! realm.write {
            realm.delete(lastUser)
        }
        //参照
        for user in realm.objects(User.self).filter("id != 0").sorted(byKeyPath: "id"){
            print(user.name)
        }*/
    
    
   

}
}
