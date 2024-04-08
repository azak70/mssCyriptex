//
//  CyriptoViewModel.swift
//  mssCyriptex
//
//  Created by ahmet azak on 5.04.2024.
//

import Foundation
import RxSwift
import RxCocoa
class CyriptoViewModel {
    
    let cyriptos : PublishSubject<[Cyripto]> = PublishSubject()
    let error : PublishSubject<String> = PublishSubject()
    let loading : PublishSubject<Bool> = PublishSubject()
    
    func requestData (){
        self.loading.onNext(true);
        let urlstr = URL(string:"https://raw.githubusercontent.com/atilsamancioglu/K21-JSONDataSet/master/crypto.json")
        WebService().downloadCurrencies(url: urlstr!) { result in
            self.loading.onNext(false)
            switch(result){
            case .success(let cyriptos):
                self.cyriptos.onNext(cyriptos)
                print("cyriptos length : \(cyriptos.count)")
            case .failure(let error):
                switch(error)
                {
                case.parsingError : self.error.onNext("Parsing Error")
                case .serverError : self.error.onNext("Server Error")
                }
                
                print(error)
                
            }
            
        }
    }
}
