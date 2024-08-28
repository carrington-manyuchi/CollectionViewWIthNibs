//
//  ViewController.swift
//  CollectionViewPractice
//
//  Created by Manyuchi, Carrington C on 2024/08/28.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let productCollectionViewCell = "ProductCollectionViewCell"
    var products = [Products]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let nibCell = UINib(nibName: productCollectionViewCell, bundle: nil)
        collectionView.register(nibCell, forCellWithReuseIdentifier: productCollectionViewCell)
        
        for _ in 1...25 {
            let product = Products()
            product?.name = "Wireless Headphone"
            product?.desc = "Hear the music, Not the noise ;)"
            products.append(product!)
        }
        collectionView.reloadData()
    }

    func registerCells() {
       
    }

}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: productCollectionViewCell, for: indexPath) as! ProductCollectionViewCell
        let product = products[indexPath.row]
        cell.img.image = UIImage(named: "img_product")
        cell.title.text = product.name!
        cell.subTitle.text = product.desc!
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        let inset: CGFloat = 10
        return UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 80)
    }
    

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let product = products[indexPath.row]
        print("\(indexPath.row) - \(product.name!)")
        
    }
    
}
