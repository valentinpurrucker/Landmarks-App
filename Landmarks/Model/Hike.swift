//
//  Hike.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 27.10.21.
//

import Foundation



struct Hike: Codable, Identifiable {
	let id: Int
	let name: String
	let distance: Double
	let difficulty: Int
	
	let observations: [Observation]
	
	static var formatter = LengthFormatter()
	
	
	var distanceText: String {
		Self.formatter.string(fromValue: distance, unit: .kilometer)
	}
	
	struct Observation : Codable, Hashable {
		
		let distanceFromStart: Double
		
		let elevation: Range<Double>
		let pace: Range<Double>
		let heartRate: Range<Double>
	}
}
