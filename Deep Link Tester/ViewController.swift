//
//  ViewController.swift
//  Deep Link Tester
//
//  Created by Ethan Kreloff on 8/2/17.
//  Copyright © 2017 Ethan Kreloff. All rights reserved.
//

//link by Loudoun Design Co. from the Noun Project

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var schemeTextField: UITextField!
    @IBOutlet weak var domainTextField: UITextField!

    weak var queryTableViewController: QueryTableViewController?

    var url: URL? {
        var urlString = ""
        
        if let scheme = schemeTextField.text {
            urlString.append(scheme)
            urlString.append("://")
        }
        
        if let domain = domainTextField.text {
            urlString.append(domain)
        }

        if let queryTableViewController = queryTableViewController {
            urlString.append(queryTableViewController.queryString)
        }
        
        return URL(string: urlString)
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.destination {
        case is QueryTableViewController:
            queryTableViewController = segue.destination as? QueryTableViewController
        default:
            return
        }
    }
    
    @IBAction func addButtonAction() {
        queryTableViewController?.cellCount += 1
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

