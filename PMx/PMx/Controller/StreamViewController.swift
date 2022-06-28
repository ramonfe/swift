//
//  StreamViewController.swift
//  PMx
//
//  Created by Ramon Felix on 30/05/22.
//

import UIKit
import Kingfisher
import GoogleMobileAds
import FirebaseAnalytics

class StreamViewController: UIViewController {
    @IBOutlet weak var bannerView: GADBannerView!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    private var streamNode = [List]()
    private var streamNodeSelected : List?
    private var movieImgUrl=""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /*test ad: ca-app-pub-3940256099942544/2934735716
         *Prod Ad: ca-app-pub-6687064215304616/1359059372
         */
        bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
        bannerView.rootViewController = self
        
        sendFirebaseLog()
        showSpinner()
        
        tableView.dataSource=self
        tableView.delegate=self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
        
        loadJsonInTable()
    }
    override func viewWillLayoutSubviews() {
        //para que el banner no cubra el contenido de la tabla
        tableView.tableFooterView = UIView(frame: CGRect(x: 0, y: 0, width: 1, height: 100))
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadBannerAd()
    }
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
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
    func sendFirebaseLog(){
        // Analytic event.
        Analytics.logEvent("init screen", parameters: ["message" : "integracion Ready"])
    }
    func loadJsonInTable(){
        //carga json
        NetworkProvider.shared.loadJsonStream{ (strimming) in
            self.streamNode = strimming.list!
            DispatchQueue.main.async
            {
                self.hideSpinner()
                self.tableView.reloadData()
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

//MARK: - UITableViewDataSource
extension StreamViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return streamNode.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        var actorsReduced = ""
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycustomcell", for: indexPath) as? MyTableViewCell
//        cell?.titleLabel.text=streamNode[indexPath.row].ListDetail
//        //validacion para que solo ponga 3 actores maximo
//        if let actorsArr = streamNode[indexPath.row].actor{
//            if streamNode[indexPath.row].actor!.count>2 {
//                actorsReduced = actorsArr[0..<3].joined(separator: ",")
//            }
//            else{
//                actorsReduced = actorsArr.joined(separator: ",")
//            }
//        }
//        cell?.actorsDescLabel.text = actorsReduced
//        cell?.dateLabel.text = unixTime(fechaUnix: streamNode[indexPath.row].mx_theater_release_date!)
//        if let score = streamNode[indexPath.row].critics_score {
//            cell?.criticLabel.text = score > 0 ? String(score) : ""
//        }
//        //cell?.criticLabel.text = peliculas[indexPath.row].critics_score
//        movieImgUrl = streamNode[indexPath.row].image ?? ""
//        if (movieImgUrl == "/images/movie_poster-04.jpg" || movieImgUrl == "")
//        {
//            if let posterPath = streamNode[indexPath.row].poster_path{
//                movieImgUrl = posterPath.replacingOccurrences(of: "http", with: "https")
//            }
//            else {
//                movieImgUrl = "https://cl.buscafs.com/www.tomatazos.com/public/uploads/images/334146/334146_140x200.jpg"
//            }
//        }
//        let processor = DownsamplingImageProcessor(size: (cell?.myImage.bounds.size)!)
//        cell?.myImage.kf.indicatorType = .activity
//        cell?.myImage.kf.setImage(with: URL(string: movieImgUrl),
//                            placeholder: UIImage(named: "placeholderImage"),
//                            options: [
//                                .processor(processor),
//                                .scaleFactor(UIScreen.main.scale),
//                                .transition(.fade(1)),
//                                .cacheOriginalImage
//                            ])
        return cell!
    }
}
//MARK: - UITableViewDelegate
extension StreamViewController:UITableViewDelegate{
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        streamNodeSelected = streamNode[indexPath.row]
        performSegue(withIdentifier: "SegueStreamDetail", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Para pasar la pelicula seleccionada al detailmoviecontroller
        if let destination = segue.destination as? DetailMovieViewController
        {
            do{
            let peliculaSelected = try Peliculas(from: streamNode as! Decoder)
            destination.pelicula = peliculaSelected
            }
            catch{}
        }
    }
}
