# PVCovidTrace

# SeniorProject

## Current Problem 
As school reopen, it is impossible to ignore the effects COVID-19 has had on the learning environment as well as the concerns associated with COVID-19 and the lack of efficient contact tracing on campus.
In addition, almost all cases are reported on social media platforms, causing paranoia and many questions amongst students who live on campus. 

# Solution 
Our mobile application will have hotspots where ppl can check-in and have better accuracy to who was last there and who they were in contact with. 
In the map, it will also show the cases and date they have been reported. 
This will assist in knowing where to avoid while quantities happen. 
With this mobile application, college campuses can help better inform students and faculty which areas have had more cases.

# Cloud Kit Database

Cloud kit was introduced by apple in 2014 esentially its apple's Back End Service. 

Guranteed with no scaling issues , apple uses it with million of users notes app, appstore,news app. 

 //price database 
 - free data up to 10GB 
 - cloudkit free up the more users you have 

Cloud kit Pros 
1. Automatic Authentication : No need for login screen , linked to user icloud account 
      - user is created once the icloud is connected 
2. Syncs Across Devices 
    - sync across devices 
3. Apple's First Party Framework 
     - supportive photos, notes , news app 

 
 # Cons 
 - Apple only 
 - not for android devices 
 - supports only the apple eco system 
 
 
# Why we drifted away from firebase 
Firebase is owned by google 
apple wont deal with siwft packages or sdks making the app heavy 

# Setting Up iCloud Kit 
  - First stat with making  a "Container" 
  - Container needs to be created on xcode 
  - Container is the overall container in our moble app 
- Container contains a public, private, shared  
    - Public Database : Allows every user to see ex: news app, wwdc app videos, our example would be  displaying the pvlocations 
    - Private Database: for user specififc data ex:notes app, goes againt user icloud data not the apps data 
    - private backend i cannot see user data  i get up to apples privacy accesebility 
    - Shared Database : collaborating as user ex: note sharing lates iOS update
 Again Cloud kit supports  Three type of Databases 
  1) Public Database 
  2) Private Database 
  3) Shared Database 
 
 
 #Break down of the database in icloud and saving locations 
 
 - Record Type 

