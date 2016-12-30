# MySampleProject

This is a template for an iOS project set up by myself. Feel free to modify it to your need.

# Project Structures

SampleProject
  + Common
    + Constants
    + Extensions
    + Libs
    + Managers
    + Models
    + Utils
    + Wrappers
  + Scenes
  + AppDelegate
  + SampleProject-Bridging-Header
  
SampleProjectUITests

SampleProjectTests

# 3rd-party Libs/Framework Included

+ [AFNetworking](https://github.com/AFNetworking/AFNetworking)
+ [CocoaLumberjack/Swift](https://github.com/CocoaLumberjack/CocoaLumberjack)
+ [Localize-Swift](https://github.com/marmelroy/Localize-Swift)
+ [PureLayout](https://github.com/PureLayout/PureLayout)
+ [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
+ [ReachabilitySwift](https://github.com/ashleymills/Reachability.swift)
+ [RealmSwift](https://github.com/realm/realm-cocoa)


# How To Use
● To build this project, you need Cocoapod installed on your Mac. In case you dont have it, pleaase open Terminal and type below command:
> $ sudo gem install cocoapods

● After Cocoapods installed, use terminal to navigate to SampleProject folder which contains Podfile and type below command into terminal
> $ pod install 

● After cloning dependencies process completed, use Xcode to open SampleProject.xcworkspace and build
