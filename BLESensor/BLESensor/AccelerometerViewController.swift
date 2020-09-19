//
//  AccelerometerViewController.swift
//  BLESensor
//
//  Created by carol on 19/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import UIKit

class AccelerometerViewController: UIViewController {

    @IBOutlet weak var timestampLable: UILabel!
    @IBOutlet weak var xLabel: UILabel!
    @IBOutlet weak var yLabel: UILabel!
    @IBOutlet weak var zLabel: UILabel!
    
    var central: BLECentral?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        central?.onDataUpdate = { [weak self] data in
            DispatchQueue.main.async {
                self?.update(data)
            }
        }
    }
    
    func update(_ data: AccelerometerData) {
        xLabel.text = String(format: "%0.2f", data.x)
        yLabel.text = String(format: "%0.2f", data.y)
        zLabel.text = String(format: "%0.2f", data.z)

        let date = Date(timeIntervalSinceReferenceDate: data.timestamp)
        timestampLable.text = date.debugDescription

    }
}
