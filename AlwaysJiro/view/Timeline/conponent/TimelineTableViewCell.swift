//
//  TimelineTableViewCell.swift
//  AlwaysJiro
//
//  Created by 若田直希 on 2022/12/12.
//

import UIKit
import Nuke

class TimelineTableViewCell: UITableViewCell {
    
    @IBOutlet weak var userTileView: UserTileView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        // 角丸にする
        userTileView.userImage.layer.cornerRadius = userTileView.userImage.frame.size.width * 0.5
        userTileView.userImage.clipsToBounds = true
    }
    
    func setCell(post: Post){
        
        let date: Date = post.createdAt.dateValue()
        
        let url = URL(string:  post.userImage) ?? URL(string: "https://ogre.natalie.mu/artist/100506/20220303/konnoayaka_art202203.jpg?imwidth=640&imdensity=1")!
        
        setStar(rating: post.rating)
        
        self.userTileView.userName.text = post.userName
        self.userTileView.postedAt.text = date.toFormattedString()
        Nuke.loadImage(with: url , into: self.userTileView.userImage)
    }
    
    func setStar(rating:Int){
        if(rating==5){
            userTileView.star1.tintColor = UIColor.systemYellow
            userTileView.star2.tintColor = UIColor.systemYellow
            userTileView.star3.tintColor = UIColor.systemYellow
            userTileView.star4.tintColor = UIColor.systemYellow
            userTileView.star5.tintColor = UIColor.systemYellow
        }else if(rating == 4){
            userTileView.star1.tintColor = UIColor.systemYellow
            userTileView.star2.tintColor = UIColor.systemYellow
            userTileView.star3.tintColor = UIColor.systemYellow
            userTileView.star4.tintColor = UIColor.systemYellow
        }else if(rating == 3){
            userTileView.star1.tintColor = UIColor.systemYellow
            userTileView.star2.tintColor = UIColor.systemYellow
            userTileView.star3.tintColor = UIColor.systemYellow
        }else if(rating == 2){
            userTileView.star1.tintColor = UIColor.systemYellow
            userTileView.star2.tintColor = UIColor.systemYellow
        }else if(rating == 1){
            userTileView.star1.tintColor = UIColor.systemYellow
        }
    }
}
