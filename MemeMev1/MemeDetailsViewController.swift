//
//  MemeDetailsViewController.swift
//  MemeMev2
//
//  Created by Tiago Oliveira on 15/12/18.
//  Copyright © 2018 Optimize 7. All rights reserved.
//

import Foundation
import UIKit

class MemeDetailsViewController: UIViewController {
    
    @IBOutlet weak var imgView: UIImageView!
    var image: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imgView.image = image
        tabBarController?.tabBar.isHidden = true
    }
}
