import UIKit
import Firebase

class TimelineViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    var users: Array<User> = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = "接続できてる？"

        Task.detached(){ [self] in
            await fetchUsers()
            await print(users)
        }
    }
    
    func fetchUsers() async {
        // Firestoreを初期化する
        let db = Firestore.firestore()
        do{
            let documents = try await db.collection("users").getDocuments()
            let users = documents.documents.map{ User(doc: $0) }
            self.users = users
        }catch{
            print("Error")
        }
    }
}
