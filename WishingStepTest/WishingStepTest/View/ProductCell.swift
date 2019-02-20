//
//  ProductCell.swift
//  WishingStepTest
//
//  Created by Giresh Dora on 13/01/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import UIKit


class ProductCell: UITableViewCell {

    // MARk:- Outlets
    
    @IBOutlet weak var productImgView: UIImageView!
    @IBOutlet weak var productNameLbl: UILabel!
    @IBOutlet weak var productManufactureLbl: UILabel!
    @IBOutlet weak var productPriceLbl: UILabel!
    
    // MARK:- Cell Initialize methods
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK:- Custom methods
    
    func setupCellView(product:Products) {
        self.productNameLbl.text = product.name
        self.productManufactureLbl.text = "Manufacturer: \(product.manufacturer)"
        self.productPriceLbl.text = "Price: \(product.price.formattedValue)"
        
        let imageUrl = "https://s7d2.scene7.com/\(product.promoImageUrl)"
//        self.productImgView.sd_setImage(with: URL(string: imageUrl)) { (image, error, type, url) in
//            self.productImgView.image = image
//        }
        //URLSession.shared.
    }

}
