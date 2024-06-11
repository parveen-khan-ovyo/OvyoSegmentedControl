# OvyoSegmentedCOntrol

![sgmentedControlText](https://github.com/parveen-khan-ovyo/OvyoSegmentedControl/assets/135009495/ff8bb9e6-9c36-4b04-a754-f25a7fb0ef15)

Features
📸 Supports both text and images
↕️ Multiple sizing and selection styles
📜 Horizontal scrolling for an infinite number of segments
⚙️ Advanced title styling with text attributes for font, color, etc
🖥 Compatible with both Swift and Objective-C
🖥 Compatible with both SwiftUI View and Swift view
📱 Updated for Xcode 15.4, iOS 13 and Swift 5.9. Supports all the way back to iOS 13!

# Installation
1. Select File > Swift Packages > Add Package Dependency....
2. Add the Github URL of the Package file:

# Usage

The code below will create a segmented control with the default looks:

Included is a demo project showing how to customize OvyoSegmentedControl.

Segmented Control in UIView

let viewInterface = OvyoSegmentedControlInterface()
        viewInterface.setItems(["HOME", "EURO 2024", "SPORTS", "MOVIES", "TV SHOWS", "KIDS", "LIVE"])
        viewInterface.setItemSelectedTitleColor(Color.yellow)
        viewInterface.itemSelectedBarColor(Color.yellow)
        viewInterface.setItemTitleColor(.white)
       // let image: UIImage = UIImage.init(systemName: "star.fill")!
        let image: UIImage = UIImage(named: "star")!
       // image.withTintColor(.red, renderingMode: .alwaysTemplate)
        viewInterface.setItemTintColor(.white)
        viewInterface.setItemSelectedTintColor(.yellow)
       // viewInterface.setItemsImages([UIImage(named: "home")!, UIImage(named: "contacts")!, UIImage(named: "moneyTransfer")!, UIImage(named: "pcOnDesk")!,
       UIImage(named: "camper")!, UIImage(named: "userAccount")!, UIImage(named: "star")!])

     //To hide show bottom bar
      //  viewInterface.setItemBar(true)
      
   //     viewInterface.setFontName("Gotham-Bold")
        viewInterface.setFontSize(12)
        viewInterface.addTarget(self)
        let view1: UIView = viewInterface.create()
        view.addSubview(view1)
        view1.backgroundColor = .black
        view1.frame = CGRect(x: 0, y: 64, width: view.bounds.width, height: 50)

        viewInterface.setItemBackgroundColor(.red)
        viewInterface.setItemSelectedBackgroundColor(.green)
        viewInterface.setCornerRadius(20)
        

Segmented Control in SwiftUI View

# Possible Styles

![sgmentedControlText](https://github.com/parveen-khan-ovyo/OvyoSegmentedControl/assets/135009495/ff8bb9e6-9c36-4b04-a754-f25a7fb0ef15)
![SegmentedControlImageWithText](https://github.com/parveen-khan-ovyo/OvyoSegmentedControl/assets/135009495/5c5b3e84-39ff-4b64-80e0-5ca7c8f95743)
![SegmentedControlImage](https://github.com/parveen-khan-ovyo/OvyoSegmentedControl/assets/135009495/11596192-3bc7-4934-950e-2a74588c7ab4)

# Maintainers
Vishal - vishal@ovyo.com, 
Srikant - srikanth.suryawanshi@ovyo.com


