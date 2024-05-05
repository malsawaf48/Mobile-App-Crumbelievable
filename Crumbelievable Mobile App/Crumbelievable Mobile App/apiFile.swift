import UIKit
import Foundation


enum ApiError: Error {
    case missingData
    case networkError
    case unexpectedError(error: Error)
    case loginFailed(message: String)
}

extension ApiError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .missingData:
            return NSLocalizedString("Found and will discard API content with missing information.", comment: "")
        case .networkError:
            return NSLocalizedString("Error fetching quake data over the network.", comment: "")
        case .unexpectedError(let error):
            return NSLocalizedString("Received unexpected error. \(error.localizedDescription)", comment: "")
        case .loginFailed(let message):
            return NSLocalizedString("Login failed: \(message)", comment: "")
        }
    }
}

// Define Codable structs to represent the JSON structure
struct User: Codable {
    let id: Int
    let username: String
    let roles: [String]
    let email: String
    let firstName: String
    let lastName: String
    let orders: [String]
    let rewardPoints: Int
    let position: String?
    let streetAddress: String?
    let city: String?
    let state: String?
    let zip: String?
    let phoneNumber: String?
    let customerNotes: String?
    let admin: Bool
    let employee: Bool
}

struct APIResponse: Codable {
    let message: String
    let data: UserData
}

struct UserData: Codable {
    let user: User
    let token: String
}

struct LoginRequest: Codable {
    let username: String
    let password: String
    
    init(username: String, password: String) {
        self.username = username
        self.password = password
    }
}

// Function to fetch data from the API
func fetchData(username: String, password: String, completion: @escaping (Result<UserData, Error>) -> Void) {
    // Define the URL
    let urlString = "https://dev.cis294.hfcc.edu/api/login"
    guard URL(string: urlString) != nil else {
        print("Invalid URL")
        return
    }
    let credentials = LoginRequest(username: username, password: password)
    guard let payload = try? JSONEncoder().encode(credentials) else {
        completion(.failure(ApiError.missingData))
        return
    }
    
    var request = URLRequest(url: URL(string: urlString)!)
    request.httpMethod = "POST"
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpBody = payload
    
    // Create a URLSession
    let session = URLSession.shared
    
    // Create a data task to fetch the data
    let task = session.dataTask(with: request) { data, response, error in
        // Check for errors
        if let error = error {
            print("Error: \(error)")
            return
        }
        
        // Check if response is received
        guard let httpResponse = response as? HTTPURLResponse else {
            print("Invalid response")
            return
        }
        
        // Check if response status code is success
        guard (200...299).contains(httpResponse.statusCode) else {
            print("Invalid status code: \(httpResponse.statusCode)")
//            completion(.failure(error!))
            return
        }
        
        // Check if data is received
        guard let jsonData = data else {
            print("No data received")
            return
        }
        
        // Decode JSON data into APIResponse object
        do {
            let apiResponse = try JSONDecoder().decode(APIResponse.self, from: jsonData)
            print("Raw data: ", String(data: jsonData, encoding: .utf8) ?? "*unknown encoding*")
            // Access the user data and token
            let user = apiResponse.data.user
            let token = apiResponse.data.token
            let userData = apiResponse.data
            
            // Now you can use user and token as needed
           // print("User ID: \(user.id)")
            //print("Username: \(user.username)")
            //print("Token: \(token)")
            
            completion(.success(userData))
            
        } catch {
            print("Error decoding JSON: \(error)")
        }
        
        
        
    }
    
    // Start the data task
    task.resume()
}
//var userN: String = "hi"
//// Call the fetchData function to fetch data from the API
//fetchData(username: "admin", password: "cpWxXb94"){ result in
//    switch result {
//    case .success(let userData):
//        print("test")
//        print("Username: \(userData.user.username)")
//        userN = userData.user.username
//        print(userN)
//        // Access other properties of response.user as needed
//    case .failure(let error):
//        print(error.localizedDescription)
//    }
//}
//print(userN)

