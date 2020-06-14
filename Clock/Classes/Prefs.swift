//
//  Prefs.swift
//  Clock
//
//  Created by Yuma Technical Inc. on 2020-06-11.
//  Copyright © 2020 Yuma Technical Inc. All rights reserved.
//

import AppKit
import ScreenSaver

extension Notification.Name {
	static let OptionsDidChange = Notification.Name(rawValue: "FalunOptionsDidChangeNotification")
//	static let ModelDidChange = Notification.Name(rawValue: "FalunModelDidChangeNotification")
}

final class Prefs: NSObject {
	
	// MARK: - Types
	
	private enum DefaultsKey: String {
		case scheme = "FalunScheme"
		case backgroundColor = "backgroundColor"
		case displayRays = "Falun_displayRays"
		case numStars = "Falun_numStars"
		case maxStarSize = "Falun_maxStarSize"
		case thesholdStarSize = "Falun_thesholdStarSize"
		case starColorScheme = "Falun_starColorScheme"
		case baseRadius = "Falun_baseRadius"
		case baseFillColor = "Falun_baseFillColor"
		case baseStrokeWidth = "Falun_baseStrokeWidth"
		case baseStrokeColor = "Falun_baseStrokeColor"
		case baseShadow = "Falun_baseShadow"
		case centerDiscRadius = "Falun_centerDiscRadius"
		case centerDiscFill = "Falun_centerDiscFill"
		case centerDiscStrokeWidth = "Falun_centerDiscStrokeWidth"
		case centerDiscStroke = "Falun_centerDiscStroke"
		case centerSymbolCornerRadius = "Falun_centerSymbolCornerRadius"
		case centerSymbolFill = "Falun_centerSymbolFill"
		case centerSymbolStrokeWidth = "Falun_centerSymbolStrokeWidth"
		case centerSymbolStroke = "Falun_centerSymbolStroke"
		case centerSymbolThickness = "Falun_centerSymbolThickness"
		case curvedSymbolRadius = "Falun_curvedSymbolRadius"
		case curvedSymbolThickness = "Falun_curvedSymbolThickness"
		case curvedSymbolFill = "Falun_curvedSymbolFill"
		case curvedSymbolStrokeWidth = "Falun_curvedSymbolStrokeWidth"
		case curvedSymbolStroke = "Falun_curvedSymbolStroke"
		case yySymbolRadius = "Falun_yySymbolRadius"
		case yySymbolStrokeWidth = "Falun_yySymbolStrokeWidth"
		case yySymbolStroke = "Falun_yySymbolStroke"
		case yyPriFill = "Falun_yyPriFill"
		case yySecFill = "Falun_yySecFill"
		case yyDotRadius = "Falun_yyDotRadius"
		case yyPriDotFill = "Falun_yyPriDotFill"
		case yyPriDotStrokeWidth = "Falun_yyPriDotStrokeWidth"
		case yyPriDotStroke = "Falun_yyPriDotStroke"
		case yySecDotFill = "Falun_yySecDotFill"
		case yySecDotStrokeWidth = "Falun_yySecDotStrokeWidth"
		case yySecDotStroke = "Falun_yySecDotStroke"
		
		var key: String {
			return rawValue
		}
	}
	
	// MARK: - Properties
	
	static let shared = Prefs()
	
	/*private*/ let defaults: UserDefaults = ScreenSaverDefaults(
		forModuleWithName: Bundle(for: Prefs.self).bundleIdentifier!)!
	
