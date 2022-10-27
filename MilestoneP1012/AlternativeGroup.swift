//
//  AlternativeGroup.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

// Another alternative is to use Group rather than @ViewBuilder, like this:

// Honestly, that’s no different from using @ViewBuilder. Yes, behind the scenes there’s an extra SwiftUI view in play (the Group view), but it will have no effect on layout and that extra view will probably just be optimized away.

struct AlternativeGroup: View {
    var randomText: some View {
        Group {
            if Bool.random() {
                Text("Hello, World!")
                    .frame(width: 300)
            } else {
                Text("Hello, World!")
            }
        }
    }
    
    var body: some View {
        randomText
    }
}

struct AlternativeGroup_Previews: PreviewProvider {
    static var previews: some View {
        AlternativeGroup()
    }
}
