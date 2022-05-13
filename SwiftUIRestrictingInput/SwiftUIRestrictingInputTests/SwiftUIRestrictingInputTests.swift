//
//  SwiftUIRestrictingInputTests.swift
//  SwiftUIRestrictingInputTests
//
//  Created by Darya Kuliashova on 09/05/2022.
//

import XCTest
@testable import SwiftUIRestrictingInput

class SwiftUIRestrictingInputTests: XCTestCase {
    var sut: ViewModel!

    override func setUpWithError() throws {
        super.setUp()
        sut = ViewModel()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testWhitespaceTextField_RestrictsWhitespaces() throws {
        let newValue = "random text with whitespaces"

        sut.restrictWhitespaces(newValue)

        XCTAssertEqual(sut.whitespaceTextFieldText, "randomtextwithwhitespaces")
    }

    func testLettersTextField_RestrictsLetters() throws {
        let newValue = "random text 12345"

        sut.restrictLetters(newValue)

        XCTAssertEqual(sut.lettersTextFieldText, "12345")
    }

    func testDecimalsTextField_RestrictDecimalNumbers() throws {
        let newValue = "random text 12345"

        sut.restrictDecimals(newValue)

        XCTAssertEqual(sut.decimalsTextFieldText, "random text")
    }
}
