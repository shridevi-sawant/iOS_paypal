//
//  WebUtility.swift
//  PostalCodeApp
//
//  Created by Shridevi Sawant on 07/10/24.
//

import Foundation


struct WebUtility {
    
    static let instance = WebUtility()
    
    private init(){}
    
    func getPlaces(pincode: String) async -> [Place] {
        
        //1. URLSession
        
        // similuate slow network
       // try! await Task.sleep(nanoseconds: 5 * 1000 * 1000 * 1000)
        
        let session = URLSession.shared
        
        //2. URLReuest
        
        let urlS = "http://api.geonames.org/postalCodeSearchJSON?postalcode=\(pincode)&maxRows=10&username=shree"
        
        guard let url = URL(string: urlS) else {
            return []
        }
        
        let req = URLRequest(url: url)
        
        
        // 3. Create Data task
        do {
            let (respData, response ) = try await session.data(for: req)
            
            switch (response as! HTTPURLResponse).statusCode {
            case 200:
                print("OK")
                let placeList = parseData(data: respData)
                print("Place count: \(placeList.count)")
                return placeList
            case 400...499:
                print("Client side error")
            case 500...599:
                print("Server error")
            default:
                print("Unknown error")
            }
        
        }catch {
            print("Network ERROR :\(error)")
        }
        
        return []
    }
    
    
    func parseData(data: Data) -> [Place] {
        do {
            let parsedData = try JSONDecoder().decode(PlaceResult.self, from: data)
            return parsedData.postalCodes
        }catch {
            print("Parsing Error: \(error)")
            return []
        }
    }
    
}


struct Place : Codable {
    var placeName: String
    var adminName2: String? // city name
    var adminName1: String? // state name
    var countryCode: String
    var lat: Double
    var lng: Double
}

struct PlaceResult : Codable {
    var postalCodes : [Place]
}
