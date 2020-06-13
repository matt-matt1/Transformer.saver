//
//  Rays.swift
//  Pong
//
//  Created by Yuma Technical Inc. on 2020-06-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension FalunView {
	
	func drawRay(_ origin: CGPoint, radians: CGFloat, radius: CGFloat, color: NSColor, thickness: CGFloat = 1, pattern: [CGFloat] = [81, 81], phase: CGFloat = 0) {
		let path = NSBezierPath()
		path.move(to: origin)
//		let radius = origin.x + origin.y
		let tox = origin.x + radius * cos(radians)
		let toy = origin.x + radius * sin(radians)
		path.line(to: NSPoint(x: tox, y: toy))
		path.setLineDash(pattern, count: pattern.count, phase: phase)
		color.setStroke()
		path.lineWidth = thickness
		path.stroke()
	}
	
	func drawCirleOfRays(origin: CGPoint, color: NSColor, radius: CGFloat) {
		var phase: CGFloat = 0
		for angle in stride(from: 0, to: 360.0, by: 90/*angleRays*3*/) {
			let mColor = (Int(angle) % 180) != 0 ? color : NSColor.green
			/*
			var top = CGPoint.zero
			top.x = CGFloat(cos(i.degreesToRadians())) * (radius * 2)
			top.y = CGFloat(sin(i.degreesToRadians())) * (radius * 2)
			let to = CGPoint(x: radius + top.x, y: radius + top.y)
			if Int(i) % 20 == 0 {
				if state == State.clockwise {
					let view = dashedLine2(from: to, to: self.from, color: self.ltBlue)
					array.append(view)
				} else {
					let view = dashedLine2(from: self.from, to: to, color: self.ltBlue)
					array.append(view)
				}
			} else {
				if state == State.clockwise {
					let view = dashedLine(from: to, to: self.from, color: self.ltBlue)
					array.append(view)
				} else {
					let view = dashedLine(from: self.from, to: to, color: self.ltBlue)
					array.append(view)
				}
			}
			*/
//			if (Int(angle) % (Int(angleRays * 2))) == 0 {
//			if (Int(angle) % 180) == 0 {
//				phase += 1
//				color = NSColor.green
//			}
			let radians: CGFloat = CGFloat(angle) * CGFloat.pi / 180
			drawRay(origin, radians: radians, radius: radius, color: mColor, phase: phase)
//			log.stringValue += "\n angle \(angle) = \(radians)"
		}
	}


}
