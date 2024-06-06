//
//  SegmentedControlInterface.swift
//  OvyoSegmentedControl
//
//  Created by Parveen Khan on 17/04/24.
//

import Foundation
import SwiftUI

public class OvyoSegmentedControlInterface: NSObject {

    /// reference of  Segmented Control View from SwiftUI
    private var segmentedOCntrol: OvyoSegmentedControlView<OvyoSegmentedControlViewModel>?

    /// reference of the UIView created by the SwiftUI to be visible when interacting with UIKit
    private var segmentedControlView: UIView?

    private let segmentedControlViewModel: OvyoSegmentedControlViewModel

    /// default initializer of Segmented Control view
    /// - Parameter action: for adding handlers
    public init(action: SegmentedControlDelegate? = nil) {
        segmentedControlViewModel = OvyoSegmentedControlViewModel()
        segmentedControlViewModel.delegate = action
    }

    /// set/update the frame of the Segmented Control  view
    /// - Parameter rect: A fixed frame for the resulting view in the  `CGRect` format
    public func setFrame(_ rect: CGRect) {
        segmentedControlViewModel.frameSize = rect.size
        // multipleButtonCardView?.frame.size = size
    }

    /// set/update the items  view as Segmented Control Item
    /// - Parameter items: it is the collection of items to show as a list of buttons in the Segmented Control Item
    public func setItems(_ items: [String]) {
        segmentedControlViewModel.items = items
    }
    
    /// set/update the items  view as Segmented Control
    /// - Parameter images: it is the collection of items images (Image) to show as a list of buttons in the Segmented Control
    public func setItemsImages(_ images: [Image]) {
        segmentedControlViewModel.itemImages = images
    }
    
    /// set/update the items  view as Segmented Control
    /// - Parameter images: it is the collection of items images (UImage) to show as a list of buttons in the Segmented Control
    public func setItemsImages(_ uiImages: [UIImage]) {
        segmentedControlViewModel.itemImages = convertToSwiftUIImages(uiImages)
    }
    
    /// set/update the items  view as Segmented Control
    /// - Parameter images: it is the collection of selected items images to show as a list of buttons in the Segmented Control
    public func setSelectedItemsImages(_ images: [Image]) {
        segmentedControlViewModel.selectedItemImages = images
    }
    
    /// set/update the items  view as Segmented Control
    /// - Parameter images: it is the collection of selected items images to show as a list of buttons in the Segmented Control
    public func setSelectedItemsImages(_ uiImages: [UIImage]) {
        segmentedControlViewModel.selectedItemImages = convertToSwiftUIImages(uiImages)
    }


    /// set/update the focus border width  of the Segmented Control   view
    /// - Parameter width: A `CGFloat` value which will set the focus border width of Segmented Control view
    public func setFocusBorderWidth(_ width: CGFloat) {
        segmentedControlViewModel.focusBorderWidth = width
    }

    /// set/update the background color  of the Segmented Control view
    /// - Parameter color: A color `Hex String` which will  set the custom background color of  the  Segmented Control view e.g.  white: "#FFFFFF",  transparent : "#00FFFFFF"
    public func setBackgroundColor(_ color: String) {
        segmentedControlViewModel.backgroundColor = color.toColor()
    }

    /// set/update the focus border color  of the Segmented Control view
    /// - Parameter color: A color `Hex String` which will  set the custom focus border color of the Segmented Control view e.g.  white: "#FFFFFF",  transparent : "#00FFFFFF"
    public func setFocusBorderColor(_ color: String) {
        segmentedControlViewModel.focusBorderColor = color.toColor()
    }
    
    /// set/update the radius  of the Segmented Control Item  view
    /// - Parameter size: A `CGFloat` value which will set the radius of item  view
    public func setCornerRadius(_ radius: CGFloat) {
        segmentedControlViewModel.itemCornerRadius = radius
    }

    /// set/update the font name  of the card  view
    /// - Parameter name: A  `Font name String` which will  set the custom font  of the Segmented Control view
    public func setFontName(_ name: String) {
        segmentedControlViewModel.fontName = name
    }

