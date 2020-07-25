//
//  ContentView.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import SwiftUI
import SwiftUICharts
import ComposableArchitecture

struct AppView: View {
    let store: Store<AppState, AppAction>
    
    var body: some View {
        WithViewStore(self.store) { viewStore in
            TabView(
                selection: viewStore.binding(
                    get: { $0.selectedTab },
                    send: AppAction.tabSelected
                )
            ) {
                HealthMonitorView(
                    store: Store(
                        initialState: HealthMonitorState(healthData:
                            [
                                HealthDatum(id: 1, type: .sleepingTime, points: [23,4,124,5,324,5,463,45,363]),
                                HealthDatum(id: 2, type: .steps, points: [23214,14124,123412,23123,2131, 88990]),
                                HealthDatum(id: 3, type: .sleepingTime, points: [23,4,124,5,324,5,463,45,363]),
                                HealthDatum(id: 4, type: .steps, points: [23214,14124,123412,23123,2131, 88990]),
                                HealthDatum(id: 5, type: .sleepingTime, points: [23,4,124,5,324,5,463,45,363]),
                                HealthDatum(id: 6, type: .steps, points: [23214,14124,123412,23123,2131, 88990]),
                                HealthDatum(id: 7, type: .sleepingTime, points: [23,4,124,5,324,5,463,45,363]),
                                HealthDatum(id: 8, type: .steps, points: [23214,14124,123412,23123,2131, 88990]),
                                HealthDatum(id: 9, type: .sleepingTime, points: [23,4,124,5,324,5,463,45,363]),
                                HealthDatum(id: 10, type: .steps, points: [23214,14124,123412,23123,2131, 88990]),
                            ]
                        ),
                        reducer: healthMonitorReducer,
                        environment: HealthMonitorEnvironment()
                    )
                ).tabItem {
                    Image(systemName: "chart.bar")
                    Text("アクティビティ")
                }.tag(Tab.healthMonitor)
                
                HealthCheckView(
                    store: Store(
                        initialState: HealthCheckState(),
                        reducer: healthCheckReducer,
                        environment: HealthCheckEnvironment()
                    )
                ).tabItem {
                    Image(systemName: "heart.circle")
                    Text("ヘルスチェック")
                }.tag(Tab.healthCheck)
                
                SettingView(
                    store: Store(
                        initialState: SettingState(),
                        reducer: SettingReducer,
                        environment: SettingEnvironment()
                    )
                ).tabItem {
                    Image(systemName: "person.crop.circle")
                    Text("アカウント")
                }.tag(Tab.settings)
            }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView(store: Store(
            initialState: AppState(),
            reducer: appReducer,
            environment: AppEnvironment()
            )
        )
    }
}
