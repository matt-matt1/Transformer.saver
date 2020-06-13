//
//  drawCurvedSwastika.swift
//  Pong
//
//  Created by Yuma Technical Inc. on 2020-06-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension FalunView {
	
	func drawCurvedSwastika(center: CGPoint, size: CGSize, thickness: CGFloat, fillColor: NSColor = NSColor.clear, strokeColor: NSColor = NSColor.clear, strokeWidth: CGFloat = 0) {
//		log.stringValue += "\n Curved Swastika center: \(center), size: \(size)"
//		let background = NSBezierPath(roundedRect: NSRect(origin: center, size: size), xRadius: size.width/4, yRadius: size.height/4)
//		NSColor.gray.setFill()
//		background.fill()
//		NSColor.black.setStroke()
//		background.lineWidth = strokeWidth
//		background.stroke()
		
		let path = NSBezierPath()
		let halfW = (size.width/2) + center.x
		let halfH = (size.height/2) + center.y
		let maxW = size.width + center.x
		let maxH = size.height + center.y
		//top-left quarter
		path.move(to: NSPoint(x: halfW - (thickness/2), 				y: halfH + (thickness/2)))
		path.line(to: NSPoint(x: halfW - (thickness/2), 				y: maxH - (2*thickness)))
		path.curve(to: NSPoint(x: thickness + center.x, 				y: halfH + (2*thickness)),
				   controlPoint1: NSPoint(x: halfW - (thickness/2), 	y: maxH - thickness),
				   controlPoint2: NSPoint(x: thickness*2 + center.x, 	y: maxH - (1.5*thickness)))
		path.curve(to: NSPoint(x: halfW + (thickness/2), 				y: maxH - (2*thickness)),
				   controlPoint1: NSPoint(x: (2*thickness) + center.x, 	y: maxH - (thickness/2)),
				   controlPoint2: NSPoint(x: halfW + (thickness/2), 	y: maxH))
		path.line(to: NSPoint(x: halfW + (thickness/2), 				y: halfH + (thickness/2)))
		
		//top-right quarter
				path.line(to: NSPoint(x: maxW - (thickness*2), y: halfH + (thickness/2)))
				path.curve(to: NSPoint(x: halfW + (2*thickness), y: maxH - thickness),
						   controlPoint1: NSPoint(x: maxW - thickness, y: halfH + (0.5*thickness)),
						   controlPoint2: NSPoint(x: maxW - (1.5*thickness), y: maxH - (2*thickness)))
				path.curve(to: NSPoint(x: maxW - (2*thickness), y: halfH - (0.5*thickness)),
						   controlPoint1: NSPoint(x: maxW - (0.5*thickness), y: maxH - (2*thickness)),
						   controlPoint2: NSPoint(x: maxW, y: halfH - (thickness/2)))
				path.line(to: NSPoint(x: halfW + (thickness/2), y: halfH - (thickness/2)))
		
		//bottom-right quarter
				path.line(to: NSPoint(x: halfW + (thickness/2), y: (2*thickness) + center.y))
				path.curve(to: NSPoint(x: maxW - thickness, y: halfH - (2*thickness)),
						   controlPoint1: NSPoint(x: halfW + (thickness/2), y: thickness + center.y),
						   controlPoint2: NSPoint(x: maxW - (thickness*2), y: (1.5*thickness) + center.y))
				path.curve(to: NSPoint(x: halfW - (thickness/2), y: (2*thickness) + center.y),
						   controlPoint1: NSPoint(x: maxW - (2*thickness), y: (thickness/2) + center.y),
						   controlPoint2: NSPoint(x: halfW - (thickness/2), y:  center.y))
				path.line(to: NSPoint(x: halfW - (thickness/2), y: halfH - (thickness/2)))
		
		//bottom-left quarter
				path.line(to: NSPoint(x: (2*thickness) + center.x, y: halfH - (thickness/2)))
				path.curve(to: NSPoint(x: halfW - (2*thickness), y: thickness + center.y),
						   controlPoint1: NSPoint(x: thickness + center.x, y: halfH - (0.5*thickness)),
						   controlPoint2: NSPoint(x: (1.5*thickness) + center.x, y: (2*thickness) + center.y))
				path.curve(to: NSPoint(x: (2*thickness) + center.x, y: halfH + (0.5*thickness)),
						   controlPoint1: NSPoint(x: (0.5*thickness) + center.x, y: (2*thickness) + center.y),
						   controlPoint2: NSPoint(x: center.x, y: halfH + (thickness/2)))
				path.line(to: NSPoint(x: halfW - (thickness/2), y: halfH + (thickness/2)))
		
		//		path.close()
//		if fillColor != NSColor.clear {
			fillColor.setFill()
			path.fill()
//		}
//		if strokeWidth > 0 {
			strokeColor.setStroke()
			path.lineWidth = strokeWidth
			path.stroke()
//		}
	}
	
	func draw4Swastikas(_ radius: CGFloat, width: CGFloat, fillColor: NSColor = NSColor.yellow, strokeColor: NSColor = NSColor.clear, strokeWidth: CGFloat = 0) {
		drawCurvedSwastika(center: CGPoint(x: basePosition.x - radius, y: basePosition.y - (2*radius) + CGFloat(Prefs.shared.baseRadius)), size: CGSize(width: radius*2, height: radius*2), thickness: width, fillColor: fillColor, strokeColor: strokeColor, strokeWidth: strokeWidth)
		drawCurvedSwastika(center: CGPoint(x: basePosition.x - CGFloat(Prefs.shared.baseRadius), y: basePosition.y - radius), size: CGSize(width: radius*2, height: radius*2), thickness: width, fillColor: fillColor, strokeColor: strokeColor, strokeWidth: strokeWidth)
		drawCurvedSwastika(center: CGPoint(x: basePosition.x - (2*radius) + CGFloat(Prefs.shared.baseRadius), y: basePosition.y - radius), size: CGSize(width: radius*2, height: radius*2), thickness: width, fillColor: fillColor, strokeColor: strokeColor, strokeWidth: strokeWidth)
		drawCurvedSwastika(center: CGPoint(x: basePosition.x - radius, y: basePosition.y - CGFloat(Prefs.shared.baseRadius)), size: CGSize(width: radius*2, height: radius*2), thickness: width, fillColor: fillColor, strokeColor: strokeColor, strokeWidth: strokeWidth)
	}

}
