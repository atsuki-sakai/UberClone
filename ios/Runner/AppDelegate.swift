import UIKit
import Flutter
import GoogleMaps

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    GeneratedPluginRegistrant.register(with: self)
    // Androidのkeyでよい
    GMSServices.provideAPIKey("AIzaSyBYxhdnLgAha8_oJgsjSq4PdCabx30LYfc")
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
