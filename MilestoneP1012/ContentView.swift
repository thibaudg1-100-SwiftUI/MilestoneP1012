//
//  ContentView.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    // this code won't work because only the 'body' property has an implicit ViewBuilder able to compose multiple Views, and Views of different types:
//    var randomText: some View {
//        if Bool.random() {
//            return Text("Hello, World!")
//                .frame(width: 300)
//        } else {
//            return Text("Hello, World!")
//        }
//    }
    
    var body: some View {
//        randomText
        Text("hellloish") // placeholder
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
