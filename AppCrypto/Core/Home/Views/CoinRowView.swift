//
//  CoinRowView.swift
//  AppCrypto
//
//  Created by Renato on 27/11/23.
//

import SwiftUI

struct CoinRowView: View {

	let coin: CoinModel
	let showHoldingsColumn: Bool

    var body: some View {
		HStack(spacing: 0){
			leftColum
			Spacer()
			if showHoldingsColumn {
				centerColumn
			}
			rightColumn
		}//end HStack
		.font(.subheadline)
    }
}

//#Preview {
////	CoinRowView(coin: dev.coin)
//	CoinRowView()
//}

struct CoinRowView_Previews: PreviewProvider{
	static var previews: some View{
			Group{
				CoinRowView(coin: dev.coin, showHoldingsColumn: true)
					.previewLayout(.sizeThatFits)
				CoinRowView(coin: dev.coin, showHoldingsColumn: true)
					.previewLayout(.sizeThatFits)
					.preferredColorScheme(.dark)
			}
	}
}


//MARK: - Extensions

extension CoinRowView{
	private var leftColum: some View{
		HStack(spacing: 0){
			Text(("\(coin.rank)"))
				.font(.caption)
				.foregroundColor(Color.theme.secondaryTextColor)
				.frame(minWidth: 30)
			Circle()
				.frame(width: 30, height: 30)
			Text(coin.symbol.uppercased())
				.font(.headline)
				.padding(.leading, 6)
				.foregroundColor(Color.theme.accent)
		} //end HStack
	} //end private var leftColum

	private var centerColumn: some View {
		VStack(alignment: .trailing){
			Text(coin.currentHoldingsValue.asCurrencyWith6Decimal())
				.bold()
			Text((coin.currentHoldings ?? 0).asNumberString())
		} //end VStack
		.foregroundColor(Color.theme.accent)
	} //end private var centerColumn

	private var rightColumn: some View {
		VStack(alignment: .trailing){
			Text("\(coin.currentPrice.asCurrencyWith2Decimal())")
				.bold()
				.foregroundColor(Color.theme.accent)
			Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
				.foregroundColor(
					(coin.priceChangePercentage24H ?? 0) >= 0 ? Color.theme.greenColor : Color.theme.redColor
				)
		} //end VStack
		.frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
	}
}


