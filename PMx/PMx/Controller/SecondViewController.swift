//
//  SecondViewController.swift
//  PMx
//
//  Created by Ramon Felix on 04/04/22.
//

import UIKit
import Kingfisher
import GoogleMobileAds
import FirebaseAnalytics

class SecondViewController: UIViewController {
    
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myTableView: UITableView!
    private var peliculas = [Peliculas]()
    private var peliculaSelected : Peliculas?
    private var movieImgUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"//"ca-app-pub-6687064215304616/1359059372"
        bannerView.rootViewController = self//ca-app-pub-3940256099942544/2934735716
        
        sendFirebaseLog()
        showSpinner()
        
        myTableView.dataSource=self
        myTableView.delegate=self
        myTableView.tableFooterView = UIView()
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
        
        loadJsonInTable()
    }
    override func viewWillLayoutSubviews() {
        //para que el banner no cubra el contenido de la tabla
        myTableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 100))
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
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
        // Step 2 - Determine the view width to use for the ad width.
        let frame = { () -> CGRect in
            // Here safe area is taken into account, hence the view frame is used
            // after the view has been laid out.
            if #available(iOS 11.0, *) {
                return view.frame.inset(by: view.safeAreaInsets)
            } else {
                return view.frame
            }
        }()
        let viewWidth = frame.size.width
        
        // Step 3 - Get Adaptive GADAdSize and set the ad view.
        // Here the current interface orientation is used. If the ad is being preloaded
        // for a future orientation change or different orientation, the function for the
        // relevant orientation should be used.
        bannerView.adSize = GADCurrentOrientationAnchoredAdaptiveBannerAdSizeWithWidth(viewWidth)
        // Step 4 - Create an ad request and load the adaptive banner ad.
        bannerView.load(GADRequest())
    }
    func sendFirebaseLog(){
        // Analu¡ytic event.
        Analytics.logEvent("second screen", parameters: ["message" : "integracion Ready"])
    }
    func loadJsonInTable(){
        //carga json
        NetworkProvider.shared.loadJsonProxEstrenos{ (estrenos) in
            self.peliculas = estrenos.ProximosEstrenos
            DispatchQueue.main.async
            {
                self.hideSpinner()
                self.myTableView.reloadData()
            }
        } failure: { (error) in
            self.hideSpinner()           
        }
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
//MARK: UITableViewDelegate
extension SecondViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        peliculas.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
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
extension SecondViewController:UITableViewDelegate
{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        peliculaSelected = peliculas[indexPath.row]
        performSegue(withIdentifier: "SegueProxDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let destination = segue.destination as? DetailMovieViewController
        {
            destination.pelicula = peliculaSelected
        }
    }
}

