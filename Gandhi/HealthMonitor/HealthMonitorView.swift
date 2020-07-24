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
        NavigationView {
            VStack(alignment: .center, spacing: CGFloat(0)){
                HStack {
                    BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Title", style: Styles.barChartStyleOrangeLight, form: ChartForm.medium)
                    VStack {
                        BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Title", style: Styles.barChartStyleOrangeLight, form: ChartForm.small)
                        BarChartView(data: ChartData(points: [8,23,54,32,12,37,7,23,43]), title: "Title", style: Styles.barChartStyleOrangeLight, form: ChartForm.small)
                    }
                }
                LineView(data: [8,23,54,32,12,37,7,23,43], title: "Line chart", legend: "Full screen").padding()
            }
            .navigationBarTitle("SwiftUI", displayMode: .inline)
        }
    }
}

struct HealthMonitorView_Previews: PreviewProvider {
    static var previews: some View {
        HealthMonitorView(
            store: Store<HealthMonitorState, HealthMonitorAction>(
                initialState: .init(),
                reducer: healthMonitorReducer,
                environment: HealthMonitorEnvironment()
            )
        )
    }
}
