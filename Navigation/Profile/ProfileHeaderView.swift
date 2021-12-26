import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var statusLabel: String = ""
    let showStatusButton = UIButton(type: .system)
    let avatarImageView = UIImage(named: "cat")?.cgImage
    let catImageView = UIView()
    let statusTextField = UILabel()
    let hipsterCat = UILabel()
    let profileTitle = UIView()
    let profileTitleText = UILabel()

    private func setUpView() {
        backgroundColor = .lightGray
        let screenSize = UIScreen.main.bounds


        showStatusButton.frame = CGRect(x: 16, y: 212, width: screenSize.width-32, height: 50)
        showStatusButton.setTitle("Show status", for: .normal)
        showStatusButton.setTitleColor(.white, for: .normal)
        showStatusButton.backgroundColor = .blue
        showStatusButton.layer.cornerRadius = 4
        showStatusButton.layer.shadowOffset = CGSize(width: 4, height: 4)
        showStatusButton.layer.shadowRadius = 4
        showStatusButton.layer.shadowColor = UIColor.black.cgColor
        showStatusButton.layer.shadowOpacity = 0.7
        showStatusButton.addTarget(nil,action:#selector(buttonAction), for: .touchUpInside)


        catImageView.frame = CGRect(x: 16, y: 96, width: 110, height: 110)
        catImageView.layer.contents = avatarImageView
        catImageView.layer.borderWidth = 3
        catImageView.layer.masksToBounds = false
        catImageView.layer.borderColor = UIColor.white.cgColor
        catImageView.layer.cornerRadius = catImageView.frame.height/2
        catImageView.clipsToBounds = true

        hipsterCat.frame = CGRect(x: 136, y: 107, width: screenSize.width-182, height: 27)
        hipsterCat.text = "Hipster Cat"
        hipsterCat.font = UIFont(name: hipsterCat.font.fontName, size: 18)
        hipsterCat.textColor = .black
        hipsterCat.font = UIFont.systemFont(ofSize: 18, weight: .bold)

        statusTextField.frame = CGRect(x: 136, y: 178, width: screenSize.width-182, height: 27)
        statusLabel = "Waiting for something..."
        statusTextField.text = statusLabel
        statusTextField.textColor = .black
        statusTextField.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        profileTitle.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 80)
        profileTitle.backgroundColor = .white
        profileTitle.layer.borderWidth = 1
        profileTitleText.text = "Profile"
        profileTitleText.font = UIFont.systemFont(ofSize: 32, weight:.regular)
        profileTitleText.frame = CGRect(x: screenSize.width/2 - screenSize.width/8, y: 20, width: screenSize.width, height: 60)
        

        self.addSubview(showStatusButton)
        self.addSubview(catImageView)
        self.addSubview(hipsterCat)
        self.addSubview(statusTextField)
        self.addSubview(profileTitle)
        self.addSubview(profileTitleText)
    }
    
    @objc func buttonAction() {
        print(statusLabel)
    }

}
