//
//  MainView.swift
//  SwiftUITask
//
//  Created by Daniil Chemaev on 23.07.2023.
//

import SwiftUI

struct MainView: View {
    @StateObject private var viewModel = UserViewModel()
    @State private var isLoading = false
    @State private var showResultView = false

    var body: some View {
        NavigationView {
            VStack {
                if !showResultView {
                    InputView(isLoading: $isLoading, showResult: $showResultView, viewModel: viewModel)
                } else {
                    ResultView(viewModel: viewModel, showResult: $showResultView)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

