//
//  ViewController.swift
//  newsy
//
//  Created by Sidharth  Miglani on 2/2/19.
//  Copyright © 2019 Sidharth  Miglani. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {
    
    let key="0875cf2216ab437b877da69ad0c6adf0"
    let Newsurl="https://newsapi.org/v2/top-headlines"
    var arr:[Article]=[Article]()
    var str=""
    @IBOutlet var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        giveData()
        tableView.delegate=self
        tableView.dataSource=self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    func configureTableView(){
        tableView.rowHeight=UITableView.automaticDimension
       // tableView.estimatedRowHeight=120.0
    }
    func getNewsData(url:String,parameters:[String:String])
    {
        Alamofire.request(url,method:.get,parameters:parameters).responseJSON{
            response in
            if response.result.isSuccess{
                print("Success!!")
                let NewsDataJSON:JSON=JSON(response.result.value!)
               print(NewsDataJSON)
                self.updateData(json: NewsDataJSON)
            }
            else{
                print("Error\(response.result.error)")
                // self.cityLabel.text="Connection Issues"
            }
        }
    }
    func updateData(json:JSON){
        var i=0
        var dummy=1//put this in loop
        while dummy==1{
            if let source=json["articles"][i]["description"].string{
            print(source)
            print(arr.count)
                let img=json["articles"][i]["urlToImage"].string
                let url=json["articles"][i]["url"].string
                arr.append(Article(imgurl: img! , content: source,url:url!))
                print(arr[i].content)
                self.configureTableView()
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            else{
                dummy=2
                print(exit)
            }
            i=i+1
        }
        //print(source)

        //print(arr[0].content)
       print(arr.count)

    }
    func giveData(){
        let params:[String:String]=["sources":"techcrunch","apiKey":key]
        getNewsData(url: Newsurl, parameters: params)
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell=tableView.dequeueReusableCell(withIdentifier: "articleCell", for:indexPath)as!TableViewCell
        cell.cont.text=arr[indexPath.row].content
        cell.img.showImage(url:arr[indexPath.row].imgurl)
  return cell
}
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let webvc=UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "web")as!webViewController
        webvc.recv=arr[indexPath.row].url
        self.present(webvc,animated: true,completion: nil)
        
    }
  }

extension UIImageView{
    func showImage(url:String){
       // let url = URL(string:url)!
      //  let urlRequest = URLRequest(url: url)
        Alamofire.request(url,method:.get)
            .responseData(completionHandler: { (responseData) in
                self.image=UIImage(data:responseData.data! )
                DispatchQueue.main.async{
                    }
                })
                
        }
    }

