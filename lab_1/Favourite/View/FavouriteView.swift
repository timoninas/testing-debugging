import UIKit

class FavouriteView: UIViewController, FavouriteInputProtocol {
    
    public var presenter: FavouriteOutputProtocol!
    
    private var favouriteCollectionView: UICollectionView!
    private var countCells = 2

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetchFavourite()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    private func setup() {
        setupCollectionView()
    }
    
    func success() {
        favouriteCollectionView.reloadData()
    }
    
    func failure() {
        favouriteCollectionView.reloadData()
    }
    
    private func setupCollectionView() {
        favouriteCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        favouriteCollectionView.backgroundColor = .white
        favouriteCollectionView.showsVerticalScrollIndicator = false
        favouriteCollectionView.translatesAutoresizingMaskIntoConstraints = false
        favouriteCollectionView.register(FavouriteViewCell.self,
                                       forCellWithReuseIdentifier: "FavouriteViewCell")
        favouriteCollectionView.delegate = self
        favouriteCollectionView.dataSource = self
        view.addSubview(favouriteCollectionView)
    }
    
    private func layout() {
        navigationItem.title = "Favourite"
        self.view.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
        layoutCollectionView()
    }
    
    private func layoutCollectionView() {
        favouriteCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor,
                                                   constant: 0).isActive = true
        favouriteCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        favouriteCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        favouriteCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
}

extension FavouriteView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return presenter.getFavouriteProducts().count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "FavouriteViewCell", for: indexPath) as! FavouriteViewCell
        let products = presenter.getFavouriteProducts()
        let product = products[indexPath.item]
        cell.setup(product: product)
        cell.delegate = self
        cell.layer.cornerRadius = 10
        cell.layer.borderColor = #colorLiteral(red: 0.7120197415, green: 0.7068746686, blue: 0.7159602642, alpha: 1)
        cell.layer.borderWidth = 0.5
        return cell
    }
}

extension FavouriteView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            let frame = favouriteCollectionView.frame
            let widthCell = (frame.width - 30) / CGFloat(countCells)
            let heightCell = widthCell * 1.8
            return CGSize(width: widthCell, height: heightCell)
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension FavouriteView: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter.tapOnProduct(product: presenter.getFavouriteProducts()[indexPath.item])
    }
}

extension FavouriteView: ReloadDelegate {
    func reloadCollectionView() {
        presenter.fetchFavourite()
    }
}
