//
//  DashboardViewModelTests.swift
//  SleepyTests
//
//  Created by Ugur Kilic on 15.04.2021.
//

import XCTest
@testable import Sleepy

class DashboardViewModelTests: XCTestCase {

    class Box {

        let model: DashboardViewModel
        var changes: [DashboardViewModel.Change] = []

        init(dataProvider: DashboardNetworkProvider) {
            model = DashboardViewModel(dataProvider: dataProvider)
            model.stateChangeHandler = { self.changes.append($0) }
        }
    }

    private var box: Box!

    // TODO: Extend mocking
    private func randomMeditation(suffix: Int) -> Meditation {
        Meditation(title: "meditation\(suffix)",
                   subtitle: "",
                   image: SleepyImageModel(small: "", large: ""),
                   releaseDate: Date(),
                   content: nil)
    }

    private func randomStory(suffix: Int) -> Story {
        Story(name: "story\(suffix)",
              category: "",
              image: SleepyImageModel(small: "", large: ""),
              date: Date(),
              content: nil)
    }

    func testModelCallsDataProvider() {
        let dataProviderSpy = DashboardDataProviderSpy()
        box = Box(dataProvider: dataProviderSpy)

        box.model.retrieveDashboard(blobID: "")

        XCTAssertTrue(dataProviderSpy.isRetrieveDashboardCallCount > 0,
                      "Dashboard view model should call data provider for items!")
    }

    func testModelCallsDataProviderWithGivenBlobID() {
        let testBlobID = "abcdef123"
        let dataProviderSpy = DashboardDataProviderSpy()
        box = Box(dataProvider: dataProviderSpy)

        box.model.retrieveDashboard(blobID: testBlobID)

        XCTAssertEqual(dataProviderSpy.retrieveDashboardBlobID,
                       testBlobID,
                       "Dashboard view model should call data provider with given blob ID!")
    }

    func testModelNotifiesWithProperLoadingStatesWhileRetrieval() {
        let dataProviderMock = DashboardDataProviderMock()
        box = Box(dataProvider: dataProviderMock)

        box.model.retrieveDashboard(blobID: "")

        XCTAssertEqual(box.changes.first,
                       .loading(true),
                       "Model should contain loading as first change!")
        XCTAssertTrue(box.changes.contains(.loading(false)),
                      "Model should stop loading after retrieval!")
    }

    func testModelNotifiesWithErrorWhenRetrievalFails() {
        let dummyError: SleepyError = .network(NSError(domain: "dummy", code: -1, userInfo: nil))

        let dataProviderMock = DashboardDataProviderMock()
        dataProviderMock.retrieveDashboardError = dummyError
        box = Box(dataProvider: dataProviderMock)

        box.model.retrieveDashboard(blobID: "")

        XCTAssertTrue(box.changes.contains(.error(dummyError)),
                      "Model should notify with retrieved error!")
    }

    func testModelNotifiesWithDataFromDataProviderWhenRetrieval() {
        let dummyMeditations = Array(0..<4).map { randomMeditation(suffix: $0) }
        let dummyStories = Array(0..<4).map { randomStory(suffix: $0) }
        let dummyResponse = DashboardResponse(isBannerEnabled: true,
                                              meditations: dummyMeditations,
                                              stories: dummyStories)

        let dataProviderMock = DashboardDataProviderMock()
        dataProviderMock.retrieveDashboardResponse = dummyResponse
        box = Box(dataProvider: dataProviderMock)

        box.model.retrieveDashboard(blobID: "")

        var isNotified = false
        box.changes.forEach {
            switch $0 {
            case let .items(isBannerEnabled, meditations, stories):
                isNotified = true
                XCTAssertEqual(isBannerEnabled, dummyResponse.isBannerEnabled)
                XCTAssertEqual(meditations.count, dummyResponse.meditations.count)
                XCTAssertEqual(stories.count, dummyResponse.stories.count)

            default:
                break
            }
        }

        XCTAssertTrue(isNotified, "Model should notify with retrieved values!")
    }
}

extension DashboardViewModel.Change: Equatable {

    public static func == (lhs: DashboardViewModel.Change,
                           rhs: DashboardViewModel.Change) -> Bool {
        switch (lhs, rhs) {
        case let (.loading(lhsValue), .loading(rhsValue)):
            return lhsValue == rhsValue
        case let (.error(lhsValue), .error(rhsValue)):
            return lhsValue == rhsValue
        default:
            return false
        }
    }
}
