// Copyright © 2021 Encrypted Ink. All rights reserved.

import Foundation

struct ExtensionBridge {
    
    private static let defaults = UserDefaults(suiteName: "XWNXDSM6BU.ink.encrypted")
    
    private static func key(id: Int) -> String {
        return String(id)
    }
    
    static func respond(id: Int, response: ResponseToExtension) {
        defaults?.setCodable(response, forKey: key(id: id))
    }
    
    static func getResponse(id: Int) -> ResponseToExtension? {
        let key = key(id: id)
        if let response = defaults?.codableValue(type: ResponseToExtension.self, forKey: key) {
            defaults?.removeObject(forKey: key)
            return response
        } else {
            return nil
        }
    }
    
}
