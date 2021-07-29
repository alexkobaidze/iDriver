//
//  Utilities.swift
//  iDriver
//
//  Created by Alex on 6/9/21.
//

import Foundation
import UIKit

class Utilities {
    static func styleTextField(_ textfield:UITextField) {

        let bottomLine = CALayer()
        
        bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 1)
        
        bottomLine.backgroundColor = UIColor.init(red: 0, green: 0.6235, blue: 0.9569, alpha: 1).cgColor
        
        textfield.borderStyle = .none
        

        textfield.layer.addSublayer(bottomLine)
        
    }
    
    static func styleFilledButton(_ button:UIButton) {

        button.layer.cornerRadius = 10.0
    
    }
    
static func isPasswordValid(_ password : String) -> Bool {
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&])[A-Za-z\\d$@$#!%*?&]{8,}")
    return passwordTest.evaluate(with: password)
}
    
}
