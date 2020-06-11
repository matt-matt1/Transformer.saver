import AppKit

struct Color {

	// MARK: - Properties

	static let darkBackground = NSColor(displayP3Red: 0.129, green: 0.125, blue: 0.141, alpha: 1)
    static let yellow = NSColor(displayP3Red: 1, green: 211.0 / 255, blue: 17.0 / 255, alpha: 1)
    static let red = NSColor(displayP3Red: 204.0 / 255, green: 29.0 / 255, blue: 26.0 / 255, alpha: 1)
	static let white = NSColor.white
	static let black = NSColor.black

	// MARK - Initializers

	private init() {}
}


//based on https://www.sitepoint.com/store-uicolor-with-userdefaults-in-swift-3/
extension UserDefaults {
	
	func colorForKey(key: String) -> NSColor? {
		var color: NSColor?
		if let colorData = data(forKey: key) {
			color = NSKeyedUnarchiver.unarchiveObject(with: colorData) as? NSColor
		}
		return color ?? NSColor.clear
	}
	
	func setColor(color: NSColor?, forKey key: String) {
		var colorData: NSData?
		if let color = color {
			colorData = NSKeyedArchiver.archivedData(withRootObject: color) as NSData?
		}
		set(colorData, forKey: key)
	}


}
