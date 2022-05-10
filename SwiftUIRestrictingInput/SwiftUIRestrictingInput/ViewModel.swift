//
//  ViewModel.swift
//  SwiftUIRestrictingInput
//
//  Created by Darya Kuliashova on 09/05/2022.
//

import SwiftUI

final class ViewModel: ObservableObject {
    @Published var whitespaceTextFieldText = ""
    @Published var lettersTextFieldText = ""
    @Published var decimalsTextFieldText = ""

    func setRestrictionForWhitespaces(input: String) {
        whitespaceTextFieldText = input
        while let rangeOfWhitespaces = whitespaceTextFieldText.rangeOfCharacter(from: .whitespaces) {
            whitespaceTextFieldText = whitespaceTextFieldText.replacingCharacters(in: rangeOfWhitespaces, with: "")
        }
    }

    func setRestrictionForLetters(input: String) {
        lettersTextFieldText = input
        while let rangeOfLetters = lettersTextFieldText.rangeOfCharacter(from: .letters) {
            lettersTextFieldText = lettersTextFieldText.replacingCharacters(in: rangeOfLetters, with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }

    func setRestrictionForDecimals(input: String) {
        decimalsTextFieldText = input
        while let rangeOfDecimals = decimalsTextFieldText.rangeOfCharacter(from: .decimalDigits) {
            decimalsTextFieldText = decimalsTextFieldText.replacingCharacters(in: rangeOfDecimals, with: "").trimmingCharacters(in: .whitespacesAndNewlines)
        }
    }
}
