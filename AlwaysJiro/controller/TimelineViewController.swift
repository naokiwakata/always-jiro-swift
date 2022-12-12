import UIKit
import Firebase

class TimelineViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var acitivityIndicator: UIActivityIndicatorView!
    //配列fruitsを設定
    let fruits = ["apple", "orange", "melon", "banana", "pineapple"]
    var users: Array<User> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // クルクルをストップした時に非表示する
        acitivityIndicator.hidesWhenStopped = true

        Task.detached(){ [self] in
            await fetchUsers()
            await self.tableView.reloadData()
        }
    }
    
    func fetchUsers() async {
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
        acitivityIndicator.stopAnimating()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(users.count)
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "TimelineCell", for: indexPath)
        
        // セルに表示する値を設定する
        cell.textLabel!.text = users[indexPath.row].displayName
        
        return cell    }
    
}
