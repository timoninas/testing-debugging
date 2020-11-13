import UIKit

class CartView: UIViewController, CartInputProtocol {
    private var profileView: ProfileView!
    private var cartTableView: UITableView!
    
    private var startProductIndex: Int = 0
    
    private var priceView: CellableView!
    private var priceLabel: UILabel!
    
    private var cells = [Cellable]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    private func setup() {
        setupProfileView()
        setupPriceLabel()
        setupPriceView()
        setupCartTableView()
        setupCells()
    }
    
    private func setupProfileView() {
        profileView = ProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.setup()
    }
    
    func setupPriceView() {
        priceView = CellableView()
        priceView.translatesAutoresizingMaskIntoConstraints = false
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
        cartTableView.backgroundColor = .systemPink
        cartTableView.separatorInset = .zero
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartProductViewCell.self, forCellReuseIdentifier: "CartProductViewCell")
        cartTableView.register(UITableViewCell.self, forCellReuseIdentifier: "SimpleCell")
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cartTableView)
    }
    
    private func setupCells() {
        cells += [EmptyTableViewCell()]
        cells += [profileView]
        cells += [EmptyTableViewCell()]
        cells += [CellableView()]
        cells += Products
    }
    
    private func layout() {
        navigationItem.title = "Your cart"
        self.view.backgroundColor = .white
        layoutCartTableView()
        layoutPriceLabel()
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
    
    private func layoutPriceLabel() {
        priceView.addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: priceView.topAnchor, constant: 0).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: priceView.leftAnchor, constant: 10).isActive = true
        priceLabel.bottomAnchor.constraint(equalTo: priceView.bottomAnchor, constant: 0).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: priceView.rightAnchor, constant: -10).isActive = true
    }
    
    private func layoutPriceView(cell: UITableViewCell) {
        priceView.topAnchor.constraint(equalTo: cell.topAnchor, constant: 0).isActive = true
        priceView.rightAnchor.constraint(equalTo: cell.rightAnchor, constant: 0).isActive = true
        priceView.bottomAnchor.constraint(equalTo: cell.bottomAnchor, constant: 0).isActive = true
        priceView.leftAnchor.constraint(equalTo: cell.leftAnchor, constant: 0).isActive = true
    }
}

extension CartView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let index = indexPath.row
        switch cells[index].typeCell {
        case .ProductTableViewCell:
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartProductViewCell") as! CartProductViewCell
            let product = cells[index] as! Product
            cell.isUserInteractionEnabled = true
            cell.setup(product: product)
            return cell
        case .ProfileTableViewCell:
            let cell = cartTableView.dequeueReusableCell(withIdentifier: "SimpleCell")!
            cell.addSubview(profileView)
            layoutProfileView(cell: cell)
            return cell
        case .some(.EmptyTableViewCell):
            let cell = UITableViewCell()
            cell.backgroundColor = #colorLiteral(red: 0.9254901961, green: 0.9294117647, blue: 0.9450980392, alpha: 1)
            return cell
            
        case .EmptyView:
            let cell = UITableViewCell()
            cell.addSubview(priceView)
            layoutPriceView(cell: cell)
            return cell
        case .none:
            return UITableViewCell()
        
        }
    }
}

extension CartView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let index = indexPath.row
        switch cells[index].typeCell {
        case .ProductTableViewCell:
            return 120
        case .ProfileTableViewCell:
            return 80
        case .some(.EmptyTableViewCell):
            return 11
        case .EmptyView:
            return 55
        case .none:
            return 0
        
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let index = indexPath.row
        switch cells[index].typeCell {
        case .ProductTableViewCell:
            tableView.deselectRow(at: indexPath, animated: true)
        case .ProfileTableViewCell:
            tableView.deselectRow(at: indexPath, animated: true)
        case .some(.EmptyTableViewCell):
            tableView.deselectRow(at: indexPath, animated: false)
        case .EmptyView:
            tableView.deselectRow(at: indexPath, animated: false)
        case .none:
            tableView.deselectRow(at: indexPath, animated: false)
        }
    }
}
