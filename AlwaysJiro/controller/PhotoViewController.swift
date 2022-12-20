import UIKit
import Nuke

class PhotoViewController: UIViewController {
    
    private var scrollView: UIScrollView!
    private var pageControl: UIPageControl!
    
    var imageURLs:Array<String> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // scrollViewの画面表示サイズを指定
        scrollView = UIScrollView(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 800))
        // scrollViewのサイズを指定（幅は1メニューに表示するViewの幅×ページ数）
        scrollView.contentSize = CGSize(width: self.view.frame.size.width*4, height: 800)
        // scrollViewのデリゲートになる
        scrollView.delegate = self
        // メニュー単位のスクロールを可能にする
        scrollView.isPagingEnabled = true
        // 水平方向のスクロールインジケータを非表示にする
        scrollView.showsHorizontalScrollIndicator = false
        self.view.addSubview(scrollView)
        
        var i:Int = 0
        for imageURL in imageURLs {
            let imageView = createImageView(imageURL: imageURL,index: i)
            scrollView.addSubview(imageView)
            i+=1
        }
        // pageControlの表示位置とサイズの設定
        pageControl = UIPageControl(frame: CGRect(x: 0, y: 670, width: self.view.frame.size.width, height: 30))
        // pageControlのページ数を設定
        pageControl.numberOfPages = imageURLs.count
        // pageControlのドットの色
        pageControl.pageIndicatorTintColor = UIColor.white
        // pageControlの現在のページのドットの色
        pageControl.currentPageIndicatorTintColor = UIColor.orange
        self.view.addSubview(pageControl)
    }
    
    @IBAction func onTap(_ sender: Any) {
        self.dismiss(animated: true)
    }
    
    func createImageView(imageURL: String,index:Int) -> UIImageView {
        let imageView = UIImageView()
        let centerRect = CGRect(center: CGPoint(x: self.view.frame.size.width*CGFloat(index)+self.view.frame.size.width/2,y:self.view.frame.size.height/2), size: CGSize(width: self.view.frame.size.width, height: 500))
        imageView.frame = centerRect
        imageView.contentMode = .scaleAspectFit
        let url = URL(string:  imageURL) ?? URL(string: "https://ogre.natalie.mu/artist/100506/20220303/konnoayaka_art202203.jpg?imwidth=640&imdensity=1")
        Nuke.loadImage(with: url! , into: imageView)
        return imageView
    }
}

// scrollViewのページ移動に合わせてpageControlの表示も移動させる
extension PhotoViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width)
    }
}
