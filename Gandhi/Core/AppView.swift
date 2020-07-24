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
                        initialState: HealthMonitorState(),
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
