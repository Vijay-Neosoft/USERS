//
//  UIViewControllerExtension.swift
//  USERS
//
//  Created by webwerks on 02/01/23.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showError(error : String?){
        print("All fields mandtry!")
        let alert = UIAlertController(title: "Alert", message: error ?? "" , preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}
