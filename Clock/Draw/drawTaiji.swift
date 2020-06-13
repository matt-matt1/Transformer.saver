//
//  drawTaiji.swift
//  Pong
//
//  Created by Yuma Technical Inc. on 2020-06-02.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import Cocoa


extension FalunView {
	
	func drawTaiji(center: CGPoint, size: CGSize, dot1Color: NSColor = NSColor.white, dot2Color: NSColor = NSColor.white, primaryFillColor: NSColor = NSColor.clear, primaryStrokeColor: NSColor = NSColor.clear, primaryStrokeWidth: CGFloat = 0, segmentStrokeColor: NSColor = NSColor.clear, segmentFillColor: NSColor = NSColor.clear) {
//		log.stringValue += "\n Taiji center: \(center), size: \(size)"
		let taiji = NSBezierPath(roundedRect: NSRect(origin: center, size: size), xRadius: size.width/2, yRadius: size.height/2)
		primaryFillColor.setFill()
		taiji.fill()
		primaryStrokeColor.setStroke()
		taiji.lineWidth = primaryStrokeWidth
		taiji.stroke()
		
		let curve1BeginAngle: CGFloat = 180
		let curve1EndAngle: CGFloat = 0
		let curve1Clockwise = true
		let curve1Center = NSPoint(x: center.x + size.width/4, y: center.y + size.height/2)
		let curve1Radius = size.width/4
		
		let curve2BeginAngle: CGFloat = 180
		let curve2EndAngle: CGFloat = 0
		let curve2Clockwise = false
		let curve2Center = CGPoint(x: center.x + 3*size.width/4, y: center.y + size.height/2)
		let curve2Radius = size.width/4
		
		let curve3BeginAngle: CGFloat = 0
		let curve3EndAngle: CGFloat = 180
		let curve3Clockwise = true
		let curve3Center = NSPoint(x: center.x + size.width/2, y: center.y + size.height/2)
		let curve3Radius = size.width/2
		
		let dotRadius = size.width/30
		//		let dot1Orgin = CGPoint(x: frame.origin.x + (frame.width/4) - dotRadius, y: (frame.height/2) - dotRadius)
		//		let dot2Orgin = CGPoint(x: frame.origin.x + (3*frame.width/4) - dotRadius, y: (frame.height/2) - dotRadius)
		
		let path = NSBezierPath()
//		path.move(to: CGPoint(x: center.x + self.radius, y: center.y + self.radius))
		path.move(to: CGPoint(x: center.x + size.width, y: center.y + size.height))
		path.appendArc(withCenter: curve1Center, radius: curve1Radius, startAngle: curve1BeginAngle, endAngle: curve1EndAngle, clockwise: curve1Clockwise)
		path.appendArc(withCenter: curve2Center, radius: curve2Radius, startAngle: curve2BeginAngle, endAngle: curve2EndAngle, clockwise: curve2Clockwise)
		path.appendArc(withCenter: curve3Center, radius: curve3Radius, startAngle: curve3BeginAngle, endAngle: curve3EndAngle, clockwise: curve3Clockwise)
		
		segmentFillColor.setFill()
		NSColor.red.setFill()
		path.fill()
		segmentStrokeColor.setStroke()
		path.lineWidth = primaryStrokeWidth
		path.stroke()
		
		let dot1View = NSView()
		dot1View.wantsLayer = true
		dot1View.layer?.cornerRadius = dotRadius
		dot1View.layer?.backgroundColor = dot1Color.cgColor
		addSubview(dot1View)
		dot1View.translatesAutoresizingMaskIntoConstraints = false
		//		let dot2 = NSBezierPath(roundedRect: NSRect(x: dot2Orgin.x, y: dot2Orgin.y, width: dotRadius*2, height: dotRadius*2), xRadius: dotRadius, yRadius: dotRadius)
		//		dot2Color.setFill()
		//		dot2.fill()
		let dot2View = NSView()
		dot2View.wantsLayer = true
		dot2View.layer?.cornerRadius = dotRadius
		dot2View.layer?.backgroundColor = dot2Color.cgColor
		addSubview(dot2View)
		dot2View.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			dot1View.leftAnchor.constraint(equalTo: self.leftAnchor, constant: center.x+87-curve1Radius),
			dot1View.topAnchor.constraint(equalTo: self.topAnchor, constant: 986-center.y),
			//			dot1View.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: /*-center.x*/-curve1Radius),
			//			dot1View.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0/*center.y*/),
			dot1View.widthAnchor.constraint(equalToConstant: dotRadius*2),
			dot1View.heightAnchor.constraint(equalToConstant: dotRadius*2),
			
			dot2View.leftAnchor.constraint(equalTo: self.leftAnchor, constant: center.x+87+curve1Radius),
			dot2View.topAnchor.constraint(equalTo: self.topAnchor, constant: 986-center.y),
			//			dot2View.centerXAnchor.constraint(equalTo: self.centerXAnchor, constant: /*-center.x+*/curve1Radius),
			//			dot2View.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: 0/*center.y*/),
			dot2View.widthAnchor.constraint(equalToConstant: dotRadius*2),
			dot2View.heightAnchor.constraint(equalToConstant: dotRadius*2),
		])
	}
	
	
	func draw4Tajias(_ radius: CGFloat, dotRadius: CGFloat) {
		let dim: CGFloat = 191//self.baseRadius/2
		//	Top-Left
		/*let taijiTopLeft = Taiji()
		//		self.taijiTopLeft.debug = true
		taijiTopLeft.position = CGPoint(x: 45, y: 257)	//	**	initial position	**
		//		let centerTaijiTopLeft = CGPoint(x: posCenter.x - (self.base.frame.width/8), y: posCenter.y - (self.base.frame.width/8))
		//		self.taijiTopLeft.position = CGPoint(x: centerTaijiTopLeft.x /*- (3*self.base.frame.width/8)*//*+ (self.centerDisc.frame.width/2)*/, y: centerTaijiTopLeft.y + (3*self.base.frame.width/8)/* - (self.centerDisc.frame.width)*/)
		//		self.taijiTopLeft.position = CGPoint(x: posCenter.x - (2*self.base.frame.width/3) - (self.centerDisc.frame.width/4) self.largeSwastika.frame.origin.x - (self.centerDisc.frame.width/2) + (insideHalf/8)/*posCenter.x - insideHalf self.base.frame.origin.x - (self.centerDisc.frame.width/4)*/, y: self.largeSwastika.frame.origin.y + self.largeSwastika.frame.height - (insideHalf/8)/*posCenter.y + insideHalf self.base.frame.origin.y + (self.base.frame.width/2)*/)
		taijiTopLeft.segmentFillColor = NSColor.black
		taijiTopLeft.primaryFillColor = NSColor.red
		base.addSubview(self.taijiTopLeft)
		taijiTopLeft.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
		self.taijiTopLeft.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: -106),
		self.taijiTopLeft.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: -106),
		//taiji center ~ 3 * self.base.frame.width / 8
		self.taijiTopLeft.widthAnchor.constraint(equalToConstant: self.radius/2),
		self.taijiTopLeft.heightAnchor.constraint(equalToConstant: self.radius/2),
		//			self.taijiTopLeft.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: 0),
		//			self.taijiTopLeft.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: 0),
		])*/
		//		drawTaiji(rect: NSRect(x: basePosition.x - radius - dim, y: basePosition.y - radius + dim, width: radius*2, height: radius*2), position: CGPoint.zero/*(x: frame.width/3, y: frame.height*2/3)*/, primaryFillColor: NSColor.red, primaryStrokeColor: NSColor.clear, primaryStrokeWidth: 0, segmentStrokeColor: NSColor.clear, segmentFillColor: NSColor.black, dot1Color: NSColor.white, dot2Color: NSColor.white)
		drawTaiji(center: CGPoint(x: basePosition.x - radius - dim, y: basePosition.y - radius + dim), size: CGSize(width: radius*2, height: radius*2), dot1Color: NSColor.white, dot2Color: NSColor.white, primaryFillColor: NSColor.black, segmentFillColor: NSColor.red)
