<p align="center">
  <a href="https://www.zipy.ai/" target="_blank" align="center">
    <img src="https://cdn.prod.website-files.com/60d19df3e49f1bce12e33927/64ddac8c19511387004a5020_Zipy%20Logo%20Vector%20(1).svg" width="280">
  </a>
  <br />
</p>

Zipy SDK for iOS
===========

# ZipyiOS SDK Guide

This guide explains how to implement and use the main features of the ZipyiOS SDK in your iOS application.

## Table of Contents
- [Installation](#installation)
- [Initialization](#initialization)
- [User Identification](#user-identification)
- [Logging](#logging)
- [Session Management](#session-management)
- [Session Control](#session-control)
- [UI Custom Masking](#ui-element-masking)

## Installation

### Swift Package Manager

#### Option 1: Package.swift
Add the following dependency to your `Package.swift`:
```swift
dependencies: [
    .package(url: "https://github.com/zipyinc/zipy-ios.git", from: "1.0.0")
]
```

#### Option 2: Xcode GUI
1. Open your project in Xcode
2. Select File > Add Package Dependencies...
3. In the search field, enter: `https://github.com/zipyinc/zipy-ios.git`
4. Select the version you want to use
5. Click "Add Package"
6. Select your target and click "Add Package" again

> **Note:** Swift Protobuf will be automatically installed as a dependency when you add the zipy-ios package.

## Initialization

For optimal performance and complete session capture, initialize the SDK as early as possible in your app's lifecycle, typically in `AppDelegate` or `SceneDelegate`. While you can integrate the SDK at any point in your application, early initialization ensures the best results and most comprehensive data collection.

### In AppDelegate:
```swift
import ZipyiOS

class AppDelegate: UIResponder, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Initialize Zipy SDK
        Zipy.initialize("YOUR_API_KEY")
        return true
    }
}
```

### In SceneDelegate:
```swift
import ZipyiOS

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // Initialize Zipy SDK
        Zipy.initialize("YOUR_API_KEY")
    }
}
```

## User Identification

### Identify User
Use the `identify` method to associate a user with the session. You can include additional user information:

```swift
import ZipyiOS

// Basic user identification
Task {
    await Zipy.identify(
        externalUUId: "user123",
        userInfo: [
            "email": "user@example.com",
            "firstName": "John",
            "lastName": "Doe",
            "customerName": "ACME Corp"
        ]
    )
}

// With custom fields (up to 10 additional fields)
Task {
    await Zipy.identify(
        externalUUId: "user123",
        userInfo: [
            "email": "user@example.com",
            "firstName": "John",
            "lastName": "Doe",
            "customerName": "ACME Corp",
            "role": "admin",
            "plan": "premium",
            "country": "US"
        ]
    )
}
```

### Anonymize User
To anonymize or disassociate a previously identified user of your application from the session, use the following code in a source file where the user signs out of your application:

```swift
Task {
    await Zipy.anonymize()
}
```

> **Note:** We recommend calling `Zipy.anonymize()` when the user logs out. This ends the current identified session and starts a fresh, anonymous session, ensuring that subsequent activity isn't mistakenly linked to the previous user.

## Logging

### Log Messages
Use different logging methods based on severity:

```swift
import ZipyiOS

// Simple message logging
Zipy.logMessage("User completed onboarding")

// With additional context
Zipy.logMessage(
    "Payment processed",
    exceptionObj: ["amount": 99.99, "currency": "USD"]
)

// With custom message length
Zipy.logMessage(
    "Detailed process log...",
    exceptionObj: ["processId": "12345"],
    maxLength: 2000
)
```

### Log Errors
```swift
// Simple error logging
Zipy.logError("Failed to process payment")

// With error object
let error = NSError(
    domain: "PaymentError",
    code: 401,
    userInfo: [NSLocalizedDescriptionKey: "Invalid card"]
)
Zipy.logError("Payment failed", exceptionObj: error)
```

### Log Exceptions
```swift
// Simple exception logging
Zipy.logException("Unexpected data format")

// With exception details
do {
    // Your code that might throw
} catch {
    Zipy.logException(
        "Data processing failed",
        exceptionObj: error
    )
}
```

## Session Management

### Get Current Session URL
Retrieve the URL for the current session:

```swift
let sessionURL = Zipy.getCurrentSessionURL()
print("Current session can be viewed at: \(sessionURL)")
```

## Session Control

### Pause Recording
Temporarily pause the SDK from capturing events:

```swift
// Pause recording (e.g., before handling sensitive information)
Zipy.pause()

// Your sensitive code here
handleSensitiveData()

// Resume recording
Zipy.resume()
```

### Resume Recording
Resume SDK event capture after pausing:

```swift
Zipy.resume()
```

### Stop Recording
Completely stop the SDK from capturing events:

```swift
Zipy.stop()
```

## UI Element Masking

Zipy's Input Masking feature ensures that all input field data on the screen is automatically masked during session recordings. This powerful feature prevents sensitive information from being visible in the recordings, safeguarding user privacy and maintaining compliance with data security standards.

Key benefits:
- Masks sensitive information to prevent unauthorized viewing
- Automatically protects input fields like passwords and personal data
- Maintains compliance with data security standards
- Ensures user privacy in session recordings

The SDK provides two types of masking:
1. **Automatic Input Masking**: Built-in protection for standard input fields
2. **Custom UI Masking**: Using `ZipyBlock` for additional UI elements

### Using ZipyBlock

You can add a `ZipyBlock` to any `UIView` or its subclasses. When screenshots are captured, the masked elements will appear as black rectangles in the screenshot while remaining fully visible to the user during normal app usage.

#### Basic Usage
```swift
import ZipyiOS

// Create a ZipyBlock on any UIView
let sensitiveView = UIView()
_ = ZipyBlock(on: sensitiveView)
```

#### Masking UI Elements in Code
```swift
// Masking a button
private let maskedButton: UIButton = {
    let button = UIButton(type: .system)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.setTitle("Masked Button", for: .normal)
    _ = ZipyBlock(on: button) // This will mask the button in screenshots
    return button
}()

// Masking a text field
private let sensitiveTextField: UITextField = {
    let textField = UITextField()
    textField.placeholder = "Sensitive Information"
    textField.translatesAutoresizingMaskIntoConstraints = false
    _ = ZipyBlock(on: textField) // This will mask the text field in screenshots
    return textField
}()
```

#### Masking Elements in Interface Builder
```swift
class CustomView: UIView {
    @IBOutlet weak var sensitiveLabel: UILabel! {
        didSet {
            _ = ZipyBlock(on: sensitiveLabel)
        }
    }
}
```

#### Dynamic Masking
```swift
class PaymentViewController: UIViewController {
    private let cardNumberField: UITextField = {
        let field = UITextField()
        field.placeholder = "Card Number"
        return field
    }()
    
    private var maskBlock: ZipyBlock?
    
    func toggleMasking(isEnabled: Bool) {
        if isEnabled {
            // Add masking
            maskBlock = ZipyBlock(on: cardNumberField)
        } else {
            // Remove masking
            maskBlock?.removeFromSuperview()
            maskBlock = nil
        }
    }
}
```

### Best Practices for UI Masking

1. **Selective Masking**
   - Only mask elements containing sensitive information
   - Consider masking elements that display personal or financial data
   - Use masking for security-critical UI components

2. **Performance**
   - Apply masks only when necessary
   - Remove masks when they're no longer needed
   - Avoid excessive use of masking as it can impact memory usage

3. **User Experience**
   - Ensure masked elements remain fully functional
   - Consider indicating to users which elements are being masked
   - Use masking consistently across similar types of sensitive information

4. **Security**
   - Always mask sensitive input fields like passwords and PINs
   - Consider masking personal information displays
   - Mask financial information and account numbers

### Example Implementation

Here's a complete example showing how to implement UI masking in a payment form:

```swift
import UIKit
import ZipyiOS

class PaymentFormViewController: UIViewController {
    private let cardNumberField: UITextField = {
        let field = UITextField()
        field.placeholder = "Card Number"
        field.translatesAutoresizingMaskIntoConstraints = false
        _ = ZipyBlock(on: field) // Mask card number
        return field
    }()
    
    private let cvvField: UITextField = {
        let field = UITextField()
        field.placeholder = "CVV"
        field.translatesAutoresizingMaskIntoConstraints = false
        _ = ZipyBlock(on: field) // Mask CVV
        return field
    }()
    
    private let balanceLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        _ = ZipyBlock(on: label) // Mask balance amount
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    
    private func setupUI() {
        view.addSubview(cardNumberField)
        view.addSubview(cvvField)
        view.addSubview(balanceLabel)
        
        NSLayoutConstraint.activate([
            cardNumberField.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            cardNumberField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cardNumberField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            cvvField.topAnchor.constraint(equalTo: cardNumberField.bottomAnchor, constant: 20),
            cvvField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            cvvField.widthAnchor.constraint(equalToConstant: 100),
            
            balanceLabel.topAnchor.constraint(equalTo: cvvField.bottomAnchor, constant: 20),
            balanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            balanceLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
    }
}
```

## Best Practices

1. **Initialization**
   - Initialize the SDK as early as possible
   - Ensure API key is valid

2. **User Identification**
   - Identify users after successful authentication
   - Include relevant user information
   - Anonymize when user logs out

3. **Logging**
   - Use appropriate log levels
   - Include relevant context
   - Don't log sensitive information
   - Keep log messages concise

4. **Session Management**
   - Handle session URLs securely
   - Store session IDs if needed for reference
   - Monitor session timeouts

5. **Privacy**
   - Use pause/resume around sensitive operations
   - Don't log personal identifiable information (PII)
   - Follow data protection regulations


## Support

For issues, feature requests, or questions:
- Create an issue in the GitHub repository
- Contact our support team at support@zipy.ai
- Check the documentation for updates 