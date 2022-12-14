import UIKit

class UserTileView: UIView {

    
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var userName: UILabel!
    @IBOutlet weak var postedAt: UILabel!
    
    @IBOutlet weak var star1: UIImageView!
    @IBOutlet weak var star2: UIImageView!
    @IBOutlet weak var star3: UIImageView!
    @IBOutlet weak var star4: UIImageView!
    @IBOutlet weak var star5: UIImageView!
    
    // カスタムUIViewを作る際の雛形
    override init(frame: CGRect) {
                super.init(frame: frame)
                nibInit()
            }
     
            required init?(coder aDecoder: NSCoder) {
                super.init(coder: aDecoder)
                nibInit()
            }
     
            private func nibInit() {
                // nibNameにXibファイルの名前を入れる
                let nib = UINib(nibName: "UserTileView", bundle: nil)
                guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
                self.addSubview(view)
            }

}
