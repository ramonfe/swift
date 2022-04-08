//
//  Films.swift
//  PMx
//
//  Created by home on 07/04/22.
//

struct Estrenos: Decodable {
    let Estrenos:[Peliculas]
}
struct Peliculas:Decodable {
    let title:String?
    let image:String?
    let critics_score:String?
    let synopsis:String?
    let genre:[String]?
    let actor:[String]?
    let director:String?
    let id_imdb:String?
}
struct Genres:Decodable{
    let genre:String
}
struct Directors:Decodable {
    let director:String
}
