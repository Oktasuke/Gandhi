//
//  HealthCheckView.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct HealthCheckView: View {
    struct ViewState: Equatable {
        var editMode: Bool
    }
    let store: Store<HealthCheckState, HealthCheckAction>
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HealthCheckView_Previews: PreviewProvider {
    static var previews: some View {
        HealthCheckView(store:
            Store<HealthCheckState, HealthCheckAction>(
                initialState: .init(),
                reducer: healthCheckReducer,
                environment: HealthCheckEnvironment()
            )
        )
    }
}
