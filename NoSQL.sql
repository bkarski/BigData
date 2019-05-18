cd mongodb-linux-x86_64-ubuntu1604-4.0.9/bin/

#Uruchomienie
./mongod --dbpath db

#Konsola
./mongo


use test
db.users.insert({name : "Anna", age : 27})

db.users.find()

db.users.insert({_id : "joe", name : "Joe", age : 46})

db.users.save({_id : "jack", name : "jack", age : 32})
db.users.find()

db.users.save({_id : "Jack", name : "Jack", age : 32})
db.users.find()




db.users.findOne({name : "Jack"})
var jack = db.users.findOne({name : "Jack"})


jack
 jack.cities = ["Warszawa", "Łódź", "Gdańsk"]

> jack
{
	"_id" : "Jack",
	"name" : "Jack",
	"age" : 32,
	"cities" : [
		"Warszawa",
		"Łódź",
		"Gdańsk"
	]
}


> db.users.findOne({name : "Jack"})
{ "_id" : "Jack", "name" : "Jack", "age" : 32 }


> db.users.save(jack)
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> 
> 
> 
> db.users.findOne({name : "Jack"})
{
	"_id" : "Jack",
	"name" : "Jack",
	"age" : 32,
	"cities" : [
		"Warszawa",
		"Łódź",
		"Gdańsk"
	]
}
> 


> db.users.update({name : "Joe"},{$set : {"cities" : ["Warszawa","Wrocław"]}})
WriteResult({ "nMatched" : 1, "nUpserted" : 0, "nModified" : 1 })
> 
> 
> 
> 
> db.users.find()
{ "_id" : ObjectId("5cc56e169dce1e3c72f4c1c7"), "name" : "Anna", "age" : 27 }
{ "_id" : "joe", "name" : "Joe", "age" : 46, "cities" : [ "Warszawa", "Wrocław" ] }
{ "_id" : "jack", "name" : "jack", "age" : 32 }
{ "_id" : "Jack", "name" : "Jack", "age" : 32, "cities" : [ "Warszawa", "Łódź", "Gdańsk" ] }
> 




> db.users.findOne({name : "Anna"})
{
	"_id" : ObjectId("5cc56e169dce1e3c72f4c1c7"),
	"name" : "Anna",
	"age" : 27
}

 var Anna = db.users.findOne({name : "Anna"})

jack.cities = ["Warszawa", "Łódź", "Gdańsk"]

db.users.update({name : "Anna"},{$set : {"addresses" : [{"street" : "Nowakowskiego", "city" : "Warszawa"},{"street" : "Poleczki", "city" : "Gdańsk"}]}})


robo3t
https://robomongo.org/download



wyszukac userów wiekszych age > 30
> db.users.find({"age" : {$gt : 30}})
{ "_id" : "joe", "name" : "Joe", "age" : 46, "cities" : [ "Warszawa", "Wrocław" ] }
{ "_id" : "jack", "name" : "jack", "age" : 32 }
{ "_id" : "Jack", "name" : "Jack", "age" : 32, "cities" : [ "Warszawa", "Łódź", "Gdańsk" ] }
> 




> db.users.find({"addresses.city" : "Warszawa"})
> db.users.find({"addresses.city" : "Warszawa"})
{ "_id" : ObjectId("5cc56e169dce1e3c72f4c1c7"), "name" : "Anna", "age" : 27, "addresses" : [ { "street" : "Nowakowskiego", "city" : "Warszawa" }, { "street" : "Poleczki", "city" : "Gdańsk" } ] }
> 




 db.users.find({"cities" : {$in : "Warszawa"}})
Error: error: {
	"ok" : 0,
	"errmsg" : "$in needs an array",
	"code" : 2,
	"codeName" : "BadValue"
}
> db.users.find({"cities" : {$in : ["Warszawa"]}})
{ "_id" : "joe", "name" : "Joe", "age" : 46, "cities" : [ "Warszawa", "Wrocław" ] }
{ "_id" : "Jack", "name" : "Jack", "age" : 32, "cities" : [ "Warszawa", "Łódź", "Gdańsk" ] }
> 




3) wyszukać userów 


db.users.find({"cities" : {$ne : ["Warszawa"]}}).pretty()
db.users.find({"cities" : {$nin : ["Warszawa"]}}).pretty()


db.users.find({},{name : 0})
db.users.find({},{name : 0})



var joe = db.users.findOne({name : "Joe"},{name : 0});

db.users.save(Joe)


db.users.find({name : {$regex : /^J.*/i}})



