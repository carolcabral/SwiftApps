//
//  AppFlowController.swift
//  BLESensor
//
//  Created by carol on 11/09/20.
//  Copyright © 2020 Ana Carolina. All rights reserved.
//

import UIKit

class AppFlowController {
    let window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start(){
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier:"BLERoleSelectViewController") as! BLERoleSelectViewController

        viewController.onChoice = { [weak self] choice in
            let nextViewController: UIViewController
            switch choice {
            case .central:
                nextViewController = DiscoveryViewController()
            case .peripheral:
                nextViewController = PeripheralViewController()
            }
            self?.window.rootViewController = nextViewController
        }
        

         window.rootViewController = viewController
         window.makeKeyAndVisible()
    }
}
