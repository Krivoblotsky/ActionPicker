//
//  ViewController.swift
//  ActionPicker
//
//  Created by Serg Krivoblotsky on 08/11/2019.
//  Copyright (c) 2019 Serg Krivoblotsky. All rights reserved.
//

import UIKit
import ActionPicker

class ViewController: UIViewController {

    @IBAction func presentButtonClicked(_ sender: Any) {
        let setupViewController = SetupViewConroller()
        let actionPickerViewController = ActionSheetViewController(contentViewController: setupViewController)
        self.present(actionPickerViewController, animated: false, completion: nil)
    }
}

