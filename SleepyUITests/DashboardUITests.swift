//
//  DashboardUITests.swift
//  SleepyUITests
//
//  Created by Ugur Kilic on 17.04.2021.
//

import XCTest

private let defaultTimeout: TimeInterval = 5

class SleepyUITests: XCTestCase {

    override func setUpWithError() throws {
        continueAfterFailure = false
    }

    func testMeditationSelectionOpensDetailPage() throws {
        let app = XCUIApplication()
        app.launch()

        // Tap meditation cell
        let firstCell = app.collectionViews.cells.firstMatch
        _ = firstCell.waitForExistence(timeout: defaultTimeout)
        firstCell.tap()

        let detailTitleLabel = app.staticTexts[Accessibility.dashboardDetailTitleLabel]
        _ = detailTitleLabel.waitForExistence(timeout: defaultTimeout)
    }

    func testStorySelectionOpensDetailPage() throws {
        let app = XCUIApplication()
        app.launch()

        // Scroll to stories
        let firstCollectionView = app.collectionViews.firstMatch
        _ = firstCollectionView.waitForExistence(timeout: defaultTimeout)
        app.swipeUp(velocity: .fast)

        // Tap story cell
        app.collectionViews.cells.firstMatch.tap()
        let detailTitleLabel = app.staticTexts[Accessibility.dashboardDetailTitleLabel]
        _ = detailTitleLabel.waitForExistence(timeout: defaultTimeout)
    }

    // TODO: Banner visibility can be tested with mocking server response
}
