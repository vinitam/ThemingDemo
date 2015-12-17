//
//  ThemeManager.swift
//  ThemeDemo
//
//  Created by Vinita on 12/2/15.
//  Copyright © 2015 Vinita. All rights reserved.
//

import Foundation
import UIKit
enum ThemeType : String{
    //Label
    case CustomLabelType = "CustomLabelType";
    
    //button
    
    case CircularButtonType = "CircularButtonType";
    
    //Text Field
    
    case SearchTextFieldType = "SearchTextFieldType";

    //View
    
    case CustomViewType = "CustomViewType";
    
    //Segmented Control
    
    case SearchSegmentedControlType = "SearchSegmentedControlType"

}



class ThemeManager{
    class var sharedInstance: ThemeManager {
        struct Static {
            static let instance: ThemeManager = ThemeManager()
        }
        return Static.instance
    }
    
    func applyTheme(label: UILabel?, themeType : ThemeType)
    {
        if let _ = label{
            var themingList = populateTheme(themeType)
            
            //Setting background color
            
            if let _ = themingList["backgroundColor"] as? String
            {
                label!.backgroundColor = UIColor(hexString: themingList["backgroundColor"] as! String)
            }
            else
            {
                label!.backgroundColor = UIColor.clearColor()
            }
            
            //Setting text color
            
            if let _ = themingList["textColor"] as? String
            {
                label!.textColor = UIColor(hexString: themingList["textColor"] as! String)
            }
            else
            {
                label!.textColor = UIColor.clearColor()
            }
            
            if let _ = themingList["font"] as? NSDictionary
            {
                label?.font = UIFont(dictionary: themingList["font"] as! NSDictionary)
            }
            
        }
    }
    
    func applyTheme(button: UIButton? , themeType : ThemeType)
    {
        if let _ = button{
            var themingList = populateTheme(themeType)
            
            if let _ = themingList["font"] as? NSDictionary
            {
                button?.titleLabel?.font = UIFont(dictionary: themingList["font"] as! NSDictionary)
            }
            
            //Setting background color
            
            if let _ = themingList["backgroundColor"] as? String
            {
                button!.backgroundColor = UIColor(hexString: themingList["backgroundColor"] as! String)
            }
            else
            {
                button!.backgroundColor = UIColor.clearColor()
            }
            
            if let _ = themingList["title"] as? String
            {
                button?.setTitle(themingList["title"] as? String, forState: UIControlState.Selected)
                button?.setTitle(themingList["title"] as? String, forState: UIControlState.Normal)
            }
            
            
            //Setting text color
            
            if let _ = themingList["textColor"] as? String
            {
                button?.setTitleColor(UIColor(hexString: themingList["textColor"] as! String) , forState: UIControlState.Normal)
                button?.setTitleColor(UIColor(hexString: themingList["textColor"] as! String) , forState: UIControlState.Selected)
            }
            else
            {
                button?.setTitleColor(UIColor.blackColor() , forState: UIControlState.Normal)
                button?.setTitleColor(UIColor.blackColor() , forState: UIControlState.Selected)
            }
            
            if let _ = themingList["borderColor"] as? String
            {
                button!.layer.borderColor = UIColor(hexString: themingList["borderColor"] as! String).CGColor
            }
            else
            {
                button!.layer.borderColor = UIColor.clearColor().CGColor
            }
            
            if let _ = themingList["cornerRadius"] as? CGFloat
            {
                button!.layer.cornerRadius = themingList["cornerRadius"] as! CGFloat
            }
            else
            {
                button!.layer.cornerRadius = 0
            }
            
            if let _ = themingList["borderWidth"] as? CGFloat
            {
                button!.layer.borderWidth = themingList["borderWidth"] as! CGFloat
            }
            else
            {
                button!.layer.borderWidth = 0
            }

            if let _ = themingList["alpha"] as? CGFloat
            {
                button?.alpha = themingList["alpha"] as! CGFloat
            }

            if let _ = themingList["imageName"] as? String
            {
                button?.setImage(UIImage(named: themingList["imageName"] as! String), forState: UIControlState.Normal)
            }
        }
    }
    
    func populateTheme(themeType : ThemeType) -> [String : AnyObject]{
        let path : String = NSBundle.mainBundle().pathForResource("Theme", ofType:"plist")!
        let dictionary : NSDictionary = NSDictionary(contentsOfFile:path) as! [String : AnyObject]
        return dictionary.objectForKey(themeType.rawValue) as! [String : AnyObject]
    }
    
