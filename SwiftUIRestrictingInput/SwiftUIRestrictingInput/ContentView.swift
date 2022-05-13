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
            whitespaceTextField
            lettersTextField
            decimalsTextField
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }

    private var whitespaceTextField: some View {
        let bindingForWhitespaceTextField = Binding<String>(
            get: { viewModel.whitespaceTextFieldText },
            set: viewModel.restrictWhitespaces
        )
        return VStack(alignment: .leading, spacing: 8) {
            Text(Constants.noWhitespaces)
            TextField("", text: bindingForWhitespaceTextField)
        }
    }

    private var lettersTextField: some View {
        let bindingForLettersTextField = Binding<String>(
            get: { viewModel.lettersTextFieldText },
            set: viewModel.restrictLetters
        )
        return VStack(alignment: .leading, spacing: 8) {
            Text(Constants.noLetters)
            TextField("", text: bindingForLettersTextField)
        }
    }

    private var decimalsTextField: some View {
        let bindingForDecimalsTextField = Binding<String>(
            get: { viewModel.decimalsTextFieldText },
            set: viewModel.restrictDecimals
            )
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
