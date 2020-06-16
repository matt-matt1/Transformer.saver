//
//  YinYangView.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-16.
//  Copyright © 2020 Sam Soffes. All rights reserved.
//

import Cocoa

@IBDesignable
class YinYangView: NSView {
	
	@IBInspectable var radius: CGFloat = 50 {
		didSet {
			self.rect = NSRect(x: rect.origin.x, y: rect.origin.y, width: (self.radius*2) + self.borderWidth, height: (self.radius*2) + self.borderWidth)
		}
	}
	@IBInspectable var priFillColor: NSColor = NSColor.black {
		didSet {
			self.priFillColor.setFill()
			self.pathCircle.fill()
		}
	}
	@IBInspectable var secFillColor: NSColor = NSColor.black {
		didSet {
			self.secFillColor.setFill()
			self.pathSegment.fill()
		}
	}
	@IBInspectable var borderColor: NSColor = NSColor.gray {
		didSet {
			self.borderColor.setStroke()
			self.pathCircle.lineWidth = self.borderWidth
			self.pathCircle.stroke()
		}
	}
	@IBInspectable var borderWidth: CGFloat = 1 {
		didSet {
			self.borderColor.setStroke()
			self.pathCircle.lineWidth = self.borderWidth
			self.pathCircle.stroke()
		}
	}
	@IBInspectable var priSecDotRadius: CGFloat {
		get {
			return 10
		}
	}
	@IBInspectable var priDotFillColor: NSColor = NSColor.yellow {
		didSet {
			self.priDotFillColor.setFill()
			self.pathPriDot.fill()
		}
	}
	@IBInspectable var secDotFillColor: NSColor = NSColor.yellow {
		didSet {
			self.secDotFillColor.setFill()
			self.pathSecDot.fill()
		}
	}
	@IBInspectable var priDotBorderColor: NSColor = NSColor.black {
		didSet {
			if self.displayInnerBorder {
				self.priDotBorderColor.setStroke()
				self.pathPriDot.lineWidth = self.priDotBorderWidth
				self.pathPriDot.stroke()
			}
		}
	}
	@IBInspectable var secDotBorderColor: NSColor = NSColor.black {
		didSet {
			if self.displayInnerBorder {
				self.secDotBorderColor.setStroke()
				self.pathSecDot.lineWidth = self.secDotBorderWidth
				self.pathSecDot.stroke()
			}
		}
	}
	@IBInspectable var priDotBorderWidth: CGFloat = 1 {
		didSet {
			if self.displayInnerBorder {
				self.priDotBorderColor.setStroke()
				self.pathPriDot.lineWidth = self.priDotBorderWidth
				self.pathPriDot.stroke()
			}
		}
	}
	@IBInspectable var secDotBorderWidth: CGFloat = 1 {
		didSet {
			if self.displayInnerBorder {
				self.secDotBorderColor.setStroke()
				self.pathSecDot.lineWidth = self.secDotBorderWidth
				self.pathSecDot.stroke()
			}
		}
	}
	//	@IBInspectable var displayInnerBorder: Bool = false {
	//		didSet {
	//		}
	//	}
	@IBInspectable var displayInnerBorder: Bool {
		get {
			return false
		}
	}
	//	override var frame: NSRect {
	//		didSet {
	//			return NSRect(origin: self.frame.origin, size: CGSize(width: self.frame.width, height: self.frame.width))
	//		}
	//	}
	override var intrinsicContentSize: NSSize {
		//		return NSSize(width: frame.width, height: frame.width)
		//		return NSSize(width: 100, height: 100)
		return NSSize(width: self.radius*2, height: self.radius*2)
	}
	var pathCircle = NSBezierPath()
	var pathSegment = NSBezierPath()
	var rect = NSRect.zero
	var pathPriDot = NSBezierPath()
	var pathSecDot = NSBezierPath()
	let context = NSGraphicsContext.current?.cgContext
	
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		//		context = NSGraphicsContext.current?.cgContext
	}
	
	//	override func resizeSubviews(withOldSize oldSize: NSSize) {
	//		self.frame = NSRect(origin: frame.origin, size: CGSize(width: oldSize.width, height: oldSize.width))
	//	}
	//	override func resize(withOldSuperviewSize oldSize: NSSize) {
	//		self.frame = NSRect(origin: frame.origin, size: CGSize(width: oldSize.width, height: oldSize.width))
	//	}
	override func viewDidEndLiveResize() {
		self.radius = frame.width/2
	}
	override func layoutSubtreeIfNeeded() {
		self.radius = frame.width/2
	}
	
	
	override func draw(_ dirtyRect: NSRect) {
		context?.saveGState()
		self.radius = dirtyRect.width/2
		self.rect = NSRect(x: dirtyRect.origin.x + (borderWidth/2), y: dirtyRect.origin.y + (borderWidth/2), width: dirtyRect.width - borderWidth, height: dirtyRect.width - borderWidth)
		if let view = superview {
			view.widthAnchor.constraint(equalTo: view.heightAnchor, constant: 0).isActive = true
		}
		pathCircle = NSBezierPath(ovalIn: rect)
		applyColors()
		context?.restoreGState()
		drawSegment()
		context?.saveGState()
		drawDots()
		context?.restoreGState()
	}
	
	
	func drawSegment() {
		context?.saveGState()
		pathSegment.move(to: CGPoint(x: rect.width/2, y: rect.height/2))
		pathSegment.appendArc(withCenter: NSPoint(x: radius/2, y: rect.height/2), radius: radius/2, startAngle: 180, endAngle: 0, clockwise: true)
		pathSegment.appendArc(withCenter: CGPoint(x: 3*radius/2, y: radius), radius: radius/2, startAngle: 180, endAngle: 0, clockwise: false)
		pathSegment.appendArc(withCenter: NSPoint(x: radius, y: radius), radius: radius, startAngle: 0, endAngle: 180, clockwise: true)
		pathSegment.line(to: NSPoint(x: 0, y: rect.height/2))
		pathSegment.close()
		applySegmentColors()
		context?.restoreGState()
	}
	
	
	func drawDots() {
		//		pathPriDot.move(to: NSPoint(x: radius/2, y: rect.height/2))
		pathPriDot = NSBezierPath(ovalIn: NSRect(x: (radius/2) - priSecDotRadius, y: (rect.height/2) - priSecDotRadius, width: priSecDotRadius*2, height: priSecDotRadius*2))
		priDotFillColor.setFill()
		pathPriDot.fill()
		priDotBorderColor.setStroke()
		pathPriDot.lineWidth = priDotBorderWidth
		pathPriDot.stroke()
		
		pathSecDot = NSBezierPath(ovalIn: NSRect(x: (3*radius/2) - priSecDotRadius, y: (rect.height/2) - priSecDotRadius, width: priSecDotRadius*2, height: priSecDotRadius*2))
		secDotFillColor.setFill()
		pathSecDot.fill()
		secDotBorderColor.setStroke()
		pathSecDot.lineWidth = secDotBorderWidth
		pathSecDot.stroke()
	}
	
	
	func applyColors() {
		priFillColor.setFill()
		pathCircle.fill()
		borderColor.setStroke()
		pathCircle.lineWidth = borderWidth
		pathCircle.stroke()
	}
	
	
	func applySegmentColors() {
		secFillColor.setFill()
		pathSegment.fill()
		if displayInnerBorder {
			borderColor.setStroke()
			pathSegment.lineWidth = borderWidth
			pathSegment.stroke()
		}
	}
	
	
	override func prepareForInterfaceBuilder() {
		applyColors()
		applySegmentColors()
	}
	
	
	override func awakeFromNib() {
		applyColors()
		applySegmentColors()
	}
	
	
}
