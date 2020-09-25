//
//  ViewController.swift
//  Techitterfirebase
//
//  Created by 森田貴帆 on 2020/09/21.
//

import UIKit
import Firebase
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet var table: UITableView!

    
    var contentarray: [DataSnapshot] = [] //データを入れておく配列。これをtableviewで表示する
    
    var snap: DataSnapshot!
    //  var ref : DatabaseReference!
    let ref = Database.database().reference() //Firebaseのルートを宣言しておく
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        self read()//データを読み込むためのメソッド
        // ref = Database.database().reference()
        table.dataSource = self
        //ここで画面遷移して
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SampleCell") as! SampleCell
        cell.namelabel.text = ""
        cell.datalabel.text = ""
        cell.postlabel.text = ""
        return cell
    }
    
    
}

