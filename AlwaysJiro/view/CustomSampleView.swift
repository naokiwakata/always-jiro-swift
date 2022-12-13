//
//  CustomSampleView.swift
//  AlwaysJiro
//
//  Created by 若田直希 on 2022/12/14.
//

import UIKit

class CustomSampleView: UIView {

    @IBOutlet weak var label: UILabel!
    override init(frame: CGRect) {
               super.init(frame: frame)
               nibInit()
           }
    
           required init?(coder aDecoder: NSCoder) {
               super.init(coder: aDecoder)
               nibInit()
           }
    
           private func nibInit() {
               let nib = UINib(nibName: "CustomSampleView", bundle: nil)
               guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
               self.addSubview(view)
           }

}