    /// set/update the font size  of the Segmented Control  view
    /// - Parameter size: A `CGFloat` value which will set the font size of the Segmented Control view
    public func setFontSize(_ size: CGFloat) {
        segmentedControlViewModel.fontSize = size
    }

    /// set/update the font weight of the texts used in the Segmented Control view
    /// - Parameter weight: A font weight which will set with default system font e.g. `bold`, `regular`
    public func setFontWeight(_ weight: Font.Weight) {
        segmentedControlViewModel.fontWeight = weight
    }

    /// set/update the item size  of the Segmented Control view
    /// - Parameter size: A `CGFloat` value which will set the item size of the Segmented Control Item view (width and height is equal)
    public func setItemSize(_ size: CGFloat) {
        segmentedControlViewModel.itemSize = size
    }

    /// set/update the Segmented Control  view  item background color
    /// - Parameter color: A color `Hex String` which will  set the custom item background color e.g.  white: "#FFFFFF",  transparent : "#00FFFFFF"
    public func setItemBackgroundColor(_ color: String) {
        segmentedControlViewModel.itemBackgroundColor = color.toColor()
    }
    
    /// set/update the Segmented Control view  item background color
    /// - Parameter color: A color `Color value` which will  set the custom item background color e.g.  white: .white,  transparent : "Color.clear"
    public func setItemBackgroundColor(_ color: Color) {
        segmentedControlViewModel.itemBackgroundColor = color
    }

    /// set/update the selected item background color
    /// - Parameter color: A color `Hex String` which will  set the custom selected item background color e.g.  white: "#FFFFFF",  transparent : "#00FFFFFF"
    public func setItemSelectedBackgroundColor(_ color: String) {
        segmentedControlViewModel.itemSelectedBackgroundColor = color.toColor()
    }
    
    /// set/update the selected item background color
    /// - Parameter color: A color `Hex String` which will  set the custom selected item background color e.g.  "white",   "clear"
    public func setItemSelectedBackgroundColor(_ color: Color) {
        segmentedControlViewModel.itemSelectedBackgroundColor = color
    }

    /// set/update the  item title color
    /// - Parameter color: color: A color `Hex String` which will  set the custom item title color e.g.  white: "#FFFFFF",  transparent : "#00FFFFFF"
    public func setItemTitleColor(_ color: String) {
        segmentedControlViewModel.itemTitleColor = color.toColor()
    }

    public func setItemTitleColor(_ color: Color) {
        segmentedControlViewModel.itemTitleColor = color
    }

    /// set/update the selected item title color
    /// - Parameter color: A color `Hex String` which will  set the custom selected item title color e.g.  white: "#FFFFFF",  transparent : "#00FFFFFF"
    public func setItemSelectedTitleColor(_ color: String) {
        segmentedControlViewModel.itemSelectedTitleColor = color.toColor()
    }
    
    public func setItemSelectedTitleColor(_ color: Color) {
        segmentedControlViewModel.itemSelectedTitleColor = color
    }
    
    
    /// set/update the selected item bar color
    /// - Parameter color: A color `Hex String` which will  set the custom selected item title color e.g.  white: "#FFFFFF",  transparent : "#00FFFFFF"
    public func itemSelectedBarColor(_ color: String) {
        segmentedControlViewModel.itemSelectedBarColor = color.toColor()
    }
    
    public func itemSelectedBarColor(_ color: Color) {
        segmentedControlViewModel.itemSelectedBarColor = color
    }
    

    /// set/update the position of Segmented Control view with respect to its parent
    /// - Parameter position: A fixed position with respect to parent view is defined for the resulting UI in the `CGPoint` format
    public func setPosition(_ position: CGPoint) {
        segmentedControlViewModel.position = position
    }

    /// set/update the  item title with respect to index
    /// - Parameters:
    ///   - title: A text which describe the item role
    ///   - index: An `integer`  value which defines the position of item in Segmented Control view
    public func setItemTitle(_ title: String, atIndex index: Int) {
        segmentedControlViewModel.items[index] = title
    }

    /// Add target to receive a SegmentedControlDelegate events
    /// - Parameter action: for adding handlers
    public func addTarget(_ action: SegmentedControlDelegate) {
        segmentedControlViewModel.delegate = action
    }

