//
//  MovieDetailView.swift
//  PopularMovies
//
//  Created by Shridevi Sawant on 08/10/24.
//

import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @EnvironmentObject var vModel : MoviewViewModel
    @State var img : UIImage?
    
    
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20){
                
                if let imgUrl = img {
                    Image(uiImage: imgUrl)
                        .resizable()
                    .frame(width: 300, height: 400)
                } else {
                    Image(systemName: "movieclapper.fill")
                        .resizable()
                    .frame(width: 300, height: 400)
                }
                
                Text(movie.title)
                    .font(.title)
                    .foregroundStyle(Color.purple)
                Spacer()
                Text(movie.overview)
                Spacer()
            }
            .padding()
            .task {
                img = await vModel.getPoster(name: movie.poster_path)
        }
        }
    }
}

#Preview {
    MovieDetailView(movie: Movie(title: "Robot", release_date: "123", poster_path: "", vote_average: 10, overview: "", id: 1))
        .environmentObject(MoviewViewModel())
}
