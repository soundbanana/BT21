//
//  UserViewModel.swift
//  SwiftUITask
//
//  Created by Daniil Chemaev on 23.07.2023.
//


import SwiftUI

class UserViewModel: ObservableObject {
    @Published var sum: Int = 0
    @Published var users: [User] = []

    func fetchData(numbers: [String], completion: @escaping () -> Void) {
        // Simulate a 2-second delay to fetch data
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            let number1 = Int(numbers[0]) ?? 0
            let number2 = Int(numbers[1]) ?? 0
            self.sum = number1 + number2
            self.users = self.parseJSON()
            completion()
        }
    }

    private func parseJSON() -> [User] {
        let jsonString = """
        {"users":[
        {"name":"Misha", "age": "20"},
        {"name":"Dmitry", "age": "21"},
        {"name":"Elena", "age": "18"},
        {"name":"Pavel", "age": "25"}
        ]}
        """

        guard let jsonData = jsonString.data(using: .utf8) else {
            return []
        }

        do {
            let decodedData = try JSONDecoder().decode([String: [User]].self, from: jsonData)
            if let users = decodedData["users"] {
                return users
            }
        } catch {
            print("Error decoding JSON: \(error)")
        }
        return []
    }
}
