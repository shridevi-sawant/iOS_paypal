//
//  MovieUtility.swift
//  PopularMovies
//
//  Created by Shridevi Sawant on 08/10/24.
//

import Foundation
import Alamofire

struct MovieUtility {
    static let instance = MovieUtility()
    static private let API_KEY = "456b638afee7c7179adac748bc9d5bc7"
    static private let imgPath = "https://image.tmdb.org/t/p/w500"
    
    private init() {}
    
    func getMoviePoster(imgName: String) async -> URL? {
        let urlS = MovieUtility.imgPath + imgName
        
        guard let url = URL(string: urlS) else {
            return nil
        }
        let docUrl = FileManager.default.urls(for: .documentDirectory,
                                              in: .userDomainMask)[0]
        
        let imgUrl = docUrl.appending(path: imgName)
        
        guard !FileManager.default.fileExists(atPath: imgUrl.relativePath) else {
            return imgUrl
        }
        
        
        let result = AF.download(url).serializingDownloadedFileURL()
        do {
            let downloadedUrl = try await result.value // request execution
           // print("Downloaded at \(imgfile.absoluteString)")
            
            // move the file to Documents folder
            
            try FileManager.default.moveItem(at: downloadedUrl, to: imgUrl)
            return imgUrl
            
        }catch {
            print("Error downloading \(imgName): \(error)")
        }
        
        return nil
    }
    
    func getPopularMovies() async -> [Movie] {
        let urlS = "https://api.themoviedb.org/3/movie/popular?api_key=\(MovieUtility.API_KEY)"
        
        guard let url = URL(string: urlS) else {
            return []
        }
        
        do {
           // let result = try await Session.default.session.data(from: url)
           
            let result: DataTask<MovieResponse> = Session.default.request(url).serializingDecodable()
            
            let response = try await result.value
           
            return response.results
            
        }catch {
            print("Error: \(error)")
        }
        
        return []
    }
    
}


struct Movie : Codable {
    var title : String
    var release_date: String
    var poster_path: String
    var vote_average: Float
    var overview : String
    var id: Int
    
}

struct MovieResponse: Codable {
    var results: [Movie]
}
