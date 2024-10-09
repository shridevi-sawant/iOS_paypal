//
//  ContentView.swift
//  PopularMovies
//
//  Created by Shridevi Sawant on 08/10/24.
//

import SwiftUI
import Alamofire

/*
 View
 
 - reference to ViewModel
 - no reference of Model
 */

struct ContentView: View {
    
    @StateObject var vModel = MoviewViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
               Text("Popular Movies")
                
                if vModel.isDataFetched {
                    List(vModel.movieList, id: \.id) { movie in
                        
                        NavigationLink {
                            MovieDetailView(movie: movie)
                                .environmentObject(vModel)
                               
                        } label: {
                            MovieView(movie: movie)
                                .environmentObject(vModel)
                        }

                        
                        
                    }
                } else {
                    ProgressView("Loading..")
                }
            
            }
            .padding()
            .task {
                await vModel.fetchMovies()
                print("Count: \(vModel.movieList.count)")
                
        }
//          
        }
    }
}

struct MovieView: View {
    @State private var img: UIImage?
    @EnvironmentObject var movieVModel: MoviewViewModel
    
    let movie: Movie
    var body: some View {
        HStack {
            //Image(systemName: "movieclapper.fill")
            if let imgUrl = img {
                Image(uiImage: imgUrl)
                    .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
            } else {
                Image(systemName: "movieclapper.fill")
                    .resizable()
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 200)
            }
            Spacer()
            VStack(spacing: 10) {
                Text(movie.title)
                    .bold()
                    .foregroundStyle(Color.pink)
                Text("Release date: \(movie.release_date)")
                Text("Rating: \(movie.vote_average)")
            }.padding()
            Spacer()
        }
        .task {
            img = await movieVModel.getPoster(name: movie.poster_path)
        }
        .font(.title2)
        .foregroundStyle(.mint)
        .background(.yellow)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(8)
    }
}


#Preview {
    ContentView()
}
