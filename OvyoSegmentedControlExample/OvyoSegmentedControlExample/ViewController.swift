//
//  ViewController.swift
//  OvyoSegmentedControlExample
//
//  Created by Parveen Khan on 04/06/24.
//

import UIKit
import OvyoSegmentedControlPackage
import SwiftUI

class ViewController: UIViewController, SegmentedControlDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let viewInterface = OvyoSegmentedControlInterface()
        viewInterface.setItems(["HOME", "EURO 2024", "SPORTS", "MOVIES", "TV SHOWS", "KIDS", "LIVE"])
        viewInterface.setItemSelectedTitleColor(.yellow)
        viewInterface.itemSelectedBarColor(.yellow)
        let image: UIImage = UIImage.init(systemName: "star.fill")!
        image.withTintColor(.blue, renderingMode: .alwaysTemplate)
        viewInterface.setItemsImages([image, image, image, image, image])
        viewInterface.setFontName("Gotham-Bold")
        viewInterface.setFontSize(12)
        viewInterface.setItemTitleColor(.white)
        //viewInterface.setBackgroundColor("#000000")
        viewInterface.addTarget(self)
       // viewInterface.setItemBackgroundColor(.red)
       // viewInterface.setItemSelectedBackgroundColor(.green)
       // viewInterface.setCornerRadius(20)
        
        let view1: UIView = viewInterface.create()
        view.addSubview(view1)
        view1.backgroundColor = .clear
        view1.frame = CGRect(x: 0, y: 50, width: view.bounds.width, height: 40)
    }

    func tabDidClickAt(_ index: Int) {
        
        switch index {
        case 0:
            self.view.backgroundColor = .red
        case 1:
            self.view.backgroundColor = .gray
        case 2:
            self.view.backgroundColor = .cyan
        case 4:
            self.view.backgroundColor = .purple
        case 3:
            self.view.backgroundColor = .systemPink
        default:
            self.view.backgroundColor = .white
        }
    }

}

