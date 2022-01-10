
import UIKit

class PostViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemTeal
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Информация", style: .plain, target: self, action: #selector(openInfo))
        let title = UILabel(frame: CGRect(x: UIScreen.main.bounds.width*0.5 - 25, y: 100, width: 100, height: 150))
        title.text = "Пост"
        navigationItem.title = "Пост"
        view.addSubview(title)
    }
    @objc func openInfo() {
        let infoViewController = InfoViewController()
        present(infoViewController, animated: true, completion: nil)
    }

}