> db.counters.insert({name : "userIdCounter", value : 0 })
WriteResult({ "nInserted" : 1 })
> 
> 
> 
> 
> db.counter.find()
> db.counters.find()
{ "_id" : ObjectId("5cc594289dce1e3c72f4c1c8"), "name" : "userIdCounter", "value" : 0 }
> 


db.counters.findAndModify({query:{ name : "userIdCounter"}, update:{ $inc:{value:1} },new:true}) 


db.users.update({firstname: "Joe"},{$addToSet : {cities : "Warszawa"}})

                                                     
> db.users.update({},{$addToSet : {cities : "Gdańsk"}},{multi : true})
WriteResult({ "nMatched" : 4, "nUpserted" : 0, "nModified" : 3 }

db.users.find().pretty()


> db.users.find()
{ "_id" : ObjectId("5cc56e169dce1e3c72f4c1c7"), "name" : "Anna", "age" : 27, "addresses" : [ { "street" : "Nowakowskiego", "city" : "Warszawa" }, { "street" : "Poleczki", "city" : "Gdańsk" } ], "cities" : [ "Gdańsk" ] }
{ "_id" : "joe", "age" : 46, "cities" : [ "Warszawa", "Wrocław", "Gdańsk" ] }
{ "_id" : "jack", "name" : "jack", "age" : 32, "cities" : [ "Gdańsk" ] }
{ "_id" : "Jack", "name" : "Jack", "age" : 32, "cities" : [ "Warszawa", "Łódź", "Gdańsk" ] }
> 





db.users.update({},{$push : {"cities" : "Poznań", "Kraków"}},{multi : true})
db.users.update({},{$pull : {"cities" : ["Poznań", "Kraków"]}},{multi : true})



db.users.update({},{$push : {"cities" : {$each : ["Poznań", "Kraków"]}}},{multi : true})

db.users.update({firstname: "Jack"},{$pullAll : {"cities" : "Warszawa"}})



http://tinyurl.com/mongo28042019

Baza filmów do pobrania
https://raw.githubusercontent.com/rkaszczuk/MongoCourse/master/0_Movies_Data/movies.json


./mongoimport --db movies --collection movies movies.json --jsonArray --drop



db.movies.find({directed_by : "George Lucas"})


1
db.movies.find({directed_by : "George Lucas"}).pretty()

2
db.movies.find({"starring.actor" : "Emma Watson"},{name: 1, _id:0}).pretty()

3
db.movies.find({},{name: 1, "estimated_budget.amount" : 1 , _id:0}).limit(10)


db.movies.find({},{name: 1, "estimated_budget.amount" : 1 , _id:0}).limit(10).sort({ "estimated_budget":1})


4
db.movies.find({"genre" : {$in : ["Fiction","Family"]}},{name: 1, _id:0})

5
db.movies.find({$and :[{"genre" : "Fiction"}, {"genre" : "Family"}]},{name: 1,genre : 1, _id:0})


 db.movies.find({$and :[{"genre" : "Fiction"}, {"genre" : "Family"}]},{name: 1,genre : 1, _id:0}).pretty()



6

db.movies.find({$nor :[{"genre" : "Fiction"}, {"genre" : "Family"}]},{name: 1,genre : 1, _id:0})
 db.movies.find({$nor :[{"genre" : "Fiction"}, {"genre" : "Family"}]},{name: 1,genre : 1, _id:0}).pretty()


 db.movies.find({$nor :[{"genre" : "Fiction"}, {"genre" : "Family"}]},{name: 1,genre : 1, _id:0}).pretty()


gross_revenue.amount
7

> db.movies.find({"gross_revenue.amount" : {$gt : 1000000000}},{name: 1,"gross_revenue.amount" : 1, _id:0}).sort({ "gross_revenue.amount":1}).limit(3).pretty()


8


db.movies.update({},{$pull : {"starring.actor" : "Natalie portman"}},{multi : true})
db.movies.update({},{$pull : {"starring : {actor" : "Natalie portman"}}},{multi : true})


db.movies.update({},{$pull : {starring : {actor : "Natalie portman"}}},{multi : true})


9

db.movies.find({name : {$regex : /^Harry/i}},{name: 1, _id:0}).pretty()

db.movies.find({name : {$regex : ".*Harry,*"}},{name: 1, _id:0}).pretty()



10

db.movies.update({directed_by : "George Lucas"},{$push : {"genre" : "Space"}},{multi : true})

db.movies.find({directed_by : "George Lucas"}).pretty()




db.movies.find({directed_by : "George Lucas"}, {$add}).pretty()














