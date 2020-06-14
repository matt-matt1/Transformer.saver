//
//  FalunStyle.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-11.
//  Copyright © 2020 Sam Soffes. All rights reserved.
//

import AppKit


protocol FalunStyle/*: CustomStringConvertible*/ {
//	var rawValue: String { get }
	
	static var backgroundColor: NSColor { get }
	static var displayRays: Bool { get }
	static var numStars: Int { get }
	static var maxStarSize: Float { get }
	static var thesholdStarSize: Int { get }
	//	associatedtype SomeType: RawRepresentable //where SomeType.RawValue: StringProtocol
	static var starColorSchemes: [String] { get }
	static var starColorScheme: String { get }
	static var baseRadius: Float { get }
	static var baseFillColor: NSColor { get }
	static var baseStrokeWidth: Float { get }
	static var baseStrokeColor: NSColor { get }
	static var baseShadow: Bool { get }
	static var centerDiscRadius: Float { get }
	static var centerDiscFill: NSColor { get }
	static var centerDiscStrokeWidth: Float { get }
	static var centerDiscStroke: NSColor { get }
	static var centerSymbolCornerRadius: Float { get }
	static var centerSymbolFill: NSColor { get }
	static var centerSymbolStrokeWidth: Float { get }
	static var centerSymbolStroke: NSColor { get }
	static var centerSymbolThickness: Float { get }
	static var curvedSymbolRadius: Float { get }
	static var curvedSymbolThickness: Float { get }
	static var curvedSymbolFill: NSColor { get }
	static var curvedSymbolStrokeWidth: Float { get }
	static var curvedSymbolStroke: NSColor { get }
	static var yySymbolRadius: Float { get }
	static var yySymbolStrokeWidth: Float { get }
	static var yySymbolStroke: NSColor { get }
	static var yyPriFill: NSColor { get }
	static var yySecFill: NSColor { get }
	static var yyDotRadius: Float { get }
	static var yyPriDotFill: NSColor { get }
	static var yyPriDotStrokeWidth: Float { get }
	static var yyPriDotStroke: NSColor { get }
	static var yySecDotFill: NSColor { get }
	static var yySecDotStrokeWidth: Float { get }
	static var yySecDotStroke: NSColor { get }

/*
	var backgroundColor: NSColor { get }
	var displayRays: Bool { get }
	var numStars: Float { get }
	var maxStarSize: Float { get }
	var thesholdStarSize: Float { get }
//	associatedtype SomeType: RawRepresentable //where SomeType.RawValue: StringProtocol
	var starColorSchemes: [String] { get }
	var starColorScheme: String { get }
	var baseRadius: Float { get }
	var baseFillColor: NSColor { get }
	var baseStrokeWidth: Float { get }
	var baseStrokeColor: NSColor { get }
	var baseShadow: Bool { get }
	var centerDiscRadius: Float { get }
	var centerDiscFill: NSColor { get }
	var centerDiscStrokeWidth: Float { get }
	var centerDiscStroke: NSColor { get }
	var centerSymbolCornerRadius: Float { get }
	var centerSymbolFill: NSColor { get }
	var centerSymbolStrokeWidth: Float { get }
	var centerSymbolStroke: NSColor { get }
	var curvedSymbolThickness: Float { get }
	var curvedSymbolFill: NSColor { get }
	var curvedSymbolStrokeWidth: Float { get }
	var curvedSymbolStroke: NSColor { get }
	var yySymbolRadius: Float { get }
	var yySymbolStrokeWidth: Float { get }
	var yySymbolStroke: NSColor { get }
	var yyPriFill: NSColor { get }
	var yySecFill: NSColor { get }
	var yyDotRadius: Float { get }
	var yyPriDotFill: NSColor { get }
	var yyPriDotStrokeWidth: Float { get }
	var yyPriDotStroke: NSColor { get }
	var yySecDotFill: NSColor { get }
	var yySecDotStrokeWidth: Float { get }
	var yySecDotStroke: NSColor { get }
*/
	
//	var backgroundColor: NSColor { get }
//	var faceColor: NSColor { get }
//	var hourColor: NSColor { get }
//	var minuteColor: NSColor { get }
//	var secondColor: NSColor { get }
//	var logoColor: NSColor { get }
	
//	static var `default`: FalunStyle { get }
}


extension FalunStyle {
	
/*
	var backgroundColor: NSColor {
		return NSColor.purple
	}
	var displayRays: Bool {
		return true
	}
	var numStars: Float {
		return 400
	}
	var maxStarSize: Float {
		return 20
	}
	var thesholdStarSize: Float {
		return 6
	}
	var colorSchemeStar: String {
		return "random"
	}
	var baseRadius: Float {
		return 360
	}
	var baseFillColor: NSColor {
		return NSColor.orange
	}
	var baseStrokeWidth: Float {
		return 0
	}
	var baseStrokeColor: NSColor {
		return NSColor.clear
	}
	var baseShadow: Bool {
		return true
	}
	var centerDiscRadius: Float {
		return 0.5
	}
	var centerDiscFill: NSColor {
		return NSColor.red
	}
	var centerDiscStrokeWidth: Float {
		return 0
	}
	var centerDiscStroke: NSColor {
		return NSColor.clear
	}
	var centerSymbolCornerRadius: Float {
		0.15
	}
	var centerSymbolFill: NSColor {
		return NSColor.yellow
	}
	var centerSymbolStrokeWidth: Float {
		return 0
	}
	var centerSymbolStroke: NSColor {
		return NSColor.clear
	}
	var curvedSymbolThickness: Float {
		return 10
	}
	var curvedSymbolFill: NSColor {
		return NSColor.yellow
	}
	var curvedSymbolStrokeWidth: Float {
		return 0
	}
	var curvedSymbolStroke: NSColor {
		return NSColor.clear
	}
	var yySymbolRadius: Float {
		return 0.2
	}
	var yySymbolStrokeWidth: Float {
		return 0
	}
	var yySymbolStroke: NSColor {
		return NSColor.clear
	}
	var yyPriFill: NSColor {
		return NSColor.black
	}
	var yySecFill: NSColor {
		return NSColor.red
	}
	var yyDotRadius: Float {
		return 0.1
	}
	var yyPriDotFill: NSColor {
		return NSColor.white
	}
	var yyPriDotStrokeWidth: Float {
		return 0
	}
	var yyPriDotStroke: NSColor {
		return NSColor.clear
	}
	var yySecDotFill: NSColor {
		return NSColor.white
	}
	var yySecDotStrokeWidth: Float {
		return 0
	}
	var yySecDotStroke: NSColor {
		return NSColor.clear
	}

//	var backgroundColor: NSColor {
//		return Color.darkBackground
//	}
//
//	var faceColor: NSColor {
//		return backgroundColor
//	}
//
//	var hourColor: NSColor {
//		return NSColor(white: 0.75, alpha: 1)
//	}
//
//	var minuteColor: NSColor {
//		return Color.white
//	}
//
//	var secondColor: NSColor {
//		return Color.yellow
//	}
//
//	var logoColor: NSColor {
//		return minuteColor
//	}

*/
}

