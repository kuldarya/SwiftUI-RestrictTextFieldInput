//
//  ContentView.swift
//  SwiftUIRestrictingInput
//
//  Created by Darya Kuliashova on 09/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State var viewModel: ViewModel = .init()

    var body: some View {
        let bindingForWhitespaceTextField = Binding<String>(
            get: { viewModel.whitespaceTextFieldText },
            set: { newValue in
                viewModel.whitespaceTextFieldText = newValue

                while let rangeOfWhitespaces = viewModel.whitespaceTextFieldText.rangeOfCharacter(from: .whitespaces) {
                    viewModel.whitespaceTextFieldText = viewModel.whitespaceTextFieldText.replacingCharacters(in: rangeOfWhitespaces, with: "")
                }
            })

        let bindingForLettersTextField = Binding<String>(
            get: { viewModel.lettersTextFieldText },
            set: { newValue in
                viewModel.lettersTextFieldText = newValue

                while let rangeOfLetters = viewModel.lettersTextFieldText.rangeOfCharacter(from: .letters) {
                    viewModel.lettersTextFieldText = viewModel.lettersTextFieldText.replacingCharacters(in: rangeOfLetters, with: "")
                }
            }
        )

        let bindingForDecimalsTextField = Binding<String>(
            get: { viewModel.decimalsTextFieldText },
            set: { newValue in
                viewModel.decimalsTextFieldText = newValue

                while let rangeOfDecimals = viewModel.decimalsTextFieldText.rangeOfCharacter(from: .decimalDigits) {
                    viewModel.decimalsTextFieldText = viewModel.decimalsTextFieldText.replacingCharacters(in: rangeOfDecimals, with: "")
                }
            })

        VStack(spacing: 48) {
            VStack(alignment: .leading, spacing: 8) {
                Text("Doesn't accept whitespaces")
                TextField("", text: bindingForWhitespaceTextField)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Doesn't accept letters")
                TextField("", text: bindingForLettersTextField)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Doesn't accept decimals")
                TextField("", text: bindingForDecimalsTextField)
            }
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

struct ContentView_Previews: PreviewProvider {
    @State static var viewModel = ViewModel()
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
