//
//  FileUtility.swift
//  DataPersistency
//
//  Created by Shridevi Sawant on 04/10/24.
//

import Foundation

// singleton design pattern - static instance, private init
struct FileUtility {
    
    static let instance = FileUtility()
    let fManager = FileManager.default
    var docURL: URL? = nil
    
    private init() {
        docURL = fManager.urls(for: .documentDirectory, in: .userDomainMask)[0]
    }
    
    func writeToFile(data: String, filename: String) throws {
        
        let fileUrl = docURL!.appending(path: filename)
        
        try data.write(to: fileUrl, atomically: true, encoding: .utf8)
        
    }
    
    func readFromFile(filename: String) throws -> String {
        
        let fileUrl = docURL!.appending(path: filename)
        
        let data = try String(contentsOf: fileUrl)
        
        return data
    }
}
