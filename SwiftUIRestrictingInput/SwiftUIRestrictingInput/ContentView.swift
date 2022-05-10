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
        VStack(spacing: 48) {
            buildWhitespaceTextField()
            buildLettersTextField()
            buildDecimalsTextField()
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }

    private func buildWhitespaceTextField() -> some View {
        let bindingForWhitespaceTextField = Binding<String>(
            get: { viewModel.whitespaceTextFieldText },
            set: { newValue in
                viewModel.setRestrictionForWhitespaces(input: newValue)
            })
        return VStack(alignment: .leading, spacing: 8) {
            Text(Constants.noWhitespaces)
            TextField("", text: bindingForWhitespaceTextField)
        }
    }

    private func buildLettersTextField() -> some View {
        let bindingForLettersTextField = Binding<String>(
            get: { viewModel.lettersTextFieldText },
            set: { newValue in
                viewModel.restRestrictionForLetters(input: newValue)
            })
        return VStack(alignment: .leading, spacing: 8) {
            Text(Constants.noLetters)
            TextField("", text: bindingForLettersTextField)
        }
    }

    private func buildDecimalsTextField() -> some View {
        let bindingForDecimalsTextField = Binding<String>(
            get: { viewModel.decimalsTextFieldText },
            set: { newValue in
                viewModel.decimalsTextFieldText = newValue

                while let rangeOfDecimals = viewModel.decimalsTextFieldText.rangeOfCharacter(from: .decimalDigits) {
                    viewModel.decimalsTextFieldText = viewModel.decimalsTextFieldText.replacingCharacters(in: rangeOfDecimals, with: "")
                }
            })
        return VStack(alignment: .leading, spacing: 8) {
            Text(Constants.noDecimalNumbers)
            TextField("", text: bindingForDecimalsTextField)
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    @State static var viewModel = ViewModel()
    static var previews: some View {
        ContentView(viewModel: viewModel)
    }
}
