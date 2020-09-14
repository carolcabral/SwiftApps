//
//  BLEPeripheral.swift
//  BLESensor
//
//  Created by carol on 11/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import Foundation
import CoreBluetooth


class BLEPeripheral: NSObject, CBPeripheralManagerDelegate {

    private var manager: CBPeripheralManager!
    private var characteristic: CBMutableCharacteristic!
    
    override init() {
        super.init()
        manager = CBPeripheralManager(delegate: self, queue: nil)
    }
    func setup() {
        let characteristicUUID = CBUUID(string: BLEIdentifiers.characteristicIdentifier)
        characteristic = CBMutableCharacteristic(type: characteristicUUID, properties: [.read], value: nil, permissions: [.readable])
        
        let descriptor = CBMutableDescriptor(type: CBUUID(string: CBUUIDCharacteristicFormatString), value: "BLESensor prototype")
        
        characteristic.descriptors = [descriptor]
        let serviceUUID = CBUUID(string: BLEIdentifiers.serviceIdentifier)
        let service = CBMutableService(type: serviceUUID, primary: true)
        
        service.characteristics = [characteristic]
    
        manager.add(service)
        
    }
    
    func peripheralManagerDidUpdateState(_ peripheral: CBPeripheralManager) {
        if peripheral.state == .poweredOn {
            print("Peripheral is powered on")
            setup()
        } else {
            print("Peripheral is not available: \(peripheral.state.rawValue)")
        }
    }
    
    func peripheralManager(_ peripheral: CBPeripheralManager, didAdd service: CBService, error: Error?) {
        
        if let error = error {
            print("Could not add service: \(error.localizedDescription)")
        } else {
            print("Peripheral added service. Start advertising")
            let advertisementData: [String: Any] = [
                CBAdvertisementDataServiceUUIDsKey:[CBUUID(string: BLEIdentifiers.serviceIdentifier)],
                CBAdvertisementDataLocalNameKey: "BLE Sensor"
            ]
            
            manager.startAdvertising(advertisementData)
        }
    }
    
    
    func peripheralManagerDidStartAdvertising(_ peripheral: CBPeripheralManager, error: Error?) {
        if let error = error {
            print("Could not start advertising: \(error.localizedDescription)")
        } else {
            print("Peripheral started advertising")
        }
    }
}
