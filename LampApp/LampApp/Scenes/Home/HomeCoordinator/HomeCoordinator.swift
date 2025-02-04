//
//  HomeViewFlowDelegate .swift
//  LampApp
//
//  Created by iOS Developer on 27/01/25.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject{
    func start()
}

class HomeCoordinator: Coordinator{
    
    //MARK: - Properties
    private let window: UIWindow
    private var navigationController: UINavigationController?
    
    //MARK: - Initializer
    init(window: UIWindow) {
        self.window = window
    }
    
    //MARK: - Functions
    func start() {
        let contentView = HomeView()
        let homeViewModel = HomeViewModel()
        let homeVC = HomeViewController(contentView: contentView, viewModel: homeViewModel, coordinator: self)
        
        let navController = UINavigationController(rootViewController: homeVC)
        window.rootViewController = navController
        window.makeKeyAndVisible()
        navigationController = navController
    }
    
    func navigateToShop(){
        let shopContentView = ShopUIView()
        let shopVC = ShopViewController(contentView: shopContentView)
        navigationController?.pushViewController(shopVC, animated: true)
    }
}
