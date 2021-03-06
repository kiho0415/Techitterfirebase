//
//  ViewController.swift
//  Techitterfirebase
//
//  Created by 森田貴帆 on 2020/09/21.
//

import UIKit
import Firebase
import FirebaseDatabase


class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate{
    
    @IBOutlet var table: UITableView!
    var contentarray = [String]()//データを入れておく配列。これをtableviewで表示する
    var namearray = [String]()
    var datearray = [String]()
    
    let ref = Database.database().reference() //Firebaseのルートを宣言しておく
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.read()//データを読み込むためのメソッド
        table.dataSource = self
        table.delegate = self
        //ここで画面遷移してログイン画面へ
        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.present(nextView, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.read()
        //Cellの高さを調節
        table.rowHeight = 80
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentarray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! SampleCell
        cell.postlabel?.text = String(contentarray[indexPath.row])
        cell.namelabel?.text = String(namearray[indexPath.row])
        cell.datelabel?.text = String(datearray[indexPath.row])
        return cell
    }
    func read()  {
        //配列に要素があったら一度空にする
        if contentarray != []{
            contentarray.removeAll()
            namearray.removeAll()
            datearray.removeAll()
        }
        ref.child("post") .observeSingleEvent(of: .value, with: { [self] (snapshot) in
            // 受け取り
            let value = snapshot.value as? NSDictionary
            guard let snapshotValue = value else { return } //該当しなければ以下の処理はしない
            for post in snapshotValue.keyEnumerator(){
                guard let parsedPosts = snapshotValue[post] as? [String:Any] else { return }
                
                print(parsedPosts["contents"]!)

                contentarray.append(parsedPosts["contents"] as! String)
                namearray.append(parsedPosts["username"] as! String)
                datearray.append(parsedPosts["date"] as! String)
            }
            self.table.reloadData()
        }) { (error) in
            print(error.localizedDescription)
        }
        
    }
}

