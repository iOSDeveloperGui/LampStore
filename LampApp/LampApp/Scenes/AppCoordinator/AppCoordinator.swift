//
//  AppCoordinato.swift
//  LampApp
//
//  Created by iOS Developer on 28/01/25.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator{
    
    //MARK: - Properties
    private let window: UIWindow
    
    //MARK: - Initializer
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Functions
    public func start() {
        let homeCoordinator = HomeCoordinator(window: window)
        homeCoordinator.start()
    }
}
    
