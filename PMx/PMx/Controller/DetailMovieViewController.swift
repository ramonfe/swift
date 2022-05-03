//
//  DetailMovieViewController.swift
//  PMx
//
//  Created by ramon felix on 17/04/22.
//

import UIKit
import Kingfisher

class DetailMovieViewController: UIViewController {
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblRate: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblSynopsis: UILabel!
    @IBOutlet weak var lblActors: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var myScrollView: UIScrollView!
    @IBOutlet weak var myMainView: UIView!
    @IBOutlet weak var lblEstreno: UILabel!
    
    var pelicula : Peliculas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblTitulo.text = pelicula?.title
        lblRate.text = pelicula?.critics_score
        lblDirector.text = pelicula?.director?.joined(separator: ",")
        lblSynopsis.text = pelicula?.synopsis
        lblActors.text = pelicula?.actor?.joined(separator: ",")
        lblGenre.text = pelicula?.genre?.joined(separator: ",")
        lblEstreno.text = unixTime(fechaUnix: pelicula?.theater_release_date)
        
        var movieImgUrl = pelicula?.image ?? ""
        if (movieImgUrl == "/images/movie_poster-04.jpg" || movieImgUrl == "")
        {
            movieImgUrl = "https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/334146/334146_140x200.jpg"
        }
        myImage.kf.setImage(with: URL(string: movieImgUrl))
    }
    override func viewDidAppear(_ animated: Bool) {
        print(myMainView.frame.height)
        //myScrollView.contentSize.height = myMainView.frame.height
        //print(myScrollView.contentSize.height)
        //print(myScrollView.contentSize.height)
        var height: CGFloat
        //let lastView = self.myScrollView.subviews[0].subviews.last!
        
        //let lastViewYPos = lastView.convert(lastView.frame.origin, to: nil).y
        //let lastViewHeight = lastView.frame.size.height
        
        height =
            lblSynopsis.frame.height + lblActors.frame.height + myImage.frame.height + lblActors.frame.height + lblGenre.frame.height + 140
        
        
        myScrollView.contentSize.height = height
        //print(lblSynopsis.frame.height)
        print(height)
    }
}
