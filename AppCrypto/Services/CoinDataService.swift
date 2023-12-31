//
//  CoinDataService.swift
//  AppCrypto
//
//  Created by Renato on 28/11/23.
//

import Foundation
import Combine

class CoinDataService {

	@Published var allCoins: [CoinModel] = []
	var coinSubscription: AnyCancellable?

	init() {
		getCoins()
	}

	private func getCoins() {
		guard let url = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&order=market_cap_desc&per_page=250&page=1&sparkline=true&price_change_percentage=24h&locale=en") else { return }

		coinSubscription = NetworkingManager.download(url: url)
			.decode(type: [CoinModel].self, decoder: JSONDecoder())
			.sink(receiveCompletion: NetworkingManager.handleCompetion, receiveValue: { [weak self] (returnCoins) in
				self?.allCoins = returnCoins
				self?.coinSubscription?.cancel()
			})
			
	} //end private func getCoins
}
