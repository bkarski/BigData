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


