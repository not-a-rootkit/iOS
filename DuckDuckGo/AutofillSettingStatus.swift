//
//  AutofillSettingStatus.swift
//  DuckDuckGo
//
//  Copyright © 2023 DuckDuckGo. All rights reserved.
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//  http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

import Foundation
import LocalAuthentication

struct AutofillSettingStatus {

    static let appSettings = AppDependencyProvider.shared.appSettings

    static var isAutofillEnabledInSettings: Bool {
        let context = LAContext()
        var error: NSError?
        let canAuthenticate = context.canEvaluatePolicy(.deviceOwnerAuthentication, error: &error)
        return appSettings.autofillCredentialsEnabled && canAuthenticate
    }

    static var defaultState: String {
        return appSettings.autofillCredentialsHasBeenEnabledAutomaticallyIfNecessary ? "on" : "off"
    }
}
