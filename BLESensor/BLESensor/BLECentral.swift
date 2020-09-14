//
//  BLECentral.swift
//  BLESensor
//
//  Created by carol on 11/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import Foundation
import CoreBluetooth

class BLECentral: NSObject, CBCentralManagerDelegate {
    
    var manager: CBCentralManager!
    var discoveredPeripherals = [DiscoveredPeripheral]()
    var onDiscovered: (()->Void)?
    
    override init(){
        super.init()
        manager = CBCentralManager(delegate: self, queue: nil)
    }
    
    func scanForPeripherals() {
        let options: [String: Any] = [CBCentralManagerScanOptionAllowDuplicatesKey: false]
        manager.scanForPeripherals(withServices: nil, options: nil)
    }
    
    func centralManagerDidUpdateState(_ central: CBCentralManager) {
        if central.state == .poweredOn {
           scanForPeripherals()
            
        } else {
            print("Central is unavailable: \(central.state.rawValue)")
        }
    }
    
    func centralManager(_ central: CBCentralManager, didDiscover peripheral: CBPeripheral, advertisementData: [String : Any], rssi RSSI: NSNumber) {
        
        if let existingPeripheral = discoveredPeripherals.first(where: {$0.peripheral == peripheral}) {
            existingPeripheral.advertisementData = advertisementData
            existingPeripheral.rssi = RSSI
        } else {
            discoveredPeripherals.append(DiscoveredPeripheral(peripheral: peripheral, rssi: RSSI, advertisementData: advertisementData))

        }
        onDiscovered?()
    }
}
