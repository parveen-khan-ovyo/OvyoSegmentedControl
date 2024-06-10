//
//  SegmentedControlView.swift
//  OvyoSegmentedControl
//
//  Created by Parveen Khan on 16/04/24.
//

import SwiftUI


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
    
    @State private var selectedTab: String = ""
    @State var selectedIndex: Int = 0
    
    var body: some View {
        GeometryReader { geometry in
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    if viewModel.items.count > 0 {
                        ForEach(Array(viewModel.items.enumerated()), id: \.offset) { index, tab in
                            TabItem(index: index, selectedIndex: $selectedIndex, viewModel: viewModel, geometrySize: geometry.size)
                        }
                    }else {
                        ForEach(Array(viewModel.itemImages.enumerated()), id: \.offset) { index, tab in
                            TabItem(index: index, selectedIndex: $selectedIndex, viewModel: viewModel, geometrySize: geometry.size)
                        }
                    }
                }
            }
            .frame(height: geometry.size.height)
        }
        .background(GeometryReader {
            Color.clear.preference(key: SelectedTabKey.self, value: $0.frame(in: .named("tabBar")).minX)
        })
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

struct TabItem: View {
    
    let index: Int
    @Binding var selectedIndex: Int
    let viewModel: OvyoSegmentedControlViewModel
    let geometrySize: CGSize
    
    var body: some View {
        Button(action: {
            // selectedTab = tab
            selectedIndex = index
            viewModel.tabActionAtIndex(index)
        }) {
            VStack(spacing: 0) {
                Spacer()
                HStack {
                    if viewModel.itemImages.count > index {
                        viewModel.itemImages[index]
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: geometrySize.height - 20)
                            .foregroundColor(selectedIndex == index ? viewModel.itemSelectedImageTintColor : viewModel.itemImageTintColor)
                    }
                    if viewModel.items.count > index {
                        Text(viewModel.items[index])
                            .frame(maxWidth: .infinity)
                            .foregroundColor(selectedIndex == index ? viewModel.itemSelectedTitleColor : viewModel.itemTitleColor)
                            .font(.custom(viewModel.fontName ?? "", size: viewModel.fontSize))
                    }
                }
                Spacer()
                if !viewModel.itemBarIsHidden {
                    Rectangle()
                        .frame(height: viewModel.itemBarHeight)
                        .foregroundColor(selectedIndex == index ? viewModel.itemSelectedBarColor : Color.clear)
                }
            }
            .background(selectedIndex == index ? viewModel.itemSelectedBackgroundColor : viewModel.itemBackgroundColor)
            .cornerRadius(viewModel.itemCornerRadius)
        }
        .padding()
    }
}


#Preview {
    OvyoSegmentedControlView(viewModel: OvyoSegmentedControlViewModel(items: ["Tab 1", "Tab 2", "Tab 3", "Tab 4", "Tab 5"]))
}
