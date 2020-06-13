//
//  drawDiscs.swift
//  Falun
//
//  Created by Yuma Technical Inc. on 2020-06-03.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension FalunView {
	
	func drawFalunBase(color: NSColor) {
		drawCircle(center: basePosition, radius: CGFloat(Prefs.shared.baseRadius), fillColor: color, shadowColor: NSColor.white.withAlphaComponent(0.4), shadowBlurRadius: CGFloat(Prefs.shared.baseRadius/4))
	}
	
	func drawFalunInner(color: NSColor) {
		drawCircle(center: basePosition, radius: CGFloat(Prefs.shared.centerDiscRadius * Prefs.shared.baseRadius), fillColor: color)
	}

}