---------------------------------------------------------------------------------------------------




20190518


db.movies.aggregate([
{$match : {"directed_by" : "George Lucas"}},
{$project : {tytul : "$name", przychod_brutto : "$gross_revenue.amount", koszt_produkcji : "$estimated_budget.amount", _id : 0 }},
{$addFields : {"zysk" : {$subtract : ["$przychod_brutto", "$koszt_produkcji"]}}},
{$group : {_id : null, sredni_zysk :  {$avg : "$zysk"}}}
])




db.movies.aggregate([
{$project : {tytul : "$name", przychod_brutto : "$gross_revenue.amount", koszt_produkcji : "$estimated_budget.amount", _id : 0 }},
{$addFields : {"zysk" : {$subtract : ["$przychod_brutto", "$koszt_produkcji"]}}},
{$group : {_id : null, sredni_zysk :  {$avg : "$zysk"}}}
])


db.movies.aggregate([
{$match : {"name" : "Star Wars"}},
{$unwind : "$genre"}
])



db.movies.aggregate([
{$group : {_id : null, ilosc : {$sum : 1}}}
])



db.movies.aggregate([
{$group : {_id : "$directed_by", ilosc_filmow : {$sum : 1}}},
{$sort : {ilosc_filmow : -1}}
])



db.movies.aggregate([
{$unwind : "$genre"},
{$group : {_id : "$genre" }},
{$group : {_id : null, suma :  {$sum : 1}}}
])



db.movies.aggregate([
{$project : {genre : 1, _id : 0}},
{$unwind : "$genre"} ,
{$group : {_id : "$genre", ilosc : {$sum : 1}}},
{$sort : {ilosc : -1}}
])



db.movies.aggregate(
[
{$project : {genre : 1, _id : 0}},
{$unwind : "$genre"} ,
{$group : {_id : "$genre"}},
{$facet : {
    gatunku : [{$project : {_id : 1}}],
    ilosc_gatunkow : [{$group : {_id : null, ilosc :  {$sum : 1}}}]
    }}
])




db.movies.aggregate([
{$sample : {size : 3}},
{$project : {genre : 1, _id : 0}},
])





//1
db.movies.aggregate([
{$unwind : "$starring"},  //rozpakowanie tablicy starring
{$group : {_id : "$starring.actor", ilosc_filmow : {$sum : 1}}}, //
{$sort : {ilosc_filmow : -1}},
{$limit : 20}
])


//2
db.movies.aggregate([
{$unwind : "$directed_by"},
{$project : {tytul : "$name", directed_by : 1, przychod_brutto : "$gross_revenue.amount", koszt_produkcji : "$estimated_budget.amount", _id : 0 }},
{$addFields : {"zysk" : {$subtract : ["$przychod_brutto", "$koszt_produkcji"]}}},
{$group : {_id : "$directed_by", sredni_zysk :  {$avg : "$zysk"}}},
{$sort : {sredni_zysk : -1}},
{$limit : 20}
])

lub

db.movies.aggregate([
{$unwind : "$directed_by"},
{$group : {_id : "$directed_by", sredni_zysk :  {$avg : "$gross_revenue.amount"}}},
{$sort : {sredni_zysk : -1}},
{$limit : 20}
])


//3
db.movies.aggregate([
{$addFields : {zysk : {$subtract : ["$gross_revenue.amount", "$estimated_budget.amount"]}}},
{$unwind : "$genre"},
{$group : {_id : "$genre", sredni_zysk :  {$avg : "$zysk"}}},
{$limit : 5}
])


//4
db.movies.aggregate([
{$addFields : {zysk : {$subtract : ["$gross_revenue.amount", "$estimated_budget.amount"]}}},
{$sort : {zysk : -1}},
{$limit : 5}
])


//5
db.movies.aggregate([
{$project : {genre : 1,starring : 1 , _id : 0 }},
{$unwind : "$starring"},
{$unwind : "$genre"},
{$group : {_id : {aktor : "$starring.actor", gatunek : "$genre", wystepy : {$sum : 1}}}},
{$sort : {sredni_zysk : -1}},
])





-------Replica Set


1. cel zduplikowanie istniejecej bazy danych(movies) z 1 serwera zrobimy 3;
1. schemat: Primary, Secondary i Artbiter


3.Wykonanie
- Stworzyć katalogi: db2, db3
-uruchomić 3 serwery z danymi z flagą --replSet na portach 27017, 27018, 27019 oraz dbPath db, db2, db3

ctrl + C


