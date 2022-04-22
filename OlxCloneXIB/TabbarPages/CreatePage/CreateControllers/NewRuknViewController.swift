//
//  NewRuknViewController.swift
//  OlxCloneXIB
//
//  Created by Macservis on 22/04/22.
//

import UIKit

class NewRuknViewController: UIViewController {
    var serverData: [Category] = []
    
    //MARK: Outlets
    
    @IBOutlet weak var nmTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setTableView()
        startFunction()
    }


 //MARK: - Methods
    
    func startFunction() {
        view.backgroundColor = UIColor.fromHexaString(hex: "F3F3F3")
        
        startNAvigation()
        serverAppend()
    }
    
    
    
    func startNAvigation() {
    
        title = "Rukn"
        
        navigationController?.navigationBar.backgroundColor = UIColor.fromHexaString(hex: "F3F3F3")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Bekor qilish", style: UIBarButtonItem.Style.plain, target: self, action: #selector(esc))
    
    }
    
    func  setTableView() {
        
        nmTableView.delegate = self
        nmTableView.dataSource = self
        nmTableView.register(UINib(nibName: "RuknTableViewCell", bundle: nil), forCellReuseIdentifier: RuknTableViewCell.identifier)
        nmTableView.rowHeight = 100
        
    }
    
    func  serverAppend() {
        serverData.append(Category(name: "Barcha e'lonlar", imageStr: "im_barcha", natija: 1500))
        serverData.append(Category(name: "Bolalar olami", imageStr: "im_bolalar",natija: 1700))
        serverData.append(Category(name: "Uy savdo", imageStr: "im_uy", natija: 1500))
        serverData.append(Category(name: "Avtomobillar", imageStr: "im_mashina", natija: 500))
        serverData.append(Category(name: "Ish", imageStr: "im_ish", natija: 18000))
        serverData.append(Category(name: "Jonivorlar", imageStr: "im_hayvonlar", natija: 3000))
        serverData.append(Category(name: "Uy jihozlari", imageStr: "im_sad", natija: 3765))
        serverData.append(Category(name: "Elektronika", imageStr: "im_elektronika", natija: 7423))
        serverData.append(Category(name: "Biznes chegirma", imageStr: "im_biznes", natija: 123))
        serverData.append(Category(name: "Moda va stil", imageStr: "im_kiyim", natija: 87678))
        serverData.append(Category(name: "Sport va Xobbi", imageStr: "im_sport", natija: 723))
        serverData.append(Category(name: "Tekinga beraman", imageStr: "im_tekin", natija: 2143))
        serverData.append(Category(name: "Obmen", imageStr: "im_obmen", natija: 8743))
    
        
    }
    

    
    //MARK: - objc methods
    
    @objc func esc() {
        navigationController?.popViewController(animated: true)
    }
    

}



extension NewRuknViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return serverData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = serverData[indexPath.row]
        let cell = nmTableView.dequeueReusableCell(withIdentifier: RuknTableViewCell.identifier, for: indexPath) as! RuknTableViewCell
        cell.nmImageView.image = UIImage(named: item.imageStr!)
        cell.nmNameLabel.text = item.name
        cell.nmNatijalarLabel.text = "\(item.natija ?? 0) ta natija"
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
        let vc = CreateViewController()
        switch serverData[indexPath.row].name {
        case "Barcha e'lonlar":
            vc.myProduct.rukn = .all
        case "Bolalar olami":
            vc.myProduct.rukn = .bolalar
        case "Uy savdo":
            vc.myProduct.rukn = .uy
        case "Avtomobillar":
            vc.myProduct.rukn = .mashina
        case "Bolalar":
            vc.myProduct.rukn = .all
        case "Ish":
            vc.myProduct.rukn = .ish
        case "Jonivorlar":
            vc.myProduct.rukn = .hayvonlar
        case "Uy jihozlari":
            vc.myProduct.rukn = .all
        case "Elektronika":
            vc.myProduct.rukn = .elektronika
        case "Biznes chegirma":
            vc.myProduct.rukn = .biznes
        case "Moda va stil":
            vc.myProduct.rukn = .moda
        case "Tekinga beraman":
            vc.myProduct.rukn = .tekin
        case "Obmen":
            vc.myProduct.rukn = .obmen
        default: break
        }
        navigationController?.popViewController(animated: true)
    }
    
}
