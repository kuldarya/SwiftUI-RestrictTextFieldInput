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
   
    @Published var isWhitespaceRestricted: Bool = false
    @Published var isLetterRestricted: Bool = false
    @Published var isDecimalRestricted: Bool = false
}
