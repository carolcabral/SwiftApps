//
//  PeripheralViewController.swift
//  BLESensor
//
//  Created by carol on 11/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import UIKit

class PeripheralViewController: UIViewController {
    var peripheral: BLEPeripheral!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        peripheral = BLEPeripheral()
        
    }
}
