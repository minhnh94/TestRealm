//
//  Title.swift
//  TestRealmSwift
//
//  Created by minhnh on 9/28/15.
//  Copyright © 2015 minhnh. All rights reserved.
//

import RealmSwift
import Realm
import ObjectMapper

class Title: Object, Mappable {
	dynamic var anime : Anime!
	dynamic var canonical : String = ""
	dynamic var english : String = ""
	dynamic var japanese : AnyObject = ""
	dynamic var romaji : String = ""
	
	required init?(_ map: Map) {
		super.init()
	}

	required init() {
		super.init()
	}
	
	override init(realm: RLMRealm, schema: RLMObjectSchema) {
		super.init(realm: realm, schema: schema)
	}
	
	func mapping(map: Map) {
		canonical <- map["canonical"]
		english <- map["english"]
		japanese <- map["japanese"]
		romaji <- map["romaji"]
	}
}
