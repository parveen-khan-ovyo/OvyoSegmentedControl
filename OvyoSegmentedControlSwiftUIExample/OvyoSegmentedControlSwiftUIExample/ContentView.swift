//
//  ContentView.swift
//  OvyoSegmentedControlSwiftUIExample
//
//  Created by Parveen Khan on 11/06/24.
//

import SwiftUI
import OvyoSegmentedControlPackage

struct ContentView: View {
    var body: some View {
        let interface = OvyoSegmentedControlInterface()
        interface.setItems(["HOME", "EURO 2024", "SPORTS", "MOVIES", "TV SHOWS", "KIDS", "LIVE"])
        interface.setItemSelectedTitleColor(Color.yellow)
        interface.itemSelectedBarColor(Color.yellow)
        interface.setItemTitleColor(.white)
        
        // Set images, assuming you have the UIImage assets in your project
        let images: [UIImage] = [UIImage(named: "home")!, UIImage(named: "contacts")!, UIImage(named: "moneyTransfer")!, UIImage(named: "pcOnDesk")!, UIImage(named: "camper")!, UIImage(named: "userAccount")!, UIImage(named: "star")!]
        interface.setItemsImages(images)
        interface.setItemTintColor(.white)
        interface.setItemSelectedTintColor(.yellow)
        interface.setFontName("Gotham-Bold")
        interface.setFontSize(12)
        interface.addTarget(Coordinator())
        
        return VStack { interface.create()
                .background(Color.black)
                .frame(width: UIScreen.main.bounds.width, height: 50)
                .padding(.top, 20)
                 
            Spacer()
        }    }
}

class Coordinator: SegmentedControlDelegate {
   
    func tabDidClickAt(_ index: Int) {
        print("index is", index)
    }
}

#Preview {
    ContentView()
}
