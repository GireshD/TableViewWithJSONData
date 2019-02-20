//
//  APIService.swift
//  WishingStepTest
//
//  Created by Giresh Dora on 13/01/19.
//  Copyright © 2019 Giresh Dora. All rights reserved.
//

import Foundation


enum APIError: String, Error {
    case noNetwork = "No Network"
    case serverOverload = "Server is overloaded"
}


class APIService {
    static let sharedInstance = APIService()
    
    // Simulate a long waiting for fetching
    func fetchPopularPhoto( complete: @escaping ( _ success: Bool, _ photos: [Products], _ error: APIError? )->() ) {
        DispatchQueue.global().async {
            
           
            //sleep(3)
            let path = Bundle.main.path(forResource: "ProductList", ofType: "json")!
            let data = try! Data(contentsOf: URL(fileURLWithPath: path))
            let productCatalogue = try! JSONDecoder().decode(ProductCatalogue.self, from: data)
            
            
//            guard let responceData = data else {
//                print("nill")
//            }
            
            do{
                let jsonResponce = try JSONSerialization.jsonObject(with: data, options: [])
                print(jsonResponce)
            }catch{
                print("Error")
            }
            
            complete( true, productCatalogue.results, nil )
        }
    }

}
