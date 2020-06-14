//
//  custom.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-12.
//  Copyright © 2020 Sam Soffes. All rights reserved.
//

import Cocoa

class custom: FalunView {
	
	var name: String = "custom"

	struct setting: FalunStyle {
		static var backgroundColor: NSColor = NSColor.purple
		static var displayRays: Bool = true
		static var numStars: Int = 400
		static var maxStarSize: Float = 20
		static var thesholdStarSize: Int = 6
		static var starColorSchemes: [String] = ["All White", "All Yellow", "All Pale Blue", "random", "Blues"]
		static var starColorScheme: String = "random"
		static var baseRadius: Float = 360
		static var baseFillColor: NSColor = NSColor.orange
		static var baseStrokeWidth: Float = 0
		static var baseStrokeColor: NSColor = NSColor.clear
		static var baseShadow: Bool = true
		static var centerDiscRadius: Float = 0.5
		static var centerDiscFill: NSColor = NSColor.red
		static var centerDiscStrokeWidth: Float = 0
		static var centerDiscStroke: NSColor = NSColor.clear
		static var centerSymbolCornerRadius: Float = 0.15
		static var centerSymbolFill: NSColor = NSColor.yellow
		static var centerSymbolStrokeWidth: Float = 0
		static var centerSymbolStroke: NSColor = NSColor.clear
		static var centerSymbolThickness: Float = 0.125
		static var curvedSymbolRadius: Float = 0.28
		static var curvedSymbolThickness: Float = 10
		static var curvedSymbolFill: NSColor = NSColor.yellow
		static var curvedSymbolStrokeWidth: Float = 0
		static var curvedSymbolStroke: NSColor = NSColor.clear
		static var yySymbolRadius: Float = 0.2
		static var yySymbolStrokeWidth: Float = 0
		static var yySymbolStroke: NSColor = NSColor.clear
		static var yyPriFill: NSColor = NSColor.black
		static var yySecFill: NSColor = NSColor.red
		static var yyDotRadius: Float = 0.1
		static var yyPriDotFill: NSColor = NSColor.white
		static var yyPriDotStrokeWidth: Float = 0
		static var yyPriDotStroke: NSColor = NSColor.clear
		static var yySecDotFill: NSColor = NSColor.white
		static var yySecDotStrokeWidth: Float = 0
		static var yySecDotStroke: NSColor = NSColor.clear
	}

	
//    override func draw(_ dirtyRect: NSRect) {
//        super.draw(dirtyRect)
//
//        // Drawing code here.
//    }
    
}
