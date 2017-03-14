# SwiftPageViewController
Introduction work through with UIPageViewController

Preview
------
<div style="display: inline-block;">
<img src="https://github.com/warumono-for-develop/SwiftPageViewController/blob/master/SwiftPageViewController/SwiftPageViewController/ScreenShot-First.png" width="165px;">
<img src="https://github.com/warumono-for-develop/SwiftPageViewController/blob/master/SwiftPageViewController/SwiftPageViewController/ScreenShot-1.png" width="165px;">
<img src="https://github.com/warumono-for-develop/SwiftPageViewController/blob/master/SwiftPageViewController/SwiftPageViewController/ScreenShot-2.png" width="165px;">
<img src="https://github.com/warumono-for-develop/SwiftPageViewController/blob/master/SwiftPageViewController/SwiftPageViewController/ScreenShot-3.png" width="165px;"><img src="https://github.com/warumono-for-develop/SwiftPageViewController/blob/master/SwiftPageViewController/SwiftPageViewController/ScreenShot-Last.png" width="165px;">
</div>

Requirements
------
Running in
+ iOS 8.0+
+ Xcode 8.1+
+ Swift 3.0+

Latest Update
------
+ 1.0 (Feb 27, 2017)

Data Source
------
```swift
func introPageViewController(_ pageViewController: IntroPageViewController, numberOfPages pages: Int)
```

Delegate
------
```swift
func introPageViewController(_ pageViewController: IntroPageViewController, didChangePageIndex index: Int)
```

Usage
------
#### Content
Drag & Drop `UIVIewController` into Storyboard

#### Identifier
Enter `Storyboard ID` of UIVIewController in Identity Inspector

Author
------
**warumono** - <warumono.for.develop@gmail.com>

License
------
**SwiftPageViewController** is available under the MIT license. See the LICENSE file for more info.
