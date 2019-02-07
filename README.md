# JCPulseAnimator 
## [Open Pull Requests, Come and Contribute!]

[![Maintenance](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://GitHub.com/Naereen/StrapDown.js/graphs/commit-activity) [![Generic badge](https://img.shields.io/badge/License-MIT-green.svg)](https://github.com/jmcur/JCPulseAnimator/blob/master/LICENSE) 
[![Generic badge](https://img.shields.io/badge/Release-0.0.6-green.svg)](https://github.com/jmcur/JCPulseAnimator/releases) ![Generic badge](https://img.shields.io/badge/Cocoapods-Yes-green.svg) ![Generic badge](https://img.shields.io/badge/Carthage-No-red.svg)

This framework generates animated waves using trigonometrical functions such as sine, cosine and tangent. You can configure the stroke color, the background color, the frequency in which the graphic is updated. You can even change dynamically colors, line width, and another parameters.

## Table of Contents
[● Why use JCPulseAnimator](https://github.com/jmcur/JCPulseAnimator#why-use-jcpulseanimator)  
[● Requirements](https://github.com/jmcur/JCPulseAnimator#requirements)  
[● Features](https://github.com/jmcur/JCPulseAnimator#features)  
[● Quick Start](https://github.com/jmcur/JCPulseAnimator#quick-start)  
[● Installation](https://github.com/jmcur/JCPulseAnimator#installation)  
[● Usage](https://github.com/jmcur/JCPulseAnimator#usage)  
[● Changelog](https://github.com/jmcur/JCPulseAnimator#changelog)  
[● Contribution](https://github.com/jmcur/JCPulseAnimator#contribution)  
[● Team](https://github.com/jmcur/JCPulseAnimator#team)  

## Why use JCPulseAnimator?
It's extremely easy and the interface it provides makes even more easier to draw pulse animations. The code is well-documented itself, so the learning curve shouldn't be aggressive.

## Requirements
The framework is built for iOS 10.0 and above. It was made at a first level in Swift 3, but since it will be deprecated soon by Apple, it was developed using Swift 4.2.

## Features
- [X] Animated Waves
- [X] Option for the animation to start and stop manually.
- [X] Different waves according to the trigonometrical functions sin, cos and tan.
- [ ] Different waves according to the inverse trigonometrical functions arcsin, arccos and arctan.
- [X] Change degrees of the graph dynamically.
- [X] Ability to change the trigonometrical function dynamically.
- [X] Add colors to background or line (Static or with animation).
- [X] Change graph line width (Static or with animation).

## Quick Start
There's an example project where you can see (Really and extreme easily, with a few lines of code) how JCPulseAnimator works. Feel free to change values and play with it!

## Installation

### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```

To integrate JCPulseAnimator into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/CocoaPods/Specs.git'
source 'https://github.com/jmcur/JCPulseAnimator.git'
platform :ios, '10.0'
use_frameworks!

target '<Your Target Name>' do
  pod 'JCPulseAnimator', '~> 0.0.6'
end
```

Then, run the following command:

```bash
$ pod install
```
## Usage

### Quick Start

```swift
import JCPulseAnimator

class ViewController: UIViewController {

    var pulseView: JCPulseView?

    override func viewDidLoad() {
        super.viewDidLoad()

          pulseView = JCPulseView(withWaveType: JCWaveType.Cos, degrees: JCWaveDegrees.positive360, strokeColor: .green, fillColor: nil, lineWidth: 3.0)

          pulseView?.changePulseFrequency(withValue: 30)

          self.view.addSubview(pulseView!)
        
          NSLayoutConstraint(item: pulseView!, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 150).isActive = true
          NSLayoutConstraint(item: pulseView!, attribute: .left, relatedBy: .equal, toItem: self.view, attribute: .left, multiplier: 1, constant: 0).isActive = true
          NSLayoutConstraint(item: pulseView!, attribute: .right, relatedBy: .equal, toItem: self.view, attribute: .right, multiplier: 1, constant: 0).isActive = true
          NSLayoutConstraint(item: pulseView!, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1.0, constant: 0).isActive = true
    }

}
```

## Changelog
 - Version 0.0.6: Working library, with the ability to start and stop the animation. To change fill's and stroke's colors as well as the line width. Also the line is now configurable with sin, cos and tan, and also the degrees to calculate the wave frequency. Now you can also change the wave type (sin, cos or tan) dynamically, so your pulse animation can be customized and unique.
 
## Contribution
We'd love for you to contribute to JCPulseAnimator. Read the ``License``, and start with pull requests, we wait for you!

## Team
The current working team for JCPulseAnimator is:
 - [Juan Curti](https://github.com/jmcur)

Feel free to report any issues!
