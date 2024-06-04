# Ovyo
![Simulator Screenshot - iPhone 15 - 2024-06-04 at 10 24 05](https://github.com/parveen-khan-ovyo/OvyoSegmentedControl/assets/135009495/2337b154-69de-47d0-b3a5-27da60becf86)

Features
📸 Supports both text and images
↕️ Multiple sizing and selection styles
📜 Horizontal scrolling for an infinite number of segments
⚙️ Advanced title styling with text attributes for font, color, etc
🖥 Compatible with both Swift and Objective-C
🖥 Compatible with both SwiftUI View and Swift view
📱 Updated for Xcode 15.4, iOS 13 and Swift 5.9. Supports all the way back to iOS 17!

# Installation
1. Select File > Swift Packages > Add Package Dependency....
2. Add the Github URL of the Package file:

# Usage

The code below will create a segmented control with the default looks:

Included is a demo project showing how to customize OvyoSegmentedControl.

Segmented Control in UIView

let viewInterface = OvyoSegmentedControlInterface()
viewInterface.setItems(["Tab1", "Tab2", "Tab3", "Tab4", "Tab5"])
viewInterface.setItemSelectedTitleColor(Color.red)
viewInterface.itemSelectedBarColor(Color.red)
// viewInterface.setItemBackgroundColor(.red)
// viewInterface.setItemSelectedBackgroundColor(.green)
// viewInterface.setCornerRadius(20)
        
let view1: UIView = viewInterface.create()
view.addSubview(view1)

view1.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: 40)

Segmented Control in SwiftUI View


Possible Styles

...inProgrss

