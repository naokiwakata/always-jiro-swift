// (セルからの画面遷移) https://qiita.com/shachi_maru/items/54a2a653caf5cef8bdf4
protocol NavigateProtocol {
    func navigate(storyboard:String,nextViewController:String,navigateType:NavigateType)
}
