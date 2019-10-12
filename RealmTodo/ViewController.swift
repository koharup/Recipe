//
//  ViewController.swift
//  RealmTodo
//
//  Created by kohari on 2019/09/27.
//  Copyright © 2019 kohari. All rights reserved.
//

import UIKit
import RealmSwift


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    var todoItems: Results<Todo>!
    @IBOutlet weak var table: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        table.register(UINib(nibName: "AllMenuTableViewCell", bundle: nil), forCellReuseIdentifier: "AllMenuTableViewCell")
        table.dataSource = self
        table.delegate = self
        
        let realm = try! Realm()
        todoItems = realm.objects(Todo.self)
        
        table.reloadData()
        
        
    }
    
    
    //画面が表示される前に実行される処理
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        table.reloadData()
    }
    
    //遷移
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        // セルの選択を解除
        tableView.deselectRow(at: indexPath, animated: true)
        
        // 別の画面に遷移
        performSegue(withIdentifier: "toDetailViewController", sender: indexPath.row)
    }
    
    
    
    //ここでtableviewに情報を写している
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "AllMenuTableViewCell", for: indexPath) as! AllMenuTableViewCell
        
        cell.titlelabel.text = todoItems[indexPath.row].title
        
        let heartArray = [cell.heart1,cell.heart2,cell.heart3,cell.heart4,cell.heart5]
        for i in 0 ..< todoItems[indexPath.row].rate {
            heartArray[i]?.image = UIImage(named:"heartFill")!
        }
        //cell.postImageView.kf.setImage(with: posts[indexPath.row].imagePath)
        
        return cell
    }
    
    
    //セル数の宣言
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return todoItems.count //総todo数を返している
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
         
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailViewController"{
            let nextVC = segue.destination as? DetailViewController
            nextVC?.selectedTodo = todoItems[sender as! Int]
        }
    }
}
