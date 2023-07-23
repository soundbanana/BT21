//
//  MainView.swift
//  SwiftUITask
//
//  Created by Daniil Chemaev on 23.07.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = MainViewModel(mainService: MainService())
    @State private var showResultView = false

    var body: some View {
        VStack {
            if case .inputView = viewModel.state {
                InputView()
                    .environmentObject(viewModel)
            } else if case .resultView = viewModel.state {
                ResultView()
                    .environmentObject(viewModel)
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

