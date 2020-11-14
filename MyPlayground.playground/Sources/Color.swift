import UIKit

func color(hex: String) -> UIColor {
    var aValue: String
    var rValue: String
    var gValue: String
    var bValue: String

    var alpha: CUnsignedInt = 0
    var red: CUnsignedInt = 0
    var green: CUnsignedInt = 0
    var blue: CUnsignedInt = 0

    var cString = hex.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

    if cString.hasPrefix("#") {
        cString = (cString as NSString).substring(from: 1)
    }

    switch cString.count {
    case 6:
        rValue = (cString as NSString).substring(to: 2)
        gValue = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        bValue = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        Scanner(string: rValue).scanHexInt32(&red)
        Scanner(string: gValue).scanHexInt32(&green)
        Scanner(string: bValue).scanHexInt32(&blue)
        return UIColor(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(1)
        )
    case 8:
        aValue = (cString as NSString).substring(to: 2)
        rValue = ((cString as NSString).substring(from: 2) as NSString).substring(to: 2)
        gValue = ((cString as NSString).substring(from: 4) as NSString).substring(to: 2)
        bValue = ((cString as NSString).substring(from: 6) as NSString).substring(to: 2)
        Scanner(string: aValue).scanHexInt32(&alpha)
        Scanner(string: rValue).scanHexInt32(&red)
        Scanner(string: gValue).scanHexInt32(&green)
        Scanner(string: bValue).scanHexInt32(&blue)
        return UIColor(
            red: CGFloat(red) / 255.0,
            green: CGFloat(green) / 255.0,
            blue: CGFloat(blue) / 255.0,
            alpha: CGFloat(alpha) / 255.0
        )
    default:
        return UIColor.clear // should stand out to indicate an error in config
    }
}

//print(color(hex: "#112233"))
//print(color(hex: "#aaffffff"))
//print(color(hex: "#gghhiijj"))
