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

    @State private var selectedTab: String = ""
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
                        })  {
                            VStack(spacing: 0) {
                                HStack {
                                    if viewModel.itemImages.count > index {
                                        viewModel.itemImages[index]
                                            .resizable()
                                            .aspectRatio(contentMode: .fit)
                                            .frame(height: 20)
                                    }
                                    if viewModel.items.count > index {
                                        Text(tab)
                                            .frame(maxWidth: .infinity)
                                            .foregroundColor(selectedTab == tab ? viewModel.itemSelectedTitleColor : viewModel.itemTitleColor)
                                            .font(Font.custom(viewModel.fontName ?? "", size: viewModel.fontSize))
                                    }
                                }
                                Spacer()
                                Rectangle()
                                    .frame(height: viewModel.itemBarHeight)
                                    .foregroundColor(selectedTab == tab ? viewModel.itemSelectedBarColor : Color.clear)
                            }
                           // .padding()
                            .background(selectedTab == tab ? viewModel.itemSelectedBackgroundColor : viewModel.itemBackgroundColor)
                            .cornerRadius(viewModel.itemCornerRadius)
                            
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
    
    //TODO: Will use in future implementation
    
//    struct TabViewItem: View {
//
//        let viewModel: OvyoSegmentedControlViewModel
//
//        var tab: String
//        @Binding var selectedTab: String
//
//        var image: Image?
//        var selectedImage: Image?
//
//        //var text: String?
//        var selectedText: String?
//
//        @State var selectedIndex: Int = 0
//        var index: Int  = 0
//
//        var body: some View {
//            VStack(spacing: 0) {
//
//              ///Will update it later
//              //  let image: Image? = tab == selectedTab ? (selectedImage != nil ? selectedImage: image) : image
//              //  let text: String? = tab == selectedTab ? (selectedText != nil ? selectedText: text) : text
//
//                if let image = image {
//                    HStack {
//                        image
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(height: 20)
//                        Text(tab)
//                            .font(.system(size: 16))
//                    }
//                    .padding()
//                    .foregroundColor(selectedTab == tab ? viewModel.itemSelectedTitleColor : viewModel.itemTitleColor)
//                } else if let image = image {
//                    image
//                        .resizable()
//                        .aspectRatio(contentMode: .fit)
//                        .frame(height: 50)
//                        .padding()
//                        .foregroundColor(selectedTab == tab ? viewModel.itemSelectedTitleColor : viewModel.itemTitleColor)
//                } else  {
//                    Text(tab)
//                        .padding()
//                        .foregroundColor(selectedTab == tab ? viewModel.itemSelectedTitleColor : viewModel.itemTitleColor)
//                        .font(Font.custom(viewModel.fontName ?? "", size: viewModel.fontSize))
//                }
//
//                Rectangle()
//                    .frame(height: viewModel.itemBarHeight)
//                    .foregroundColor(selectedTab == tab ? viewModel.itemSelectedBarColor : Color.blue)
//            }
//            .onTapGesture {
//                selectedTab = tab
//                selectedIndex = index
//                viewModel.tabActionAtIndex(index)
//            }
//        }
//    }
}

#Preview {
    OvyoSegmentedControlView(viewModel: OvyoSegmentedControlViewModel(items: ["Tab 1", "Tab 2", "Tab 3", "Tab 4", "Tab 5"]))
}
