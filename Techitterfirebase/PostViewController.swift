//
//  PostViewController.swift
//  Techitterfirebase
//
//  Created by 森田貴帆 on 2020/09/22.
//

import UIKit
import Firebase
import FirebaseDatabase 

class PostViewController: UIViewController {
    
    @IBOutlet var posttextfield: UITextField!
    
    var saveData: UserDefaults = UserDefaults.standard
    var ref : DatabaseReference! //データの書き込みを行うために必要
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func post() {
        
        if  posttextfield.text != nil{
            let date = Date()
            let dateFormatter = DateFormatter()
            // DateFormatter を使用して書式とロケールを指定する
            dateFormatter.dateFormat = DateFormatter.dateFormat(fromTemplate: "yyyy/MM/dd", options: 0, locale: Locale(identifier: "ja_JP"))
            let post:  [String : Any]  = ["username":saveData.string(forKey: "username")!,"date": String(dateFormatter.string(from: date)), "contents": posttextfield.text!]  //←この方がスッキリする
            ref.child("post").childByAutoId().setValue(post)
            //画面遷移
            self.dismiss(animated: true, completion: nil)
        }
    }
    
}
