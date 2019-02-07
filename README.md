# JCPulseAnimator

This framework generates animated waves using trigonometrical functions such as sine, cosine and tangent. You can configure the stroke color, the background color, the frequency in which the graphic is updated. You can even change dynamically colors, line width, and another parameters.

## Why use JCPulseAnimator?
It's extremely easy and the interface it provides makes even more easier to draw pulse animations. The code is well-documented itself, so the learning curve shouldn't be aggressive.

## Requirements
The framework is built for iOS 10.0 and above. It was made at a first level in Swift 3, but since it will be deprecated soon by Apple, it was developed using Swift 4.2.

## Quick Start
There's an example project where you can see (Really and extreme easily, with a few lines of code) how JCPulseAnimator works. Feel free to change values and play with it!

## Installation

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
