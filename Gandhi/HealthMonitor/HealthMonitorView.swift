//
//  HealthMonitorView.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import SwiftUI
import SwiftUICharts
import ComposableArchitecture
import QGrid

struct HealthMonitorView: View {
    struct ViewState: Equatable {
        var editMode: Bool
    }
    let store: Store<HealthMonitorState, HealthMonitorAction>
    var body: some View {
        WithViewStore(self.store) { viewStore in
            List(viewStore.healthData) { healthDatum in
                Text(healthDatum.type.label)
                BarChartView(data: ChartData(points: healthDatum.points), title: "Title", legend: "Legendary")
            }
        }
    }
}


struct Cell: View {
    var data: HealthDatum
    var body: some View {
        HStack {
            VStack(alignment: .center) {
                Text(self.data.type.label)
            }
        }
    }
}

struct HealthMonitorView_Previews: PreviewProvider {
    static var previews: some View {
        HealthMonitorView(
            store: Store<HealthMonitorState, HealthMonitorAction>(
                initialState: HealthMonitorState(healthData:
                    [
                        HealthDatum(id: 1, type: .sleepingTime, points: [23,4,124,5,324,5,463,45,363]),
                        HealthDatum(id: 2, type: .steps, points: [23214,14124,123412,23123,2131, 88990])
                    ]
                ),
                reducer: healthMonitorReducer,
                environment: HealthMonitorEnvironment()
            )
        )
    }
}
