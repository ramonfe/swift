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
    var theater_release_date:String?=nil
    let synopsis:String?
    let genre:[String]?
    let actor:[String]?
    let director:[String]?
    var id_imdb:String?=nil
    
    private enum CodingKeys:String,CodingKey{
        case title,image,theater_release_date,critics_score, synopsis,genre,actor,director,id_imdb }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.title = try container.decode(String.self, forKey: .title)
        self.image = try container.decode(String.self, forKey: .image)
        if let criticScore = try? container.decode(String.self, forKey: .critics_score) {
            self.critics_score = criticScore
        }
        if let releaseDate = try? container.decode(String.self, forKey: .theater_release_date) {
            self.theater_release_date = releaseDate
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
    }
    
    
}
