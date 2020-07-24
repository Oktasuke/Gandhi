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
    case unknow
    
    public var label: String {
        switch self {
        case .steps: return "歩数"
        case .sleepingTime: return "睡眠時間"
        default: return "不明"
        }
    }
}

struct HealthDatum: Equatable {
    var type: HealthDatumType = .unknow
    var points: [Int] = []
}
