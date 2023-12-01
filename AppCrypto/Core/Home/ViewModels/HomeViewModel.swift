//
//  HomeViewModel.swift
//  AppCrypto
//
//  Created by Renato on 28/11/23.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject{
	
	@Published var allCoins: [CoinModel] = []
	@Published var portifolioCoins: [CoinModel] = []

	private let dataService = CoinDataService()
	private var cancellabes = Set<AnyCancellable>()

	init() {
//		DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//			self.allCoins.append(DeveloperPreview.instance.coin)
//			self.portifolioCoins.append(DeveloperPreview.instance.coin)
		
		addSubscribers()

		} //end init()

	func addSubscribers() {
		dataService.$allCoins
			.sink { [weak self] (returnedCoins) in
				self?.allCoins = returnedCoins
			}
			.store(in: &cancellabes)
	}
	} //end class HomeViewModel