    func applyTheme(view: UIView? , themeType : ThemeType)
    {
        if let _ = view{
            var themingList = populateTheme(themeType)
            //Setting background color
            
            if let _ = themingList["backgroundColor"] as? String
            {
                view!.backgroundColor = UIColor(hexString: themingList["backgroundColor"] as! String)
            }
            else
            {
                view!.backgroundColor = UIColor.clearColor()
            }
            
            if let _ = themingList["borderColor"] as? String
            {
                view!.layer.borderColor = UIColor(hexString: themingList["borderColor"] as! String).CGColor
            }
            else
            {
                view!.layer.borderColor = UIColor.clearColor().CGColor
            }
            
            if let _ = themingList["cornerRadius"] as? CGFloat
            {
                view!.layer.cornerRadius = themingList["cornerRadius"] as! CGFloat
            }
            else
            {
                view!.layer.cornerRadius = 0
            }
            
            if let _ = themingList["borderWidth"] as? CGFloat
            {
                view!.layer.borderWidth = themingList["borderWidth"] as! CGFloat
            }
            else
            {
                view!.layer.borderWidth = 0
            }
            
            view?.alpha = themingList["alpha"] as! CGFloat
        }
    }
    
    func applyTheme(textField: UITextField? , themeType : ThemeType)
    {
        if let _ = textField{
            var themingList = populateTheme(themeType)
            
            textField?.font = UIFont(dictionary: themingList["font"] as! NSDictionary)
            
            //Setting background color
            
            if let _ = themingList["backgroundColor"] as? String
            {
                textField!.backgroundColor = UIColor(hexString: themingList["backgroundColor"] as! String)
            }
            else
            {
                textField!.backgroundColor = UIColor.clearColor()
            }
            
            //Setting text color
            
            if let _ = themingList["textColor"] as? String
            {
                textField?.textColor = UIColor(hexString: themingList["textColor"] as! String)
            }
            else
            {
                textField?.textColor = UIColor.blackColor()
            }
            
            if let _ = themingList["cornerRadius"] as? CGFloat
            {
                textField!.layer.cornerRadius = themingList["cornerRadius"] as! CGFloat
            }
            else
            {
                textField!.layer.cornerRadius = 0
            }
            
            textField?.alpha = themingList["alpha"] as! CGFloat
            
            
        }
    }
    
    func applyTheme(segmentedControl: UISegmentedControl? , themeType : ThemeType)
    {
        if let _ = segmentedControl{
            var themingList = populateTheme(themeType)
            
            if let font = themingList["font"] as? NSDictionary
            {
                let attributes : [NSObject : AnyObject] = [NSFontAttributeName :  UIFont(dictionary: font)]

                segmentedControl?.setTitleTextAttributes(attributes, forState: UIControlState.Normal)
                segmentedControl?.setTitleTextAttributes(attributes, forState: UIControlState.Selected)
            }

            if let index = themingList["index"] as? Int
            {
                segmentedControl?.setTitle(segmentedControl?.titleForSegmentAtIndex(index), forSegmentAtIndex: index)
            }
            
            let sortedViews = segmentedControl!.subviews.sort( { $0.frame.origin.x < $1.frame.origin.x } )
            
            for (index, view) in sortedViews.enumerate() {
                if index == segmentedControl!.selectedSegmentIndex {
                    view.tintColor = UIColor(hexString: themingList["selectedTextColor"] as! String)
                    view.backgroundColor = UIColor(hexString: themingList["selectedBgColor"] as! String)
                } else {
                    view.tintColor = UIColor(hexString: themingList["normalTextColor"] as! String)
                    view.backgroundColor = UIColor(hexString: themingList["normalBgColor"] as! String)
                }
            }

            if let _ = themingList["borderColor"] as? String
            {
                segmentedControl?.layer.borderColor = UIColor(hexString: themingList["borderColor"] as! String).CGColor
            }
            else
            {
                segmentedControl?.layer.borderColor = UIColor.clearColor().CGColor
            }
            
            if let _ = themingList["cornerRadius"] as? CGFloat
            {
                segmentedControl?.layer.cornerRadius = themingList["cornerRadius"] as! CGFloat
            }
            else
            {
                segmentedControl?.layer.cornerRadius = 0
            }
            
            if let _ = themingList["borderWidth"] as? CGFloat
            {
                segmentedControl?.layer.borderWidth = themingList["borderWidth"] as! CGFloat
            }
            else
            {
                segmentedControl?.layer.borderWidth = 0
            }
            
            if let _ = themingList["masksToBounds"] as? Bool
            {
                segmentedControl?.layer.masksToBounds = themingList["masksToBounds"] as! Bool
            }
            else
            {
                segmentedControl?.layer.masksToBounds = false
            }
        }
    }
}



