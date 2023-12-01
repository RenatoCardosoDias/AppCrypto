//
//  AppCryptoApp.swift
//  AppCrypto
//
//  Created by Renato on 27/11/23.
//

import SwiftUI

@main
struct AppCryptoApp: App {

	@StateObject private var vm = HomeViewModel()
    var body: some Scene {
        WindowGroup {
			NavigationView{
				HomeView()
					.toolbar(.hidden)
			} //end NaviagtionView
			.environmentObject(vm)
        }
    }
}
