//
//  ImageViewController.swift
//  Authentification App
//
//  Created by Denis on 06.01.2022.
//

import UIKit

class ImageViewController: UIViewController {

    var user: User!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var labelAbout: UILabel!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageView.image = UIImage (named: user.person.image)
        labelAbout.text = user.person.about
    }
    


}
