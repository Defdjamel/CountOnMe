//
//  UIViewController+Extension.swift
//  CountOnMe
//
//  Created by james on 08/05/2019.
//  Copyright © 2019 Vincent Saluzzo. All rights reserved.
//

import UIKit

extension UIViewController {

     func showAlertOk(_ title: String, _ message : String ){
        let alertVC = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alertVC.addAction(UIAlertAction(title: "OK", style: .cancel, handler: nil))
        self.present(alertVC, animated: true, completion: nil)
    }
}
