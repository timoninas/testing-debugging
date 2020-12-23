//
//  ViewController.swift
//  lab_1
//
//  Created by Антон Тимонин on 16.10.2020.
//

import UIKit
import CoreData

class CatalogView: UIViewController, CatalogInputProtocol {
    
    let countCells = 2
    
    var presenter: CatalogOutputProtocol!
    
    var catalogCollectionView: UICollectionView!
    var typeProductCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        navigationItem.title = "One Shop"
        presenter.fetchProducts()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        layout()
    }
    
    func success() {
        catalogCollectionView.reloadData()
    }
    
    func failure() {
        
    }
    
    func setup() {
        setupTypesCollectionView()
        setupCatalogCollectionView()
    }
    
    func setupTypesCollectionView() {
        let layout = UICollectionViewFlowLayout.init()
        layout.scrollDirection = .horizontal
        typeProductCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        typeProductCollectionView.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        typeProductCollectionView.showsHorizontalScrollIndicator = false
        typeProductCollectionView.translatesAutoresizingMaskIntoConstraints = false
        //        typeProductCollectionView.gro
        typeProductCollectionView.register(TypeProductViewCell.self,
                                           forCellWithReuseIdentifier: "TypeProductViewCell")
        typeProductCollectionView.delegate = self
        typeProductCollectionView.dataSource = self
        view.addSubview(typeProductCollectionView)
    }
    
    func setupCatalogCollectionView() {
        catalogCollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
        catalogCollectionView.backgroundColor = .white
        catalogCollectionView.showsVerticalScrollIndicator = false
        catalogCollectionView.translatesAutoresizingMaskIntoConstraints = false
        catalogCollectionView.register(CatalogViewCell.self,
                                       forCellWithReuseIdentifier: "CatalogViewCell")
        catalogCollectionView.delegate = self
        catalogCollectionView.dataSource = self
        view.addSubview(catalogCollectionView)
    }
    
    func layout() {
        self.view.backgroundColor = .white
        layoutTypeProductCollectionView()
        layoutCatalogCollectionView()
    }
    
    func layoutTypeProductCollectionView() {
        typeProductCollectionView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 0).isActive = true
        typeProductCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        typeProductCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
        typeProductCollectionView.heightAnchor.constraint(equalToConstant: 60).isActive = true
    }
    
    func layoutCatalogCollectionView() {
        catalogCollectionView.topAnchor.constraint(equalTo: typeProductCollectionView.bottomAnchor,
                                                   constant: 0).isActive = true
        catalogCollectionView.leftAnchor.constraint(equalTo: self.view.leftAnchor, constant: 0).isActive = true
        catalogCollectionView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor, constant: 0).isActive = true
        catalogCollectionView.rightAnchor.constraint(equalTo: self.view.rightAnchor, constant: 0).isActive = true
    }
    
    func presentFilterAlert() {
        let alert = UIAlertController(title: "Filter products", message: "Select the option that you want to filter the product by", preferredStyle: .actionSheet)
        let action1 = UIAlertAction(title: "From low price to high", style: .default) { [self] (_) in
            presenter.sortBy(type: .LowToHigh)
        }
        let action2 = UIAlertAction(title: "From high price to low", style: .default) { [self] (_) in
            presenter.sortBy(type: .HighToLow)
        }
        let action3 = UIAlertAction(title: "By product type", style: .default) { [self] (_) in
            presenter.sortBy(type: .TypeProduct)
        }
        alert.addAction(action1)
        alert.addAction(action2)
        alert.addAction(action3)
        present(alert, animated: true, completion: nil)
    }
    
    func reloadContent() {
        catalogCollectionView.reloadData()
    }
}

extension CatalogView: UICollectionViewDelegate {
    
}

extension CatalogView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == typeProductCollectionView {
            let type = presenter.typesProducts[indexPath.item]
            let width = type.widthOfString(usingFont: UIFont.systemFont(ofSize: 17))
            return CGSize(width: 10 + width * 1.5, height: 40)
        } else {
            let frame = catalogCollectionView.frame
            let widthCell = (frame.width - 30) / CGFloat(countCells)
            let heightCell = widthCell * 1.8
            return CGSize(width: widthCell, height: heightCell)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        if collectionView == typeProductCollectionView {
            return UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 0)
        } else {
            return UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension CatalogView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == typeProductCollectionView {
            return presenter.typesProducts.count
        } else {
            guard let count = presenter.getProducts()?.count else { return 0 }
            return count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == typeProductCollectionView {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TypeProductViewCell", for: indexPath) as! TypeProductViewCell
            let type = presenter.typesProducts[indexPath.item]
            cell.setup(typeOf: type)
            cell.layer.cornerRadius = 12
            cell.layer.borderColor = #colorLiteral(red: 0.7120197415, green: 0.7068746686, blue: 0.7159602642, alpha: 1)
            cell.layer.borderWidth = 0.3
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CatalogViewCell", for: indexPath) as! CatalogViewCell
            guard let products = presenter.getProducts() else {return UICollectionViewCell() }
            let product = products[indexPath.item]
            cell.setup(catalogProduct: product)
            cell.layer.cornerRadius = 10
            cell.layer.borderColor = #colorLiteral(red: 0.7120197415, green: 0.7068746686, blue: 0.7159602642, alpha: 1)
            cell.layer.borderWidth = 0.5
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == typeProductCollectionView {
            let index = indexPath.item
            let type = presenter.typesProducts[index].lowercased()
            
            switch type {
            case "filter":
                presentFilterAlert()
            case "all":
                self.catalogCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0),
                                                        at: .top, animated: true)
                presenter.resetProducts()
            default:
                self.catalogCollectionView.scrollToItem(at: IndexPath(item: 0, section: 0),
                                                        at: .top, animated: true)
                presenter.resetProducts()
                presenter.filterByType(indexType: index)
            }
        } else {
            guard let products = presenter.getProducts() else { return }
            let product = products[indexPath.item]
            presenter.tapOnProduct(product: product)
        }
    }
}
