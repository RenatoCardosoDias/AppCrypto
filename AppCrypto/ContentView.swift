//
//  ContentView.swift
//  AppCrypto
//
//  Created by Renato on 27/11/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
			Color.theme.background
				.ignoresSafeArea()
			VStack(spacing: 40){
				Text("Accent Color")
					.foregroundColor(Color.theme.accent)
				Text("Secondary Text Color")
					.foregroundColor(Color.theme.secondaryTextColor)
				Text("Red Color")
					.foregroundColor(Color.theme.redColor)
				Text("Green Color")
					.foregroundColor(Color.theme.greenColor)
			} //end VStack
			.font(.headline)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
