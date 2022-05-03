//
//  SecondViewController.swift
//  PMx
//
//  Created by Ramon Felix on 04/04/22.
//

import UIKit
import Kingfisher

class SecondViewController: UIViewController {
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var myTableView: UITableView!
    private var peliculas = [Peliculas]()
    private var peliculaSelected : Peliculas?
    private var movieImgUrl = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showSpinner()
        myTableView.dataSource=self
        myTableView.delegate=self
        myTableView.tableFooterView = UIView()
        myTableView.register(UINib(nibName: "MyTableViewCell", bundle: nil), forCellReuseIdentifier: "mycustomcell")
        
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
            print(error)
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
        cell?.dateFixLabel.text = unixTime(fechaUnix: peliculas[indexPath.row].theater_release_date!)
        cell?.criticFixLabel.text = peliculas[indexPath.row].critics_score
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

