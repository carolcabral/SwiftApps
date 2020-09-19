//
//  AccelerometerDataSource.swift
//  BLESensor
//
//  Created by carol on 19/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import Foundation

struct AccelerometerData: Codable {
    let timestamp: TimeInterval
    let x: Double
    let y: Double
    let z: Double
}
protocol AccelerometerDataSource {
    var onUpdate: ( (AccelerometerData) -> Void)? { get set }
    func start()
    func stop()
}
