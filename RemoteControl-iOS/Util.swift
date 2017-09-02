//
//  Util.swift
//  RemoteControl-iOS
//
//  Created by Aaqib Hussain on 26/8/17.
//  Copyright © 2017 Aaqib Hussain. All rights reserved.
//

import UIKit

class Util: NSObject{

    
    static func isTextfieldEmpty(textField: UITextField)-> Bool{
        if textField.text == "" {
            return true
        }
        return false
    }


}
