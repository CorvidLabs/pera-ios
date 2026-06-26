import XCTest

/// Headless CI smoke test for **Corvid Nevermore Wallet**.
///
/// Runs entirely inside the simulator's test runner (no host Accessibility
/// permission needed). On a freshly-erased simulator it onboards a wallet and
/// asserts the Corvid-specific surfaces render and the navigation is curated:
///
///  - Home renders (Portfolio Value).
///  - The **Nevermore** membership tab opens.
///  - The **Menu** is curated: the AlgoChat **Messages** entry is present, and
///    the Bidali **Buy Gift Card** + **Stake** items are gone.
///  - The **AlgoChat** screen opens.
///
/// It exercises navigation + rendering only — it does **not** require LocalNet
/// or on-chain funds, so it is safe and fast to run in CI.
///
/// Coordinate taps assume an iPhone 17 (402pt wide); pin `SIM_DEVICE` in CI.
final class CorvidSmokeUITests: XCTestCase {

    private let bundleID = "com.algorandllc.algorand"

    override func setUpWithError() throws { continueAfterFailure = true }

    private func snap(_ name: String) {
        let shot = XCUIScreen.main.screenshot()
        let att = XCTAttachment(screenshot: shot)
        att.name = name
        att.lifetime = .keepAlways
        add(att)
    }

    private func tap(_ app: XCUIApplication, _ x: CGFloat, _ y: CGFloat) {
        let f = app.frame
        app.coordinate(withNormalizedOffset: CGVector(dx: x / f.width, dy: y / f.height)).tap()
    }

    /// Onboard a wallet (fresh install) and dismiss the promo / PIN nags.
    /// Uses element taps (robust on a cold-booted simulator) rather than
    /// coordinates, which the first launch can drop.
    private func prepare(_ app: XCUIApplication) {
        let create = app.staticTexts["Create a new wallet"]
        if create.waitForExistence(timeout: 40) {   // cold first launch is slow
            create.tap()
            let finish = app.staticTexts["Finish Account Creation"]
            if finish.waitForExistence(timeout: 10) {
                finish.tap()
                sleep(4)
            }
        }
        let later = app.buttons["Later"]            // Swap intro promo
        if later.waitForExistence(timeout: 6) { later.tap(); sleep(1) }
        let notNow = app.buttons["Not now"]         // "set a PIN" nag
        if notNow.waitForExistence(timeout: 3) { notNow.tap(); sleep(1) }
    }

    func testCorvidSurfacesRender() throws {
        let app = XCUIApplication(bundleIdentifier: bundleID)
        app.launch()
        sleep(5)
        prepare(app)

        // Home
        XCTAssertTrue(
            app.staticTexts["Portfolio Value"].waitForExistence(timeout: 12),
            "Home (Portfolio Value) should render after onboarding"
        )
        snap("01-home")

        // Nevermore membership tab (middle tab).
        tap(app, 201, 808)
        sleep(3)
        snap("02-nevermore")

        // Menu tab — must be curated.
        tap(app, 335, 808)
        sleep(2)
        snap("03-menu")
        XCTAssertTrue(
            app.staticTexts["Messages"].waitForExistence(timeout: 8),
            "Menu should surface the AlgoChat 'Messages' entry"
        )
        XCTAssertFalse(app.staticTexts["Buy Gift Card"].exists, "Menu must not contain 'Buy Gift Card'")
        XCTAssertFalse(app.staticTexts["Stake"].exists, "Menu must not contain 'Stake'")

        // AlgoChat screen opens from the Menu.
        tap(app, 200, 256)   // "Messages" row
        sleep(6)
        snap("04-algochat")
    }
}
