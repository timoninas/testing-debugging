import UIKit

class CartView: UIViewController, CartInputProtocol {
    public var presenter: CartOutputProtocol!
    
    private var profileView: ProfileView!
    private var cartTableView: UITableView!
    
    private var startProductIndex: Int = 0
    private var priceLabel: UILabel!
    
    private var cells = [Cellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.fetchCart()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print(cartTableView.contentSize.height)
        print()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    func success() {
        cartTableView.reloadData()
    }
    
    func failure() {
        cartTableView.reloadData()
    }
    
    private func setup() {
        setupProfileView()
        setupPriceLabel()
        setupCartTableView()
        setupCells()
    }
    
    private func setupProfileView() {
        profileView = ProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.setup()
    }
    
    
    func setupPriceLabel() {
        priceLabel = UILabel()
        priceLabel.font = UIFont(name:"HelveticaNeue-Medium", size: 19.0)
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.numberOfLines = 1
        priceLabel.text = "Сумма заказа: 10000 РУБ."
    }
    
    private func setupCartTableView() {
        cartTableView = UITableView()
        cartTableView.backgroundColor = .white
        cartTableView.separatorInset = .zero
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartProductViewCell.self, forCellReuseIdentifier: "CartProductViewCell")
        cartTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SimpleCell")
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cartTableView)
    }
    
    private func setupCells() {
        cells += [profileView]
        cells += Products
    }
    
    private func layout() {
        navigationItem.title = "Your cart"
        self.view.backgroundColor = .white
        layoutCartTableView()
    }
    
    private func layoutProfileView(cell: UITableViewCell) {
        profileView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        profileView.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: 0).isActive = true
        profileView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        profileView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 0).isActive = true
    }
    
    private func layoutCartTableView() {
        cartTableView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        cartTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        cartTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
    }
}

extension CartView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter.getCart().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartProductViewCell") as! CartProductViewCell
        let product = presenter.getCart()[index]
        cell.delegate = self
        cell.isUserInteractionEnabled = true
        cell.setup(product: product)
        return cell
    }
}

extension CartView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 120
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        presenter.tapOnProduct(product: presenter.getCart()[index])
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension CartView: ReloadDelegate {
    func reloadCollectionView() {
        DispatchQueue.main.async { [self] in
            presenter.fetchCart()
        }
    }
}
