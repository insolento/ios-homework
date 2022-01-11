import UIKit

class ProfileViewController: UIViewController {
    
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
    
    fileprivate let postInf: [(String, String, String, Int, Int)] = [
        ("holliwood_news", PostDescriptions.holliwoodNewsHamilton, "holliwoodNewsHamiltonPhoto", 2446,5400),
        ("ottofab", PostDescriptions.ottofabDog, "ottofabDogPhoto", 17428, 25345),
        ("sphynxcatlovers", PostDescriptions.sphynxcatloversCat, "sphynxcatloversCatPhoto", 3034, 12550),
        ("infocar.ua", PostDescriptions.infocarSilverado, "infocarSilveradoPhoto", 445, 1200),
        ("marvel", PostDescriptions.marvelEternals, "marvelEternalsPhoto", 1266291, 13544234),
    ]

    fileprivate enum CellReuseIdentifiers: String {
        case post = "PostCellReuse"
    }

    let tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(PostCellController.self, forCellReuseIdentifier: CellReuseIdentifiers.post.rawValue)
        return tableView
    }()
    
    let headerView: UIView = {
        let headerView = ProfileHeaderView()
        return headerView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        addSubviews()
        addHeaderFooter()
        autoresizingMask()
        layout()

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        guard let indexPath = tableView.indexPathForSelectedRow else { return
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func addSubviews() {
        view.backgroundColor = .white
        view.addSubview(tableView)
        view.addSubview(profileTitle)
        view.addSubview(profileTitleText)
    }
    
    func addHeaderFooter() {
        tableView.tableHeaderView = headerView
        tableView.tableHeaderView?.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor).isActive = true
        tableView.tableHeaderView?.heightAnchor.constraint(equalToConstant: 200).isActive = true
        tableView.tableHeaderView?.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: 10).isActive = true
        tableView.tableFooterView = UIView()
        tableView.tableFooterView?.heightAnchor.constraint(equalToConstant: 100).isActive = true
        tableView.tableFooterView?.backgroundColor = .white
    }
    
    func autoresizingMask() {
        tableView.translatesAutoresizingMaskIntoConstraints = false
        headerView.translatesAutoresizingMaskIntoConstraints = false
        profileTitle.translatesAutoresizingMaskIntoConstraints = false
        profileTitleText.translatesAutoresizingMaskIntoConstraints = false
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            profileTitle.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: -8),
            profileTitle.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 8),
            profileTitle.topAnchor.constraint(equalTo: view.topAnchor, constant: -10),
            profileTitle.heightAnchor.constraint(equalToConstant: 90),
            profileTitleText.bottomAnchor.constraint(equalTo: profileTitle.bottomAnchor),
            profileTitleText.centerXAnchor.constraint(equalTo: profileTitle.centerXAnchor),
            tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            tableView.topAnchor.constraint(equalTo: profileTitle.bottomAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            tableView.heightAnchor.constraint(equalToConstant: 10000),
        ])
    }

}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        postInf.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: PostCellController = tableView.dequeueReusableCell(
            withIdentifier: CellReuseIdentifiers.post.rawValue,
            for: indexPath
        ) as? PostCellController else {
            fatalError()
        }

        // update data
        let data = postInf[indexPath.row]
        
        cell.update(author: data.0, description: data.1, image: data.2, likes: data.3, views: data.4)

        return cell
    }
}
