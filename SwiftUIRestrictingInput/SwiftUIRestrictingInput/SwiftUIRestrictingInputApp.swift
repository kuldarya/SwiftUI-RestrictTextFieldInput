//
//  SwiftUIRestrictingInputApp.swift
//  SwiftUIRestrictingInput
//
//  Created by Darya Kuliashova on 09/05/2022.
//

import SwiftUI

@main
struct SwiftUIRestrictingInputApp: App {
    private var viewModel = ViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: viewModel)
                
        }
    }
}
