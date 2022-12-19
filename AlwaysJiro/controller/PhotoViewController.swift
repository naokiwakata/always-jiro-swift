//
//  PhotoViewController.swift
//  AlwaysJiro
//
//  Created by 若田直希 on 2022/12/19.
//

import UIKit

class PhotoViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        label.text = "PhotoView"
    }
    
    @IBAction func onTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
}
