//
//  DetailMovieViewController.swift
//  PMx
//
//  Created by ramon felix on 17/04/22.
//

import UIKit
import Kingfisher
import GoogleMobileAds

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
    @IBOutlet weak var bannerView: GADBannerView!
    
    var pelicula : Peliculas?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        
        lblTitulo.text = pelicula?.title
        lblRate.text = pelicula?.critics_score
        lblDirector.text = pelicula?.director?.joined(separator: ",")
        lblSynopsis.text = pelicula?.synopsis
        lblActors.text = pelicula?.actor?.joined(separator: ",")
        lblGenre.text = pelicula?.genre?.joined(separator: ",")
        lblEstreno.text = unixTime(fechaUnix: pelicula?.mx_theater_release_date)
        
        var movieImgUrl = pelicula?.image ?? ""
        if (movieImgUrl == "/images/movie_poster-04.jpg" || movieImgUrl == "")
        {
            movieImgUrl = "https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/334146/334146_140x200.jpg"
        }
        myImage.kf.setImage(with: URL(string: movieImgUrl))
    }
    override func viewDidAppear(_ animated: Bool) {
        var height: CGFloat
        height =
            lblSynopsis.frame.height + lblActors.frame.height + myImage.frame.height + lblActors.frame.height + lblGenre.frame.height + 240
        
        
        myScrollView.contentSize.height = height
        //print(lblSynopsis.frame.height)
        loadBannerAd()
    }
    override func viewWillTransition(to size: CGSize,
                                     with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to:size, with:coordinator)
        coordinator.animate(alongsideTransition: { _ in
            self.loadBannerAd()
        })
    }
    func loadBannerAd(){
        let frame = { () -> CGRect in
            if #available(iOS 11.0, *) {
                return view.frame.inset(by: view.safeAreaInsets)
            } else {
                return view.frame
            }
        }()
        let viewWidth = frame.size.width
        
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        
        bannerView.load(GADRequest())
    }
}
