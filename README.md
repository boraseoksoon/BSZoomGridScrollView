# BSZoomGridScrollView

[![CI Status](https://img.shields.io/travis/boraseoksoon/BSZoomGridScrollView.svg?style=flat)](https://travis-ci.org/boraseoksoon/BSZoomGridScrollView)
[![Version](https://img.shields.io/cocoapods/v/BSZoomGridScrollView.svg?style=flat)](https://cocoapods.org/pods/BSZoomGridScrollView)
[![License](https://img.shields.io/cocoapods/l/BSZoomGridScrollView.svg?style=flat)](https://cocoapods.org/pods/BSZoomGridScrollView)
[![Platform](https://img.shields.io/cocoapods/p/BSZoomGridScrollView.svg?style=flat)](https://cocoapods.org/pods/BSZoomGridScrollView)

BSZoomGridScrollView is a powerful, pure swift iOS UI framework that provides the awesome grid scrollview containing your image array that are able to zoom, tracking your touch area.<br>

## Features

- [x] Designed for SwiftUI, SwiftUI 100% support.
- [x] Grid ScrollView is there for you out of box.
- [x] Tracking user touch area on the grid scrollview out of box.
- [x] Return selected image by long press, pan gesture out of box. 
- [x] Grid UI configuration.

<img src="https://firebasestorage.googleapis.com/v0/b/boraseoksoon-ff7d3.appspot.com/o/BSZoomGridScrollView%2FBSZoomGridScrollView.png?alt=media&token=062257fc-2aeb-498f-aa33-b179f5e1656b" width=240>
<br>

<img src="https://firebasestorage.googleapis.com/v0/b/boraseoksoon-ff7d3.appspot.com/o/BSZoomGridScrollView%2FBSZoomGridScrollView01.png?alt=media&token=87df0d09-2f66-4f95-85ec-acc1e55e5435" width=240>
<br>

<img src="https://firebasestorage.googleapis.com/v0/b/boraseoksoon-ff7d3.appspot.com/o/BSZoomGridScrollView%2FBSZoomGridScrollView02.png?alt=media&token=2af6a309-dd1b-4aa5-a63e-10900011681f" width=240>
<br>


Youtube video URL Link for how it works: <br>
[link0](https://youtu.be/QTB7GqZL-L8)

<br>

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

- iOS 13.0 or later
- Swift 5.0 or later
- Xcode 11.0 or later

## How To Use: 
* SwiftUI

```Swift
import SwiftUI

/// 🥳 # Step1: let's import!
import BSZoomGridScrollView

struct ContentView: View {
    @State var showSelectedImageView = false
    @State var selectedImage: UIImage?
    
    var imagesToZoom: [UIImage] = {
        var images = [UIImage]()
        for i in 0...29 {
            images.append(UIImage(named: "s\(i)") ?? UIImage())
        }
        return images
    }()

    var body: some View {
        /// 😊 # Step2. That's it. completed!
        BSZoomGridScrollView(imagesToZoom: imagesToZoom,
                             powerOfZoomBounce: .regular,
                             numberOfColumns: 200,
                             numberOfRows: 10,
                             didLongPressItem: { selectedImage in
                                print("on long press : ", selectedImage)
                                /// Grab an image user end up choosing.
                                self.selectedImage = selectedImage
                                
                                /// Present!
                                self.showSelectedImageView.toggle()
                             },
                             didFinishDraggingOnItem: { selectedImage in
                                print("on drag finish : ", selectedImage)
        })
        .edgesIgnoringSafeArea(.all)
        .sheet(isPresented:self.$showSelectedImageView) {
            /// The example view showing a picked up image.
            ShowingSelectedImageView(selectedImage: self.selectedImage)
        }
    }
}
```

* UIKit
```
import SwiftUI
import UIKit

///
// 😚 #Step1: import BSZoomGridScrollView!
///
import BSZoomGridScrollView

class ViewController: UIViewController {
    
    ///
    // 😋 #Step2: declare BSZoomGridScrollView
    ///
    private lazy var zoomGridScrollViewController: BSZoomGridScrollViewController = { [unowned self] in
        ///
        /// It can be used on both SwiftUI and UIKit.
        /// To see how it works on SwiftUI,
        /// please refer to comments in SwiftUI directory -> ContentView.swift
        ///
        return BSZoomGridScrollViewController(imagesToZoom: imagesToZoom,
                                              powerOfZoomBounce: .crazy,
                                              numberOfColumns: 70,
                                              numberOfRows: 25,
                                              didLongPressItem: { selectedImage in
                                                print("on long press : ", selectedImage)
                                                /// Grab an image user end up choosing.
                                              },
                                              didFinishDraggingOnItem: { selectedImage in
                                                print("on drag finish : ", selectedImage)
                                              })
    }()
    
    ///
    // prepare any image array to feed to BSZoomGridScrollViewController.
    ///
    private var imagesToZoom: [UIImage] = {
        var images = [UIImage]()
        for i in 0...29 {
            images.append(UIImage(named: "s\(i)") ?? UIImage())
        }
        return images
    }()
    
    ///
    // 😁 #Step3: Present it!
    ///
    @IBAction func goToBSZoomGridScrollView(_ sender: Any) {
        ///
        // 😎 That's all. well done.
        ///
        self.present(zoomGridScrollViewController,
                     animated: true,
                     completion: nil)
    }
    
    ///
    // MARK: - ViewController LifeCycle Methods
    ///
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

```

## Installation

There are four ways to use BSZoomGridScrollView in your project:
- using CocoaPods
- using Swift Package Manager
- manual install (build frameworks or embed Xcode Project)

### Installation with CocoaPods

[CocoaPods](http://cocoapods.org/) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries in your projects. See the [Get Started](http://cocoapods.org/#get_started) section for more details.

#### Podfile
```ruby
pod 'BSZoomGridScrollView'
```

### Installation with Swift Package Manager (Xcode 11+)

[Swift Package Manager](https://swift.org/package-manager/) (SwiftPM) is a tool for managing the distribution of Swift code as well as C-family dependency. From Xcode 11, SwiftPM got natively integrated with Xcode.

BSZoomGridScrollView support SwiftPM from version 5.1.0. To use SwiftPM, you should use Xcode 11 to open your project. Click `File` -> `Swift Packages` -> `Add Package Dependency`, enter [BSZoomGridScrollView repo's URL](https://github.com/BSZoomGridScrollView/BSZoomGridScrollView.git). Or you can login Xcode with your GitHub account and just type `BSZoomGridScrollView` to search.

After select the package, you can choose the dependency type (tagged version, branch or commit). Then Xcode will setup all the stuff for you.

If you're a framework author and use BSZoomGridScrollView as a dependency, update your `Package.swift` file:

```swift
let package = Package(
    dependencies: [
        .package(url: "https://github.com/BSZoomGridScrollView/BSZoomGridScrollView.git", from: "0.1.1")
    ],
    // ...
)
```

## Author

boraseoksoon@gmail.com

## License

BSZoomGridScrollView is available under the MIT license. See the LICENSE file for more info.

