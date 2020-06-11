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
		case model = "SAMModel"
		case style = "SAMStyle"
		case logo = "SAMClockLogo"
		case seconds = "SAMSeconds"
		
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
	
	private let defaultModel = Vibrant.self//BN0032.self
	
	var model: FalunView.Type {
		return models.first { $0.modelName == modelName } ?? defaultModel
	}
	
	@objc var modelName: String {
		get {
			return defaults.string(forKey: DefaultsKey.model.key) ?? defaultModel.modelName
		}
		
		set {
			defaults.set(newValue, forKey: DefaultsKey.model.key)
			save()
			
			NotificationCenter.default.post(name: .ModelDidChange, object: model)
		}
	}
	
	var style: FalunStyle {
		let styles = model.styles
		let index = styles.map { $0.rawValue }.firstIndex(of: styleName) ?? styles.startIndex
		return styles[index]
	}
	
	@objc var styleName: String {
		get {
			return defaults.string(forKey: DefaultsKey.style.key)!
		}
		
		set {
			defaults.set(newValue, forKey: DefaultsKey.style.key)
			save()
		}
	}
	
	@objc var drawsLogo: Bool {
		get {
			return defaults.bool(forKey: DefaultsKey.logo.key)
		}
		
		set {
			defaults.set(newValue, forKey: DefaultsKey.logo.key)
			save()
		}
	}
	
	@objc var drawsSeconds: Bool {
		get {
			return defaults.bool(forKey: DefaultsKey.seconds.key)
		}
		
		set {
			defaults.set(newValue, forKey: DefaultsKey.seconds.key)
			save()
		}
	}
	
	// MARK: - Initializers
	
	override init() {
		defaults.register(defaults: [
			DefaultsKey.model.key: defaultModel.modelName,
			DefaultsKey.style.key: defaultModel.Style.default.rawValue,
			DefaultsKey.logo.key: false,
			DefaultsKey.seconds.key: true
		])
	}
	
	// MARK: - Private
	
	private func save() {
		defaults.synchronize()
		NotificationCenter.default.post(name: .OptionsDidChange, object: self)
	}
}
