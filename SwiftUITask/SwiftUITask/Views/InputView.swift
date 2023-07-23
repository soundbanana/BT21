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
    @Binding var isLoading: Bool
    @Binding var showResult: Bool
    @ObservedObject var viewModel: UserViewModel

    var body: some View {
        VStack {
            TextField("", text: $number1)
                .keyboardType(.numberPad)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1) // Add border to the TextField
            )

            TextField("", text: $number2)
                .keyboardType(.numberPad)
                .padding()
                .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(.gray, lineWidth: 1) // Add border to the TextField
            )

            Button(action: {
                fetchData()
            }, label: {
                    Text("Вторая View")
                        .foregroundColor(.white) // Set the text color to white
                    .padding()
                        .frame(maxWidth: .infinity)
                        .background(.blue) // Set the background color to blue
                    .cornerRadius(8) // Add a corner radius for a rounded button appearance
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
            showResult = true
        }
    }
}
