#!/bin/bash

## Currently a bug introduced in Xcode 15.2 unresolved where the visionOS destination will use the iOS base SDK.
## Workaround available here: https://developer.apple.com/documentation/xcode-release-notes/xcode-15_2-release-notes
## This build script will fail unless workaround is applied.

xcodebuild -downloadPlatform visionOS

xcodebuild archive \
    -scheme Adshift-iOS \
    -archivePath "./build/ios.xcarchive" \
    -destination "generic/platform=iOS" \
    SKIP_INSTALL=NO \

xcodebuild archive \
    -scheme Adshift-iOS \
    -archivePath "./build/ios_sim.xcarchive" \
    -destination "generic/platform=iOS Simulator" \
    SKIP_INSTALL=NO \



xcodebuild -create-xcframework \
    -framework "./build/ios.xcarchive/Products/Library/Frameworks/Adshift-iOS.framework" \
    -framework "./build/ios_sim.xcarchive/Products/Library/Frameworks/Adshift-iOS.framework" \
    -output "./build/Adshift-iOS.xcframework"
 
