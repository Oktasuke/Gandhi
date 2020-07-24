//
//  SettingCore.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct SettingState: Equatable {
    public init() {}
}

indirect enum SettingAction: Equatable {
}

struct SettingEnvironment {}


let SettingReducer =
    Reducer<SettingState, SettingAction, SettingEnvironment>{state, action, _ in
        return .none
    }.debugActions(actionFormat: .labelsOnly)

