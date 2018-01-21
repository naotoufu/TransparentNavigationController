//
//  ViewController.swift
//  TransparentNavigationController
//
//  Created by 伊東直人 on 2018/01/19.
//  Copyright © 2018年 伊東直人. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    var currentNavigationBarData: NavigationBarData!
    var nextNavigationBarData: NavigationBarData!
    override func viewDidLoad() {
        super.viewDidLoad()
        if currentNavigationBarData == nil {
            currentNavigationBarData = NavigationBarData()
        }
        nextNavigationBarData = currentNavigationBarData
        navigationController?.navigationBar.barTintColor = currentNavigationBarData.barTintColor.toUIColor
        navigationController?.navigationBar.setBackgroundImage(currentNavigationBarData.backgroundImageColor.toUIImage, for: .default)
        navigationController?.navigationBar.shadowImage = (currentNavigationBarData.prefersShadowImageHidden) ? UIImage() : nil
        nextNavigationBarData.barTintColor = .Transparent
        nextNavigationBarData.backgroundImageColor = .Transparent
        title = "Title " + "\(navigationController!.viewControllers.count)"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(currentNavigationBarData.prefersHidden, animated: animated)
//        self.navigationController?.navigationBar.isTranslucent = false
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "Show SecondView":
                guard let viewController = segue.destination as? ViewController2 else {
                    return
                }
                viewController.currentNavigationBarData = nextNavigationBarData

                break
            default:
                break
            }
        }
    }
    
}

