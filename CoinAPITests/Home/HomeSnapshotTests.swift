//
//  HomeSnapshotTests.swift
//  CoinAPITests
//
//  Created by Guiherme de Oliveira Macedo on 26/01/24.
//

@testable import CoinAPI
import XCTest
import FBSnapshotTestCase

class HomeSnapshotTests: FBSnapshotTestCase {
    
    
    // MARK: - Setup
    
    private let homeManagerSpy = HomeManagerSpy()
    private let homeCoordinatorSpy = HomeCoordinatorSpy()
    
    // MARK: - Override
    
    override open func setUp() {
        super.setUp()
        
        recordMode = false
    }
    
    func testHomeViewControllerShouldBeShown() {
        // Given
        let viewModel = HomeViewModel(manager: homeManagerSpy, navigationHandler: homeCoordinatorSpy)
        let sut = HomeViewController(viewModel: viewModel)
        
        // When
        addControllerToWindow(sut)
        
        // Then
        FBSnapshotVerifyView(sut.view)
    }
    
    func testHomeViewControllerShouldDisplayError() {
        // Given
        
        homeManagerSpy.homeResult = Result.Failure(Errors.resourceNotFound)

        let viewModel = HomeViewModel(manager: homeManagerSpy, navigationHandler: homeCoordinatorSpy)
        let sut = HomeViewController(viewModel: viewModel)
        
        // When
        addControllerToWindow(sut)
        
        // Then
        FBSnapshotVerifyView(sut.view)
    }
}
