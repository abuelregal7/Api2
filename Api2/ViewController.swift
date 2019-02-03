//
//  ViewController.swift
//  Api2
//
//  Created by Ahmed abu elregal on 11/11/18.
//  Copyright © 2018 Ahmed abu elregal. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController ,UITableViewDataSource, UITableViewDelegate {
    var newcountry = [Country]()
    
    @IBOutlet weak var countrytable: UITableView!
    
    override func viewDidLoad() {
        
        countrytable.dataSource = self
        countrytable.delegate = self
        
        super.viewDidLoad()
        
        getCountry()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func getCountry()
    {
        let languageUrl = "https://restcountries.eu/?fbclid=IwAR01zxZhviB1KVg_eC9JnxgigtythDocKpZghu95LFk-PcLR6_JvvcbJZio#api-endpoints-all"
        Alamofire.request(languageUrl).responseJSON { response in
            print("The respone is : \(response)")
            let result = response.result
            print("The result is : \(result.value!)")
            if let arrayOfDic = result.value as? Dictionary<String, AnyObject>{
                print(arrayOfDic["name"] as Any)
                print(arrayOfDic["languages"] as Any)
                let messagedata1 = arrayOfDic["name"] as? [[String : Any]]
                let messagedata2 = arrayOfDic["languages"] as? [[String : Any]]
                for aDic in messagedata1! {
                    self.newcountry.append(Country(
                        name : aDic["name"] as! String
                        , languages : aDic["languages"] as! String
                        
                        
                    ))
                }
                for aDic in messagedata2! {
                    self.newcountry.append(Country(
                        name : aDic["name"] as! String
                        , languages : aDic["languages"] as! String
                        
                        
                    ))
                }
                self.countrytable.reloadData()
                print("\n\n")
                print("The Count is :\(self.newcountry.count)")
            }
        }
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newcountry.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = countrytable.dequeueReusableCell(withIdentifier: "countriesTableViewCell") as! countriesTableViewCell
        cell.lableName.text = newcountry[indexPath.row].name
        cell.lableLanguage.text = newcountry[indexPath.row].languages
        return cell
    }
    
    
}

