//
//  LiveView.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-16.
//  Copyright © 2020 Yuma Technical Inc.. All rights reserved.
//

import Cocoa

@IBDesignable
class LineView: NSView {
	
	enum Placement: String/*Int*/ {
		case none = "none"
		case start = "start"
		case end = "end"
		case startAndEnd = "startAndEnd"
	}
	@IBInspectable var lineColor: NSColor = NSColor.red {
		didSet {
		}
	}
	@IBInspectable var lineWidth: CGFloat = 1 {
		didSet {
		}
	}
	@IBInspectable var segmentTopWidth: CGFloat = 10 {
		didSet {
		}
	}
	@IBInspectable var segmentBottomWidth: CGFloat = 10 {
		didSet {
		}
	}
	var placementArrowhead: Placement = Placement.none
	/*	@IBInspectable var placementArrowheadAdapter: Int {
	get {
	return self.placementArrowhead.rawValue
	}
	set(placementArrowheadIndex) {
	self.placementArrowhead = Placement(rawValue: placementArrowheadIndex) ?? .none
	}
	}*/
	@available(*, unavailable, message: "IB only")
	@IBInspectable var placementArrowheadAdapter: String? {
		willSet {
			// Ensure user enters a valid shape while making it lowercase.
			// Ignore input if not valid.
			if let newShape = Placement(rawValue: newValue?.lowercased() ?? "none") {
				placementArrowhead = newShape
			}
		}
	}
	@IBInspectable var lengthArrowhead: CGFloat {
		get {
			return 15
		}
	}
	@IBInspectable var heightArrowhead: CGFloat {
		get {
			return 5
		}
	}
	var path = NSBezierPath()
	
	
	override func draw(_ dirtyRect: NSRect) {
		super.draw(dirtyRect)
		
		self.path.move(to: NSPoint.zero)
		self.path.line(to: NSPoint(x: segmentBottomWidth, y: 0))
		self.path.line(to: NSPoint(x: segmentBottomWidth, y: dirtyRect.maxY))
		self.path.line(to: NSPoint(x: dirtyRect.maxX, y: dirtyRect.maxY))
		lineColor.setStroke()
		self.path.lineWidth = lineWidth
		self.path.stroke()
		if placementArrowhead != Placement.none {
			drawArrowhead(dirtyRect)
		}
	}
	
	func drawArrowhead(_ frame: NSRect) {
		switch placementArrowhead {
			case .end:
				self.path.move(to: NSPoint(x: frame.maxX, y: frame.maxY))
				break
			case .start:
				self.path.move(to: NSPoint.zero)
				break
			case .startAndEnd:
				self.path.move(to: NSPoint.zero)
				self.path.move(to: NSPoint(x: frame.maxX, y: frame.maxY))
				break
			case .none:
				break
		}
	}
	
	
}
