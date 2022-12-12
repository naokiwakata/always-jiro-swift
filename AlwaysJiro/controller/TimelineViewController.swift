import UIKit
import Firebase

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    
    var users: Array<User> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
            let documents = try await db.collection("users").getDocuments()
            let users = documents.documents.map{ User(doc: $0) }
            self.users = users
        }catch{
            print("Error")
        }
        
        // ローディングストップ
        acitivityIndicator.stopAnimating()
        
    }
    
    // TableViewの描画に必要（リストの数を返す）
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }
    
    // TableViewの描画に必要（Cellを指定）
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // このようにコンポーネントをXibファイルで作って場合分けが可能っぽい
        if indexPath.row == 0 {
            // セルを取得する
            let cell = tableView.dequeueReusableCell(withIdentifier: "SampleTableViewCell", for: indexPath) as! SampleTableViewCell
            
                return cell
        }
        // セルを取得する
        let cell = tableView.dequeueReusableCell(withIdentifier: "TimelineTableViewCell", for: indexPath) as! TimelineTableViewCell
        
        cell.setCell(user: users[indexPath.row])
        
        return cell
        
    }
    
}
