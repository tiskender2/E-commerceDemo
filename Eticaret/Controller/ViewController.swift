//
//  ViewController.swift
//  Eticaret
//
//  Created by MacMini on 26.10.2017.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    

    @IBOutlet weak var sideMenu: UIBarButtonItem!
    var indirimImage=[UIImage(named: "resim"),UIImage(named: "resim2")]
    var urunresimlerr=[String]()
    var urunResim=[UIImage(named: "arabakokusu"),UIImage(named: "arabakokusu"),UIImage(named: "arabakokusu"),UIImage(named: "arabakokusu"),UIImage(named: "arabakokusu")]
    var urunIndirim=["KOZMETİKTE %50 İNDİRİM","ELEKTRONİKTE %50 İNDİRİM"]
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewUrun: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        sideMenus()
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func sideMenus()
    {
        if revealViewController() != nil
        {
            sideMenu.target = revealViewController()
            sideMenu.action = #selector(SWRevealViewController.revealToggle(_:))
            revealViewController().rearViewRevealWidth = self.view.frame.width - 50
            view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
            
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.collectionView
        {
            return indirimImage.count
        }
        else
        {
            return urunResim.count
        }
      
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ResimCollectionViewCell
        if collectionView == self.collectionView
        {
             cell.imageView.image = indirimImage[indexPath.row]
             cell.label.text = urunIndirim[indexPath.row]
        }
        else
        {
            cell.layer.cornerRadius = 5
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor(red: 223/255, green: 223/255, blue: 223/255, alpha: 0).cgColor
            let bottomborder = UIView(frame: CGRect(x: 1, y:cell.urunIndirim.frame.size.height-(cell.urunIndirim.frame.size.height/2) , width: cell.urunIndirim.frame.size.width, height: 1))
            bottomborder.backgroundColor=UIColor.red
            cell.urunIndirim.addSubview(bottomborder)
            cell.urunResim.image=urunResim[indexPath.row]
            cell.urunAd.text = "Araba Kokusu"
            cell.urunIndirim.text = "24.99 TL"
            cell.urunFiyat.text = "19.99 TL"
            
        }
       
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if collectionView == self.collectionViewUrun
        {
            
            
            let nesne = self.storyboard?.instantiateViewController(withIdentifier: "UrunDetayViewController") as! UrunDetayViewController
            nesne.urunResimler=urunresimlerr
            self.navigationController?.pushViewController(nesne, animated: true)
        }
    }
    
    
   
    
  
    



}
