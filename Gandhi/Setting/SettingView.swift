//
//  SettingView.swift
//  Gandhi
//
//  Created by taisuke.okada on 2020/07/24.
//  Copyright © 2020 taisuke.okada. All rights reserved.
//

import SwiftUI
import ComposableArchitecture

struct SettingView: View {
    let store: Store<SettingState, SettingAction>
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct SettingView_Previews: PreviewProvider {
    static var previews: some View {
        SettingView(
            store: Store<SettingState, SettingAction>(
                initialState: .init(),
                reducer: SettingReducer,
                environment: SettingEnvironment()
            )
        )
    }
}
