//
//  HomeView.swift
//  AppCrypto
//
//  Created by Renato on 27/11/23.
//

import SwiftUI

struct HomeView: View {

	@EnvironmentObject private var vm: HomeViewModel
	@State private var showPortifolio: Bool = false

    var body: some View {
		ZStack{
			// background layer
			Color.theme.background
				.ignoresSafeArea()

			//Content layer
			VStack{
				homeHeader
				columnTitle

				if !showPortifolio {
					allCoinsList
					.transition(.move(edge: .leading))
				}
				if showPortifolio {
					portifolioCoinsList
						.transition(.move(edge: .trailing))
				}
				Spacer(minLength: 0)
			} //end VStack
		} //end ZStack
    }
}

//#Preview {
//	NavigationView{
//		HomeView()
//			.toolbar(.hidden)
//	}
//	.environmentObject(dev.homeVM)
//}

struct HomeView_Previews: PreviewProvider{
	static var previews: some View{
		HomeView()
			.environmentObject(dev.homeVM)
	}
}


//MARK: - EXTENSIONS

extension HomeView{
	private var homeHeader: some View {
		HStack{
			CircleButtonView(iconName: showPortifolio ? "plus" : "info")
				.animation(.none)
				.background (
					CircleButtonAnimationView(animate: $showPortifolio)
				)
			Spacer()
			Text(showPortifolio ? "Portifolio" :  "Live Prices")
				.font(.headline)
				.fontWeight(.heavy)
				.foregroundColor(Color.theme.accent)
				.animation(.none)
			Spacer()
			CircleButtonView(iconName: "chevron.right")
				.rotationEffect(Angle(degrees: showPortifolio ? 180 : 0))
				.onTapGesture {
					withAnimation(.spring()) {
						showPortifolio.toggle()
					}
				} //end .onTapGesture
		} //end HStack
		.padding(.horizontal)
	}

	private var allCoinsList: some View{
		List{
			ForEach(vm.allCoins){ coin in
				CoinRowView(coin: coin, showHoldingsColumn: false)
					.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))

			} //end ForEach
		} //end List
		.listStyle(PlainListStyle())
	}
	private var portifolioCoinsList: some View{
		List{
			ForEach(vm.portifolioCoins){ coin in
				CoinRowView(coin: coin, showHoldingsColumn: true)
					.listRowInsets(.init(top: 10, leading: 0, bottom: 10, trailing: 10))

			} //end ForEach
		} //end List
		.listStyle(PlainListStyle())
	}

	private var columnTitle: some View{
		HStack{
			Text("Coin")
			Spacer()
			if showPortifolio{
				Text("Holdings")
			}
			Text("Price")
				.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
		}
		.font(.caption)
		.foregroundColor(Color.theme.secondaryTextColor)
		.padding(.horizontal)
	}

}
