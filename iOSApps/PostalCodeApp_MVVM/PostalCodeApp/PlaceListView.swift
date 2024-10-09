//
//  PlaceListView.swift
//  PostalCodeApp
//
//  Created by Shridevi Sawant on 07/10/24.
//

import SwiftUI

struct PlaceListView: View {
    
    var pincode = ""
    
    
    //@State var completeList: [Place] = []
    
    @StateObject var vModel = PlacesViewModel()
    
   // @State var query = ""
    
    var body: some View {
        VStack {
            if vModel.isDataFetched {
                VStack{
                    if (vModel.placeList.isEmpty ){
                        Label("No places found for \(pincode)", systemImage: "cross.circle.fill")
                    }else {
                        List(vModel.placeList, id: \.placeName) { p in
                            
                            
                            PlaceView(place: p)
                        }
                        
                        .foregroundStyle(Color.blue)
                       
                        
                    }
                }
                
            } else {
                ProgressView()
            }
        }
        .task {
            await vModel.fetchPlaces(pCode: pincode)
            
            
        }
    }
}

struct PlaceView: View {
    let place: Place
    
    var body: some View {
        HStack {
            Image(systemName: "building.columns.circle.fill")
                .resizable()
                .frame(width: 100, height: 100)
            
            Spacer()
            
            VStack {
                Text(place.placeName)
                Text("\(place.adminName2 ?? ""), \(place.adminName1 ?? "")")
                Text(place.countryCode)
            }
            .font(.title)
            
            Button {
                // open map
                let url = "http://maps.apple.com/?ll=\(place.lat),\(place.lng)"
                
                let urlObj = URL(string: url)!
                // navigate to map
                if UIApplication.shared.canOpenURL(urlObj){
                    UIApplication.shared.open(urlObj)
                } else {
                    print("No Map application found")
                }
                
            } label: {
                Image(systemName: "location.fill")
            }
            
        }
    }
}


#Preview {
    PlaceListView()
}
