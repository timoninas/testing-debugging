import UIKit
import Kingfisher

class DetailView: UIViewController {
    
    // MARK:- Property
    public var product: Product?
    
    // MARK:- UI Properties
    private var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    
    private var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .left
        lbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.contentMode = .left
        lbl.font = UIFont(name:"HelveticaNeue", size: 16.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    private var stackLabelViews: UIStackView = {
        let sv = UIStackView()
        sv.translatesAutoresizingMaskIntoConstraints = false
        sv.axis = .vertical
        return sv
    }()
    
    // MARK:- ViewDidLoad
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    // MARK:- Setup
    private func setup() {
        setupImageView()
        setupLabels()
    }
    
    private func setupImageView() {
        self.view.addSubview(imageView)
        guard let product = self.product else { return }
        guard let url = product.url, let URL = URL(string: url) else { return }
        self.imageView.kf.setImage(with: URL)
    }
    
    private func setupLabels() {
        let tmpView = UIView()
        tmpView.translatesAutoresizingMaskIntoConstraints = false
//        tmpView.backgroundColor = .green
        
        if let name = product?.name {
            nameLabel.text = name
        }
        
        if let price = product?.price {
            priceLabel.text = "\(price) РУБ."
        }
        
        stackLabelViews.addArrangedSubview(nameLabel)
        stackLabelViews.addArrangedSubview(priceLabel)
        stackLabelViews.addArrangedSubview(tmpView)
        
        self.view.addSubview(stackLabelViews)
    }
    
    // MARK:- viewDidLayoutSubviews
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        layout()
    }
    
    // MARK:- Layout
    private func layout() {
        layoutSelfView()
        layoutImageView()
        layoutStackLabelView()
    }
    
    private func layoutSelfView() {
        self.view.backgroundColor = .white
    }
    
    private func layoutImageView() {
        imageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -10).isActive = true
        imageView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 10).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    }
    
    private func layoutStackLabelView() {
        stackLabelViews.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 15).isActive = true
        stackLabelViews.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 15).isActive = true
        stackLabelViews.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -15).isActive = true
        stackLabelViews.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -15).isActive = true
        nameLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
        priceLabel.heightAnchor.constraint(equalToConstant: 35).isActive = true
    }
}
