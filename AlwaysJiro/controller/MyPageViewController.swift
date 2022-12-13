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
        // nibNameにはxibファイル名が入る。
        let cell:UIView = UINib(nibName: "TimelineTableViewCell", bundle: nil).instantiate(withOwner: self, options: nil)[0] as! UIView
        // 呼び出したコントローラーのviewに設定する
        view.addSubview(cell)
    }
    
}
