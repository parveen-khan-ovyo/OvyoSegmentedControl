//
//  ViewController.swift
//  OvyoSegmentedControlExample
//
//  Created by Parveen Khan on 04/06/24.
//

import UIKit
import OvyoSegmentedControlPackage

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
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
    }


}

