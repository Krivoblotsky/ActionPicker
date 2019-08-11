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

    @IBAction func compactExampleButtonClicked(_ sender: Any) {
        let setupViewController = CompactExampleViewConroller()
        let actionPickerViewController = ActionPickerViewController(contentViewController: setupViewController)
        self.present(actionPickerViewController, animated: false, completion: nil)
    }
    @IBAction func extendedExampleButtonClicked(_ sender: Any) {
        let setupViewController = ExtendedExampleViewConroller()
        let actionPickerViewController = ActionPickerViewController(contentViewController: setupViewController)
        self.present(actionPickerViewController, animated: false, completion: nil)
    }
}

