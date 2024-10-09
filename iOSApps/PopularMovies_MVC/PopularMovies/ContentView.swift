//
//  ContentView.swift
//  PopularMovies
//
//  Created by Shridevi Sawant on 08/10/24.
//

import SwiftUI
import Alamofire

struct ContentView: View {
    
    @State private var movieList : [Movie] = []
    
    var body: some View {
        VStack {
           Text("Popular Movies")
            List(movieList, id: \.id) { movie in
                MovieView(movie: movie)
            }
        
        }
        .padding()
        .task {
            movieList = await MovieUtility.instance.getPopularMovies()
            print("Count: \(movieList.count)")
        }
    }
}

struct MovieView: View {
    @State private var img: URL?
    
    let movie: Movie
    var body: some View {
        HStack {
            //Image(systemName: "movieclapper.fill")
            if let imgUrl = img {
                Image(uiImage: UIImage(contentsOfFile: imgUrl.relativePath)!)
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
            img = await MovieUtility.instance.getMoviePoster(imgName: movie.poster_path)
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
