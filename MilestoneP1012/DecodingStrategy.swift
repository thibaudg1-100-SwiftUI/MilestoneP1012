//
//  DecodingStrategy.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

// our local model is:
struct User: Codable {
    // properties names formatted with default Camel case
    var firstName: String
    var lastName: String
}

struct DecodingStrategy: View {
    
    // our remote data is formatted with Snake case
    let str = """
    {
        "first_name": "Andrew",
        "last_name": "Glouberman"
    }
    """
    
    var body: some View {
        Button("Decode data") {
            decodeData()
        }
    }
    
    func decodeData() {
        let data = Data(str.utf8)
        
        do {
            let decoder = JSONDecoder()
            // it won't work unless adding the following line:
            decoder.keyDecodingStrategy = .convertFromSnakeCase

            let user = try decoder.decode(User.self, from: data)
            print("Hi, I'm \(user.firstName) \(user.lastName)")
        } catch {
            print("Whoops: \(error.localizedDescription)")
        }
    }
}

struct DecodingStrategy_Previews: PreviewProvider {
    static var previews: some View {
        DecodingStrategy()
    }
}
