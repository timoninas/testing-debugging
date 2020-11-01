import UIKit
import Kingfisher

class CatalogViewCell: UICollectionViewCell {
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 8
        iv.translatesAutoresizingMaskIntoConstraints = false
        
        return iv
    }()
    
    var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .topLeft
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    var priceLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name:"HelveticaNeue", size: 16.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .topLeft
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    var favoutireButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let emptyImage = UIImage(named: "emptyFavourite")
        let filledImage = UIImage(named: "filledFavourite")
        btn.setImage(emptyImage, for: .normal)
        btn.setImage(filledImage, for: .highlighted)
        return btn
    }()
    
    var buyButton: UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        let emptyImage = UIImage(named: "emptyBuy")
        let filledImage = UIImage(named: "filledBuy")
        btn.setImage(emptyImage, for: .normal)
        btn.setImage(filledImage, for: .highlighted)
        return btn
    }()
    
    var product: Product!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        imageView.image = nil
    }
    
    public func setup(product: Product) {
        self.product = product
        self.backgroundColor = .white
        setupImageView()
        setupNameLabel()
        setupPriceLabel()
        setupFavouriteButton()
        setupBuyButton()
    }
    
    private func setupImageView() {
        if let url = product.url, let URL = URL(string: url) {
            imageView.kf.setImage(with: URL)
        }
//        guard let image = UIImage(named: "macintosh") else { return }
        
        self.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        imageView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1.1, constant: 0).isActive = true
    }
    
    private func setupNameLabel() {
        nameLabel.text = product.name
        self.addSubview(nameLabel)
        nameLabel.topAnchor.constraint(equalTo: self.imageView.bottomAnchor).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        nameLabel.heightAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 0.5, constant: 0).isActive = true
    }
    
    private func setupPriceLabel() {
        priceLabel.text = "\(product.price) РУБ."
        self.addSubview(priceLabel)
        priceLabel.topAnchor.constraint(equalTo: self.nameLabel.bottomAnchor).isActive = true
        priceLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        priceLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        priceLabel.heightAnchor.constraint(equalTo: nameLabel.widthAnchor, multiplier: 0.2, constant: 0).isActive = true
    }
    
    private func setupFavouriteButton() {
        self.addSubview(favoutireButton)
        favoutireButton.widthAnchor.constraint(equalToConstant: 30).isActive = true
        favoutireButton.heightAnchor.constraint(equalToConstant: 30).isActive = true
        favoutireButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        favoutireButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
    
    private func setupBuyButton() {
        self.addSubview(buyButton)
        buyButton.widthAnchor.constraint(equalToConstant: 35).isActive = true
        buyButton.heightAnchor.constraint(equalToConstant: 35).isActive = true
        buyButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -15).isActive = true
        buyButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
    }
}
