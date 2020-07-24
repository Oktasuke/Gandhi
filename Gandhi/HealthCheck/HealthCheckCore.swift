//
//  HealthCheckCore.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct HealthCheckState: Equatable {
    public init() {}
}

indirect enum HealthCheckAction: Equatable {
    case healthCheckStart
    case todaysHealthCheckReady
    case todaysHealthCheckFinished
}

struct HealthCheckEnvironment {}


let healthCheckReducer =
    Reducer<HealthCheckState, HealthCheckAction, HealthCheckEnvironment>{state, action, _ in
        switch action {
        case .healthCheckStart: return .none
        case .todaysHealthCheckFinished: return .none
        case .todaysHealthCheckReady: return .none
        }
    }
        .debugActions(actionFormat: .labelsOnly)
