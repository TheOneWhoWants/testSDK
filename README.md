# ADShift - SDK

[![SPM Compatible](https://img.shields.io/badge/SPM-compatible-brightgreen.svg)](https://swift.org/package-manager)

# Table Of Contents

1. [Installation](#Installation)
1. [Integration](#Integration)
1. [Consents][#Consents)
1. [Deeplinking](#Deeplinking)
1. [SKAN Postback](#SKAN)
1. [Usage](#Usage)
1. [Support](#support)

[Cocoapods](#pods)

## [Installation](#Installation)

##### Swift Package Manager - SPM

The [Swift Package Manager](https://swift.org/package-manager/) is Swift's native dependency management tool, built directly into the `swift` compiler. To integrate ADShift into your project:

To install the SDK into your project, navigate to "File" -> "Add Package Dependencies" and use this link:

```swift
https://github.com/adshift/adshift-swift.git
```

After setting up your Swift package, simply add GrowthBook to the `dependencies` section in your `Package.swift` file:

```swift
dependencies: [
    .package(url: "https://github.com/adshift/adshift-swift.git")
]
```

## [Integration](#Integration)
note::: Configure your Adshift Api Key in `didFinishLaunchingWithOptions`.

To integrate the ADShift SDK, simply call the `setApiKey` method with your unique API key.

```swift
Adshift.shared.setApiKey(apiKey: "[YOUR_API_KEY]")
```

Set a unique User ID if there is one:
```swift
Adshift.shared.setCustomerUserId(userId: "[USER_ID]")
```

Use `start` command to start running 
```swift 
Adshift.shared.start()
```

## [Consents][#Consents)

[More information here](https://developer.apple.com/documentation/bundleresources/information-property-list/nsusertrackingusagedescription)
Manually set given consents 
```swift
Adshift.shared.setConsentData(newConsent: AdShiftConsent.forGDPRUser(
    hasConsentForDataUsage: true,
    hasConsentForAdsPersonalization: true,
    hasConsentForAdStorage: true)
)
```

## [Deeplinking](#Deeplinking)

#### Sets a callback to handle any incoming deeplink response that was sent to the backend.
```swift
Adshift.shared.onDeeplinkReceived { response in
    // Your response handling
}
```

#### Handles a received deeplink and notifies all registered listeners via `onDeeplinkReceived`.
```swift
func setDeeplinkListener(url: URL)
```

## [SKAN Postback](#SKAN)

To configure direct install postbacks, add Adjust’s callback URL to your Info.plist file:

    1. In Xcode, open the Info.plist file from the Project Navigator.
    2. Click the Add button next to any key in the property list editor and press Return.
    3. Set the key name to: `NSAdvertisingAttributionReportEndpoint`
    4. Change the type to String.
    5. Set the value to: 
    
```swift
https://adjust-skadnetwork.com
```


## [Usage](#Usage)

#### `func isStarted() -> Bool`
Returns `true` if the SDK has already been started.

#### `func start(onStart: (() -> Void)? = nil)`
Starts the SDK if a valid API key is set. Calls `onStart` closure if provided.

#### `func stop(onStop: (() -> Void)? = nil)`
Stops the SDK. Calls `onStop` closure if provided.

#### `func setCustomerUserId(_ userId: String)`
Associates a custom user ID with all future tracked events.

#### `func trackPurchase(productId: String, price: Double, currency: String, token: String)`
Sends a purchase event to the backend with price, currency, and token metadata.

#### `func setConsentData(newConsent: AdShiftConsent)`
Stores user consent settings within the SDK for compliant tracking.


#### `func setApiKey(apiKey: String)`
Sets the API key to initialize the SDK. Triggers deferred deep link resolution.

#### `func setLogLevel(_ logLevel: LoggerLevel)`
Sets the desired verbosity level of SDK logs (`debug`, `info`, `warning`, `error`).

#### `func trackEvent(eventName: ASInAppEventType)`
Tracks a general in-app event like `login`, `signup`, or custom events.


## [Support](#support)
