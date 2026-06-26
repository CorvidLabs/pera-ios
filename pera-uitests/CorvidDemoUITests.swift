import XCTest

/// Drives the Corvid Nevermore Wallet on LocalNet headlessly (no host
/// Accessibility needed — XCUITest runs inside the simulator).
final class CorvidDemoUITests: XCTestCase {

    private let bundleID = "com.algorandllc.algorand"

    override func setUpWithError() throws {
        continueAfterFailure = true
    }

    private func snap(_ name: String) {
        let shot = XCUIScreen.main.screenshot()
        let att = XCTAttachment(screenshot: shot)
        att.name = name
        att.lifetime = .keepAlways
        add(att)
    }

    /// Dismiss any "intro" promo sheet (Swap intro, etc.) if present.
    private func dismissPromos(_ app: XCUIApplication) {
        for label in ["Later", "Not now", "Got it", "Maybe later"] {
            let b = app.buttons[label]
            if b.waitForExistence(timeout: 1) && b.isHittable {
                b.tap()
                sleep(1)
            }
        }
    }

    private func tapFirst(_ app: XCUIApplication, labels: [String], timeout: TimeInterval = 4) -> Bool {
        for label in labels {
            let b = app.buttons[label]
            if b.waitForExistence(timeout: timeout) && b.isHittable {
                b.tap()
                return true
            }
        }
        return false
    }

    func testTour() throws {
        let app = XCUIApplication(bundleIdentifier: bundleID)
        app.launch()
        sleep(5)
        dismissPromos(app)
        snap("01-home")

        // Discovery: dump the element tree so we can wire later flows.
        print("HIERARCHY-START")
        print(app.debugDescription)
        print("HIERARCHY-END")

        // Nevermore tab (custom tab bar — try button + tab bar queries).
        var openedNevermore = tapFirst(app, labels: ["NFTs", "Nevermore", "Collectibles"])
        if !openedNevermore {
            let tb = app.tabBars.buttons.element(boundBy: 1)
            if tb.waitForExistence(timeout: 3) { tb.tap(); openedNevermore = true }
        }
        sleep(2)
        snap("02-nevermore")

        // Menu tab.
        if !tapFirst(app, labels: ["Menu"]) {
            let tb = app.tabBars.buttons.element(boundBy: 2)
            if tb.waitForExistence(timeout: 3) { tb.tap() }
        }
        sleep(2)
        snap("03-menu")

        // Back to Home.
        _ = tapFirst(app, labels: ["Home"])
        sleep(1)
        snap("04-home-again")
    }
}
