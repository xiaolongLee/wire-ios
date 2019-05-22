//
// Wire
// Copyright (C) 2019 Wire Swiss GmbH
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program. If not, see http://www.gnu.org/licenses/.
//

import XCTest
@testable import Wire

///TODO: enable snapshot test after develop branch is merged
final class UIViewController_LegalHoldAlertSnapshotTests: ZMSnapshotTestCase {
    
    var sut: UIAlertController!
    var mockViewContoller: UIViewController!
    
    override func setUp() {
        super.setUp()
        mockViewContoller = UIViewController()
        sut = mockViewContoller.presentLegalHoldDeactivatedAlert(animated: false)

        addUIInterruptionMonitor(withDescription: "System Dialog") {
            (alert) -> Bool in
            let button = alert.buttons.element(boundBy: 1)
            if button.exists {
                button.tap()
            }
            return true
        }
    }
    
    override func tearDown() {
        sut = nil
        mockViewContoller = nil
        super.tearDown()
    }

    func DISABLE_testForLegalHoldAlert(){
        verifyAlertController(sut)
    }
}
