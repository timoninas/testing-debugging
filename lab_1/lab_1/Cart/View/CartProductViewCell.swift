import UIKit
import Kingfisher

class CartProductViewCell: UITableViewCell {
    
    private var product: Product!
    
    private var productImageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 8
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    private var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .topLeft
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    private var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name:"HelveticaNeue", size: 18.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .topLeft
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    var labelStackView: UIStackView = {
       let sv = UIStackView()
        sv.axis = .vertical
        sv.spacing = 0
        sv.distribution = .fillEqually
        sv.translatesAutoresizingMaskIntoConstraints = false
        return sv
    }()
    
    var cancelButton: UIButton = {
        let btn = UIButton()
        let emptyImage = UIImage(named: "emptyCancel")
        let filledImage = UIImage(named: "filledCancel")
        btn.setImage(emptyImage, for: .normal)
        btn.setImage(filledImage, for: .highlighted)
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    public func setup(product: Product) {
        self.product = product
        setupProduct()
        setupLabelsStackView()
        layout()
        cancelButton.addTarget(self, action: #selector(printBTN), for: .touchUpInside)
    }
    
    private func setupProduct() {
        guard let product = self.product else { return }
        if let url = product.url, let URL = URL(string: url) {
            productImageView.kf.setImage(with: URL)
        }
        nameLabel.text = product.name
        priceLabel.text = "\(product.price) РУБ."
    }
    
    private func setupLabelsStackView() {
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(priceLabel)
        
    }
    
    private func layout() {
        layoutProductImageView()
        layoutLabelsStackView()
        layoutCancelButton()
    }
    
    private func layoutProductImageView() {
        self.addSubview(productImageView)
        productImageView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.8).isActive = true
        productImageView.widthAnchor.constraint(equalTo: productImageView.heightAnchor, multiplier: 1).isActive = true
        productImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        productImageView.leftAnchor.constraint(equalToSystemSpacingAfter: self.leftAnchor, multiplier: 1).isActive = true
    }
    
    private func layoutLabelsStackView() {
        self.addSubview(labelStackView)
        labelStackView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: 10).isActive = true
        labelStackView.heightAnchor.constraint(equalTo: productImageView.heightAnchor, multiplier: 0.9).isActive = true
        labelStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        labelStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -35).isActive = true
//        labelStackView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    
    private func layoutCancelButton() {
        self.contentView.addSubview(cancelButton)
        cancelButton.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.175).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: cancelButton.heightAnchor).isActive = true
        cancelButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 7).isActive = true
        cancelButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -15).isActive = true
    }
    
    @objc
    func printBTN() {
        print("Stub")
    }
}
