//
//  Lifecycle.swift
//  Pong
//
//  Created by Yuma Technical Inc. on 2020-06-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension FalunView {
	
	// MARK: - Lifecycle
	
	override func draw(_ rect: NSRect) {
//		drawStarField(fillColor: NSColor.white, strokeWidth: 0, strokeColor: NSColor.clear)
//		drawStarField(fillColor: NSColor.white, strokeWidth: 1, strokeColor: NSColor.yellow)
		drawStarField(fillColor: NSColor.white, strokeWidth: 1, strokeColor: NSColor.white)
//		log.stringValue += "\n baseRadius = \(baseRadius)"
		drawCirleOfRays(origin: basePosition, color: Color.lightBlue, radius: (frame.width + frame.height)/2)
		drawFalunBase(color: /*Color.outerCircleCyan*/Prefs.shared.baseFillColor)
		//		let baseSide = CGFloat(innerSquareLengthFitsOuterCircle(radius: Float(baseRadius)) / 2)
		//		log.stringValue += "\n base inner square side length = \(baseSide)"
		drawFalunInner(color: /*Color.taijiRed*/Prefs.shared.centerDiscFill)
		let innerSide = innerSquareLengthFitsOuterCircle(radius: Prefs.shared.centerDiscRadius * Prefs.shared.baseRadius)
//		log.stringValue += "\n middle Swastika inner square side length = \(innerSide)"
		drawLargeSwastika(color: Prefs.shared.centerSymbolFill, length: CGFloat(innerSide), width: CGFloat(Prefs.shared.baseRadius / 8), cornerRadius: CGFloat(Prefs.shared.centerSymbolCornerRadius * Prefs.shared.baseRadius))
		
		//		let taijiDiagonal = CGFloat(innerSquareLengthFitsOuterCircle(radius: Float(baseRadius / 4)))
		//		log.stringValue += "\n Taiji diagonal length = \(taijiDiagonal)"
		//		draw4Tajias(length: baseSide, radius: baseRadius / 4, diagonalLength: taijiDiagonal)
		draw4Tajias(CGFloat(Prefs.shared.yySymbolRadius), dotRadius: CGFloat(Prefs.shared.yyDotRadius))
		draw4Swastikas(CGFloat(Prefs.shared.baseRadius / 4), width: CGFloat(Prefs.shared.curvedSymbolThickness * Prefs.shared.baseRadius), fillColor: Prefs.shared.curvedSymbolFill, strokeColor: Prefs.shared.curvedSymbolStroke, strokeWidth: CGFloat(Prefs.shared.curvedSymbolStrokeWidth))
		
		//		drawPaddle(color: innerCircleColor)
		//		drawCenterDot(color: NSColor.green)

	}


}
