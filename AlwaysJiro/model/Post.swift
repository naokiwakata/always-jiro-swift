import Firebase

class Post {
    
    let uid: String
    let adress: String
    let comment: String
    let hasImage: Bool
    let createdAt: Timestamp
    let imageIDs:Array<String>
    let imageURLs:Array<String>
    let onlyReview:Bool
    let rating: Int
    let shopImage:String
    let shopName:String
    let shopUid:String
    let userImage:String
    let userName:String
    let userUid:String

    init(doc: DocumentSnapshot) {
        let dic:[String: Any] = doc.data()!
        
        self.uid = doc.documentID
        self.adress = dic["adress"] as? String ?? ""
        self.comment = dic["comment"] as? String ?? ""
        self.createdAt = dic["createdAt"] as? Timestamp ?? Timestamp()
        self.imageIDs = dic["imageIDs"] as? Array<String> ?? []
        self.imageURLs = dic["imageURLs"] as? Array<String> ?? []
        self.onlyReview = dic["onlyReview"] as? Bool ?? false
        self.hasImage = dic["hasImage"] as? Bool ?? false
        self.rating = dic["rating"] as? Int ?? 0
        self.shopImage = dic["shopImage"] as? String ?? ""
        self.shopName = dic["shopName"] as? String ?? ""
        self.shopUid = dic["shopUid"] as? String ?? ""
        self.userImage = dic["userImage"] as? String ?? ""
        self.userName = dic["userName"] as? String ?? ""
        self.userUid = dic["userUid"] as? String ?? ""
    }
}
