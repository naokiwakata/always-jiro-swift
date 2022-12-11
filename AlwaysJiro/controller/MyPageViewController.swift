//
//  MyPageViewController.swift
//  AlwaysJiro
//
//  Created by 若田直希 on 2022/12/11.
//

import UIKit

class MyPageViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        label.text = "Hello World!!"
        
        // TabBarを作成する
        let tabBar = UITabBar()
        tabBar.translatesAutoresizingMaskIntoConstraints = false
        
        // TabBarの位置を調整する
        let safeAreaInsets = view.safeAreaInsets
        tabBar.frame = CGRect(x: safeAreaInsets.left,
                              y: 0,
                              width: view.frame.width - safeAreaInsets.left - safeAreaInsets.right,
                              height: 44)
        
        // タブバーアイテムを作成する
        let tab1 = UITabBarItem(tabBarSystemItem: .featured, tag: 1)
        let tab2 = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
        let tab3 = UITabBarItem(tabBarSystemItem: .history, tag: 3)
        
        // TabBarにタブバーアイテムを追加する
        tabBar.setItems([tab1, tab2, tab3], animated: false)
        
        // TabBarを画面の上部に配置する
        view.addSubview(tabBar)
        NSLayoutConstraint.activate([
            tabBar.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tabBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBar.trailingAnchor.constraint(equalTo: view.trailingAnchor),
        ])
    }
    
}
