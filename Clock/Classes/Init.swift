//
//  Init.swift
//  Pong
//
//  Created by Yuma Technical Inc. on 2020-06-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa
import SpriteKit


extension FalunView {
	
	func setup() {
		//		let load = NSTextField()
		//		load.isBezeled = false
		//		load.textColor = NSColor.white
		//		load.stringValue = "Loading ..."
		//		addSubview(load)
		
		// Set up animation duration
//		animationTimeInterval = 1.0 / 60.0
		
		autoresizingMask = [NSView.AutoresizingMask.width, NSView.AutoresizingMask.height]
		autoresizesSubviews = true
		nextResponder = nil
		NSEvent.addLocalMonitorForEvents(matching: .keyDown) { _ in return nil; }
		NSEvent.addLocalMonitorForEvents(matching: .keyUp) { _ in return nil; }
		
		NotificationCenter.default.addObserver(self, selector: #selector(optionsFalunDidChange(_:)),
											   name: .PreferencesDidChange, object: nil)
		optionsFalunDidChange(nil)
		
		initValues()
		//		load.removeFromSuperview()
//		sceneView.wantsLayer = true // This is very very important!!!!!!
//		sceneView.translatesAutoresizingMaskIntoConstraints = false
//		addSubview(sceneView)
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "H:|[view]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterY, metrics: nil, views: ["view": sceneView]))
//		addConstraints(NSLayoutConstraint.constraints(withVisualFormat: "V:|[view]|", options: NSLayoutConstraint.FormatOptions.alignAllCenterX, metrics: nil, views: ["view": sceneView]))
		drawBackground(Color.bgColor)
//		if startedFromTestApp { startAnimation() }
//		if hasConfigureSheet {
//			let configureSheet = ConfigureSheet()
//			configureSheet.viewDidLoad()
//		}
	}
	
	func initValues() {
//		log.stringValue = String(format: "screen size = %f x %f", NSScreen.main?.frame.width as! CVarArg, NSScreen.main?.frame.height as! CVarArg)
//		log.stringValue += String(format: "\n initial position = %f x %f", basePosition.x, basePosition.y)
//		addSubview(log)
		for _ in 0 ..< Int(Prefs.shared.numStars) {
			let size = CGFloat.random(in: 0 ..< CGFloat(Prefs.shared.maxStarSize))//SSRandomFloatBetween(0, maxStarSize)
			let point = CGPoint(x: CGFloat.random(in: 0..<frame.width), y: CGFloat.random(in: 0..<frame.height))//CGSize(width: CGFloat.random(in: 0..<size), height: CGFloat.random(in: 0..<size))//SSRandomPointForSizeWithinRect(NSSize(width: size, height: size), frame)
			let frame = NSRect(x: point.x, y: point.y, width: size, height: size)
			let color = NSColor(calibratedRed: CGFloat.random(in: 0..<255)/255.0/*SSRandomFloatBetween(0, 255)/255*/,
								green: CGFloat.random(in: 0..<255)/255.0/*SSRandomFloatBetween(0, 255)/255*/,
								blue: CGFloat.random(in: 0..<255)/255.0/*SSRandomFloatBetween(0, 255)/255*/, alpha: 1.0)
			let alpha: CGFloat = CGFloat.random(in: 0..<1)//SSRandomFloatBetween(0, 1)
			stars.append(Star(frame: frame, alpha: alpha, color: color))
			//			log.stringValue += "\n star \(frame)"
		}
		basePosition = CGPoint(x: frame.width / 2, y: frame.height / 2)
		//		ballVelocity = initialVelocity()
	}

	
	@objc /*private*/ func optionsFalunDidChange(_ notification: NSNotification?) {
//		let preferences = (notification?.object as? Preferences) ?? Preferences()
//		let view = preferences.model.init(frame: bounds)
//		view.styleName = preferences.styleName
//		clockView = view
	}
	/*
	override func startAnimation() {
		if !startedFromTestApp { super.startAnimation() }
//		drawBackground(bgColor)
		
		//		createWebView()
//		if let webView = webView {
//			addSubview(webView)
//			//			addSubview(EventSinkView.init())
//
//			let color = NSColor(calibratedWhite: 0.0, alpha: 1.0)
//			if let layer = webView.layer {
//				layer.backgroundColor = color.cgColor
//			}
//		}
		//		loadNethack()
//		sceneView.presentScene(MyScene(size: sceneView.bounds.size), transition: SKTransition())
	}
	
	override func stopAnimation() {
		super.stopAnimation()
//		if let webView = webView {
//			webView.removeFromSuperview()
//			webView.stopLoading()
//		}
//		webView = nil
	}
	*/
	
	func innerSquareLengthFitsOuterCircle(radius: Float) -> Float {
		let diameter = 2 * radius
		let areaDiagonal = diameter * diameter
		let areaSide = areaDiagonal / 2
		return sqrt(areaSide)
	}
	
	func drawCircle(center: CGPoint, radius: CGFloat, fillColor: NSColor = NSColor.white, strokeWidth: CGFloat = 0, strokeColor: NSColor = NSColor.clear, shadowColor: NSColor = NSColor.clear, shadowOpacity: CGFloat = 0.75, shadowOffset: NSSize = NSMakeSize(0, 0), shadowBlurRadius: CGFloat = 20) {
//		self.base = NSView(frame: NSRect(x: center.x - radius, y: center.y - radius, width: radius*2, height: radius*2))
		let context = NSGraphicsContext.current?.cgContext
//		self.base.wantsLayer = true
		let path = NSBezierPath(roundedRect: NSRect(x: center.x - radius, y: center.y - radius, width: radius*2, height: radius*2), xRadius: radius, yRadius: radius)
		context?.saveGState()
		context?.setShadow(offset: shadowOffset, blur: shadowBlurRadius, color: shadowColor.cgColor)
		fillColor.setFill()
		path.fill()
		strokeColor.setStroke()
		path.lineWidth = strokeWidth
		path.stroke()
		context?.restoreGState()
//		guard let layer = self.base.layer else {
//			print("cannot get layer of base")
//			log.stringValue += "\n cannot get layer of base"
//			return
//		}
//		layer.frame = self.base.frame
////		layer.position = posCenter
//		layer.position = center
//		layer.cornerRadius = radius
//		layer.backgroundColor = fillColor.cgColor
//		layer.borderWidth = strokeWidth
//		layer.borderColor = strokeColor.cgColor
//		let shadow = NSShadow()
//		shadow.shadowColor = shadowColor
//		shadow.shadowOffset = shadowOffset
//		shadow.shadowBlurRadius = shadowBlurRadius
//		self.base.shadow = shadow
//		addSubview(self.base)
	}
	


}
