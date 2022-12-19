import UIKit
import Firebase

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource,NavigateProtocol {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    
    var posts: Array<Post> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 10000
        // クルクルをストップした時に非表示する
        acitivityIndicator.hidesWhenStopped = true
        // UITableViewに自作したTableViewCellを追加
        tableView.register(UINib(nibName: "TimelineTableViewCell", bundle: nil), forCellReuseIdentifier: "TimelineTableViewCell")
        tableView.register(UINib(nibName: "SampleTableViewCell", bundle: nil), forCellReuseIdentifier: "SampleTableViewCell")
        
        // 非同期処理
        Task.detached(){ [self] in
            await fetchUsers()
            // ユーザーを取得後に画面を更新
            await self.tableView.reloadData()
        }
    }
    
    func fetchUsers() async {
        // ローディングスタート
        acitivityIndicator.startAnimating()
        
        // Firestoreを初期化する
        let db = Firestore.firestore()
        do{
            let documents = try await db.collection("timeline").getDocuments()
            let posts = documents.documents.map{ Post(doc: $0) }
            self.posts = posts
        }catch{
            print("Error")
        }
        
        // ローディングストップ
        acitivityIndicator.stopAnimating()
        
    }
    
    // TableViewの描画に必要（リストの数を返す）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(posts.count)
        return posts.count
    }
    
    // TableViewの描画に必要（Cellを指定）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // このようにコンポーネントをXibファイルで作って場合分けが可能っぽい
        //        if indexPath.row == 0 {
        //            // セルを取得する
        //            let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as! SampleTableViewCell
        //
        //                return cell
        //        }
        // セルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        cell.delegate = self
        cell.setCell(post: posts[indexPath.row])
        
        print("\(indexPath.row) / \(posts.count)")
        
        return cell
        
    }
    
    func navigateToPhotoView(storyboard:String,nextViewController:String,navigateType:NavigateType,post:Post) {
        let baseVC = self
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let nextVc = storyboard.instantiateViewController(withIdentifier: nextViewController) as! PhotoViewController
        // imageURLsをPhotoViewに渡す
        nextVc.imageURLs = post.imageURLs
        
        DispatchQueue.main.async {
            switch navigateType {
            case .push:
                nextVc.hidesBottomBarWhenPushed = true // タブバー非表示
                baseVC.navigationController?.pushViewController(nextVc, animated: true)
            case .modal:
                nextVc.modalPresentationStyle = .fullScreen
                nextVc.modalTransitionStyle = UIModalTransitionStyle.crossDissolve //　ふわっと遷移(https://superhahnah.com/swift-modal-transition-style/)
                baseVC.present(nextVc,animated: true)
            }
        }
        
    }
    
}
