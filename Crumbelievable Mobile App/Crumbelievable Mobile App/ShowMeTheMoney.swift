//
//  ShowMeTheMoney.swift
//  Crumbelievable Mobile App
//
//  Created by Hassan Chahrour on 4/18/24.
//

import UIKit
import SwiftUI
import PassKit
import Frames

class ShowMeTheMoney: UIViewController {

        override func viewDidLoad() {
            super.viewDidLoad()

            /**
                This is optional and can use nil instead of this property.
                But if you can provide these details for your user you can
                    - make their checkout experience easier by prefilling fields they may need to do
                    - improve acceptance success for card tokenisation
            */
            let country = Country(iso3166Alpha2: "GB")
            let address = Address(
                addressLine1: "221B Baker Street",
                addressLine2: "Marylebone",
                city: "London",
                state: "London",
                zip: "NW1 6XE",
                country: country)
            let phone = Phone(number: "+44 2072243688",
                country: country)
            let billingFormData = BillingForm(
                name: "Amazing Customer",
                address: address,
                phone: phone)

            let configuration = PaymentFormConfiguration(
                apiKey: "<Your Public Key>",
                environment: .sandbox,
                supportedSchemes: [.visa, .maestro, .mastercard],
                billingFormData: billingFormData)
            
            // Style applied on Card input screen (Payment Form)
            let paymentFormStyle = DefaultPaymentFormStyle()

            // Style applied on Billing input screen (Billing Form)
            let billingFormStyle = DefaultBillingFormStyle()

            // Frames Style
            let style = PaymentStyle(
                paymentFormStyle: paymentFormStyle,
                billingFormStyle: billingFormStyle)
            
            let completion: ((Result<TokenDetails, TokenRequestError>) -> Void) = { result in
                switch result {
                case .failure(let failure):
                    if failure == .userCancelled {
                        // Depending on needs, User Cancelled can be handled as an individual failure to complete, an error, or simply a callback that control is returned
                        print("User has cancelled")
                    } else {
                        print("Failed, received error", failure.localizedDescription)
                    }
                case .success(let tokenDetails):
                    print("Success, received token", tokenDetails.token)
                }
            }
            
            let framesViewController = PaymentFormFactory.buildViewController(
                configuration: configuration, // Step 2
                style: style, completionHandler: completion         // Step 3
                //completionHandler: completion // Step 4
            )
            /**
                We are assuming you started the Walkthrough from the presenting ViewController
                    and that a Navigation Controller is available
                
                You will need to make minor adjustments otherwise.
                
                For the best experience we recommend embedding the presenting ViewController inside an UINavigationController
            */
            navigationController?.pushViewController(framesViewController, animated: true)
        }
    }
