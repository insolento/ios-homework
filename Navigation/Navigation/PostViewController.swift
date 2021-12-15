
import UIKit

class PostViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(openInfo))

        
        
        var postTitle: String
        let screenSize = UIScreen.main.bounds
        let screenWidth = screenSize.width
        print(screenWidth)
        view.backgroundColor = .systemTeal
        let title = UILabel(frame: CGRect(x: screenSize.width*0.5 - 25, y: 100, width: 100, height: 150))
        title.text = "Пост"
        
        view.addSubview(title)
        
    }
    @objc func openInfo() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }

}
