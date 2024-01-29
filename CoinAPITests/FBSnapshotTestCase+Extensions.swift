//
//  FBSnapshotTestCase.swift
//  CoinAPITests
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

import Foundation
import FBSnapshotTestCase
import UIKit

extension FBSnapshotTestCase {    
    func addControllerToWindow(_ controller: UIViewController) {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = controller
        window.makeKeyAndVisible()
    }
}
