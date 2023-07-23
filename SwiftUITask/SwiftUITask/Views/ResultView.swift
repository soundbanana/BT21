//
//  ResultView.swift
//  SwiftUITask
//
//  Created by Daniil Chemaev on 23.07.2023.
//

import SwiftUI

struct ResultView: View {
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            HStack {
                backButton
                Spacer()
            }
                .padding(.top, 8)
                .padding(.leading, 8)

            Text("\(viewModel.sum)")
                .padding()
                .font(.largeTitle)

            HStack {
                Text("Имя")
                    .font(.headline)
                Spacer()
                Text("Возраст")
                    .font(.headline)
            }
                .padding(.horizontal)
                .frame(maxWidth: .infinity, alignment: .leading)

            Divider()

            List(viewModel.users, id: \.name) { user in
                HStack {
                    Text(user.name)
                    Spacer()
                    Text(user.age)
                }
                    .padding(.horizontal)
            }
                .listStyle(PlainListStyle())
        }
            .padding()
    }

    private var backButton: some View {
        Button(action: {
            viewModel.state = .inputView // Set the state to inputView to go back to InputView
        }) {
            HStack {
                Text("Закрыть")
            }
        }
    }
}
