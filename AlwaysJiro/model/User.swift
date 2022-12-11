import Firebase

class User {
    
    let displayName: String
    let email: String
    let uid: String
    let createdAt: Timestamp
    let allVisit:Int
    let favorite:Int
    let rating:Int
    let introduce:String
    let photoURL:String
    let signInMethod:String
    let twitterURL:String
    let tokens:Array<String>

    init(doc: DocumentSnapshot) {
        let dic:[String: Any] = doc.data()!
        
        self.uid = doc.documentID
        self.displayName = dic["displayName"] as? String ?? ""
        self.email = dic["email"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
        self.allVisit = dic["allVisit"] as? Int ?? 0
        self.favorite = dic["favorite"] as? Int ?? 0
        self.rating = dic["rating"] as? Int ?? 0
        self.introduce = dic["introduce"] as? String ?? ""
        self.photoURL = dic["photoURL"] as? String ?? ""
        self.signInMethod = dic["signInMethod"] as? String ?? ""
        self.twitterURL = dic["twitterURL"] as? String ?? ""
        self.tokens = dic["tokens"] as? Array<String> ?? []
    }
    
}
