//
//  ViewController.swift
//  ThemingDemo
//
//  Created by Vinita on 12/17/15.
//  Copyright © 2015 Vinita. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var circularButton: UIButton!
    @IBOutlet weak var customLabel: UILabel!
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var customView: UIView!
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.customizeUI()
    }
    
    func customizeUI(){
        ThemeManager.sharedInstance.applyTheme(self.circularButton, themeType: ThemeType.CircularButtonType)
        ThemeManager.sharedInstance.applyTheme(self.customLabel, themeType: ThemeType.CustomLabelType)
        ThemeManager.sharedInstance.applyTheme(self.searchTextField, themeType: ThemeType.SearchTextFieldType)
        ThemeManager.sharedInstance.applyTheme(self.customView, themeType: ThemeType.CustomViewType)
        ThemeManager.sharedInstance.applyTheme(self.segmentedControl, themeType: ThemeType.SearchSegmentedControlType)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

