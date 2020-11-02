import UIKit

class CartView: UIViewController, CartInputProtocol {
    private var profileView: ProfileView!
    private var cartTableView: UITableView!
    
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
        setupCartTableView()
    }
    
    private func setupProfileView() {
        profileView = ProfileView()
        profileView.translatesAutoresizingMaskIntoConstraints = false
        profileView.backgroundColor = .green
        self.view.addSubview(profileView)
    }
    
    private func setupCartTableView() {
        cartTableView = UITableView()
        cartTableView.backgroundColor = .systemPink
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.register(CartProductViewCell.self, forCellReuseIdentifier: "CartProductViewCell")
        cartTableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(cartTableView)
    }
    
    private func layout() {
        navigationItem.title = "Your cart"
        self.view.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        layoutProfileView()
        layoutCartTableView()
    }
    
    private func layoutProfileView() {
        profileView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        profileView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        profileView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        profileView.heightAnchor.constraint(equalToConstant: 80).isActive = true
    }
    
    private func layoutCartTableView() {
        cartTableView.topAnchor.constraint(equalTo: self.profileView.bottomAnchor, constant: 0).isActive = true
        cartTableView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        cartTableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        cartTableView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
    }
}

extension CartView: UITableViewDelegate {
    
}

extension CartView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cartTableView.dequeueReusableCell(withIdentifier: "CartProductViewCell") as! CartProductViewCell
        let products = Products
        let index = indexPath.row
        cell.textLabel!.text = products[index].name
        return cell
    }
}
