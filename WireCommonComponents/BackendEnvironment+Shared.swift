//
// Wire
// Copyright (C) 2018 Wire Swiss GmbH
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

import Foundation
import WireTransport

extension BackendEnvironment {
    
    public static let backendSwitchNotification = Notification.Name("backendEnvironmentSwitchNotification")
    
    public static var shared: BackendEnvironment = {
        let bundle = Bundle.backendBundle
        guard let environment = BackendEnvironment(userDefaults: .standard, configurationBundle: .backendBundle) else { fatalError("Malformed backend configuration data") }
        return environment
        }() {
        didSet {
            shared.save(in: .standard)
            NotificationCenter.default.post(name: backendSwitchNotification, object: shared)
        }
    }
}
