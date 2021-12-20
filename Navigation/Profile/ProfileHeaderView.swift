import UIKit

class ProfileHeaderView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUpView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    var descriptionText: String = ""
    let button = UIButton(type: .system)
    let catImage = UIImage(named: "cat")?.cgImage
    let catImageView = UIView()
    let descriptionProfile = UILabel()
    let hipsterCat = UILabel()
    let profileTitle = UIView()
    let profileTitleText = UILabel()

    private func setUpView() {
        backgroundColor = .lightGray
        let screenSize = UIScreen.main.bounds


        button.frame = CGRect(x: 16, y: 212, width: screenSize.width-32, height: 50)
        button.setTitle("Show status", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 4
        button.layer.shadowOffset = CGSize(width: 4, height: 4)
        button.layer.shadowRadius = 4
        button.layer.shadowColor = UIColor.black.cgColor
        button.layer.shadowOpacity = 0.7
        button.addTarget(nil,action:#selector(buttonAction), for: .touchUpInside)


        catImageView.frame = CGRect(x: 16, y: 96, width: 110, height: 110)
        catImageView.layer.contents = catImage
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

        descriptionProfile.frame = CGRect(x: 136, y: 178, width: screenSize.width-182, height: 27)
        descriptionText = "Waiting for something..."
        descriptionProfile.text = descriptionText
        descriptionProfile.textColor = .black
        descriptionProfile.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        
        profileTitle.frame = CGRect(x: 0, y: 0, width: screenSize.width, height: 80)
        profileTitle.backgroundColor = .white
        profileTitle.layer.borderWidth = 1
        profileTitleText.text = "Profile"
        profileTitleText.font = UIFont.systemFont(ofSize: 32, weight:.regular)
        profileTitleText.frame = CGRect(x: screenSize.width/2 - screenSize.width/8, y: 20, width: screenSize.width, height: 60)
        

        self.addSubview(button)
        self.addSubview(catImageView)
        self.addSubview(hipsterCat)
        self.addSubview(descriptionProfile)
        self.addSubview(profileTitle)
        self.addSubview(profileTitleText)
    }
    
    @objc func buttonAction() {
        print(descriptionText)
    }

}
