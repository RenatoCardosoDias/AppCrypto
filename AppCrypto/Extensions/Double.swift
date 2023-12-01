//
//  Double.swift
//  AppCrypto
//
//  Created by Renato on 28/11/23.
//

import Foundation

extension Double {

	///Converts a Double into a Currency with 2 decimal places
	///```
	///Convert 1234.56 to $1,234.56
	///```

	private var currencyFormatter2: NumberFormatter{
		//usar o formato numerico
		let formatter = NumberFormatter()
		//queremos usar as vírgulas e definimos como true
		formatter.usesGroupingSeparator = true
		//Adicionar estilos numericos
		formatter.numberStyle = .currency
		//		//Localidade
		//		formatter.locale = .current
		//		//Codigo da moeda
		//		formatter.currencyCode = "usd"
		//		//Simbolo do moeda
		//		formatter.currencySymbol = "$"

		//Definindo quantas casas decimais queremos permitir
		formatter.minimumFractionDigits = 2
		formatter.maximumFractionDigits = 2
		return formatter
	}

	///Converts a Double into a Currency as a String with 2 decimal places
	///```
	///Convert 1234.56 to $1,234.56"
	///```
	func asCurrencyWith2Decimal() -> String {
		let number = NSNumber(value: self)
		return currencyFormatter2.string(from: number) ?? "0.00"
	}

	//MARK: - DIVISOR

	///Converts a Double into a Currency with 2-6 decimal places
	///```
	///Convert 1234.56 to $1,234.56
	///Convert 12.3456 to $12.3456
	///Convert 0.123456 to $0.123456
	///```

	private var currencyFormatter6: NumberFormatter{
		//usar o formato numerico
		let formatter = NumberFormatter()
		//queremos usar as vírgulas e definimos como true
		formatter.usesGroupingSeparator = true
		//Adicionar estilos numericos
		formatter.numberStyle = .currency
//		//Localidade
//		formatter.locale = .current
//		//Codigo da moeda
//		formatter.currencyCode = "usd"
//		//Simbolo do moeda
//		formatter.currencySymbol = "$"

		//Definindo quantas casas decimais queremos permitir
		formatter.minimumFractionDigits = 2
		formatter.maximumFractionDigits = 6
		return formatter
	}

	///Converts a Double into a Currency as a String with 2-6 decimal places
	///```
	///Convert 1234.56 to $1,234.56"
	///Convert 12.3456 to "$12.3456"
	///Convert 0.123456 to "$0.123456"
	///```
	func asCurrencyWith6Decimal() -> String {
		let number = NSNumber(value: self)
		return currencyFormatter6.string(from: number) ?? "0.00"
	}

	///Converts a Double into string representation
	///```
	///Convert 1.23456 to "1.23
	///```
	func asNumberString() -> String {
		return String(format: "%.2f", self)
	}

	///Converts a Double into string representation with percent symbol
	///```
	///Convert 1.23456 to "1.23
	///```
	func asPercentString() -> String {
		return asNumberString() + "%"
	}
}
