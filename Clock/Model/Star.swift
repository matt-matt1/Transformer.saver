//
//  Star.swift
//  Pong
//
//  Created by Yuma Technical Inc. on 2020-06-03.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


class Star/*: NSObject*/ {
	
	let frame: NSRect
	let alpha: CGFloat
	let color: NSColor
	
	
	init(frame: NSRect, alpha: CGFloat, color: NSColor) {
		self.frame = frame
		self.alpha = alpha
		self.color = color
	}


}
