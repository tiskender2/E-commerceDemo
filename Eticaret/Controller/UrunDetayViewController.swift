//
//  UrunDetayViewController.swift
//  Eticaret
//
//  Created by MacMini on 31.10.2017.
//  Copyright © 2017 MacMini. All rights reserved.
//

import UIKit
import SDWebImage
class UrunDetayViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout,BEMCheckBoxDelegate{
    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var urunIsım: UILabel!
    @IBOutlet weak var urunTip: UILabel!
    @IBOutlet weak var urunFiyatı: UILabel!
    @IBOutlet weak var urunAcıklama: UITextView!
    var vids=[String]()
    var vidResim=[String]()
    var baslik=[String]()
    var fiyat=[String]()
    var indirimliFiyat=[String]()
    var secim=[String]()
    var urunResimler=[String]()
    var varyant_key=[String]()
    var varyant_tur=[String]()
    var varyantBaslik=[String]()
    var varyantId=[String]()
    var ozellik1Id=[String]()
    var ozellik1Baslık=[String]()
    var ozellik1Stok=[String]()
    var ozellik2Id=[String]()
    var ozellik2Baslık=[String]()
    var ozellik2Stok=[String]()
    var ozellik3Id=[String]()
    var ozellik3Baslık=[String]()
    var ozellik3SecimDurum=[String]()
    var secim4_id=""
    var uygulamadili="tr"
    var urunSayıları=""
    var maxStok:String=""
    var urunBilgi=[String]()
    var bemcheckBox=[BEMCheckBox]()
    var group1=[BEMCheckBoxGroup]()
    var group2=[BEMCheckBoxGroup]()
    @IBOutlet weak var btnFav: UIButton!
    @IBOutlet weak var adetSayi: UILabel!
    @IBOutlet weak var arttırBtn: UIButton!
    @IBOutlet weak var azaltBtn: UIButton!
    @IBOutlet weak var adetView: UIView!
    @IBOutlet weak var urunHakkindaView: UIView!
    @IBOutlet weak var ozellik4Label: UILabel!
    @IBOutlet weak var urunlerCw: UICollectionView!
    @IBOutlet weak var urunResimCw: UICollectionView!
    @IBOutlet weak var ozellik1Cw: UICollectionView!
    @IBOutlet weak var ozellik2Cw: UICollectionView!
    @IBOutlet weak var ozellik3Cw: UICollectionView!
    var newstr2 = 0
    var lg = CGFloat()
    override func viewDidLoad() {
        super.viewDidLoad()
        urunDetayCustomize()
      urunDetayDatas(urlString: "")
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      
    }
    func didTap(_ checkBox: BEMCheckBox) {
        
      //  let currentTag = checkBox.tag
        if checkBox.on != false
        {
          // maxStok=ozellik1Stok[checkBox.tag]
           adetSayi.text="0"
        }
       
     /*  for box in bemcheckBox where box.tag != currentTag  {
            
            box.on = false
            
        }*/
    }
    @IBAction func azaltBtnAction(_ sender: Any) {
       
        if adetSayi.text != "0"
        {
            adetSayi.text = String(Int(adetSayi.text!)! - 1)
        }
    }
    @IBAction func arttırBtnAction(_ sender: Any) {
     
        if adetSayi.text == maxStok
        {
            adetSayi.text = maxStok
        }
        else
        {
           adetSayi.text = String(Int(adetSayi.text!)! + 1)
        }
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == self.urunResimCw {
            return urunResimler.count
        }
        else  if collectionView == self.urunlerCw {
            return vidResim.count
        }
        else if collectionView == self.ozellik1Cw{
            return ozellik1Id.count
        }
        else if collectionView == self.ozellik2Cw{
            return ozellik2Id.count
        }
        else {
            return ozellik3Id.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! UrunDetayCollectionViewCell
        cell.layer.borderColor = UIColor(red: 210/255, green: 210/255, blue: 210/255, alpha: 1).cgColor
        cell.layer.borderWidth = 1
        cell.layer.cornerRadius = 4
        if collectionView == self.urunResimCw {
        cell.urunDetayResim.sd_setImage(with: URL(string: urunResimler[indexPath.row]))
        indicator.stopAnimating()
        }
        else if collectionView == self.urunlerCw{
            cell.urunlerResim.sd_setImage(with: URL(string: vidResim[indexPath.row]))
            cell.urunlerFiyat.text = indirimliFiyat[indexPath.row]
            cell.urunlerIsim.text = baslik[indexPath.row]
            cell.urunlerIsim.sizeToFit()
            
        }
        else if collectionView == self.ozellik1Cw
        {
            cell.ozellik1Label.text = ozellik1Baslık[indexPath.row]
            
          //  bemcheckBox.append(indexPath.row)
            cell.ozellik1Bem.tag = Int(ozellik1Id[indexPath.row])!
            bemcheckBox.append(cell.ozellik1Bem)
          //  self.group1 = [BEMCheckBoxGroup(checkBoxes: [cell.ozellik1Bem])]
            
            
            
        }
        else if collectionView == self.ozellik2Cw
        {
            cell.ozellik2Label.text = ozellik2Baslık[indexPath.row]
            cell.ozellik2Bem.tag = Int(ozellik2Id[indexPath.row])!
           // self.group2 =  [BEMCheckBoxGroup.init(checkBoxes: [cell.ozellik2Bem])]
        }
        else if collectionView == self.ozellik3Cw
        {
            cell.ozellik3Label.text = ozellik3Baslık[indexPath.row]
           // cell.ozellik3Bem.tag = indexPath.row
            if varyant_tur[2] == "checkbox"
            {
            cell.ozellik3Bem.boxType = BEMBoxType.square
            }
        }
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if collectionView == self.ozellik1Cw
        {
            
            let size = UICollectionViewFlowLayout()

            let size2 = size.itemSize
            let height = size2.height
            let witdh =  size2.width
            let cg = CGFloat(ozellik1Baslık[indexPath.row].count)
                 return CGSize(width: witdh + (cg*10), height: height/1.2)
        }
        else if collectionView == self.urunResimCw
        {
            let width = urunResimCw.frame.size.width
            let height = urunResimCw.frame.size.height
           
            return CGSize(width: width, height: height)
        }
        else if collectionView == self.urunlerCw
        {
            let width = urunlerCw.frame.size.width/2
            let height = urunlerCw.frame.size.height
           
            return CGSize(width: width, height: height)
        }
         else if collectionView == self.ozellik2Cw
        {
            let size = UICollectionViewFlowLayout()
            
            let size2 = size.itemSize
            let height = size2.height
            let witdh =  size2.width
            let cg = CGFloat(ozellik2Baslık[indexPath.row].count)
            return CGSize(width: witdh + (cg*10), height: height/1.2)
        }
        else
        {
            let size = UICollectionViewFlowLayout()
            
            let size2 = size.itemSize
            let height = size2.height
            let witdh =  size2.width
            let cg = CGFloat(ozellik3Baslık[indexPath.row].count)
            return CGSize(width: witdh + (cg*10), height: height/1.2)
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
   func urunDetayCustomize()
    {
        let size = UICollectionViewFlowLayout()
        size.minimumLineSpacing = 2
        // size.minimumInteritemSpacing = 2
        size.scrollDirection = .horizontal
        urunlerCw.collectionViewLayout = size
        adetView.layer.borderColor = UIColor.lightGray.cgColor
        adetView.layer.borderWidth = 1
        adetView.layer.cornerRadius = 4
        azaltBtn.layer.borderWidth = 1
        azaltBtn.layer.borderColor = UIColor.lightGray.cgColor
        arttırBtn.layer.borderWidth = 1
        arttırBtn.layer.borderColor = UIColor.lightGray.cgColor
        adetSayi.layer.borderWidth = 1
        adetSayi.layer.borderColor = UIColor.lightGray.cgColor
        urunHakkindaView.layer.borderWidth = 1
        urunHakkindaView.layer.borderColor = UIColor.lightGray.cgColor
        urunHakkindaView.layer.cornerRadius = 4
        btnFav.layer.borderWidth = 1
        btnFav.layer.borderColor = UIColor(red: 147/255, green: 3/255, blue: 6/255, alpha: 1).cgColor
        btnFav.layer.cornerRadius = 25
     
       
    }
    func urunDetayDatas(urlString:String)
    {
        
        let urlRequest = URL(string: urlString)
        var request = URLRequest(url: urlRequest! as URL)
        request.httpMethod = "POST"
        let parameters = ""+"2"+"&="+uygulamadili
        request.httpBody = parameters.data(using: String.Encoding.utf8)
        let task = URLSession.shared.dataTask(with: request as URLRequest) { (data, response, error) in
            
            if error != nil
            {
                print(error!)
            }
            else
            {
                do {
                    let json = try JSONSerialization.jsonObject(with: data!, options: .mutableContainers) as? NSDictionary
                    if let vid = json![""] as? String
                    {
                        self.urunBilgi.append(vid)
                    }
                    if let ubaslik = json![""] as? String
                    {
                        DispatchQueue.main.async {
                            self.urunIsım.text=ubaslik
                        }
                        
                    }
                    if let vbaslik = json![""] as? String
                    {
                        DispatchQueue.main.async {
                            self.urunTip.text=vbaslik
                        }
                        print(vbaslik)
                    }
                    if let fiyat = json![""] as? String
                    {
                       self.urunBilgi.append(fiyat)
                    }
                    if let ifiyat = json![""] as? String
                    {
                        
                        DispatchQueue.main.async {
                            self.urunFiyatı.text=ifiyat
                        }
                    }
                    if let uicerik = json![""] as? String
                    {
                      DispatchQueue.main.async {
                        self.setHTMLFromString(htmlText: uicerik)
                        }
                    }
                    if let stoksayisi = json![""] as? String
                    {
                        self.urunBilgi.append(stoksayisi)
                    }
                    
                    if let stokacıklama = json![""] as? String
                    {
                        self.urunBilgi.append(stokacıklama)
                    }
                    
                    self.urunResimler.removeAll()
                    if let resimler = json![""] as! NSArray?
                    {
                        for i in 0..<resimler.count
                        {
                            let resim = resimler[i] as! String
                            self.urunResimler.append(resim)
                            
                        }
                 
                    }
                    if let dVaryants = json![""] as?  NSArray
                    {
                        for i in 0..<dVaryants.count
                        {
                            if let jsonVeri = dVaryants[i] as? NSDictionary
                            {
                                if let vid = jsonVeri[""] as? String
                                {
                                    self.vids.append(vid)
                                    
                                }
                                if let resims = jsonVeri[""] as? String
                                {
                                    self.vidResim.append(resims)
                                    
                                }
                                if let basliks = jsonVeri[""] as? String
                                {
                                    
                                    self.baslik.append(basliks)
                                    
                                    
                                }
                                if let fiyats = jsonVeri[""] as? String
                                {
                                    self.fiyat.append(fiyats)
                                    
                                }
                                if let ifiyats = jsonVeri[""] as? String
                                {
                                    self.indirimliFiyat.append(ifiyats)
                                    
                                }
                                if let secims = jsonVeri[""] as? String
                                {
                                    self.secim.append(secims)
                                    
                                }
                            }
                            
                        }
                      
                    }
                    if let varyants = json![""] as?  NSArray
                    {
                        for i in 0..<varyants.count
                        {
                            if let jsonVeri = varyants[i] as? NSDictionary
                            {
                                if let varkey = jsonVeri[""] as? String
                                {
                                    self.varyant_key.append(varkey)
                                    
                                }
                                if let tur = jsonVeri[""] as? String
                                {
                                    self.varyant_tur.append(tur)
                                    
                                }
                                if let vbasliks = jsonVeri[""] as? String
                                {
                                    
                                    self.varyantBaslik.append(vbasliks)
                                   
                                    
                                }
                                if let secim = jsonVeri[""] as? String
                                {
                                     DispatchQueue.main.async {
                                    self.ozellik4Label.text=secim
                                    }
                                }
                                if let secim_id = jsonVeri[""] as? String
                                {
                                    self.secim4_id=secim_id
                                }
                               
                               
                                if let secims = jsonVeri[""] as? NSArray
                                {
                                    
                                    for j in 0..<secims.count
                                    {
                                      
                                        if let jsonVeri = secims[j] as? NSDictionary
                                        {
                                            if i == 0
                                            {
                                            if let ids = jsonVeri[""] as? String
                                            {
                                                self.ozellik1Id.append(ids)
                                            }
                                            if let secimlerbaslik = jsonVeri[""] as? String
                                            {
                                                
                                                self.ozellik1Baslık.append(secimlerbaslik)
                                            }
                                            if let stoks = jsonVeri[""] as? String
                                            {
                                                
                                                self.ozellik1Stok.append(stoks)
                                            }
                                            }
                                            else if i == 1
                                            {
                                                if let ids = jsonVeri[""] as? String
                                                {
                                                    self.ozellik2Id.append(ids)
                                                }
                                                if let secimlerbaslik = jsonVeri[""] as? String
                                                {
                                                    
                                                    self.ozellik2Baslık.append(secimlerbaslik)
                                                }
                                                if let stoks = jsonVeri[""] as? String
                                                {
                                                    
                                                    self.ozellik2Stok.append(stoks)
                                                }
                                            }
                                             else if i == 2
                                            {
                                                if let ids = jsonVeri[""] as? String
                                                {
                                                    self.ozellik3Id.append(ids)
                                                }
                                                if let secimlerbaslik = jsonVeri[""] as? String
                                                {
                                                    
                                                    self.ozellik3Baslık.append(secimlerbaslik)
                                                }
                                                if let secims = jsonVeri[""] as? String
                                                {
                                                    
                                                    self.ozellik3SecimDurum.append(secims)
                                                }
                                            }
                                           
                                            
                                        }
                                    }
                                }
   
                            }
                            
                        }
                        
                    }
                    
                    DispatchQueue.main.async {
                        self.urunResimCw.reloadData()
                        self.urunlerCw.reloadData()
                        self.ozellik1Cw.reloadData()
                        self.ozellik2Cw.reloadData()
                        self.ozellik3Cw.reloadData()
                    }
                }
                catch
                {
                    print(error)
                }
            }
        }
        task.resume()
    }
    func setHTMLFromString(htmlText: String) {
        let modifiedFont = NSString(format:"<span style=\"font-family: '-apple-system', 'HelveticaNeue'; font-size: \(18)\">%@</span>" as NSString, htmlText) as String
        
        
        //process collection values
        let attrStr = try! NSAttributedString(
            data: modifiedFont.data(using: .unicode, allowLossyConversion: true)!,
            options: [NSAttributedString.DocumentReadingOptionKey.documentType:NSAttributedString.DocumentType.html, NSAttributedString.DocumentReadingOptionKey.characterEncoding: String.Encoding.utf8.rawValue],
            documentAttributes: nil)
        
        
        self.urunAcıklama.attributedText = attrStr
    }


}
