// This module re-exports ZipyiOS and SwiftProtobuf for convenience
@_exported import ZipyiOS
@_exported import SwiftProtobuf

// Add any additional convenience APIs here if needed
public enum ZipyiOSWrapper {
    public static var version: String {
        return "0.0.9"  // Match this with your current version
    }
} 