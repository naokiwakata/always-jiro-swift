import UIKit

class ShopTileView: UIView {

    @IBOutlet weak var shopName: UILabel!
    @IBOutlet weak var shopAddress: UILabel!
    @IBOutlet weak var shopImage: UIImageView!

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
                let nib = UINib(nibName: "ShopTileView", bundle: nil)
                guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else { return }
                self.addSubview(view)
            }
}
