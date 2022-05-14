//
//  DetailMovieViewController.swift
//  PMx
//
//  Created by ramon felix on 17/04/22.
//

import UIKit
import Kingfisher
import GoogleMobileAds
import YouTubeiOSPlayerHelper

class DetailMovieViewController: UIViewController{
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
    @IBOutlet weak var videoPlayer: YTPlayerView!
    @IBOutlet weak var vpHeightConstraint: NSLayoutConstraint!
    var pelicula : Peliculas?
    
    private var interstitial: GADInterstitialAd?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBanners()
        loadElements()
    }
    func loadBanners(){
        //prepare interstitial
        let request = GADRequest()
        GADInterstitialAd.load(withAdUnitID:"ca-app-pub-3940256099942544/4411468910",
                               request: request,
                               completionHandler: { [self] ad, error in
                                if let error = error {
                                    print("Failed to load interstitial ad with error: \(error.localizedDescription)")
                                    return
                                }
                                interstitial = ad
                                interstitial?.fullScreenContentDelegate = self
                               }
        )
        //setup banner
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
    }
    func loadElements(){
        lblTitulo.text = pelicula?.title
        lblRate.text = pelicula?.critics_score
        lblDirector.text = pelicula?.director?.joined(separator: ",")
        lblSynopsis.text = pelicula?.synopsis
        lblActors.text = pelicula?.actor?.joined(separator: ",")
        lblGenre.text = pelicula?.genre?.joined(separator: ",")
        lblEstreno.text = unixTime(fechaUnix: pelicula?.mx_theater_release_date)
        if let trailerKey = pelicula?.trailer_key{
            vpHeightConstraint.constant = 300
            //add video
            //videoPlayer.isHidden = true
            videoPlayer.load(withVideoId: trailerKey)
            videoPlayer.delegate = self
            //        self.view.layoutIfNeeded()
        }
        else{
            vpHeightConstraint.constant = 0
        }
        var movieImgUrl = pelicula?.image ?? ""
        if (movieImgUrl == "/images/movie_poster-04.jpg" || movieImgUrl == "")
        {
            if let posterPath = pelicula?.poster_path{
                movieImgUrl = posterPath.replacingOccurrences(of: "http", with: "https")
            }
            else {
                movieImgUrl = "https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/334146/334146_140x200.jpg"
            }
        }
        let processor = DownsamplingImageProcessor(size: myImage.bounds.size)
        myImage.kf.indicatorType = .activity
        myImage.kf.setImage(with: URL(string: movieImgUrl),
                            placeholder: UIImage(named: "placeholderImage"),
                            options: [
                                .processor(processor),
                                .scaleFactor(UIScreen.main.scale),
                                .transition(.fade(1)),
                                .cacheOriginalImage
                            ])
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
    override func viewDidDisappear(_ animated: Bool) {
        videoPlayer.stopVideo()
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
    @IBAction func btnTrailer(_ sender: Any) {
        showInterstitial()
    }
    func showInterstitial(){
        //        if interstitial != nil {
        //            interstitial?.present(fromRootViewController: self)
        //        } else {
        //            print("Ad wasn't ready")
        //        }
    }
    override func willMove(toParent parent: UIViewController?) {
        super.willMove(toParent: parent)
        if parent == nil{
            showInterstitial()
        }
    }
}
// MARK: - GADFullScreenContentDelegate
extension DetailMovieViewController:GADFullScreenContentDelegate{
    
    /// Tells the delegate that the ad failed to present full screen content.
    func ad(_ ad: GADFullScreenPresentingAd, didFailToPresentFullScreenContentWithError error: Error) {
        print("Ad did fail to present full screen content.")
    }
    
    /// Tells the delegate that the ad will present full screen content.
    func adWillPresentFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad will present full screen content.")
    }
    
    /// Tells the delegate that the ad dismissed full screen content.
    func adDidDismissFullScreenContent(_ ad: GADFullScreenPresentingAd) {
        print("Ad did dismiss full screen content.")
    }
}
//MARK:- YTPlayerViewDelegate
extension DetailMovieViewController : YTPlayerViewDelegate{
    func playerViewDidBecomeReady(_ playerView: YTPlayerView) {
        videoPlayer.frame.size.height = 200
        videoPlayer.isHidden = false
    }
}
