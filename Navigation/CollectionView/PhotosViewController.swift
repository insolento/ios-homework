import UIKit

class PhotosViewController: UIViewController {
    
    private enum LayoutConstant {
        static let spacing: CGFloat = 8.0
    }
    
    let photosCollection: UICollectionView = {
        let viewLayout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: viewLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    
    lazy var photos: [String] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        
        for i in 1...20{
            let photoName = "photo" + String(i)
            photos.append(photoName)
        }
        
        view.backgroundColor = .systemBackground
        view.addSubview(photosCollection)
        layout()
        photosCollection.dataSource = self
        photosCollection.delegate = self
        photosCollection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        navigationController?.navigationBar.isHidden = false
        self.navigationController?.navigationBar.topItem?.title = "Photo Gallery"
    }
    
    func layout() {
        NSLayoutConstraint.activate([
            photosCollection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            photosCollection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            photosCollection.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            photosCollection.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
        ])
    }

}

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = photosCollection.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        let data = photos[indexPath.row]
        cell.setup(data)
        return cell
    }
    
    
}

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    
    private func itemWidth(for width: CGFloat, spacing: CGFloat) -> CGFloat {
        let itemsInRow: CGFloat = 3
        
        let totalSpacing: CGFloat = 32
        let finalWidth = (width - totalSpacing) / itemsInRow
        
        return floor(finalWidth)
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        sizeForItemAt indexPath: IndexPath
    ) -> CGSize {
        let width = (view.frame.width - 32)/3
        return CGSize(width: width, height: width)
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        insetForSectionAt section: Int
    ) -> UIEdgeInsets {
        return UIEdgeInsets(
            top: LayoutConstant.spacing,
            left: LayoutConstant.spacing,
            bottom: LayoutConstant.spacing,
            right: LayoutConstant.spacing
        )
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumLineSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }

    func collectionView(
        _ collectionView: UICollectionView,
        layout collectionViewLayout: UICollectionViewLayout,
        minimumInteritemSpacingForSectionAt section: Int
    ) -> CGFloat {
        LayoutConstant.spacing
    }
    
    func collectionView(
        _ collectionView: UICollectionView,
        didSelectItemAt indexPath: IndexPath) {
            print("Did select cell at \(indexPath.row)")
            let newViewController = PhotosOpenViewController()
            let photoName = "photo" + String(indexPath.row+1)
            newViewController.setup(photoName)
            navigationController?.pushViewController(newViewController, animated: true)
        }
}
