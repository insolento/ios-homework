import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    struct Constants {
        static let screenSize = UIScreen.main.bounds
        static let avatarImageView = UIImage(named: "cat")?.cgImage
    }
    
    var statusLabel: String = "Waiting for something..."
    
    let showStatusButton: UIButton = {
        let statusButton = UIButton(type: .system)
        statusButton.setTitle("Show status", for: .normal)
        statusButton.setTitleColor(.white, for: .normal)
        statusButton.backgroundColor = .blue
        statusButton.layer.cornerRadius = 4
        statusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        statusButton.layer.shadowRadius = 4
        statusButton.layer.shadowColor = UIColor.black.cgColor
        statusButton.layer.shadowOpacity = 0.7
        statusButton.addTarget(nil,action:#selector(buttonAction), for: .touchUpInside)
        return statusButton
    }()
    
    let catImageView: UIView = {
        let catImage = UIView()
        catImage.layer.contents = Constants.avatarImageView
        catImage.layer.borderWidth = 3
        catImage.layer.masksToBounds = false
        catImage.layer.borderColor = UIColor.white.cgColor
        catImage.layer.cornerRadius = 50
        catImage.clipsToBounds = true
        return catImage
    }()
    
    let statusTextField: UILabel = {
        let textField = UILabel()
        textField.textColor = .black
        textField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        return textField
    }()
    
    let hipsterCat: UILabel = {
        let cat = UILabel()
        cat.text = "Hipster Cat"
        cat.font = UIFont(name: cat.font.fontName, size: 18)
        cat.textColor = .black
        cat.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        return cat
    }()
    
    let profileTitle: UIView = {
        let profTitle = UIView()
        profTitle.backgroundColor = .white
        profTitle.layer.borderWidth = 1
        return profTitle
    }()
    
    let profileTitleText: UILabel = {
        let profTitleText = UILabel()
        profTitleText.text = "Profile"
        profTitleText.font = UIFont.systemFont(ofSize: 32, weight:.regular)
        return profTitleText
    }()
    
    let yellowView = UIView()

    private func setUpView() {
        catImageView.translatesAutoresizingMaskIntoConstraints = false
        showStatusButton.translatesAutoresizingMaskIntoConstraints = false
        hipsterCat.translatesAutoresizingMaskIntoConstraints = false
        statusTextField.translatesAutoresizingMaskIntoConstraints = false
        profileTitle.translatesAutoresizingMaskIntoConstraints = false
        profileTitleText.translatesAutoresizingMaskIntoConstraints = false

        self.addSubview(catImageView)
        self.addSubview(showStatusButton)
        self.addSubview(hipsterCat)
        self.addSubview(statusTextField)
        self.addSubview(profileTitle)
        self.addSubview(profileTitleText)
        backgroundColor = .lightGray
        statusTextField.text = statusLabel
        
        NSLayoutConstraint.activate([
            profileTitle.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            profileTitle.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            profileTitle.topAnchor.constraint(equalTo: self.topAnchor),
            profileTitle.heightAnchor.constraint(equalToConstant: 90)
        ])
        
        NSLayoutConstraint.activate([
            profileTitleText.bottomAnchor.constraint(equalTo: profileTitle.bottomAnchor),
            profileTitleText.centerXAnchor.constraint(equalTo: profileTitle.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            catImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: +16),
            catImageView.topAnchor.constraint(equalTo: profileTitle.bottomAnchor, constant: +16.0),
            catImageView.heightAnchor.constraint(equalToConstant: 100.0),
            catImageView.widthAnchor.constraint(equalToConstant: 100.0)
        ])
        
        NSLayoutConstraint.activate([
            hipsterCat.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: +20),
            hipsterCat.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            hipsterCat.topAnchor.constraint(equalTo: profileTitle.bottomAnchor, constant: +27)
        ])
        
        NSLayoutConstraint.activate([
            showStatusButton.topAnchor.constraint(equalTo: catImageView.bottomAnchor, constant: +16),
            showStatusButton.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: +16),
            showStatusButton.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -16),
            showStatusButton.heightAnchor.constraint(equalToConstant: 50)
        ])
        
        NSLayoutConstraint.activate([
            statusTextField.bottomAnchor.constraint(equalTo: showStatusButton.topAnchor, constant: -34),
            statusTextField.leadingAnchor.constraint(equalTo: catImageView.trailingAnchor, constant: +20),
            statusTextField.trailingAnchor.constraint(equalTo: self.trailingAnchor),
        ])
        
    }
    
    @objc func buttonAction() {
        print(statusLabel)
    }

}
