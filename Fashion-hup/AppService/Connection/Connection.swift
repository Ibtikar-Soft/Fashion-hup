//
//  Connection.swift
//  Fashion-hup
//
//  Created by Sandal on 21/02/1443 AH.
//

import Foundation

let AppBase="https://lamatiapi.ibtikar-soft.com/"
let AppImageBase="https://lamatiapi.ibtikar-soft.com/"

//App/
class Connection:NSData
{
    
     let baseUrl=AppBase+"api/"
    
    func  getUrl(word:String) -> String{
        var link:String =    ""
        switch word {
        // Auth
        case "Login":
            link = baseUrl+"Login"
            break
//            https://kayanapp.ibtikar-soft.sa/api/Customer/
        case "RegisterCustomers":
            link = baseUrl+"RegisterCustomers"
            break
        case "VerifyUser":
            link = baseUrl+"VerifyUser"
            break
        case "ReSendVarificationCode":
            link = baseUrl+"ReSendVarificationCode?PhoneNo=966"
            break
        
            // user profile
        case "GetProfileByID":
            link = baseUrl+"GetProfileByID?CustomerID="
            break
            
            
            // vichile
            
        case "GetVechileType":
            link = baseUrl+"GetVechileType"
            break
        case "GetVechileCompany":
            link = baseUrl+"GetVechileCompany"
            break
        case "GetVechileModel":
            link = baseUrl+"GetVechileModel"
            break
        case "RegisterVechile":
            link = baseUrl+"RegisterVechile"
            break
        case "GetServices":
            link = baseUrl+"GetServices"
            break
        case "GetAdditionalServices":
            link = baseUrl+"GetAdditionalServices"
            break
        case "GetCustomerVechiles":
            link = baseUrl+"GetCustomerVechiles?CustomerID="
            break
        case "DeleteVechile":
            link = baseUrl+"DeleteVechile?VechileID="
            break
        case "RegisterReservation":
            link = baseUrl+"RegisterReservation"
            break
        case "GetCustomerReservations":
            link = baseUrl+"GetCustomerReservations?CustomerID="
            break
            
            
            
            /////
        case "GetAppConfig":
            link = baseUrl+"GetAppConfig"
            break
        default:
            break
        }
        return link
        
    }
}

