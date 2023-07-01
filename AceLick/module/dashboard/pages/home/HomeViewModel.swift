//
//  HomeViewModel.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 01/07/2023.
//

import UIKit
import RxSwift

final class HomeViewModel {
    func retrieveItems() -> Observable<[MenuItem]> {
        return Observable.create { observer in
            NetworkService<Empty, BaseResponse<[MenuItem]>>.shared.initiate(path: "/item/all") { result in
                switch result {
                case .success(let response):
                    observer.onNext(response.data)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create()
        }
    }
}
