//
//  DateUtilityUnitTests.swift
//  SleepyTests
//
//  Created by Ugur Kilic on 17.04.2021.
//

import XCTest
@testable import Sleepy

class DateUtilityUnitTests: XCTestCase {

    func testDateUtilityConvertsDateToExpectedFormat() {
        let components = DateComponents(year: 2020, month: 3, day: 5)
        guard let date = Calendar.current.date(from: components) else {
            XCTFail("Date being tested must exist!")
            return
        }

        let dateString = DateUtility.string(from: date)

        XCTAssertEqual(dateString,
                       "03/05/2020, Thu",
                       "Date formatter doesn't convert dates to expected format!")
    }
}
