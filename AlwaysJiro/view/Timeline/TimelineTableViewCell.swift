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
    @IBOutlet weak var publishedAt: UILabel!
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
        
        // 角丸にする
        userImage.layer.cornerRadius = userImage.frame.size.width * 0.5
        userImage.clipsToBounds = true
    }
    
    func setCell(post: Post){
        self.name.text = post.userName
        
        let date: Date = post.createdAt.dateValue()
        self.publishedAt.text = date.toFormattedString()
        
        let url = URL(string:  post.userImage) ?? URL(string: "https://ogre.natalie.mu/artist/100506/20220303/konnoayaka_art202203.jpg?imwidth=640&imdensity=1")!
        Nuke.loadImage(with: url , into: self.userImage)
        
        setStar(rating: post.rating)
    }
    
    func setStar(rating:Int){
        if(rating==5){
            star1.tintColor = UIColor.systemYellow
            star2.tintColor = UIColor.systemYellow
            star3.tintColor = UIColor.systemYellow
            star4.tintColor = UIColor.systemYellow
            star5.tintColor = UIColor.systemYellow
        }else if(rating == 4){
            star1.tintColor = UIColor.systemYellow
            star2.tintColor = UIColor.systemYellow
            star3.tintColor = UIColor.systemYellow
            star4.tintColor = UIColor.systemYellow
        }else if(rating == 3){
            star1.tintColor = UIColor.systemYellow
            star2.tintColor = UIColor.systemYellow
            star3.tintColor = UIColor.systemYellow
        }else if(rating == 2){
            star1.tintColor = UIColor.systemYellow
            star2.tintColor = UIColor.systemYellow
        }else if(rating == 1){
            star1.tintColor = UIColor.systemYellow
        }
    }
}
