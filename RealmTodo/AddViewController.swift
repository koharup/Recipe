//
//  AddViewController.swift
//  RealmTodo
//
//  Created by kohari on 2019/09/30.
//  Copyright © 2019 kohari. All rights reserved.
// butttonの画像が丸くならない

import UIKit
import RealmSwift

class AddViewController: UIViewController, UITextFieldDelegate,UITextViewDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var textBox: UITextField!
    @IBOutlet weak var textMemo: UITextView!
    @IBOutlet weak var textUrl: UITextField!
    @IBOutlet var cameraImageView: UIImageView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet var saveButton: UIButton!
    @IBOutlet var alubumButton: UIButton!
    //ハートの方
    @IBOutlet weak var heart1: UIButton!
    @IBOutlet weak var heart2: UIButton!
    @IBOutlet weak var heart3: UIButton!
    @IBOutlet weak var heart4: UIButton!
    @IBOutlet weak var heart5: UIButton!
    
    //ハート
    let heartFill:UIImage = UIImage(named:"heartFill")!
    let heartEmpty:UIImage = UIImage(named:"heartEmpty")!
    
    //ハート
    var rate: Int = 0 {
        willSet {
            let hearts = [heart1, heart2, heart3, heart4, heart5]
            for (i, heart) in hearts.enumerated() {
                heart?.isSelected = i < newValue
            }
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        saveButton.layer.cornerRadius = 47
        alubumButton.layer.cornerRadius = 47
        
        //キーボードたたむ
        textBox.delegate = self
        textUrl.delegate = self
        
        
        //ハート
        let hearts = [heart1, heart2, heart3, heart4, heart5]
        for heart in hearts {
            heart?.setImage(heartEmpty, for: .normal)
            heart?.setImage(heartFill, for: .selected)
        }
        
        
        
    }
    
    @IBAction func addButton(_ sender: Any){
        //保存
        let realm = try! Realm()
        let todo = Todo()
        todo.title = textBox.text!
        todo.memo = textMemo.text!
        todo.url = textUrl.text!
        todo.rate = rate
//        todo.heartmark1 = heart1.
        print(heart1.state)
        
        
        // if let文は繋げられる
        if let image = imageView.image {
            // jpgの形式にしてサイズをなるべく小さくしたものを保存
            todo.imageData = image.jpegData(compressionQuality: 0.2)
        }
      
        try! realm.write{
            realm.add(todo)
        }
        
        
        self.navigationController?.popViewController(animated: true) //変更
        
        
        
        //アラートを出す
        let alert: UIAlertController = UIAlertController(title: "保存", message: "保存が完了しました。",preferredStyle: .alert)
        
        //OKボタン
        alert.addAction(
            UIAlertAction(
                title: "OK",
                style: .default,
                handler: { action in
                    //ボタンが押された時の動作
                    print("OKボタンが押されました！")
            }
            )
        )
        present(alert, animated: true, completion: nil)
        
    }
    
    //キーボード閉じる(タイトル)
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //キーボード閉じる（メモ）
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if (self.textMemo.isFirstResponder) {
            self.textMemo.resignFirstResponder()
        }
    }
    
    
    
    
    
    
    
    @IBAction func takePhoto(){
        
        //カメラが使えるかの確認
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            
            //カメラを起動
            
            let picker = UIImagePickerController()
            picker.sourceType = .camera
            picker.delegate = self
            
            picker.allowsEditing = true
            
            present(picker, animated: true, completion: nil)
            
        }else{
            //カメラが使えない時はエラーがコンソールに出ます
            print("error")
        }
    }
    
    //カメラ、カメラロールを使った時に選択した画像をアプリ内に表示させるためのメソッド
    func imagePickerController(_ imagePicker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]){
        cameraImageView.image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func openAlbum(){
        //カメラロールを使えるか確認
        let imagePickerController = UIImagePickerController()
        imagePickerController.delegate = self
        // 今回はフォトライブラリオンリーに
        // 実用的にはUIAlertControllerを使ってどちらにするか選択させるなどもよく行われる
        imagePickerController.sourceType = .photoLibrary
        present(imagePickerController, animated: true, completion: nil)
        
    }
    
    
    @IBAction func heart1Tapped(_ sender: AnyObject) {
        switch rate {
        case 1:
            rate = 0
            
        default:
            rate = 1
        }
    }
    @IBAction func heart2Tapped(_ sender: AnyObject) {
        rate = 2
    }
    
    @IBAction func heart3Tapped(_ sender: AnyObject) {
        rate = 3
    }
    
    @IBAction func heart4Tapped(_ sender: AnyObject) {
        rate = 4
    }
    
    @IBAction func heart5Tapped(_ sender: AnyObject) {
        rate = 5
    }
    
}





/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destination.
 // Pass the selected object to the new view controller.
 }
 */


