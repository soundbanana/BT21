//
//  MainViewModel.swift
//  SwiftUITask
//
//  Created by Daniil Chemaev on 23.07.2023.
//

import SwiftUI

enum ViewState {
    case inputView
    case resultView
}

class MainViewModel: ObservableObject {
    @Published var state: ViewState = .inputView

    let mainService: MainService

    var sum: Int = 0
    var users: [User] = []

    init(mainService: MainService) {
        self.mainService = mainService
    }

    func fetchData(numbers: [String], completion: @escaping () -> Void) {
        state = .inputView

        mainService.fetchData() { [weak self] users in
            self?.sum = numbers.compactMap { Int($0) }.reduce(0, +)  // We can take it to a separate service or shove it into the MainService
            self?.users = users
            self?.state = .resultView
        }
    }
}
