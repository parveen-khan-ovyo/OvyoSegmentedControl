//
//  Font+Name+Size.swift
//  SegmentedControlExample
//
//  Created by Parveen Khan on 17/04/24.
//

import Foundation

enum AppFontSize {
    #if os(tvOS)
        static let tabTitleFontSize: CGFloat = 38

    #elseif os(iOS)
        static let tabTitleFontSize: CGFloat = 18
    #endif
}
