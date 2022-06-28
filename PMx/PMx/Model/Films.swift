//
//  Films.swift
//  PMx
//
//  Created by home on 07/04/22.
//

struct Estrenos: Decodable {
    let Estrenos:[Peliculas]
}
struct ProximosEstrenos: Decodable {
    let ProximosEstrenos:[Peliculas]
    private enum CodingKeys:String,CodingKey{
        case ProximosEstrenos = "Proximos Estrenos"
    }
}
struct Peliculas:Decodable {
    let title:String?
    let image:String?
    var critics_score:String?=nil
    var mx_theater_release_date:String?=nil
    let synopsis:String?
    let genre:[String]?
    let actor:[String]?
    let director:[String]?
    var id_imdb:String?=nil
    var backdrop_path:String?
    var poster_path:String?
    var trailer_key:String?
    
    private enum CodingKeys:String,CodingKey{
        case title,image,mx_theater_release_date,critics_score, synopsis,genre,actor,director,id_imdb,
             backdrop_path,poster_path,trailer_key }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(String.self, forKey: .image)
        if let criticScore = try? container.decode(String.self, forKey: .critics_score) {
            self.critics_score = criticScore
        }
        if let releaseDate = try? container.decode(String.self, forKey: .mx_theater_release_date) {
            self.mx_theater_release_date = releaseDate
        }
        self.synopsis = try container.decode(String.self, forKey: .synopsis)
        if let genero = try? container.decode(String.self, forKey: .genre){
            self.genre = [genero]
        }else{
            self.genre = try container.decode([String].self, forKey: .genre)
        }
        if let singleActor = try? container.decode(String.self, forKey: .actor){
            self.actor = [singleActor]
        }else{
            actor = try? container.decode([String].self, forKey: .actor)
        }
        if let idImdb = try? container.decode(String.self, forKey: .id_imdb){
            self.id_imdb = idImdb
        }
        if let singleDirector = try? container.decode(String.self, forKey: .director) {
            self.director = [singleDirector]
        } else {
            self.director = try container.decode([String].self, forKey: .director)
        }
        if let trailerKey = try? container.decode(String.self, forKey: .trailer_key){
            self.trailer_key = trailerKey
        }
        if let backdropPath = try? container.decode(String.self, forKey: .backdrop_path){
            self.backdrop_path = backdropPath
        }
        if let posterPath = try? container.decode(String.self, forKey: .poster_path){
            self.poster_path = posterPath
        }
    }
}
struct Stream:Decodable {
    let list:[List]?
}
struct List:Decodable{
    let ListName:String?
    let ListDetail:[StreamNode]?
}
struct StreamNode:Decodable {
    let title:String?
    let image:String?
    let critics_score:Int?
    let director:[String]?
    let actor:[String]?
    var backdrop_path:String?
    var poster_path:String?
    var trailer_key:String?
   // let genre:String?
    let mx_theater_release_date:String?
    let synopsis:String?
    
    enum CodingKeys:String,CodingKey{
        case title = "movie_title"
        case image = "thumbnail"
        case critics_score = "score"
        case director = "movie_directors"
        case actor = "movie_actors"
        case mx_theater_release_date = "movie_date"
        case backdrop_path="backdrop_path"
        case poster_path="poster_path"
        case trailer_key="trailer_key"
       // case genre="genre"
        case synopsis="synopsis"
    } 
    init(from decoder: Decoder) throws{
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(String.self, forKey: .image)
        self.critics_score = try container.decode(Int.self, forKey: .critics_score)
        self.director = try container.decode([String].self, forKey: .director)
        self.actor = try container.decode([String].self, forKey: .actor)
        if let backdropPath = try? container.decode(String.self, forKey: .backdrop_path){
            self.backdrop_path = backdropPath
        }
        if let posterPath = try? container.decode(String.self, forKey: .poster_path){
            self.poster_path = posterPath
        }
        if let trailerKey = try? container.decode(String.self, forKey: .trailer_key){
            self.trailer_key = trailerKey
        }
       // self.genre = try container.decode(String.self, forKey: .genre)
        self.mx_theater_release_date = try container.decode(String.self, forKey: .mx_theater_release_date)
        self.synopsis = try container.decode(String.self, forKey: .synopsis)
    }
}

