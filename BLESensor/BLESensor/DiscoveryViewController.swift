//
//  DiscoveryViewController.swift
//  BLESensor
//
//  Created by carol on 11/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import UIKit

class DiscoveryViewController: UITableViewController {
    var central: BLECentral!
    var onConnected: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        central = BLECentral()
        central.onDiscovered = { [weak self] in
            self?.tableView.reloadData()
            }
        central?.onConnected = { [weak self] in
            self?.onConnected?()
        }
        tableView.register(UINib(nibName: "DiscoveredPeripheralCell", bundle: nil), forCellReuseIdentifier: "DiscoveredPeripheralCell")
        
     
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return central.discoveredPeripherals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DiscoveredPeripheralCell", for: indexPath) as! DiscoveredPeripheralCell
        let discoveredPeripheral = central.discoveredPeripherals[indexPath.row]
        cell.identifierLabel.text = discoveredPeripheral.peripheral.identifier.uuidString
        cell.rssiLabel.text = discoveredPeripheral.rssi.stringValue
        cell.advertisementLabel.text = discoveredPeripheral.advertisementData.debugDescription
        cell.identifierLabel.textColor = .blue
        cell.rssiLabel.textColor = .red
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        central.connect(at: indexPath.row)
    }
}
