//
//  BarChartRowView.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/25.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import SwiftUI
import ComposableArchitecture
import SwiftUICharts

struct BarChartRowView: View {
    struct ViewState: Equatable {
        var title: String
        var points: [Double]
    }
    
    enum ViewAction {
        case rowClicked(HealthDatum)
    }
    
    let store: Store<HealthDataState, HealthDataAction>
    
    public init(store: Store<HealthDataState, HealthDataAction>) {
        self.store = store
    }
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            HStack {
                Text(viewStore.healthDatum.type.label)
                BarChartView(data: ChartData(points: viewStore.healthDatum.points), title: "Title", legend: "Legendary") // legend is optional
            }
        }
    }
}

struct BarChartRowView_Previews: PreviewProvider {
    static var previews: some View {
        BarChartRowView(
            store: Store<HealthDataState, HealthDataAction>(
                initialState: .init(healthDatum: HealthDatum(id: 1, type: HealthDatumType.sleepingTime, points: [90,100,20,23,34,61,21,10])),
                reducer: healthDataReducer,
                environment: HealthDataEnvironment()
        ))
    }
}