	/*private*/ let schemes = [
//		"null"
		Vibrant.self,
		Cyan.self,
		custom.self
	]
	/*private*/ let defaultScheme = Vibrant.self
	/*private*/ let defaultSchemeName = "Vibrant"
	var scheme: FalunView.Type {
		return schemes.first { $0.schemeName == schemeName } ?? defaultScheme
	}
	@objc var schemeName: String {
		get {
			return defaults.string(forKey: DefaultsKey.scheme.key) ?? defaultScheme.schemeName
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.scheme.key)
			save()
			NotificationCenter.default.post(name: .ModelDidChange, object: scheme)
		}
	}
	var schemeNames: [String] {
		return ["Vibrant",
			"Cyan",
			"custom"]
	}

	var starSchemes: [FalunView.ColorSchemeStar] {
		return scheme.ColorSchemeStar.allCases
	}

	
	var backgroundColor: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.backgroundColor.key) ?? defaultScheme.setting.backgroundColor
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.backgroundColor.key)
			save()
		}
	}
	var displayRays: Bool {
		get {
			return defaults.bool(forKey: DefaultsKey.displayRays.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.displayRays.key)
			save()
		}
	}
	var numStars: Int {
		get {
			return defaults.integer(forKey: DefaultsKey.numStars.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.numStars.key)
			save()
		}
	}
	var maxStarSize: Float {
		get {
			return defaults.float(forKey: DefaultsKey.maxStarSize.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.maxStarSize.key)
			save()
		}
	}
	var thesholdStarSize: Int {
		get {
			return defaults.integer(forKey: DefaultsKey.thesholdStarSize.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.thesholdStarSize.key)
			save()
		}
	}
	var starColorScheme: String {
		get {
			return defaults.string(forKey: DefaultsKey.starColorScheme.key) ?? defaultScheme.setting.starColorScheme //defaultScheme.Style.default.starColorScheme
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.starColorScheme.key)
			save()
		}
	}
	var baseRadius: Float {
		get {
			return defaults.float(forKey: DefaultsKey.baseRadius.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.baseRadius.key)
			save()
		}
	}
	var baseFillColor: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.baseFillColor.key) ?? defaultScheme.setting.baseFillColor
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.baseFillColor.key)
			save()
		}
	}
	var baseStrokeWidth: Float {
		get {
			return defaults.float(forKey: DefaultsKey.baseStrokeWidth.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.baseStrokeWidth.key)
			save()
		}
	}
	var baseStrokeColor: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.baseStrokeColor.key) ?? defaultScheme.setting.baseStrokeColor
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.baseStrokeColor.key)
			save()
		}
	}
	var baseShadow: Bool {
		get {
			return defaults.bool(forKey: DefaultsKey.baseShadow.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.baseShadow.key)
			save()
		}
	}
	var centerDiscRadius: Float {
		get {
			return defaults.float(forKey: DefaultsKey.centerDiscRadius.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerDiscRadius.key)
			save()
		}
	}
	var centerDiscFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.centerDiscFill.key) ?? defaultScheme.setting.centerDiscFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerDiscFill.key)
			save()
		}
	}
	var centerDiscStrokeWidth: Float {
		get {
			return defaults.float(forKey: DefaultsKey.centerDiscStrokeWidth.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerDiscStrokeWidth.key)
			save()
		}
	}
	var centerDiscStroke: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.centerDiscStroke.key) ?? defaultScheme.setting.centerDiscStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerDiscStroke.key)
			save()
		}
	}
	var centerSymbolCornerRadius: Float {
		get {
			return defaults.float(forKey: DefaultsKey.centerSymbolCornerRadius.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerSymbolCornerRadius.key)
			save()
		}
	}
	var centerSymbolFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.centerSymbolFill.key) ?? defaultScheme.setting.centerSymbolFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerSymbolFill.key)
			save()
		}
	}
	var centerSymbolStrokeWidth: Float {
		get {
			return defaults.float(forKey: DefaultsKey.centerSymbolStrokeWidth.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerSymbolStrokeWidth.key)
			save()
		}
	}
	var centerSymbolStroke: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.centerSymbolStroke.key) ?? defaultScheme.setting.centerSymbolStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerSymbolStroke.key)
			save()
		}
	}
	var centerSymbolThickness: Float {
		get {
			return defaults.float(forKey: DefaultsKey.centerSymbolThickness.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerSymbolThickness.key)
			save()
		}
	}
	var curvedSymbolRadius: Float {
		get {
			return defaults.float(forKey: DefaultsKey.curvedSymbolRadius.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.curvedSymbolRadius.key)
			save()
		}
	}
	var curvedSymbolThickness: Float {
		get {
			return defaults.float(forKey: DefaultsKey.curvedSymbolThickness.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.curvedSymbolThickness.key)
			save()
		}
	}
	var curvedSymbolFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.curvedSymbolFill.key) ?? defaultScheme.setting.curvedSymbolFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.curvedSymbolFill.key)
			save()
		}
	}
	var curvedSymbolStrokeWidth: Float {
		get {
			return defaults.float(forKey: DefaultsKey.curvedSymbolStrokeWidth.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.curvedSymbolStrokeWidth.key)
			save()
		}
	}
	var curvedSymbolStroke: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.curvedSymbolStroke.key) ?? defaultScheme.setting.curvedSymbolStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.curvedSymbolStroke.key)
			save()
		}
	}
	var yySymbolRadius: Float {
		get {
			return defaults.float(forKey: DefaultsKey.yySymbolRadius.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySymbolRadius.key)
			save()
		}
	}
	var yySymbolStrokeWidth: Float {
		get {
			return defaults.float(forKey: DefaultsKey.yySymbolStrokeWidth.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySymbolStrokeWidth.key)
			save()
		}
	}
	var yySymbolStroke: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yySymbolStroke.key) ?? defaultScheme.setting.yySymbolStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySymbolStroke.key)
			save()
		}
	}
	var yyPriFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yyPriFill.key) ?? defaultScheme.setting.yyPriFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yyPriFill.key)
			save()
		}
	}
	var yySecFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yySecFill.key) ?? defaultScheme.setting.yySecFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySecFill.key)
			save()
		}
	}
	var yyDotRadius: Float {
		get {
			return defaults.float(forKey: DefaultsKey.yyDotRadius.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yyDotRadius.key)
			save()
		}
	}
	var yyPriDotFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yyPriDotFill.key) ?? defaultScheme.setting.yyPriDotFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yyPriDotFill.key)
			save()
		}
	}
	var yyPriDotStrokeWidth: Float {
		get {
			return defaults.float(forKey: DefaultsKey.yyPriDotStrokeWidth.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yyPriDotStrokeWidth.key)
			save()
		}
	}
	var yyPriDotStroke: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yyPriDotStroke.key) ?? defaultScheme.setting.yyPriDotStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yyPriDotStroke.key)
			save()
		}
	}
	var yySecDotFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yySecDotFill.key) ?? defaultScheme.setting.yySecDotFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySecDotFill.key)
			save()
		}
	}
	var yySecDotStrokeWidth: Float {
		get {
			return defaults.float(forKey: DefaultsKey.yySecDotStrokeWidth.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySecDotStrokeWidth.key)
			save()
		}
	}
	var yySecDotStroke: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yySecDotStroke.key) ?? defaultScheme.setting.yySecDotStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySecDotStroke.key)
			save()
		}
	}

	
	// MARK: - Initializers
	
	override init() {
		defaults.register(defaults: [
//			DefaultsKey.model.key: defaultModel.modelName,
//			DefaultsKey.style.key: defaultModel.Style.default.rawValue,
//			DefaultsKey.logo.key: false,
//			DefaultsKey.seconds.key: true
/*			DefaultsKey.scheme.key: defaultScheme.schemeName,*/
			DefaultsKey.backgroundColor.key: defaultScheme.setting.backgroundColor, //Vibrant.self.Style.allCases.b,//defaultScheme.backgroundColor.default.rawValue,
			DefaultsKey.displayRays.key: defaultScheme.setting.displayRays,
			DefaultsKey.numStars.key: defaultScheme.setting.numStars,
			DefaultsKey.maxStarSize.key: defaultScheme.setting.maxStarSize,
			DefaultsKey.thesholdStarSize.key: defaultScheme.setting.thesholdStarSize,
			DefaultsKey.starColorScheme.key: defaultScheme.setting.starColorScheme,
			DefaultsKey.baseRadius.key: defaultScheme.setting.baseRadius,
			DefaultsKey.baseFillColor.key: defaultScheme.setting.baseFillColor,
			DefaultsKey.baseStrokeWidth.key: defaultScheme.setting.baseStrokeWidth,
			DefaultsKey.baseStrokeColor.key: defaultScheme.setting.baseStrokeColor,
			DefaultsKey.baseShadow.key: defaultScheme.setting.baseShadow,
			DefaultsKey.centerDiscRadius.key: defaultScheme.setting.centerDiscRadius,
			DefaultsKey.centerDiscFill.key: defaultScheme.setting.centerDiscFill,
			DefaultsKey.centerDiscStrokeWidth.key: defaultScheme.setting.centerDiscStrokeWidth,
			DefaultsKey.centerDiscStroke.key: defaultScheme.setting.centerDiscStroke,
			DefaultsKey.centerSymbolCornerRadius.key: defaultScheme.setting.centerSymbolCornerRadius,
			DefaultsKey.centerSymbolFill.key: defaultScheme.setting.centerSymbolFill,
			DefaultsKey.centerSymbolStrokeWidth.key: defaultScheme.setting.centerSymbolStrokeWidth,
			DefaultsKey.centerSymbolStroke.key: defaultScheme.setting.centerSymbolStroke,
			DefaultsKey.centerSymbolThickness.key: defaultScheme.setting.centerSymbolThickness,
			DefaultsKey.curvedSymbolRadius.key: defaultScheme.setting.curvedSymbolRadius,
			DefaultsKey.curvedSymbolThickness.key: defaultScheme.setting.curvedSymbolThickness,
			DefaultsKey.curvedSymbolFill.key: defaultScheme.setting.curvedSymbolFill,
			DefaultsKey.curvedSymbolStrokeWidth.key: defaultScheme.setting.curvedSymbolStrokeWidth,
			DefaultsKey.curvedSymbolStroke.key: defaultScheme.setting.curvedSymbolStroke,
			DefaultsKey.yySymbolRadius.key: defaultScheme.setting.yySymbolRadius,
			DefaultsKey.yySymbolStrokeWidth.key: defaultScheme.setting.yySymbolStrokeWidth,
			DefaultsKey.yySymbolStroke.key: defaultScheme.setting.yySymbolStroke,
			DefaultsKey.yyPriFill.key: defaultScheme.setting.yyPriFill,
			DefaultsKey.yySecFill.key: defaultScheme.setting.yySecFill,
			DefaultsKey.yyDotRadius.key: defaultScheme.setting.yyDotRadius,
			DefaultsKey.yyPriDotFill.key: defaultScheme.setting.yyPriDotFill,
			DefaultsKey.yyPriDotStrokeWidth.key: defaultScheme.setting.yyPriDotStrokeWidth,
			DefaultsKey.yyPriDotStroke.key: defaultScheme.setting.yyPriDotStroke,
			DefaultsKey.yySecDotFill.key: defaultScheme.setting.yySecDotFill,
			DefaultsKey.yySecDotStrokeWidth.key: Vibrant.setting.yySecDotStrokeWidth,
			DefaultsKey.yySecDotStroke.key: Vibrant.setting.yySecDotStroke
		])
	}
	
	// MARK: - Private
	
	private func save() {
		defaults.synchronize()
		NotificationCenter.default.post(name: .OptionsDidChange, object: self)
	}


}
