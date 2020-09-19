//
//  DeviceAccelerometerDataSource.swift
//  BLESensor
//
//  Created by carol on 19/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import Foundation
import CoreMotion

class DeviceAccelerometerDataSource: AccelerometerDataSource {
    
    var onUpdate: ((AccelerometerData) -> Void)?
    private let manager = CMMotionManager()
    
    func start() {
        guard manager.isAccelerometerAvailable else {
            print ("Accelerometer is not available")
            return
        }
        
        if manager.isAccelerometerActive {
            return
        }
        manager.accelerometerUpdateInterval = 1.0
        manager.startAccelerometerUpdates(to: OperationQueue.main) { [weak self] (data, error) in
            if let error = error {
                print("Error acceletometer updates: \(error.localizedDescription)")
            } else if let data = data {
                print ("")
                let accelerometerData = AccelerometerData(timestamp: data.timestamp, x: data.acceleration.x, y: data.acceleration.y, z: data.acceleration.z)
                self?.onUpdate?(accelerometerData)
            }
        }
        
    }
    
    func stop() {
        manager.stopAccelerometerUpdates()
    }
    
    
}
