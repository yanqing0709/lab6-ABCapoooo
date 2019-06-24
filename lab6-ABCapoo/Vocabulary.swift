//
//  Vocabulary.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/19.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import Foundation

struct Vocabulary: Codable {
    var alphabet: String
    var meaning: String
    var example: String
    var opposite: String
    
    static let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    
    static func saveToFile(vocabularies: [Vocabulary]) {
        let propertyEncoder = PropertyListEncoder()
        if let data = try? propertyEncoder.encode(vocabularies) {
            let url = Vocabulary.documentsDirectory.appendingPathComponent("vocabulary").appendingPathExtension("plist")
            try? data.write(to: url)
        }
    }
    
    static func readVocabulariesFromFile() -> [Vocabulary]? {
        let propertyDecoder = PropertyListDecoder()
        let url = Vocabulary.documentsDirectory.appendingPathComponent("vocabulary").appendingPathExtension("plist")
        if let data = try? Data(contentsOf: url), let vocabularies = try? propertyDecoder.decode([Vocabulary].self, from: data) {
            return vocabularies
        } else {
            return nil
        }
    }
}
