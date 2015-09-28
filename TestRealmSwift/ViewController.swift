//
//  ViewController.swift
//  TestRealmSwift
//
//  Created by minhnh on 9/24/15.
//  Copyright © 2015 minhnh. All rights reserved.
//

import UIKit
import RealmSwift
import Alamofire
import AlamofireObjectMapper
import ObjectMapper
import SwiftyJSON

class ViewController: UIViewController {
	
	@IBOutlet weak var animeTitle: UILabel!
	@IBOutlet weak var textField: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
	}
	
	func request() {
		let idRoll = rand() % 10000
		
		let urlReq = "https://hummingbird.me/api/v2/anime/" + String(idRoll)
		
		let headers = [
			"X-Client-Id":"5bdd3ebe66dbdc448172"
		]
		
		Alamofire.request(.GET, urlReq, headers: headers)
			.responseObject { (response: RootClass?, error: ErrorType?) in
				print("Completed!")
				self.animeTitle.text = response!.anime.titles.romaji
				response!.anime.rootClass = response!
				response!.anime.titles.anime = response!.anime
				let realm = try! Realm()
				realm.write {
					realm.add(response!)
				}
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func didClickedInsert(sender: UIButton) {
		request()
		print("Initializing new data....")
	}
	
	@IBAction func didClickedSearch(sender: AnyObject) {
		let text = textField.text
		let realm = try! Realm()
		let predicate = NSPredicate(format: "romaji CONTAINS %@", text!)
		let titles = realm.objects(Title.self).filter(predicate)
		print("\(titles)")
	}
}

