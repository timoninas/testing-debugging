import UIKit

class ProfileView: UIView {
    var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.layer.cornerRadius = 8
        iv.translatesAutoresizingMaskIntoConstraints = false
        iv.image = UIImage(named: "profileAvatar")
        return iv
    }()
    
    var nameLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name:"HelveticaNeue-Bold", size: 18.0)
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.contentMode = .topLeft
        lbl.numberOfLines = 0
        
        return lbl
    }()
    
    var phoneLabel: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name:"HelveticaNeue", size: 15.0)
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
    
    public func setup() {
        setupImageView()
        setupLabelsStackView()
        layout()
        update()
        setupArrow()
    }
    
    private func setupLabelsStackView() {
        labelStackView.addArrangedSubview(nameLabel)
        labelStackView.addArrangedSubview(phoneLabel)
        addSubview(labelStackView)
    }
    
    private func setupImageView() {
        addSubview(imageView)
    }
    
    private func setupArrow() {
        let arrowImage = UIImage(named: "rightArrow")
        let arrowImageView = UIImageView(image: arrowImage)
        arrowImageView.translatesAutoresizingMaskIntoConstraints = false
        arrowImageView.contentMode = .scaleToFill
        addSubview(arrowImageView)
        arrowImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        arrowImageView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        arrowImageView.heightAnchor.constraint(equalToConstant: 40).isActive = true
        arrowImageView.widthAnchor.constraint(equalTo: arrowImageView.heightAnchor, multiplier: 1, constant: 0).isActive = true
    }
    
    public func update() {
        nameLabel.text = "Anton Timonin"
        phoneLabel.text = "+79152765451"
    }
    
    private func layout() {
        layoutImageView()
        layoutLabelsStackView()
    }
    
    private func layoutImageView() {
        imageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        imageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 5).isActive = true
        imageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 10).isActive = true
        imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor, multiplier: 1, constant: 0).isActive = true

    }
    
    private func layoutLabelsStackView() {
        labelStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        labelStackView.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10).isActive = true
        labelStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
        labelStackView.leftAnchor.constraint(equalTo: imageView.rightAnchor, constant: 20).isActive = true
    }
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
