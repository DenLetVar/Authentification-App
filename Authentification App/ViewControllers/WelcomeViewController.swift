//
//  WelcomeViewController.swift
//  Authentification App
//
//  Created by Denis on 04.01.2022.
//

import UIKit

class WelcomeViewController: UIViewController {

    @IBOutlet var welcomeLabel: UILabel!
    
    var user: User!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        welcomeLabel.text = "Welcome, \(user.person.fullName)"
    }
    

    @IBAction func logOutPressed() {
        dismiss(animated: true)
    }
    

}
