//
//  SegmentedControlView.swift
//  OvyoSegmentedControl
//
//  Created by Parveen Khan on 16/04/24.
//

import SwiftUI

struct TabItem {
    let title: String
}

// PreferenceKey to store the selected tab position
struct SelectedTabKey: PreferenceKey {
    static var defaultValue: CGFloat = 0

    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

struct OvyoSegmentedControlView<M: OvyoSegmentedControlViewModel>: View {

    @ObservedObject var viewModel: M
    private let isScrollable = false

    //   let tabs = ["Tab 1", "Tab 2", "Tab 3", "Tab 4", "Tab 5"]
    @State private var selectedTab: String?
    @State var selectedIndex: Int = 0

    var body: some View {
        GeometryReader { geometry in

            ScrollView(.horizontal, showsIndicators: false) {

                HStack {
                    ForEach(Array(viewModel.items.enumerated()), id: \.offset) { index, tab in
                        Button(action: {
                            selectedTab = tab
                            selectedIndex = index
                            viewModel.tabActionAtIndex(index)
                        }) {
                            VStack(spacing: 0) {
                                Text(tab)
                                    .frame(maxWidth: .infinity)
                                    .foregroundColor(selectedTab == tab ? viewModel.itemSelectedTitleColor : viewModel.itemTitleColor)
                                Rectangle()
                                    .frame(height: viewModel.itemBarHeight)
                                    .foregroundColor(selectedTab == tab ? viewModel.itemSelectedBarColor : Color.clear)
                            }
                        }
                        .padding()
                    }
                }
                .frame(height: geometry.size.height)
            }
            .background(GeometryReader {
                Color.clear.preference(key: SelectedTabKey.self, value: $0.frame(in: .named("tabBar")).minX)
            })
        }
    }

    // Calculate the selected tab indicator offset
    private func calculateIndicatorOffset() -> CGFloat {
        let width = UIScreen.main.bounds.width / CGFloat(viewModel.items.count)
        return CGFloat(selectedIndex) * width
    }

    // Calculate the selected tab indicator top position
    private func calculateIndicatorTop() -> CGFloat {
        let height: CGFloat = 30 // Height of the above view
        return height + 0 // Add padding if needed
    }
}

#Preview {
    OvyoSegmentedControlView(viewModel: OvyoSegmentedControlViewModel(items: ["Tab 1", "Tab 2", "Tab 3", "Tab 4", "Tab 5"]))
}
