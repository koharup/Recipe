//
//  DetailViewController.swift
//  
//
//  Created by kohari on 2019/10/06.
//

import UIKit
import RealmSwift

class DetailViewController: UIViewController {
    
    var todoItems: Results<Todo>!
    

    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    @IBOutlet weak var heart1: UIImageView!
    @IBOutlet weak var heart2: UIImageView!
    @IBOutlet weak var heart3: UIImageView!
    @IBOutlet weak var heart4: UIImageView!
    @IBOutlet weak var heart5: UIImageView!
    
    @IBOutlet weak var comment: UILabel!
    @IBOutlet weak var url: UILabel!
    
    let heartFill:UIImage = UIImage(named:"heartFill")!
    let heartEmpty:UIImage = UIImage(named:"heartEmpty")!
    
    var selectedTodo :Todo!
    
    //ハート
    
    override func viewDidLoad() {
       
        super.viewDidLoad()
        print(selectedTodo.title)
        print(selectedTodo.memo)
        print(selectedTodo.url)
        print(selectedTodo.imageData)
        
        name.text = selectedTodo.title
        comment.text = selectedTodo.memo
        url.text = selectedTodo.url
        photo.image = UIImage(data: selectedTodo.imageData!)
        
        let realm = try! Realm()
               todoItems = realm.objects(Todo.self)
        
        let heartArray = [heart1,heart2,heart3,heart4,heart5]
        for i in 0 ..< todoItems.rate {
                       heartArray[i]?.image = UIImage(named:"heartFill")!
        
       
    
        
        }
        
       
        
        
    /*     let hearts = [heart1, heart2, heart3, heart4, heart5]
        for heart in hearts {
            heart?.setimage(heartEmpty, for: .normal)
            heart?.setImage(heartFill, for: .selected)
        }
  */
        // Do any additional setup after loading the view.
    }
    
   
    

    


}


