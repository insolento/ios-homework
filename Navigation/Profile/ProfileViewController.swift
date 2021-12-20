import UIKit

class ProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        let headerView = ProfileHeaderView(frame: self.view.frame)
        self.viewWillLayoutSubviews()
        self.view.addSubview(headerView)
        
    }
    



}
