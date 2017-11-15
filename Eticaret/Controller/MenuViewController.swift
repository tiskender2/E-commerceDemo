//
//  MenuViewController.swift
//  Eticaret
//
//  Created by MacMini on 26.10.2017.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    @IBOutlet weak var kayitliAdres: UILabel!
    @IBOutlet weak var siparis: UILabel!
    @IBOutlet weak var imageIcon: UIButton!
    @IBOutlet weak var isimLabel: UILabel!
    @IBOutlet weak var epostaLabel: UILabel!
    @IBOutlet weak var submenuBtn: UIButton!
    @IBOutlet weak var siparisSorgula: UILabel!
    @IBOutlet weak var sepetim: UILabel!
    @IBOutlet weak var girişyapLogin: UILabel!
    @IBOutlet weak var girisyapBtn: UIButton!
    @IBOutlet weak var uyeOl: UIButton!
    @IBOutlet weak var adreslerBtn: UIButton!
    @IBOutlet weak var siparisBtn: UIButton!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var ayarlarBtn: UIButton!
    @IBOutlet weak var cikisBtn: UIButton!
    @IBOutlet weak var anasayfaBtn: UIButton!
    @IBOutlet weak var kategoriBtn: UIButton!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var acılırview: UIView!
    var icongonder = true
 
    
    var menuIsım=["Hakkımızda","Banka Hesap Bilgileri","Gizlilik ve Güvenlik","Teslimat ve İade Koşulları","Mesafeli Satış Sözleşmesi","İletişim"]

    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        borderCustimize()
        let firstView = stackView.arrangedSubviews[1]
         self.submenuBtn.setImage(UIImage(named: "ikinci"), for: .normal)
        firstView.isHidden = true
        let secondView = stackView.arrangedSubviews[2]
        secondView.isHidden = true
       
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return menuIsım.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        tableView.separatorColor=UIColor.clear
        cell.menuisimLabel.text!=menuIsım[indexPath.row]
        return cell
    }
    
    @IBAction func submenuAction(_ sender: Any) {
        
        if !icongonder
        {
            
            let firstView = stackView.arrangedSubviews[2]
            UIView.animate(withDuration: 0.5){
                firstView.isHidden = true
                self.submenuBtn.setImage(UIImage(named: "ikinci"), for: .normal)
        }
              icongonder = true
        }
        else
            {
         
                let firstView = self.stackView.arrangedSubviews[2]
            UIView.animate(withDuration: 0.5){
                firstView.isHidden = false
                let bottomborder = UIView(frame: CGRect(x: 1, y:self.acılırview.frame.size.height-1 , width: self.acılırview.frame.size.width, height: 0.5))
                bottomborder.backgroundColor=UIColor.lightGray
                self.acılırview.addSubview(bottomborder)
                   self.submenuBtn.setImage(UIImage(named: "ilk"), for: .normal)
        }
                icongonder = false
        
    }
    }
    
   
     
        
    @objc func tapFunction(sender:UITapGestureRecognizer) {
        print("tap working")
    }
    
    func borderCustimize()
    {
        imageIcon.layer.cornerRadius = 20
        imageIcon.clipsToBounds = true
        submenuBtn.setImage(UIImage(named: "arrow"), for: .normal)
        //siparis.isUserInteractionEnabled = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(MenuViewController.tapFunction))
        siparis.isUserInteractionEnabled = true
        siparis.addGestureRecognizer(tap)
        //ustLabel.backgroundColor = UIColor(patternImage: UIImage(named: "gradbg")!)
        let leftborder = UIView(frame: CGRect(x: 1, y: 0, width: 0.5, height: siparis.frame.size.height))
        leftborder.backgroundColor=UIColor.white
        siparis.addSubview(leftborder)
        let leftborder2 = UIView(frame: CGRect(x: 1, y: 0, width: 0.5, height: sepetim.frame.size.height))
        leftborder2.backgroundColor=UIColor.white
        sepetim.addSubview(leftborder2)
        let bottomborder = UIView(frame: CGRect(x: 1, y:siparis.frame.size.height-1 , width: siparis.frame.size.width, height: 0.5))
        bottomborder.backgroundColor=UIColor.white
        siparis.addSubview(bottomborder)
        let bottomborder5 = UIView(frame: CGRect(x: 1, y:sepetim.frame.size.height-1 , width: sepetim.frame.size.width, height: 0.5))
        bottomborder5.backgroundColor=UIColor.white
        sepetim.addSubview(bottomborder5)
        let bottomborder4 = UIView(frame: CGRect(x: 1, y:siparisSorgula.frame.size.height-1 , width: siparisSorgula.frame.size.width, height: 0.5))
        bottomborder4.backgroundColor=UIColor.white
        siparisSorgula.addSubview(bottomborder4)
        let bottomborder3 = UIView(frame: CGRect(x: 1, y:self.kategoriBtn.frame.size.height-1 , width: self.kategoriBtn.frame.size.width, height: 0.5))
        bottomborder3.backgroundColor=UIColor.lightGray
        self.kategoriBtn.addSubview(bottomborder3)
        kategoriBtn.setTitle("  KATEGORİLER", for: .normal)
        let bottomborder2 = UIView(frame: CGRect(x: 1, y:kayitliAdres.frame.size.height-1 , width: kayitliAdres.frame.size.width, height: 0.5))
        bottomborder2.backgroundColor=UIColor.white
        kayitliAdres.addSubview(bottomborder2)
        adreslerBtn.contentHorizontalAlignment = .left
        siparisBtn.contentHorizontalAlignment = .left
        favBtn.contentHorizontalAlignment = .left
        ayarlarBtn.contentHorizontalAlignment = .left
        cikisBtn.contentHorizontalAlignment = .left
        anasayfaBtn.contentHorizontalAlignment = .left
        kategoriBtn.contentHorizontalAlignment = .left
    }

   


}

