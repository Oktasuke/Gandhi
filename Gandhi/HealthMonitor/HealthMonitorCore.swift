//
//  HealthMonitorCore.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct HealthMonitorState: Equatable {
    public init() {}
}

indirect enum HealthMonitorAction: Equatable {
    case addToHealthMonitor
}

struct HealthMonitorEnvironment {}


let healthMonitorReducer =
    Reducer<HealthMonitorState, HealthMonitorAction, HealthMonitorEnvironment>{
        state, action, _ in
        switch action {
        case .addToHealthMonitor :
            return .none
        }
    }.debugActions(actionFormat: .labelsOnly)
