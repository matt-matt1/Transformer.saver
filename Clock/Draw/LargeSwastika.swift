//
//  LargeSwastika.swift
//  Pong
//
//  Created by Yuma Technical Inc. on 2020-06-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension FalunView {
	
	func drawLargeSwastika(color: NSColor, length: CGFloat, width: CGFloat, cornerRadius: CGFloat) {
		let segmentLength = (length / 2) + (width / 2)
		var segment = NSBezierPath()
		let side = length / 2
		//		top-left segment:		//OK
		let x1 = basePosition.x - side
		let y1 = basePosition.y + side - width
		let rect1 = CGRect(x: x1, y: y1, width: segmentLength, height: width)
		segment = NSBezierPath(roundedRect: rect1, xRadius: cornerRadius, yRadius: cornerRadius)
		color.setFill()
		segment.fill()
		//		vertical line:			//OK
		let x2 = basePosition.x - (width / 2)		//left-right
		let y2 = basePosition.y - side				//up-down
		let rect2 = CGRect(x: x2, y: y2, width: width, height: length)
		segment = NSBezierPath(roundedRect: rect2, xRadius: cornerRadius, yRadius: cornerRadius)
		//		NSColor.black.setFill()
		segment.fill()
		//		horizontal line:		//OK
		let x3 = basePosition.x - side
		let y3 = basePosition.y - (width / 2)
		let rect3 = CGRect(x: x3, y: y3, width: length, height: width)
		segment = NSBezierPath(roundedRect: rect3, xRadius: cornerRadius, yRadius: cornerRadius)
		//		NSColor.black.setFill()
		segment.fill()
		//		bottom-right segment:	//OK
		let x4 = basePosition.x - (width  / 2)
		let y4 = basePosition.y - side
		let rect4 = CGRect(x: x4, y: y4, width: segmentLength, height: width)
		segment = NSBezierPath(roundedRect: rect4, xRadius: cornerRadius, yRadius: cornerRadius)
		segment.fill()
		//		top-right segment:		//OK
		let x5 = basePosition.x + side - (width)
		let y5 = basePosition.y - (width / 2)
		let rect5 = CGRect(x: x5, y: y5, width: width, height: segmentLength)
		segment = NSBezierPath(roundedRect: rect5, xRadius: cornerRadius, yRadius: cornerRadius)
		segment.fill()
		//		bottom-left segment:
		let x6 = basePosition.x - side	//OK
		let y6 = basePosition.y - side	//OK
		let rect6 = CGRect(x: x6, y: y6, width: width, height: segmentLength)
		segment = NSBezierPath(roundedRect: rect6, xRadius: cornerRadius, yRadius: cornerRadius)
		//		NSColor.black.setFill()
		segment.fill()
	}


}
