//
//  TimelineTableViewCell.swift
//  AlwaysJiro
//
//  Created by 若田直希 on 2022/12/12.
//

import UIKit
import Nuke

class TimelineTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var userImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setCell(user: User){
        self.name.text = user.displayName
        let url = URL(string:  user.photoURL) ?? URL(string: "https://ogre.natalie.mu/artist/100506/20220303/konnoayaka_art202203.jpg?imwidth=640&imdensity=1")!

        Nuke.loadImage(with: url , into: self.userImage)
    }
    
}
