
//
//  HealthDataCore.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/25.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import Foundation
import ComposableArchitecture

struct HealthDataState: Equatable {
    let healthDatum: HealthDatum
    
    public init(healthDatum: HealthDatum){
        self.healthDatum = healthDatum
        
    }
}

enum HealthDataAction: Equatable {
    case rowClicked(HealthDatum)
}

struct HealthDataEnvironment {}

let healthDataReducer =
    Reducer<HealthDataState, HealthDataAction, HealthDataEnvironment> { state, action, _ in
        switch action {
        case let .rowClicked(HealthDatum):
            print(HealthDatum.type)
        }
        return .none
    }.debugActions(actionFormat: .labelsOnly)

extension HealthDataState {
    var view: BarChartRowView.ViewState {
        BarChartRowView.ViewState(title: self.healthDatum.type.label, points: self.healthDatum.points)
    }
}

extension HealthDataAction {
    static func view(_ viewAction: BarChartRowView.ViewAction) -> Self {
        switch viewAction {
        case let .rowClicked(healthDatum):
            return .rowClicked(healthDatum)
        }
    }
}
