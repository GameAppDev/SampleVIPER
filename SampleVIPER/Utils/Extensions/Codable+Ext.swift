//
//  Codable+Ext.swift
//  SampleVIPER
//
//  Created by OguzhanYalcin on 11.06.2024.
//

import Foundation

extension Encodable {
    
    public var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self)
        else { return nil }
        
        return (try? JSONSerialization.jsonObject(
            with: data,
            options: .allowFragments
        )).flatMap { $0 as? [String: Any] }
    }
}

extension Decodable {
    
    public static func fromJSON<T: Decodable>(
        _ fileName: String,
        fileExtension: String = "json",
        bundle: Bundle = .main
    ) throws -> T {
        guard let url = bundle.url(forResource: fileName, withExtension: fileExtension) else {
            throw NSError(domain: NSURLErrorDomain, code: NSURLErrorResourceUnavailable)
        }
        let data = try Data(contentsOf: url)
        return try JSONDecoder().decode(T.self, from: data)
    }
}
