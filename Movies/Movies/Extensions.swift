//
//  Extensions.swift
//  Movies
//
//  Created by kristhian deoliveira on 6/29/19.
//  Copyright © 2019 kristhian deoliveira. All rights reserved.
//

import UIKit

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            NSURLConnection.sendAsynchronousRequest(request as URLRequest, queue: .main, completionHandler: { (response, data, error) in
                if let imageData = data as NSData? {
                    self.image = UIImage(data: imageData as Data)
                }
            })
        }
    }
}


extension String {
    
    // default: it is a number suitable for your project if the string is not an integer
    
    func toInt(default: Int) -> Int {
        if let result = Int(self) {
            return result
        }
        else {
            return 0
            }
            }
            
}
