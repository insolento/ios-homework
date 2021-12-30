import UIKit

class InfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .cyan
        
        let alertButton: UIButton = {
            let button = UIButton(type: .system)
            button.frame.size.height = 75
            button.frame.size.width = 250
            button.center = view.center
            button.setTitle("Open alert", for: .normal)
            button.addTarget(self, action:#selector(self.openAlert), for: .touchUpInside)
            return button
        }()
        
        view.addSubview(alertButton)
    }
    
    @objc func openAlert() {
        let alertWindow = UIAlertController(title: "Name of alert", message: "Message of Alert", preferredStyle: .alert)
        present(alertWindow, animated: true, completion: nil)
        print("Было открыто UIAlertController")
    }
}
