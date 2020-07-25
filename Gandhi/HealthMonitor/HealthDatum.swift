//
//  HealthData.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import Foundation

public enum HealthDatumType: Equatable {
    case steps
    case sleepingTime
    
    public var label: String {
        switch self {
        case .steps: return "歩数"
        case .sleepingTime: return "睡眠時間"
        }
    }
}

struct HealthDatum: Equatable, Identifiable {
    let id: Int
    let type: HealthDatumType
    let points: [Double]
}
