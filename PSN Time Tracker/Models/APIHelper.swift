//
//  APIHelper.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 30/09/23.
//

import Foundation
import SwiftUI
class APIHelper {
    @AppStorage("ssoToken") var ssoToken: String = ""
    let baseUrl: String = "https://psn-time-tracker-api.onrender.com"
    func performGet<T: Decodable>(path: String) async throws -> T {
        let url = URL(string: "\(baseUrl)\(path)?token=\(ssoToken)&language=pt-br")!
        let (data, _) = try await URLSession.shared.data(from: url)
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    }
}