cd mongodb-linux-x86_64-ubuntu1604-4.0.9/bin/

#Uruchomienie
./mongod --dbpath db --port 27017 --replSet rs1
./mongod --dbpath db2 --port 27018 --replSet rs1
./mongod --dbpath db3 --port 27019 --replSet rs1


#Konsola
./mongo




> rs.status()
{
	"operationTime" : Timestamp(0, 0),
	"ok" : 0,
	"errmsg" : "no replset config has been received",
	"code" : 94,
	"codeName" : "NotYetInitialized",
	"$clusterTime" : {
		"clusterTime" : Timestamp(0, 0),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	}
}
>



> rs.initiate()
{
	"info2" : "no configuration specified. Using a default configuration for the set",
	"me" : "localhost:27017",
	"ok" : 1,
	"operationTime" : Timestamp(1558187016, 1),
	"$clusterTime" : {
		"clusterTime" : Timestamp(1558187016, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	}
}
rs1:SECONDARY> 


rs1:PRIMARY> rs.add("localhost:27018")
{
	"ok" : 1,
	"operationTime" : Timestamp(1558187169, 1),
	"$clusterTime" : {
		"clusterTime" : Timestamp(1558187169, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	}
}
rs1:PRIMARY> 


rs1:PRIMARY> rs.addArb("localhost:27019")
{
	"ok" : 1,
	"operationTime" : Timestamp(1558187272, 1),
	"$clusterTime" : {
		"clusterTime" : Timestamp(1558187272, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	}
}



rs1:PRIMARY> rs.status()
{
	"set" : "rs1",
	"date" : ISODate("2019-05-18T13:50:27.486Z"),
	"myState" : 1,
	"term" : NumberLong(1),
	"syncingTo" : "",
	"syncSourceHost" : "",
	"syncSourceId" : -1,
	"heartbeatIntervalMillis" : NumberLong(2000),
	"optimes" : {
		"lastCommittedOpTime" : {
			"ts" : Timestamp(1558187418, 1),
			"t" : NumberLong(1)
		},
		"readConcernMajorityOpTime" : {
			"ts" : Timestamp(1558187418, 1),
			"t" : NumberLong(1)
		},
		"appliedOpTime" : {
			"ts" : Timestamp(1558187418, 1),
			"t" : NumberLong(1)
		},
		"durableOpTime" : {
			"ts" : Timestamp(1558187418, 1),
			"t" : NumberLong(1)
		}
	},
	"lastStableCheckpointTimestamp" : Timestamp(1558187378, 1),
	"members" : [
		{
			"_id" : 0,
			"name" : "localhost:27017",
			"health" : 1,
			"state" : 1,
			"stateStr" : "PRIMARY",
			"uptime" : 1235,
			"optime" : {
				"ts" : Timestamp(1558187418, 1),
				"t" : NumberLong(1)
			},
			"optimeDate" : ISODate("2019-05-18T13:50:18Z"),
			"syncingTo" : "",
			"syncSourceHost" : "",
			"syncSourceId" : -1,
			"infoMessage" : "",
			"electionTime" : Timestamp(1558187017, 1),
			"electionDate" : ISODate("2019-05-18T13:43:37Z"),
			"configVersion" : 3,
			"self" : true,
			"lastHeartbeatMessage" : ""
		},
		{
			"_id" : 1,
			"name" : "localhost:27018",
			"health" : 1,
			"state" : 2,
			"stateStr" : "SECONDARY",
			"uptime" : 258,
			"optime" : {
				"ts" : Timestamp(1558187418, 1),
				"t" : NumberLong(1)
			},
			"optimeDurable" : {
				"ts" : Timestamp(1558187418, 1),
				"t" : NumberLong(1)
			},
			"optimeDate" : ISODate("2019-05-18T13:50:18Z"),
			"optimeDurableDate" : ISODate("2019-05-18T13:50:18Z"),
			"lastHeartbeat" : ISODate("2019-05-18T13:50:26.287Z"),
			"lastHeartbeatRecv" : ISODate("2019-05-18T13:50:26.286Z"),
			"pingMs" : NumberLong(0),
			"lastHeartbeatMessage" : "",
			"syncingTo" : "localhost:27017",
			"syncSourceHost" : "localhost:27017",
			"syncSourceId" : 0,
			"infoMessage" : "",
			"configVersion" : 3
		},
		{
			"_id" : 2,
			"name" : "localhost:27019",
			"health" : 1,
			"state" : 7,
			"stateStr" : "ARBITER",
			"uptime" : 155,
			"lastHeartbeat" : ISODate("2019-05-18T13:50:26.287Z"),
			"lastHeartbeatRecv" : ISODate("2019-05-18T13:50:26.425Z"),
			"pingMs" : NumberLong(0),
			"lastHeartbeatMessage" : "",
			"syncingTo" : "",
			"syncSourceHost" : "",
			"syncSourceId" : -1,
			"infoMessage" : "",
			"configVersion" : 3
		}
	],
	"ok" : 1,
	"operationTime" : Timestamp(1558187418, 1),
	"$clusterTime" : {
		"clusterTime" : Timestamp(1558187418, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	}
}





rs.remove



use test
db.users.insert({name : "restest", age : 27})



db.getCollection('oplog.rs').find({op: "i"})


 ./mongo --port 27018 

rs1:PRIMARY> rs.status()
{
	"set" : "rs1",
	"date" : ISODate("2019-05-18T14:10:47.717Z"),
	"myState" : 1,
	"term" : NumberLong(3),
	"syncingTo" : "",
	"syncSourceHost" : "",
	"syncSourceId" : -1,
	"heartbeatIntervalMillis" : NumberLong(2000),
	"optimes" : {
		"lastCommittedOpTime" : {
			"ts" : Timestamp(1558188468, 1),
			"t" : NumberLong(1)
		},
		"readConcernMajorityOpTime" : {
			"ts" : Timestamp(1558188468, 1),
			"t" : NumberLong(1)
		},
		"appliedOpTime" : {
			"ts" : Timestamp(1558188640, 1),
			"t" : NumberLong(3)
		},
		"durableOpTime" : {
			"ts" : Timestamp(1558188640, 1),
			"t" : NumberLong(3)
		}
	},
	"lastStableCheckpointTimestamp" : Timestamp(1558188468, 1),
	"members" : [
		{
			"_id" : 0,
			"name" : "localhost:27017",
			"health" : 0,
			"state" : 8,
			"stateStr" : "(not reachable/healthy)",
			"uptime" : 0,
			"optime" : {
				"ts" : Timestamp(0, 0),
				"t" : NumberLong(-1)
			},
			"optimeDurable" : {
				"ts" : Timestamp(0, 0),
				"t" : NumberLong(-1)
			},
			"optimeDate" : ISODate("1970-01-01T00:00:00Z"),
			"optimeDurableDate" : ISODate("1970-01-01T00:00:00Z"),
			"lastHeartbeat" : ISODate("2019-05-18T14:10:46.821Z"),
			"lastHeartbeatRecv" : ISODate("2019-05-18T14:07:56.465Z"),
			"pingMs" : NumberLong(0),
			"lastHeartbeatMessage" : "Error connecting to localhost:27017 (127.0.0.1:27017) :: caused by :: Connection refused",
			"syncingTo" : "",
			"syncSourceHost" : "",
			"syncSourceId" : -1,
			"infoMessage" : "",
			"configVersion" : -1
		},
		{
			"_id" : 1,
			"name" : "localhost:27018",
			"health" : 1,
			"state" : 1,
			"stateStr" : "PRIMARY",
			"uptime" : 2269,
			"optime" : {
				"ts" : Timestamp(1558188640, 1),
				"t" : NumberLong(3)
			},
			"optimeDate" : ISODate("2019-05-18T14:10:40Z"),
			"syncingTo" : "",
			"syncSourceHost" : "",
			"syncSourceId" : -1,
			"infoMessage" : "",
			"electionTime" : Timestamp(1558188488, 1),
			"electionDate" : ISODate("2019-05-18T14:08:08Z"),
			"configVersion" : 3,
			"self" : true,
			"lastHeartbeatMessage" : ""
		},
		{
			"_id" : 2,
			"name" : "localhost:27019",
			"health" : 1,
			"state" : 7,
			"stateStr" : "ARBITER",
			"uptime" : 1375,
			"lastHeartbeat" : ISODate("2019-05-18T14:10:46.705Z"),
			"lastHeartbeatRecv" : ISODate("2019-05-18T14:10:46.706Z"),
			"pingMs" : NumberLong(0),
			"lastHeartbeatMessage" : "",
			"syncingTo" : "",
			"syncSourceHost" : "",
			"syncSourceId" : -1,
			"infoMessage" : "",
			"configVersion" : 3
		}
	],
	"ok" : 1,
	"operationTime" : Timestamp(1558188640, 1),
	"$clusterTime" : {
		"clusterTime" : Timestamp(1558188640, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	}
}
rs1:PRIMARY> 

















