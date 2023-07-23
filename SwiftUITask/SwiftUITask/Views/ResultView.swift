//
//  ResultView.swift
//  SwiftUITask
//
//  Created by Daniil Chemaev on 23.07.2023.
//

import SwiftUI

struct ResultView: View {
    @ObservedObject var viewModel: UserViewModel
    @Binding var showResult: Bool // Binding to control the presentation of ResultView

    var body: some View {
        VStack {
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
            .navigationBarItems(leading: backButton)
    }

    private var backButton: some View {
        Button(action: {
            showResult = false // Set the binding to false to dismiss ResultView
        }) {
            HStack {
                Text("Закрыть")
            }
        }
    }
}
