//
//  ViewController.swift
//  Deep Link Tester
//
//  Created by Ethan Kreloff on 8/2/17.
//  Copyright © 2017 Ethan Kreloff. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var host: String = "play"
    var contentId: String?
    
    var url: URL? {
        var urlString = "pantaya://\(host)"
        
        if let contentId = contentId {
            urlString.append("/\(contentId)")
        }
        
        return URL(string: urlString)
    }

    @IBAction func hostSegmentControlValueChanged(_ sender: UISegmentedControl) {
        if let selectedHost = sender.titleForSegment(at: sender.selectedSegmentIndex)?.lowercased() {
            host = selectedHost
        }
    }
    
    @IBAction func contentIdTextFieldEditingDidEnd(_ sender: UITextField) {
        contentId = sender.text
    }

    @IBAction func goButtonAction() {
        guard let url = url else {
            return
        }
        
         if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
}

