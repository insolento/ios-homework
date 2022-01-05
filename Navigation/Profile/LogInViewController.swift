import UIKit

class LogInViewController: UIViewController {
    
    struct Constants {
        static let logoImage = UIImage(named: "VKIcon")?.cgImage
    }
    
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.showsVerticalScrollIndicator = true
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.backgroundColor = .systemBackground
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    let contentView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        
        return view
    }()
    
    let profile: UIViewController = ProfileViewController()
    
    let logoView: UIView = {
        let logoView = UIView()
        logoView.translatesAutoresizingMaskIntoConstraints = false
        logoView.layer.contents = Constants.logoImage
        return logoView
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.cornerRadius = 10
        button.layer.masksToBounds = true
        button.setBackgroundImage(UIImage(named: "blue_pixel"), for: .normal)
        button.setTitle("Log In", for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.titleLabel?.textColor = .systemBackground
        return button
    }()
    
    let login: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Email or phone"
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.font = UIFont.systemFont(ofSize: 16)
        field.tintColor = UIColor(named: "VKColor")
        field.autocapitalizationType = .none
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        return field
    }()
    
    let password: UITextField = {
        let field = UITextField()
        field.translatesAutoresizingMaskIntoConstraints = false
        field.placeholder = "Password"
        field.backgroundColor = .systemGray6
        field.textColor = .black
        field.font = UIFont.systemFont(ofSize: 16)
        field.tintColor = UIColor(named: "VKColor")
        field.autocapitalizationType = .none
        field.layer.borderWidth = 0.5
        field.layer.borderColor = UIColor.lightGray.cgColor
        field.isSecureTextEntry = true
        field.layer.sublayerTransform = CATransform3DMakeTranslation(8, 0, 0)
        return field
    }()
    
    let loginView: UIView = {
        let loginView = UIView()
        loginView.translatesAutoresizingMaskIntoConstraints = false
        loginView.layer.cornerRadius = 10
        loginView.layer.masksToBounds = true
        loginView.layer.borderWidth = 0.5
        loginView.layer.borderColor = UIColor.lightGray.cgColor
        return loginView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIInputViewController.dismissKeyboard))
        self.navigationController?.navigationBar.isHidden = true
        view.backgroundColor = .systemBackground
        logInButton.addTarget(self, action: #selector(self.logIn), for: .touchUpInside)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        view.addSubview(logInButton)
        view.addSubview(logoView)
        view.addSubview(loginView)
        view.addGestureRecognizer(tap)
        view.addSubview(scrollView)
        
        loginView.addSubview(login)
        loginView.addSubview(password)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            //scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            scrollView.heightAnchor.constraint(equalToConstant: 1000)
        ])
        scrollView.addSubview(logInButton)
        scrollView.addSubview(logoView)
        scrollView.addSubview(loginView)
        
        NSLayoutConstraint.activate([
            logInButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            logInButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            logInButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 456),
            logInButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            logoView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 120),
            logoView.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
            logoView.heightAnchor.constraint(equalToConstant: 100.0),
            logoView.widthAnchor.constraint(equalToConstant: 100.0)
        ])
        
        NSLayoutConstraint.activate([
            loginView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 340),
            loginView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
            loginView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
            loginView.heightAnchor.constraint(equalToConstant: 100)
        ])
        
        NSLayoutConstraint.activate([
            password.bottomAnchor.constraint(equalTo: loginView.bottomAnchor),
            password.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            password.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            password.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            login.topAnchor.constraint(equalTo: loginView.topAnchor),
            login.leadingAnchor.constraint(equalTo: loginView.leadingAnchor),
            login.trailingAnchor.constraint(equalTo: loginView.trailingAnchor),
            login.heightAnchor.constraint(equalToConstant: 50)
        ])
        
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
//    @objc func logIn() {
//        if login.text!.count  > 0 {
//            if password.text!.count > 0 {
//                self.navigationController?.pushViewController(profile, animated: true)
//            } else { print("Enter password!") }
//        } else { print("Enter email or phone number!") }
//    }
// Вариант с проверкой на ввод, оставлю закоменченным
    
    @objc func logIn() {
        self.navigationController?.pushViewController(profile, animated: true)
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0 {
                self.view.frame.origin.y -= keyboardSize.height/2
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
        }
    }
}
