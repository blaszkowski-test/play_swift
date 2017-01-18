//
//  secondController.swift
//  swTest
//
//  Created by LIM on 25.11.2016.
//  Copyright © 2016 LIM. All rights reserved.
//

import UIKit

class SecondController : UIViewController {
    
    var nameTest : String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(nameTest ?? "nico")
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
