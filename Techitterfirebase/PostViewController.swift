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
    
    var ref : DatabaseReference! //データの書き込みを行うために必要
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference()
    }
    
    @IBAction func post() {
        let post = ["username": "", "date": "", "contents": "\(String(describing:posttextfield.text))"] //←この方がスッキリする
        ref.child("post").childByAutoId().setValue(post)
        //String(describing:posttextfield.textわからない
    }
    
    func create(){
        //textFieldになにも書かれてない場合は、その後の処理をしない
        //  guard let text = posttextfield.text else { return }
        
        //ロートからログインしているユーザーのIDをchildにしてデータを作成
        //childByAutoId()でユーザーIDの下に、IDを自動生成してその中にデータを入れる
        //setValueでデータを送信する。第一引数に送信したいデータを辞書型で入れる
        //今回は記入内容と一緒にユーザーIDと時間を入れる
        //FIRServerValue.timestamp()で現在時間を取る
        // self.ref.child((FIRAuth.auth()?.currentUser?.uid)!).childByAutoId().setValue(["user": (FIRAuth.auth()?.currentUser?.uid)!,"content": text, "date": FIRServerValue.timestamp()])
    }

    
}
