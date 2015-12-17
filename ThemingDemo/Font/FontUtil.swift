//
//  FontUtil.swift
//  ThemeDemo
//
//  Created by Vinita on 12/2/15.
//  Copyright © 2015 Vinita. All rights reserved.
//

import Foundation

import UIKit
extension UIFont {
    convenience init(dictionary : NSDictionary) {
        self.init(name : dictionary["name"]! as! String, size : dictionary["size"]! as! CGFloat)!
    }

}