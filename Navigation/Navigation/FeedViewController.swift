import UIKit

class FeedViewController: UIViewController {
    let postController = PostViewController()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        struct Post {
            internal var title: String
        }
        
        view.backgroundColor = .white
        
        let buttonToPost = UIButton(type: .system)
        
        buttonToPost.frame.size.height = 75
        buttonToPost.frame.size.width = 250
        buttonToPost.center = view.center
        buttonToPost.setTitle("Open Post", for: .normal)
        view.addSubview(buttonToPost)
        
        buttonToPost.addTarget(self, action:#selector(self.openPost), for: .touchUpInside)
    }
    @objc func openPost() {
        self.navigationController?.pushViewController(postController, animated: true)
    }
}
