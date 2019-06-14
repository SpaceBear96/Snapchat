//
//  VerSnapViewController.swift
//  Snapchat_3
//
//  Created by Cafu Aguilar on 6/14/19.
//  Copyright © 2019 Tecsup. All rights reserved.
//

import UIKit

class VerSnapViewController: UIViewController {

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        label.text? = snap.descrip
    }

}
