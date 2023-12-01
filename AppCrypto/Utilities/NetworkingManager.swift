//
//  NetworkingManager.swift
//  AppCrypto
//
//  Created by Renato on 28/11/23.
//

import Foundation
import Combine


class NetworkingManager{

	enum NetworkingError: LocalizedError {
		case badURLResponse(url: URL)
		case unknown

		var errorDescription: String? {
			switch self {
				case .badURLResponse(url: let url): return "[🔥]Bad response from URL: \(url)"
				case .unknown: return "[⚠️]Unknow error ocured"
			}
		}
	}

	static func download(url: URL) -> AnyPublisher<Data, Error>{
		return URLSession.shared.dataTaskPublisher(for: url)
			.subscribe(on: DispatchQueue.global(qos: .default))
		//Tentar mapear o resultado que recebemos em segundo plano
			.tryMap({ try handleURLResponse(output: $0, url: url)})
			.receive(on: DispatchQueue.main)
			.eraseToAnyPublisher()
	}
	static func handleURLResponse(output: URLSession.DataTaskPublisher.Output, url: URL) throws -> Data {
		guard let response = output.response as? HTTPURLResponse,
									response.statusCode >= 200 && response.statusCode < 300 else {
			throw NetworkingError.badURLResponse(url: url)
		} //end guard let response
		return output.data
	} //end static func handleURLResponse


	static func handleCompetion(completion: Subscribers.Completion<Error>) {
		switch completion{
			case .finished:
				break
			case .failure(let error):
				print(error.localizedDescription)
		} //end switch competion
	} //end static func handleCompetion
}
