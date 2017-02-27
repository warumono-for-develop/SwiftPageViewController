//
//  IntroViewController.swift
//  Maniau1
//
//  Created by kevin on 2017. 2. 24..
//  Copyright © 2017년 warumono. All rights reserved.
//

import UIKit

class IntroViewController: UIViewController
{
	@IBOutlet weak var pageControl: UIPageControl!
	@IBOutlet weak var containerView: UIView!
	
	fileprivate var introPageViewController: IntroPageViewController?
	{
		didSet
		{
			introPageViewController?.introPageViewControllerDataSource = self
			introPageViewController?.introPageViewControllerDelegate = self
		}
	}
	
	override var preferredStatusBarStyle: UIStatusBarStyle
	{
		return .lightContent
	}
	
	override func viewDidLoad()
	{
		super.viewDidLoad()
		
		// Do any additional setup after loading the view.
		
		pageControl.addTarget(self, action: #selector(IntroViewController.didChangePage), for: .valueChanged)
	}
	
	override func didReceiveMemoryWarning()
	{
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	override func prepare(for segue: UIStoryboardSegue, sender: Any?)
	{
		if let introPageViewController = segue.destination as? IntroPageViewController
		{
			self.introPageViewController = introPageViewController
		}
	}
}

extension IntroViewController
{
	@IBAction func didTouch(_ sender: UIButton)
	{
		if sender.tag == 0
		{
			if pageControl.numberOfPages <= pageControl.currentPage + 1
			{
				return
			}
			
			introPageViewController?.pageTo(at: pageControl.numberOfPages - 1)
		}
		else if sender.tag == 1
		{
			introPageViewController?.next()
		}
	}
	
	@objc fileprivate func didChangePage()
	{
		introPageViewController?.pageTo(at: pageControl.currentPage)
	}
}

extension IntroViewController: IntroPageViewControllerDataSource
{
	func introPageViewController(_ pageViewController: IntroPageViewController, numberOfPages pages: Int)
	{
		pageControl.numberOfPages = pages
	}
}

extension IntroViewController: IntroPageViewControllerDelegate
{
	func introPageViewController(_ pageViewController: IntroPageViewController, didChangePageIndex index: Int)
	{
		pageControl.currentPage = index
	}
}
