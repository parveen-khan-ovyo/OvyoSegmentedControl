//
//  SegmentedControlViewModel.swift
//  OvyoSegmentedControl
//
//  Created by Parveen Khan on 17/04/24.
//

import Foundation
import SwiftUI

protocol SegmentedControlViewModelProtocol: ObservableObject {
    var items: [String] { get }
    var tabBackgroundColor: Color? { get }
}

public protocol SegmentedControlDelegate: AnyObject {
    func tabDidClickAt(_ index: Int)
}

class OvyoSegmentedControlViewModel: SegmentedControlViewModelProtocol {

    /// output click Action protocol
    weak var delegate: SegmentedControlDelegate?

    @Published var items: [String] = []
    @Published var itemImages:[Image] = []
    @Published var selectedItemImages:[Image] = []
    
    @Published var tabBackgroundColor: Color? = .gray
    @Published var forgroundColor: Color? = .clear

    @Published var frameSize: CGSize = .zero
    @Published var itemSize: CGFloat = SegmentedControlDefaultSize().itemSize
    @Published var itemCornerRadius: CGFloat = SegmentedControlDefaultSize().itemCornerRadius

    @Published var itemSpacing: CGFloat = SegmentedControlDefaultSize().itemSpacing
    @Published var focusBorderWidth: CGFloat = SegmentedControlDefaultSize().focusBorderWidth
    @Published var segmentViewBorderWidth: CGFloat = SegmentedControlDefaultSize().segmentViewBorderWidth
    /// buttons specification
    @Published var buttonBackgroundColor: Color? = SegmentedControlDefaultColor().itemBackgroundColor.toColor()
    @Published var itemBorderColor: Color? = SegmentedControlDefaultColor().itemBorderColor.toColor()
    /// Colors
    @Published var textColor: Color = SegmentedControlDefaultColor().textColor.toColor()
    @Published var backgroundColor: Color = SegmentedControlDefaultColor().backgroundColor.toColor()
    @Published var focusBorderColor: Color = SegmentedControlDefaultColor().focusBorderColor.toColor()
    @Published var segmentviewBorderColor: Color = SegmentedControlDefaultColor().segmentBorderColor.toColor()

    /// Font
    @Published var fontName: String?
    @Published var fontSize: CGFloat = AppFontSize.tabTitleFontSize
    @Published var fontWeight: Font.Weight = .regular

    /// Item
    @Published var itemBackgroundColor: Color = SegmentedControlDefaultColor().itemBackgroundColor.toColor()
    @Published var itemSelectedBackgroundColor: Color = SegmentedControlDefaultColor().itemSelectedBackgroundColor.toColor()
    @Published var itemTitleColor: Color = SegmentedControlDefaultColor().itemTitleColor.toColor()
    @Published var itemSelectedTitleColor: Color? = .white

    // @Published var itemBarColor: Color = SegmentedControlDefaultColor().itemTitleColor.toColor()
    @Published var itemSelectedBarColor: Color? = .white
    @Published var itemBarHeight: CGFloat = SegmentedControlDefaultSize().itemBarHeight
    @Published var selectedIndex: Int = 0

    /// position
    @Published var position: CGPoint?

    init() {}

    init(items: [String]) {
        self.items = items
    }

    func tabActionAtIndex(_ index: Int) {
        print("selected index \(index)")
        delegate?.tabDidClickAt(index)
    }
}
