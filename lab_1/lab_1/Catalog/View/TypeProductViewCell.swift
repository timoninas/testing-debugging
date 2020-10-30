import UIKit

class TypeProductViewCell: UICollectionViewCell {
    var typeLabel: UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
    func setup(typeOf: String) {
        setupLabel(typeOf: typeOf)
        setupLayout()
    }
    
    func setupLabel(typeOf: String) {
        typeLabel = UILabel()
        typeLabel.text = typeOf
        typeLabel.textAlignment = .center
        typeLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(typeLabel)
    }
    
    func setupLayout() {
        typeLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        typeLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        typeLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        typeLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
}
