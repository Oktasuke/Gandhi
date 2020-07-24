//
//  AppCore.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import Foundation
import ComposableArchitecture

enum Tab {
    case healthMonitor
    case healthCheck
    case settings
}

public struct AppState: Equatable {
    var selectedTab: Tab = .healthMonitor
}

indirect enum AppAction: Equatable {
    case tabSelected(Tab)
}

public struct AppEnvironment {}

let appReducer: Reducer<AppState, AppAction, AppEnvironment> = Reducer.combine(
    Reducer { state, action, _ in
        switch action {
        case let .tabSelected(tab):
            state.selectedTab = tab
            return .none
        }
    }
)
