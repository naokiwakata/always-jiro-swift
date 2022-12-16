import Foundation

extension Date{
    func toFormattedString() -> String{
        let df = DateFormatter()
        df.locale = Locale(identifier: "ja_JP")
        df.dateFormat = "yyyy/MM/dd HH:mm"
        return df.string(from: self)
    }
}
