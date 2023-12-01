//
//  Color.swift
//  AppCrypto
//
//  Created by Renato on 27/11/23.
//

import Foundation
import SwiftUI

struct ColorTheme {
	let accent = Color("AccentColor")
	let background = Color("BackgroundColor")
	let greenColor = Color("GreenColor")
	let redColor  = Color("RedColor")
	let secondaryTextColor = Color("SecondaryTextColor")
}

extension Color {

		static let theme = ColorTheme()
}
