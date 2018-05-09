//
//  PageViewController.swift
//  ScrumArtifacts
//
//  Created by Falko on 08.05.18.
//  Copyright © 2018 Falko Möller. All rights reserved.
//

import UIKit

class PageViewController: UIPageViewController, UIPageViewControllerDataSource{
    
    var pages = [UIViewController]()
    
    // store viewcontroller in pages array
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // tells UIPageViewController that self is its dataSourceDelegate
        dataSource = self

        pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fiboOne"))
        pages.append(UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "fiboTwo"))
        setViewControllers([pages.first!], direction: .forward, animated: false, completion: nil)
    }
    
    // What should be shown before
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        
        // shouldnt be empty check
        guard let index = pages.index(of: viewController) else {
            return nil
        }
        
        if index == 0 {
            return pages.last
        }
        return pages[index-1]
        
    }
    
    // What should be shown next
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
       
        // shouldnt be empty check
        guard let index = pages.index(of: viewController) else {
            return nil
        }
        
        if index == pages.count-1 {
            return pages.first
        }
        return pages[index+1]
    }
 
}
