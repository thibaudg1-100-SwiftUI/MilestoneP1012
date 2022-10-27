//
//  ViewBuilderSuperPower.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

struct ViewBuilderSuperPower: View {
    @ViewBuilder var randomText: some View {
        if Bool.random() {
            Text("Hello, World!")
                .frame(width: 300)
        } else {
            Text("Hello, World!")
        }
    }
    
    var body: some View {
        randomText
    }
}

struct ViewBuilderSuperPower_Previews: PreviewProvider {
    static var previews: some View {
        ViewBuilderSuperPower()
    }
}
