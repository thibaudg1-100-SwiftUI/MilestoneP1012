//
//  TypeErasureAnyView.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

// Type erasure is the process of hiding the underlying type of some data. This is used often in Swift: we have type erasing wrappers such as AnyHashable and AnySequence, and all they do is act as shells that forward on their operations to whatever they contain, without revealing what the contents are to anything externally.

// In SwiftUI we have AnyView for this purpose: it can hold any kind of view inside it, which allows us to mix and match views freely, like this:

struct TypeErasureAnyView: View {
    var randomText: some View {
            if Bool.random() {
                return AnyView(Text("Hello, World!")
                    .frame(width: 300))
            } else {
                return AnyView(Text("Hello, World!"))
            }
        }

        var body: some View {
            randomText
        }
}

// However, there is a performance cost to using AnyView: by hiding the way our views are structured, we’re forcing SwiftUI to do a lot more work when our view hierarchy changes – if we make one small change inside one of the type-erased parts of our view hierarchy, there’s a good chance it will all need to be recreated.

struct TypeErasureAnyView_Previews: PreviewProvider {
    static var previews: some View {
        TypeErasureAnyView()
    }
}
