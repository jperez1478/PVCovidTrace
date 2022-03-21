//
//  Login.swift
//  pvCovidTrace
//
//  Created by Jamal  Henry on 3/21/22.
//

import SwiftUI
import AuthenticationServices //Allow sign in with Apple
import CloudKit //Allow ICloud Services


struct Login: View {
 
    @AppStorage ("login") private var login = false
    
    var body: some View {
        // Use Navigation View
        NavigationView{
            ZStack{
                // Add a background image
                Image("pvmap")
                //Image(uiImage: UIImage(data: UserDefaults.standard.object(forKey: "demoImage") as! Data) as! UIImage)
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    // Let userID = saved userID
                    let userID = UserDefaults.standard.object(forKey: "userID") as? String

                    if (!login && (userID == nil)) {
                        Spacer()
                    
                        
                        // If login = false and userID is not exist,
                        // Show Sign in with Apple Button.
                        SignInWithAppleButton(
                            // Request User FullName and Email
                            onRequest: { request in
                                // You can change them if needed.
                                request.requestedScopes = [.fullName, .email]
                            },
                            // Once user complete, get result
                            onCompletion: { result in
                                // Switch result
                                switch result {
                                    // Auth Success
                                    case .success(let authResults):

                                    switch authResults.credential {
                                        case let appleIDCredential as ASAuthorizationAppleIDCredential:
                                            let userID = appleIDCredential.user
                                            if let firstName = appleIDCredential.fullName?.givenName,
                                                let lastName = appleIDCredential.fullName?.familyName,
                                                let email = appleIDCredential.email{
                                                // For New user to signup, and
                                                // save the 3 records to CloudKit
                                                let record = CKRecord(recordType: "UsersData", recordID: CKRecord.ID(recordName: userID))
                                                record["email"] = email
                                                record["firstName"] = firstName
                                                record["lastName"] = lastName
                                                // Save to local
                                                UserDefaults.standard.set(email, forKey: "email")
                                                UserDefaults.standard.set(firstName, forKey: "firstName")
                                                UserDefaults.standard.set(lastName, forKey: "lastName")
                                                let publicDatabase = CKContainer.default().publicCloudDatabase
                                                publicDatabase.save(record) { (_, _) in
                                                    UserDefaults.standard.set(record.recordID.recordName, forKey: "userID")
                                                }
                                                // Change login state
                                                self.login = true
                                            } else {
                                                // For returning user to signin,
                                                // fetch the saved records from Cloudkit
                                                let publicDatabase = CKContainer.default().publicCloudDatabase
                                                publicDatabase.fetch(withRecordID: CKRecord.ID(recordName: userID)) { (record, error) in
                                                    if let fetchedInfo = record {
                                                        let email = fetchedInfo["email"] as? String
                                                        let firstName = fetchedInfo["firstName"] as? String
                                                        let lastName = fetchedInfo["lastName"] as? String
                                                        // Save to local
                                                        UserDefaults.standard.set(userID, forKey: "userID")
                                                        UserDefaults.standard.set(email, forKey: "email")
                                                        UserDefaults.standard.set(firstName, forKey: "firstName")
                                                        UserDefaults.standard.set(lastName, forKey: "lastName")
                                                        // Change login state
                                                        self.login = true
                                                    }
                                                }
                                            }
                                        
                                        // default break (don't remove)
                                        default:
                                            break
                                        }
                                    case .failure(let error):
                                        print("failure", error)
                                }
                            }
                        )
                        .signInWithAppleButtonStyle(.white) // Button Style
                        .frame(width:350,height:50)         // Set Button Size (Read iOS 14 beta 7 release note)
                        
                    }else{
                        // Hide the button after logined
                        //Place holder View until we find Jess correct the view
                        MainTabView()
                    }
                    
                    // Show User Info
                    if let userID = UserDefaults.standard.object(forKey: "userID") as? String {
                        VStack(alignment: .leading) {
                        
                            if let firstName = UserDefaults.standard.object(forKey: "firstName") as? String,
                            let lastName = UserDefaults.standard.object(forKey: "lastName") as? String{
                                Label(NSLocalizedString("Welcome back", comment: "") + "! " + firstName + " " + lastName, systemImage: "lock.rotation.open")
                                    .font(.footnote)
                            }
                            if let email = UserDefaults.standard.object(forKey: "email") as? String {
                                HStack {
                                    Label(NSLocalizedString("Your Email", comment: "") + ": ", systemImage: "envelope.circle")
                                    ScrollView(.horizontal, showsIndicators: false) {
                                        Text(email)
                                    }
                                }.font(.footnote)
                            }
                            
                            HStack {
                                Label(NSLocalizedString("User ID", comment: "") + ": ", systemImage: "person.crop.circle")
                                ScrollView(.horizontal, showsIndicators: false) {
                                    Text(userID)
                                }
                            }.font(.footnote)
                        }
                        .padding()
                        .background(Color("WB").opacity(0.5))
                        .cornerRadius(25)
                    }
                }.padding()
            }
            .navigationTitle("Login to PVCovidTrace")
        }
    }
}
        

struct Login_Previews: PreviewProvider {
    static var previews: some View {
        Login()
    }
}
