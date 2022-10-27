//
//  BestFriendTernary.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

// The last option isn’t always possible, but it is possible here and you should always watch out for it: where you can use it, a ternary conditional operator is always a better choice than any of the above solutions.

struct BestFriendTernary: View {
    var randomText: some View {
        Text("Hello, World!")
            .frame(width: Bool.random() ? 300 : nil)
        // inert modifier: allows for no modifications at all when used with certain values (nil, 0, 1, ...)
        // blur(radius: 0), opacity(1) ...
    }
    
    var body: some View {
        randomText
    }
}

// Why “ideal”? Because in this situation SwiftUI only creates a single text view. Yes, the width changes between a fixed 300 points and the default size of the text, but the actual rendered text that gets created isn’t changing. In comparison, using AnyView, @ViewBuilder, and Group all involve two views: when the Bool.random() value flips from one state to the other, the first text view will be destroyed and a new one will be created.


struct BestFriendTernary_Previews: PreviewProvider {
    static var previews: some View {
        BestFriendTernary()
    }
}
