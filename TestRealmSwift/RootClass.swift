//
//  RootClass.swift
//  TestRealmSwift
//
//  Created by minhnh on 9/28/15.
//  Copyright © 2015 minhnh. All rights reserved.
//

import UIKit
import ObjectMapper
import Realm
import RealmSwift

class RootClass: Object, Mappable {
	dynamic var anime : Anime!
	
	required init?(_ map: Map) {
		super.init()
	}

	required init() {
		super.init()
	}
	
	override init(realm: RLMRealm, schema: RLMObjectSchema) {
		super.init(realm: realm, schema: schema)
	}
	
	func mapping(map: Map)
	{
		anime <- map["anime"]
	}
}
