//
//  StarField.swift
//  FalunSSApp
//
//  Created by Yuma Technical Inc. on 2020-05-31.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension FalunView {
	
	func drawAStar(size: CGFloat, point: CGPoint, fillColor: NSColor = NSColor.white, strokeWidth: CGFloat = 0, strokeColor: NSColor = NSColor.clear, alpha: CGFloat) {
		let context = NSGraphicsContext.current?.cgContext
		context?.saveGState()
		var path = NSBezierPath()
		let frame = NSRect(origin: point, size: CGSize(width: size, height: size))
		if size < CGFloat(Prefs.shared.thesholdStarSize) {
			path = NSBezierPath(ovalIn: frame)
		} else {
			let halfW: CGFloat = (size/2) + point.x
			let halfH: CGFloat = (size/2) + point.y
			let innerRadius: CGFloat = size/12
			let maxX: CGFloat = point.x + size
			let maxY: CGFloat = point.y + size
			path.move(to: NSPoint(x: halfW - innerRadius, y: halfH + innerRadius))
			path.line(to: NSPoint(x: halfW, y: maxY))
			path.line(to: NSPoint(x: halfW + innerRadius, y: halfH + innerRadius))
			path.line(to: NSPoint(x: maxX, y: halfH))
			path.line(to: NSPoint(x: halfW + innerRadius, y: halfH - innerRadius))
			path.line(to: NSPoint(x: halfW, y: point.y))
			path.line(to: NSPoint(x: halfW - innerRadius, y: halfH - innerRadius))
			path.line(to: NSPoint(x: point.x, y: halfH))
			path.line(to: NSPoint(x: halfW - innerRadius, y: halfH + innerRadius))
		}
		fillColor.withAlphaComponent(alpha).setFill()
		path.fill()
		strokeColor.withAlphaComponent(alpha).setStroke()
		path.lineWidth = strokeWidth
		path.stroke()
		context?.setBlendMode(CGBlendMode.screen)
		let colors = [fillColor.cgColor, NSColor.clear.cgColor] as CFArray
		let gradient = CGGradient(colorsSpace: nil, colors: colors, locations: nil)
		let endRadius = size / 2
		let center = CGPoint(x: (size / 2) + point.x, y: (size / 2) + point.y)
		context?.drawRadialGradient(gradient!, startCenter: center, startRadius: 0.0, endCenter: center, endRadius: endRadius, options: CGGradientDrawingOptions.drawsAfterEndLocation)
		context?.restoreGState()
	}
	
	func drawStarField(fillColor: NSColor = NSColor.white, strokeWidth: CGFloat = 0, strokeColor: NSColor = NSColor.clear) {
		for star in stars {
			drawAStar(size: star.frame.width, point: star.frame.origin, fillColor: /*fillColor*//* */star.color/* */, strokeWidth: strokeWidth, strokeColor: strokeColor, alpha: star.alpha)
		}
	}

	func drawBackground(_ color: NSColor) {
		self.wantsLayer = true
		self.layer?.backgroundColor = color.cgColor
	}


}