//		log.stringValue += "\n basePosition:\(basePosition)"
//		let center = CGPoint(x: dim - radius - 30, y: baseRadius - radius + dim + 20)
//		let size = CGSize(width: radius*2, height: radius*2)
//		log.stringValue += "\n Taiji \(center), \(size)"
//		drawTaiji(center: center, size: size, dot1Color: NSColor.white, dot2Color: NSColor.white, primaryFillColor: NSColor.black, segmentFillColor: NSColor.red)

		//	Top-Right
		/*self.taijiTopRight = Taiji()//(frame: CGRect(x: 0, y: 0, width: radius, height: radius))
		//		self.taijiTopRight.debug = true
		self.taijiTopRight.position = CGPoint(x: 257, y: 256)
		self.taijiTopRight.segmentFillColor = NSColor.blue
		self.taijiTopRight.primaryFillColor = NSColor.red
		self.taijiTopRight.setAnchorPoint(anchorPoint: CGPoint(x: 0.5, y: 0.5))
		self.base.addSubview(self.taijiTopRight)
		self.taijiTopRight.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
		self.taijiTopRight.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: 106),
		self.taijiTopRight.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: -106),
		self.taijiTopRight.widthAnchor.constraint(equalToConstant: self.radius/2),
		self.taijiTopRight.heightAnchor.constraint(equalToConstant: self.radius/2),
		//			self.taijiTopRight.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: 0),
		//			self.taijiTopRight.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: 0),
		])*/
		drawTaiji(center: CGPoint(x: basePosition.x - radius + dim, y: basePosition.y - radius + dim), size: CGSize(width: radius*2, height: radius*2), dot1Color: NSColor.white, dot2Color: NSColor.white, primaryFillColor: NSColor.blue, segmentFillColor: NSColor.red)
		//		drawTaiji(rect: NSRect(x: basePosition.x - radius + dim, y: basePosition.y - radius + dim, width: radius*2, height: radius*2), position: CGPoint(x: 257, y: 256), primaryFillColor: NSColor.red, primaryStrokeColor: NSColor.clear, primaryStrokeWidth: 0, segmentStrokeColor: NSColor.clear, segmentFillColor: NSColor.blue, dot1Color: NSColor.white, dot2Color: NSColor.white)
		
		//	Bottom-Left
		/*self.taijiBottomLeft = Taiji()//(frame: CGRect(x: 0, y: 0, width: radius, height: radius))
		//		self.taijiBottomLeft.debug = true
		self.taijiBottomLeft.position = CGPoint(x: 45, y: 43)
		self.taijiBottomLeft.segmentFillColor = NSColor.blue
		self.taijiBottomLeft.primaryFillColor = NSColor.red
		self.base.addSubview(self.taijiBottomLeft)
		self.taijiBottomLeft.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
		//			self.taijiTopLeft.centerXAnchor.constraint(equalTo: self.centerDisc.centerXAnchor, constant: cos(3 * self.centerDisc.frame.width / 8)),
		//			self.taijiTopLeft.centerYAnchor.constraint(equalTo: self.centerDisc.centerYAnchor, constant: sin(3 * self.centerDisc.frame.width / 8)),
		//taiji center ~ 3 * self.base.frame.width / 8
		self.taijiBottomLeft.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: -106),
		self.taijiBottomLeft.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: 106),
		self.taijiBottomLeft.widthAnchor.constraint(equalToConstant: self.radius/2),
		self.taijiBottomLeft.heightAnchor.constraint(equalToConstant: self.radius/2)
		])*/
		drawTaiji(center: CGPoint(x: basePosition.x - radius - dim, y: basePosition.y - radius - dim), size: CGSize(width: radius*2, height: radius*2), dot1Color: NSColor.white, dot2Color: NSColor.white, primaryFillColor: NSColor.blue, segmentFillColor: NSColor.red)
		//		drawTaiji(rect: NSRect(x: basePosition.x - radius - dim, y: basePosition.y - radius - dim, width: radius*2, height: radius*2), position: CGPoint(x: 45, y: 43), primaryFillColor: NSColor.red, primaryStrokeColor: NSColor.clear, primaryStrokeWidth: 0, segmentStrokeColor: NSColor.clear, segmentFillColor: NSColor.blue, dot1Color: NSColor.white, dot2Color: NSColor.white)
		
		//	Bottom-Right
		//		drawTaijiBackground(object: self.taijiBottomRight, origin: CGPoint(x: 520, y: 180), color: NSColor.black)
		/*self.taijiBottomRight = Taiji()//(frame: CGRect(x: 0, y: 0, width: radius, height: radius))
		//		self.taijiBottomRight.debug = true
		self.taijiBottomRight.position = CGPoint(x: 257, y: 44)
		self.taijiBottomRight.segmentFillColor = NSColor.black
		self.taijiBottomRight.primaryFillColor = NSColor.red
		self.base.addSubview(self.taijiBottomRight)
		self.taijiBottomRight.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
		//			self.taijiTopLeft.centerXAnchor.constraint(equalTo: self.centerDisc.centerXAnchor, constant: cos(3 * self.centerDisc.frame.width / 8)),
		//			self.taijiTopLeft.centerYAnchor.constraint(equalTo: self.centerDisc.centerYAnchor, constant: sin(3 * self.centerDisc.frame.width / 8)),
		//taiji center ~ 3 * self.base.frame.width / 8
		self.taijiBottomRight.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: 106),
		self.taijiBottomRight.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: 106),
		self.taijiBottomRight.widthAnchor.constraint(equalToConstant: self.radius/2),
		self.taijiBottomRight.heightAnchor.constraint(equalToConstant: self.radius/2),
		//			self.taijiBottomRight.centerYAnchor.constraint(equalTo: self.base.centerYAnchor, constant: 0),
		//			self.taijiBottomRight.centerXAnchor.constraint(equalTo: self.base.centerXAnchor, constant: 0),
		])*/
		drawTaiji(center: CGPoint(x: basePosition.x - radius + dim, y: basePosition.y - radius - dim), size: CGSize(width: radius*2, height: radius*2), dot1Color: NSColor.white, dot2Color: NSColor.white, primaryFillColor: NSColor.black, segmentFillColor: NSColor.red)
		//		drawTaiji(rect: NSRect(x: basePosition.x - radius + dim, y: basePosition.y - radius - dim, width: radius*2, height: radius*2), position: CGPoint(x: 257, y: 44), primaryFillColor: NSColor.red, primaryStrokeColor: NSColor.clear, primaryStrokeWidth: 0, segmentStrokeColor: NSColor.clear, segmentFillColor: NSColor.black, dot1Color: NSColor.white, dot2Color: NSColor.white)
		//		log.stringValue += "\n top-right taiji inner dot center = \(inner4DotPoint.x) x \(inner4DotPoint.y)"
	}
	

}
