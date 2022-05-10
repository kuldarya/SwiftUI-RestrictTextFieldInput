//
//  SwiftUIRestrictingInputTests.swift
//  SwiftUIRestrictingInputTests
//
//  Created by Darya Kuliashova on 09/05/2022.
//

import XCTest
@testable import SwiftUIRestrictingInput

class SwiftUIRestrictingInputTests: XCTestCase {
    var sut: ContentView!

    override func setUpWithError() throws {
        super.setUp()
        sut = ContentView()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testWhitespaceTextField_RestrictsWhitespaces() throws {
        let newValue = "random text with whitespaces"

        sut.viewModel.setRestrictionForWhitespaces(input: newValue)

        XCTAssertEqual(sut.viewModel.whitespaceTextFieldText, "randomtextwithwhitespaces")
    }

    func testLettersTextField_RestrictsLetters() throws {
        let newValue = "random text 12345"

        sut.viewModel.setRestrictionForLetters(input: newValue)

        XCTAssertEqual(sut.viewModel.lettersTextFieldText, "12345")
    }

    func testDecimalsTextField_RestrictDecimalNumbers() throws {
        let newValue = "random text 12345"

        sut.viewModel.setRestrictionForDecimals(input: newValue)

        XCTAssertEqual(sut.viewModel.decimalsTextFieldText, "random text")
    }
}
