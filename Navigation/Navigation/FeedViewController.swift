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
        let secondButton = UIButton(type: .system)
        let thirdButton = UIButton(type: .system)
        
        secondButton.setTitle("Open Post", for: .normal)
        thirdButton.setTitle("Open Post", for: .normal)
        
        buttonToPost.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        buttonToPost.setTitle("Open Post", for: .normal)
        buttonToPost.translatesAutoresizingMaskIntoConstraints = false
        buttonToPost.addTarget(self, action:#selector(self.openPost), for: .touchUpInside)
        
        secondButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        secondButton.setTitle("Open Post", for: .normal)
        secondButton.translatesAutoresizingMaskIntoConstraints = false
        secondButton.addTarget(self, action:#selector(self.openPost), for: .touchUpInside)
        
        thirdButton.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        thirdButton.setTitle("Open Post", for: .normal)
        thirdButton.translatesAutoresizingMaskIntoConstraints = false
        thirdButton.addTarget(self, action:#selector(self.openPost), for: .touchUpInside)
        
        let buttonStackView = UIStackView()
        buttonStackView.axis = .vertical
        buttonStackView.distribution = .equalSpacing
        buttonStackView.alignment = .center
        buttonStackView.spacing = 10.0
        buttonStackView.translatesAutoresizingMaskIntoConstraints = false
        
        buttonStackView.addArrangedSubview(buttonToPost)
        buttonStackView.addArrangedSubview(secondButton)
        buttonStackView.addArrangedSubview(thirdButton)
        
        view.addSubview(buttonStackView)
        NSLayoutConstraint.activate([
            buttonStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            buttonStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            buttonStackView.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor, constant: -16.0),
            buttonStackView.heightAnchor.constraint(equalToConstant: 200.0)
        ])
    }
    @objc func openPost() {
        self.navigationController?.pushViewController(postController, animated: true)
    }

   

}
