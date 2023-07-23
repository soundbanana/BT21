//
//  InputView.swift
//  SwiftUITask
//
//  Created by Daniil Chemaev on 23.07.2023.
//

import SwiftUI

struct InputView: View {
    @State private var number1 = ""
    @State private var number2 = ""
    @State var isLoading: Bool = false
    @EnvironmentObject var viewModel: MainViewModel

    var body: some View {
        VStack {
            TextField("", text: $number1)
                .keyboardType(.numberPad)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1)
            )

            TextField("", text: $number2)
                .keyboardType(.numberPad)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1)
            )

            Button(action: {
                fetchData()
            }, label: {
                    Text("Вторая View")
                        .foregroundColor(.white)
                    .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue)
                    .cornerRadius(8)
                })
                .disabled(isLoading)

            if isLoading {
                ProgressView()
            }
        }
            .padding()
    }

    private func fetchData() {
        isLoading = true
        viewModel.fetchData(numbers: [number1, number2]) {
            isLoading = false
        }
    }
}
