//
//  Extensions.swift
//  RemoteControl-iOS
//
//  Created by Aaqib Hussain on 26/8/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import UIKit


extension UIViewController{
    
    
    func showAlert(title: String?, message: String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okButton = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
        
    }
    
}
