//
//  ContentView.swift
//  SwiftUIRestrictingInput
//
//  Created by Darya Kuliashova on 09/05/2022.
//

import SwiftUI

struct ContentView: View {
    @State private var restrictWhitespaces = ""
    @State private var restrictLetters = ""
    @State private var restrictDecimals = ""

    var body: some View {
        VStack(spacing: 48) {
            Text("SWIFTUI")
            VStack(alignment: .leading, spacing: 8) {
                Text("Doesn't accept whitespaces")
                TextField("", text: $restrictWhitespaces)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Doesn't accept letters")
                TextField("", text: $restrictLetters)
            }
            VStack(alignment: .leading, spacing: 8) {
                Text("Doesn't accept decimals")
                TextField("", text: $restrictDecimals)
            }
            Spacer()
        }
        .textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.horizontal, 24)
        .padding(.top, 24)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
