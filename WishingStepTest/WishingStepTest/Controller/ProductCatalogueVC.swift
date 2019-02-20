//
//  ProductCatalogueVC.swift
//  WishingStepTest
//
//  Created by Giresh Dora on 13/01/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit

class ProductCatalogueVC: UIViewController {

    // MARK:- Outlets and properties
    
    @IBOutlet weak var productCatalogueTableView: UITableView!
    var productLists : [Products] = [Products]()
    
    // MARK:- Viewcontroller lifecycle methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadLocalJsonContent()
    }
    
    // MARK:- Custom methods
    
    func loadLocalJsonContent(){
        APIService.sharedInstance.fetchPopularPhoto{ [weak self] (success, products, error) in
            if error != nil {
            } else {
                self?.productLists = products
                DispatchQueue.main.async {
                    self?.productCatalogueTableView.reloadData()
                }
            }
        }
    }

}


// MARK: - Extension

extension ProductCatalogueVC : UITableViewDelegate,UITableViewDataSource {
    
    // MARK: - Table view DataSource methods
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return productLists.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        let productDetail = productLists[indexPath.row]
        cell.setupCellView(product: productDetail)
        return cell
    }
    
    // Mark: - Table view Delegate methods
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let productDetail = productLists[indexPath.row]
        let urlString = "https://www.homedepot.ca\(productDetail.url)"
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "ProductDetailVC") as! ProductDetailVC
        detailVC.urlString = urlString
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
