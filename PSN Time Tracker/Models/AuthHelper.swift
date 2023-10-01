//
//  AuthHelper.swift
//  PSN Time Tracker
//
//  Created by Samuel Martins on 01/10/23.
//

import Foundation
import SwiftUI

class AuthHelper: ObservableObject {
    @AppStorage("ssoToken") var ssoToken: String = ""
    

    
    var token: String {
        print("ssoToken \(ssoToken)")
        return ssoToken
    }
}
