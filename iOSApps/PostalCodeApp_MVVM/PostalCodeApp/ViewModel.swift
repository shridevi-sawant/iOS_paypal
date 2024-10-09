//
//  ViewModel.swift
//  PostalCodeApp
//
//  Created by Shridevi Sawant on 08/10/24.
//

import Foundation

class PlacesViewModel: ObservableObject {
    
    @Published var placeList: [Place] = []
    @Published var isDataFetched = false
    
    func fetchPlaces(pCode: String) async{
        DispatchQueue.main.async {
            self.isDataFetched = false
        }
        
       let data = await WebUtility.instance.getPlaces(pincode: pCode)
        DispatchQueue.main.async {
            self.placeList = data
            self.isDataFetched = true
        }
        
        
    }
}
