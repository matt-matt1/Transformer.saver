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
//		case model = "SAMModel"
//		case style = "SAMStyle"
//		case logo = "SAMClockLogo"
//		case seconds = "SAMSeconds"
		case backgroundColor = "backgroundColor"
		case displayRays = "Falun_displayRays"
		case numStars = "Falun_numStars"
		case maxStarSize = "Falun_maxStarSize"
		case thesholdStarSize = "Falun_thesholdStarSize"
		case colorSchemeStar = "Falun_colorSchemeStar"
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
	
	private let defaults: UserDefaults = ScreenSaverDefaults(
		forModuleWithName: Bundle(for: Prefs.self).bundleIdentifier!)!
	
	private let models = [
		Vibrant.self,
//		BN0021.self,
//		BN0032.self,
//		BN0095.self,
//		BN0111.self
	]
	
//	private let defaultModel = Vibrant.self//BN0032.self
	private let defaultScheme = Vibrant.self

//	var model: FalunView.Type {
//		return models.first { $0.modelName == modelName } ?? defaultModel
//	}
	var scheme: FalunView.Type {
		return models.first { $0.schemeName == schemeName } ?? defaultScheme
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

//	@objc var modelName: String {
//		get {
//			return defaults.string(forKey: DefaultsKey.model.key) ?? defaultModel.modelName
//		}
//
//		set {
//			defaults.set(newValue, forKey: DefaultsKey.model.key)
//			save()
//
//			NotificationCenter.default.post(name: .ModelDidChange, object: model)
//		}
//	}
	
//	var style: FalunStyle {
//		let styles = model.styles
//		let index = styles.map { $0.rawValue }.firstIndex(of: styleName) ?? styles.startIndex
//		return styles[index]
//	}
//	var scheme: FalunStyle {
//		let styles = model.styles
//		let index = styles.map { $0.rawValue }.firstIndex(of: styleName) ?? styles.startIndex
//		return styles[index]
//	}
//	@objc var styleName: String {
//		get {
//			return defaults.string(forKey: DefaultsKey.style.key)!
//		}
//
//		set {
//			defaults.set(newValue, forKey: DefaultsKey.style.key)
//			save()
//		}
//	}
	
//	@objc var drawsLogo: Bool {
//		get {
//			return defaults.bool(forKey: DefaultsKey.logo.key)
//		}
//
//		set {
//			defaults.set(newValue, forKey: DefaultsKey.logo.key)
//			save()
//		}
//	}
	
//	@objc var drawsSeconds: Bool {
//		get {
//			return defaults.bool(forKey: DefaultsKey.seconds.key)
//		}
//
//		set {
//			defaults.set(newValue, forKey: DefaultsKey.seconds.key)
//			save()
//		}
//	}
	
	var backgroundColor: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.backgroundColor.key) ?? defaultScheme.Style.default.backgroundColor
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
	var numStars: Float {
		get {
			return defaults.float(forKey: DefaultsKey.numStars.key)
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
	var thesholdStarSize: Float {
		get {
			return defaults.float(forKey: DefaultsKey.thesholdStarSize.key)
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.thesholdStarSize.key)
			save()
		}
	}
	var colorSchemeStar: String {
		get {
			return defaults.string(forKey: DefaultsKey.colorSchemeStar.key) ?? defaultScheme.Style.default.colorSchemeStar
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.colorSchemeStar.key)
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
			return defaults.colorForKey(key: DefaultsKey.baseFillColor.key) ?? defaultScheme.Style.default.baseFillColor
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
			return defaults.colorForKey(key: DefaultsKey.baseStrokeColor.key) ?? defaultScheme.Style.default.baseStrokeColor
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
			return defaults.colorForKey(key: DefaultsKey.centerDiscFill.key) ?? defaultScheme.Style.default.centerDiscFill
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
			return defaults.colorForKey(key: DefaultsKey.centerDiscStroke.key) ?? defaultScheme.Style.default.centerDiscStroke
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
			return defaults.colorForKey(key: DefaultsKey.centerSymbolFill.key) ?? defaultScheme.Style.default.centerSymbolFill
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
			return defaults.colorForKey(key: DefaultsKey.centerSymbolStroke.key) ?? defaultScheme.Style.default.centerSymbolStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.centerSymbolStroke.key)
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
			return defaults.colorForKey(key: DefaultsKey.curvedSymbolFill.key) ?? defaultScheme.Style.default.curvedSymbolFill
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
			return defaults.colorForKey(key: DefaultsKey.curvedSymbolStroke.key) ?? defaultScheme.Style.default.curvedSymbolStroke
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
			return defaults.colorForKey(key: DefaultsKey.yySymbolStroke.key) ?? defaultScheme.Style.default.yySymbolStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySymbolStroke.key)
			save()
		}
	}
	var yyPriFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yyPriFill.key) ?? defaultScheme.Style.default.yyPriFill
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yyPriFill.key)
			save()
		}
	}
	var yySecFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yySecFill.key) ?? defaultScheme.Style.default.yySecFill
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
			return defaults.colorForKey(key: DefaultsKey.yyPriDotFill.key) ?? defaultScheme.Style.default.yyPriDotFill
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
			return defaults.colorForKey(key: DefaultsKey.yyPriDotStroke.key) ?? defaultScheme.Style.default.yyPriDotStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yyPriDotStroke.key)
			save()
		}
	}
	var yySecDotFill: NSColor {
		get {
			return defaults.colorForKey(key: DefaultsKey.yySecDotFill.key) ?? defaultScheme.Style.default.yySecDotFill
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
			return defaults.colorForKey(key: DefaultsKey.yySecDotStroke.key) ?? defaultScheme.Style.default.yySecDotStroke
		}
		set {
			defaults.set(newValue, forKey: DefaultsKey.yySecDotStroke.key)
			save()
		}
	}

	
	// MARK: - Initializers
	
	override init() {
//		defaults.register(defaults: [
//			DefaultsKey.model.key: defaultModel.modelName,
//			DefaultsKey.style.key: defaultModel.Style.default.rawValue,
//			DefaultsKey.logo.key: false,
//			DefaultsKey.seconds.key: true
//		])
	}
	
	// MARK: - Private
	
	private func save() {
		defaults.synchronize()
		NotificationCenter.default.post(name: .OptionsDidChange, object: self)
	}


}
