//
//  Anime.swift
//  TestRealmSwift
//
//  Created by minhnh on 9/28/15.
//  Copyright © 2015 minhnh. All rights reserved.
//

import RealmSwift
import Realm
import ObjectMapper

class Anime: Object, Mappable {
	dynamic var rootClass : RootClass!
	dynamic var ageRating : String = ""
	dynamic var bayesianRating : Float = 0
	dynamic var communityRating : Float = 0
	dynamic var coverImage : String = ""
	dynamic var episodeCount : Int = 0
	dynamic var episodeLength : Int = 0
	dynamic var finishedAiringDate : String = ""
	dynamic var id : Int = 0
	dynamic var posterImage : String = ""
	dynamic var showType : String = ""
	dynamic var slug : String = ""
	dynamic var startedAiringDate : String = ""
	dynamic var synopsis : String = ""
	dynamic var titles : Title!
	dynamic var youtubeVideoId : String = ""

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
		ageRating <- map["age_rating"]
		bayesianRating <- map["bayesian_rating"]
		communityRating <- map["community_rating"]
		coverImage <- map["cover_image"]
		episodeCount <- map["episode_count"]
		episodeLength <- map["episode_length"]
		finishedAiringDate <- map["finished_airing_date"]
		id <- map["id"]
		posterImage <- map["poster_image"]
		showType <- map["show_type"]
		slug <- map["slug"]
		startedAiringDate <- map["started_airing_date"]
		synopsis <- map["synopsis"]
		titles <- map["titles"]
		youtubeVideoId <- map["youtube_video_id"]
	}
}
