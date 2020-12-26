import UIKit

class TypeProductViewCell: UICollectionViewCell {
    var typeButton: UIButton!
    
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
        typeButton = UIButton()
        typeButton.isUserInteractionEnabled = false
        typeButton.setTitle(typeOf, for: .normal)
        typeButton.setTitleColor(.black, for: .normal)
        typeButton.setTitleColor(.gray, for: .highlighted)
        typeButton.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(typeButton)
    }
    
    func setupLayout() {
        typeButton.topAnchor.constraint(equalTo: self.topAnchor, constant: 0).isActive = true
        typeButton.rightAnchor.constraint(equalTo: self.rightAnchor, constant: 0).isActive = true
        typeButton.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0).isActive = true
        typeButton.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 0).isActive = true
    }
}
