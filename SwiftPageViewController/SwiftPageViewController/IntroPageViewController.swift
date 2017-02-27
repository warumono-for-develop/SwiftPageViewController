//
//  IntroPageViewController.swift
//  Maniau1
//
//  Created by kevin on 2017. 2. 24..
//  Copyright © 2017년 warumono. All rights reserved.
//

import UIKit

protocol IntroPageViewControllerDataSource: class
{
	func introPageViewController(_ pageViewController: IntroPageViewController, numberOfPages pages: Int)
}

protocol IntroPageViewControllerDelegate: class
{
	func introPageViewController(_ pageViewController: IntroPageViewController, didChangePageIndex index: Int)
}

class IntroPageViewController: UIPageViewController
{
	weak var introPageViewControllerDataSource: IntroPageViewControllerDataSource?
	weak var introPageViewControllerDelegate: IntroPageViewControllerDelegate?
	
	fileprivate(set) lazy var contentViewControllers: [UIViewController] =
	{
		return [
			self.contentViewController(withIdentifier: "First"),
			self.contentViewController(withIdentifier: "One"),
			self.contentViewController(withIdentifier: "Two"),
			self.contentViewController(withIdentifier: "Three"),
			self.contentViewController(withIdentifier: "Last")
		]
	}()
	
	fileprivate var allowRotate: Bool = false
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		dataSource = self
		delegate = self
		
		if let initialViewController = contentViewControllers.first
		{
			contentViewController(followingViewController: initialViewController)
		}
		
		introPageViewControllerDataSource?.introPageViewController(self, numberOfPages: contentViewControllers.count)
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
}

extension IntroPageViewController
{
	fileprivate func contentViewController(withIdentifier identifier: String) -> UIViewController
	{
		return UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(identifier)ContentViewController")
	}
	
	fileprivate func contentViewController(followingViewController viewController: UIViewController, to direction: UIPageViewControllerNavigationDirection = .forward)
	{
		setViewControllers([viewController], direction: direction, animated: true)
		{
			(finished) -> Void in
			self.didChangePage()
		}
	}
	
	fileprivate func didChangePage()
	{
		if let firstViewController = viewControllers?.first, let index = contentViewControllers.index(of: firstViewController)
		{
			introPageViewControllerDelegate?.introPageViewController(self, didChangePageIndex: index)
		}
	}
}

extension IntroPageViewController
{
	public func next()
	{
		if let visibleViewController = viewControllers?.first, let viewController = pageViewController(self, viewControllerAfter: visibleViewController)
		{
			contentViewController(followingViewController: viewController)
		}
	}
	
	func pageTo(at index: Int)
	{
		if let firstViewController = viewControllers?.first, let currentIndex = contentViewControllers.index(of: firstViewController)
		{
			let direction: UIPageViewControllerNavigationDirection = index >= currentIndex ? .forward : .reverse
			let viewController = contentViewControllers[index]
			
			contentViewController(followingViewController: viewController, to: direction)
		}
	}
}

extension IntroPageViewController: UIPageViewControllerDataSource
{
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController?
	{
		guard let index = contentViewControllers.index(of: viewController) else { return nil }
		
		let previous = index - 1
		
		guard previous >= 0 else { return nil }
		guard contentViewControllers.count > previous else { return nil }
		
		return contentViewControllers[previous]
	}
	
	func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController?
	{
		guard let index = contentViewControllers.index(of: viewController) else { return nil }
		
		let next = index + 1
		let count = contentViewControllers.count
		
//		guard count != next else { return contentViewControllers.first } // rotatable
		guard count != next else { return nil }
		guard count > next else { return nil }
		
		return contentViewControllers[next]
	}
}

extension IntroPageViewController: UIPageViewControllerDelegate
{
	func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool)
	{
		didChangePage()
	}
}
