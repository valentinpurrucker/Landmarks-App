//
//  Badge.swift
//  Landmarks
//
//  Created by Valentin Purrucker on 27.10.21.
//

import SwiftUI

struct Badge: View {
	
	let badgeAmount = 8
	
	var badgeSymbols: some View {
		ForEach(0..<8) {i in
			RotatedBadgeSymbol(angle: .degrees(Double(i) / Double(8)) * 360.0)
		}
		.opacity(0.5)
	}
	
    var body: some View {
		ZStack {
			BadgeBackground()
			GeometryReader { geometry in
				badgeSymbols
					.scaleEffect(1.0 / 4.0, anchor: .top)
					.position(x: geometry.size.width / 2, y: (3.0 / 4.0) * geometry.size.height)
				
			}
		}
		.scaledToFit()
		
    }
}

struct Badge_Previews: PreviewProvider {
    static var previews: some View {
        Badge()
    }
}
