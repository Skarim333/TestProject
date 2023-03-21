//
//  ProfileViewModel.swift
//  TestTask
//
//  Created by Карим Садыков on 17.03.2023.
//

import Foundation

protocol ProfileViewModelProtocol {
    func logOut()
}

class ProfileViewModel: ProfileViewModelProtocol {
    var coordinator: ProfileCoordinator?
    
    func logOut() {
        coordinator?.didFinishProfile()
    }
}