    public func setSelectedItemAt(_ index: Int) {
        segmentedControlViewModel.selectedIndex = index
    }

    public func create() -> some View {

        let customView = OvyoSegmentedControlView(viewModel: segmentedControlViewModel)
        segmentedOCntrol = customView
        return customView
    }

    public func create() -> UIView {
        let cardView = OvyoSegmentedControlView(viewModel: segmentedControlViewModel)
        segmentedOCntrol = cardView
        let customView: UIView = cardView.convertToUIView()
        segmentedControlView = customView
        return customView
    }
    
    func convertToSwiftUIImages(_ uiImages: [UIImage]) -> [Image] {
        var images: [Image] = []
        
        for uiImage in uiImages {
            let image = Image(uiImage: uiImage)
            images.append(image)
        }
        
        return images
    }

}

extension View {
    //// To scale the font with view
    func scaledFont(name: String?, size: CGFloat, weight: Font.Weight? = nil) -> some View {
        modifier(ScaledFont(name: name, size: size, weight: weight))
    }

    /// To covert swiftUI view to UIView
    public func convertToUIView() -> UIView {
        let view = AnyView(self)
        let hostingView: UIView = UIHostingController(rootView: view).view
        return hostingView
    }
}

//// Scale the font modifier
struct ScaledFont: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var name: String?
    var size: CGFloat
    var weight: Font.Weight?

    func body(content: Content) -> some View {
        // Note:- not removing this code because we will utilize this code with the support of dynamic font size
        // let scaledSize = UIFontMetrics.default.scaledValue(for: size)
        guard let fontName = name else {
            return content.font(.system(size: size, weight: weight ?? .regular, design: .default))
        }
        if #available(iOS 14.0, *) {
            return content.font(.custom(fontName, fixedSize: size))
        }
        return content.font(.system(size: size, weight: weight ?? .regular, design: .default))
    }
}

extension String {

    func toColor() -> Color {
        let hex = trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let alpha, red, green, blue: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (alpha, red, green, blue) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (alpha, red, green, blue) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (alpha, red, green, blue) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (alpha, red, green, blue) = (1, 1, 1, 0)
        }
        return Color(
            .sRGB,
            red: Double(red) / 255,
            green: Double(green) / 255,
            blue: Double(blue) / 255,
            opacity: Double(alpha) / 255
        )
    }

    func toUIColor() -> UIColor {
        var alpha: CGFloat = 1.0
        var cString: String = trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if cString.hasPrefix("#") {
            cString.remove(at: cString.startIndex)
        }
        if cString.count == 8 {
            let alphaString = cString.suffix(2)
            if let alphaValue = UInt8(alphaString, radix: 16) {
                alpha = CGFloat(alphaValue) / 100
            }
            cString = String(cString.dropLast(2))
        }
        if cString.count != 6 {
            return UIColor.gray
        }
        var rgbValue: UInt32 = 0
        Scanner(string: cString).scanHexInt32(&rgbValue)

        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }

    /// returns the number of lines that can be fit in provided with
    func splittingLinesThatFitIn(width: CGFloat, font: UIFont) -> [String] {

        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.lineBreakMode = .byWordWrapping

        /// set up styled text for the container
        let storage = NSTextStorage(string: self, attributes: [
            NSAttributedString.Key.font: font,
            NSAttributedString.Key.paragraphStyle: paragraphStyle,
        ])

        /// add a layout manage for the storage
        let layout = NSLayoutManager()
        storage.addLayoutManager(layout)

        /// Set up the size of the container
        /// width is what we care about, height is maximum
        let container = NSTextContainer(size: CGSize(width: width, height: CGFloat.greatestFiniteMagnitude))

        /// add the container to the layout
        layout.addTextContainer(container)

        var lines = [String]()

        /// generate the layout and add each line to the array
        layout.enumerateLineFragments(forGlyphRange: NSRange(location: 0, length: storage.length)) { _, _, _, range, _ in
            lines.append(storage.attributedSubstring(from: range).string)
        }
        return lines
    }
}
