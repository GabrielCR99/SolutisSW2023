//
//  Configuration.swift
//  SolutisSW2023
//
//  Created by Gabriel Roveri on 03/05/23.
//

import Foundation

enum HTTPMethod: String {
    case get    = "GET"
}

enum Task {
    case requestPlain
    case requestParameters(parameters: [String: Any])
}

protocol Configuration {
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var task: Task { get }

}

struct ServiceError: Error {
    let issueCode: IssueCode
    var message: String {
        return issueCode.message
    }

    static var urlError: ServiceError {
        return ServiceError(issueCode: IssueCode.customMessage(message: "Wrong URL"))
    }

    static var notFoundData: ServiceError {
        return ServiceError(issueCode: IssueCode.customMessage(message: "Data not found"))
    }

    static var parseError: ServiceError {
        return ServiceError(issueCode: IssueCode.customMessage(message: "Parse Model Error"))
    }

    static var somethingWrong: ServiceError {
        return ServiceError(issueCode: IssueCode.customMessage(message: "Something went wrong!"))
    }

    enum IssueCode {
        case UNAUTHORIZED
        case sessionExpire
        case sessionNotFound
        case timeOut
        case customMessage(message: String)

        static func initValue(value: String) -> IssueCode {
            switch value.uppercased() {
            case "UNAUTHORIZED":
                return .UNAUTHORIZED
            case "SESSION_EXPIRE":
                return .sessionExpire
            case "SESSION_NOT_FOUND":
                return .sessionNotFound
            case "TIME_OUT":
                return .timeOut
            default:
                if value.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
                    return .customMessage(message: "Something went wrong!")
                }
                return .customMessage(message: value)
            }
        }

        var message: String {
            switch self {
            case .UNAUTHORIZED:
                return "Unauthorized!"
            case .sessionExpire:
                return "Session expired!"
            case .sessionNotFound:
                return "Session not found!"
            case .timeOut:
                return "Time out!"
            case .customMessage(let message):
                return message
            }
        }
    }
}
