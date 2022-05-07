//
//  ViewController.swift
//  PMx
//
//  Created by home on 04/04/22.
//

import UIKit
import Kingfisher
import GoogleMobileAds
import FirebaseAnalytics

class ViewController: UIViewController{
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var peliculas = [Peliculas]()
    private var peliculaSelected : Peliculas?
    private var movieImgUrl=""    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadBanner()
        sendFirebaseLog()
        showSpinner()
        tableView.dataSource=self
        tableView.delegate=self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
        
        loadJsonInTable()
    }
    func sendFirebaseLog(){
        // Analu¡ytic event.
        Analytics.logEvent("init screen", parameters: ["message" : "integracion Ready"])
    }
    func loadJsonInTable(){
        //carga json
        NetworkProvider.shared.loadJsonEstrenos { (estrenos) in
            self.peliculas = estrenos.Estrenos
            DispatchQueue.main.async
            {
                self.hideSpinner()
                self.tableView.reloadData()
            }
        } failure: { (error) in
            self.hideSpinner()            
        }
    }
    func loadBanner(){
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"//"ca-app-pub-6687064215304616/1359059372"
        bannerView.rootViewController = self//ca-app-pub-3940256099942544/2934735716
        bannerView.load(GADRequest())
        
        bannerView.delegate = self
    }
    func showSpinner(){
        activityIndicator.startAnimating()
        activityIndicator.isHidden=false
    }
    func hideSpinner(){
        
        activityIndicator.stopAnimating()
        activityIndicator.isHidden=true
    }
}
//MARK: GADBannerViewDelegate
extension ViewController:GADBannerViewDelegate{
    func bannerViewDidReceiveAd(_ bannerView: GADBannerView) {
        print("bannerViewDidReceiveAd")
    }
    
    func bannerView(_ bannerView: GADBannerView, didFailToReceiveAdWithError error: Error) {
        print("bannerView:didFailToReceiveAdWithError: \(error.localizedDescription)")
    }
    
    func bannerViewDidRecordImpression(_ bannerView: GADBannerView) {
        print("bannerViewDidRecordImpression")
    }
    
    func bannerViewWillPresentScreen(_ bannerView: GADBannerView) {
        print("bannerViewWillPresentScreen")
    }
    
    func bannerViewWillDismissScreen(_ bannerView: GADBannerView) {
        print("bannerViewWillDIsmissScreen")
    }
    
    func bannerViewDidDismissScreen(_ bannerView: GADBannerView) {
        print("bannerViewDidDismissScreen")
    }
}

//MARK: UITableViewDataSource
extension ViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return peliculas.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var actorsReduced = ""
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyTableViewCell
        cell?.titleLabel.text=peliculas[indexPath.row].title
        //validacion para que solo ponga 3 actores maximo
        if let actorsArr = peliculas[indexPath.row].actor{
            if peliculas[indexPath.row].actor!.count>2 {
                actorsReduced = actorsArr[0..<3].joined(separator: ",")
            }
            else{
                actorsReduced = actorsArr.joined(separator: ",")
            }
        }
        cell?.actorsDescLabel.text = actorsReduced
        cell?.dateLabel.text = unixTime(fechaUnix: peliculas[indexPath.row].mx_theater_release_date!)
        cell?.criticLabel.text = peliculas[indexPath.row].critics_score
        movieImgUrl = peliculas[indexPath.row].image ?? ""
        if (movieImgUrl == "/images/movie_poster-04.jpg" || movieImgUrl == "")
        {
            movieImgUrl = "https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/334146/334146_140x200.jpg"
        }
        cell?.myImage.kf.setImage(with: URL(string: movieImgUrl))
        return cell!
    }
}
//MARK: UITableViewDelegate
extension ViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        peliculaSelected = peliculas[indexPath.row]
        performSegue(withIdentifier: "SegueEstrenoDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? DetailMovieViewController
        {            
            destination.pelicula = peliculaSelected
        }
    }
}

