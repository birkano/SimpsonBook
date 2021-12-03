//
//  ViewController.swift
//  SimpsonBook
//
//  Created by Birkan Pusa on 3.12.2021.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    // simpson dizisi oluşturduk
    var mySimpsons = [simpson]()
    var chosenSimpson : simpson?
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.dataSource = self
        tableView.delegate = self
        
        
        // sinifa elemanlari tanımadik
        
       let homer = simpson(simpsonName: "Homer", simpsonJob: "Nuclear Safet", simpsonImage: UIImage(named: "homer")!)
       let marge = simpson(simpsonName: "Marge", simpsonJob: "House Wife", simpsonImage: UIImage(named: "marge")!)
       let bart = simpson(simpsonName: "Bart", simpsonJob: "Kid", simpsonImage: UIImage(named: "bart")!)
       let lisa = simpson(simpsonName: "Lisa", simpsonJob: "Kid teacher", simpsonImage: UIImage(named: "lisa")!)
       let maggie = simpson(simpsonName: "Maggie", simpsonJob: "Baby", simpsonImage: UIImage(named: "maggie")!)
        
        //sınıfa tanımaladığımız elemanları diziye ekledik
        mySimpsons.append(homer)
        mySimpsons.append(marge)
        mySimpsons.append(bart)
        mySimpsons.append(lisa)
        mySimpsons.append(maggie)
        
        
    //navigasyona title ekledim
        navigationItem.title = "Simpsons"
        

    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return mySimpsons.count //dizideki eleman sayisi kadar eleman goster hucre olustur dedik
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = mySimpsons[indexPath.row].name //dizideki elemanları tableview'da listeledik
        return cell
    }
    
    //table view secilince gidecek, performsegue id'si ile o sayfaya gitmesi gerektigini soyledik
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //tiklayince hangi verileri yollayacagiz
        chosenSimpson = mySimpsons[indexPath.row]

        self.performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    //ikinci sayfaya veri yolladik
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //su sayfaya gidince su veriyi yolla dedik
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! detailsViewController
            destinationVC.selectedSimpson = chosenSimpson
            
    }

}

}
