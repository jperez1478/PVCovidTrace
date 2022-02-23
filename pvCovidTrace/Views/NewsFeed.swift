//
//  NewsFeed.swift
//  pvCovidTrace
//
//  Created by Jessica Perez on 2/16/22.
//

import SwiftUI

struct ImageTextView : View {
    
    //Declare the variables that will be used to preview content
    var image:String
    var title: String
    var subtitle: String

    
    
    var body: some View {
        //Declare a scrolling page
        ScrollView(){
            VStack(alignment:.leading){
                Image (image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                VStack(alignment: .leading){
                    Text(title)
                        .font(.title)
                        .fontWeight(.black)
                    Text (subtitle)
                        .font(.headline)
                    
                }
                .padding(10)
            }
        }
    }
}



struct NewsFeed: View {
    
    
    var body: some View {
        //Navigation Bar
        NavigationView{
            //Declare a scrolling page
            ScrollView(showsIndicators: false){
                VStack{
                    ImageTextView(
                        image: "Uv",
                        title: "University View Covid Cases",
                        subtitle: "Covid has been at an all time high for the past few week in the University Village. Therefore, we will be changing some precedures to ensure the safety of students."
                    )
                    ImageTextView(
                        image: "header-logo",
                        title: "University Village Next Steps" ,
                        subtitle: "Through out the past we have been having problems with the safety of students in the University Village. Therfore, we as faculty staff have come together with next step procedures")
                    ImageTextView(
                        image: "pvmap",
                        title: "Covid Testing",
                        subtitle: "Covid-19 has been coming to a calm because of our campus wide Covid vaccine. If you have not been tested yet, come on campus in the Music Building. We will be giving out Vaccines Monday - Friday from 9am to 2pm.")
                }
            
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .principal){
                    HStack{
                        Image("pvmap")
                            .resizable()
                            .scaledToFit()
                        Text("Home")
                            .font(.title)
                            .fontWeight(.black)
                            .padding(5)
                        
                    }
                }
            }
        }
       
    }
}

struct NewsFeed_Previews: PreviewProvider {
    static var previews: some View {
        NewsFeed()
    }
}
 
