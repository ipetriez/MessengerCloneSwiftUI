//
//  RootContentView.swift
//  MessengerCloneSwiftUI
//
//  Created by Sergey Petrosyan on 14.01.24.
//

import SwiftUI

struct RootContentView: View {
    @StateObject private var rootContentVM = RootContentViewModel()
    var body: some View {
        Group {
            if rootContentVM.userSession != nil {
                InboxView()
            } else {
                LogInView()
            }
        }
    }
}

#Preview {
    RootContentView()
}
