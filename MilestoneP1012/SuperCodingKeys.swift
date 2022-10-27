//
//  SuperCodingKeys.swift
//  MilestoneP1012
//
//  Created by RqwerKnot on 10/03/2022.
//

import SwiftUI

// our local model is:
struct User2: Codable {
    // properties names formatted with default Camel case
    var firstName: String
    var lastName: String
    
    // You see, the reason we conventionally use CodingKeys for the name is that this name has super powers: if a CodingKeys enum exists, Swift will automatically use it to decide how to encode and decode an object for times we don’t provide custom Codable implementations.
    
    // writing this nested enum is fine because it has no special meaning for Swift, it will still synthetize its own Codable conformance implementation in the background without noticing this enum:
    enum ZZZCodingKeys: CodingKey {
        case firstName
    }
    
    // This enum called 'CodingKeys' has a special meaning and tells Swift to use this specific implementation for Codable protocol conformance, instead of Swift own implementation.
    // But this enum doesn't cover all the Struct properties which means there is no initializer that handles setting the lastName property - and that’s not allowed.
    //    enum CodingKeys: CodingKey {
    //        case firstName
    //    }
    
    // this one is correct though:
    enum CodingKeys: String, CodingKey {
        case firstName = "first"
        case lastName = "last"
    }
    // if we attach raw value strings to our properties, Swift will use those for the JSON property names. That is, the case names should match our Swift property names, and the case values should match the JSON property names.
    
}

struct SuperCodingKeys: View {
    // our remote data has property names completely differnet from our local model:
    let str = """
    {
        "first": "Andrew",
        "last": "Glouberman"
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
            
            let user = try decoder.decode(User2.self, from: data)
            print("Hi, I'm \(user.firstName) \(user.lastName)")
        } catch {
            print("Whoops: \(error.localizedDescription)")
        }
    }
}

struct SuperCodingKeys_Previews: PreviewProvider {
    static var previews: some View {
        SuperCodingKeys()
    }
}
