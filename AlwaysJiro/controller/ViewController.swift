//
//  ViewController.swift
//  AlwaysJiro
//
//  Created by 若田直希 on 2022/12/10.
//

import UIKit
import Firebase

class ViewController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // タブバーの色変更
        UITabBar.appearance().tintColor = UIColor.orange
        
        // Firestoreを初期化する
        let db = Firestore.firestore()
        
        // usersコレクションを取得する
        db.collection("users").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
    
    
}

