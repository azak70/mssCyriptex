//
//  ViewController.swift
//  mssCyriptex
//
//  Created by ahmet azak on 3.04.2024.
//

import UIKit
import RxSwift

class ViewController: UIViewController,UITableViewDelegate {
    
    @IBOutlet weak var tableview: UITableView!
    
    let cyriptoVM = CyriptoViewModel()
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    let disposeBag = DisposeBag()
    var cyrptos=[Cyripto]()
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cyrptos.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        tableview.rx.setDelegate(self).disposed(by: disposeBag)
        setupBindings()
        cyriptoVM.requestData()
        
        // Do any additional setup after loading the view.
    }
    private func setupBindings (){
        cyriptoVM.loading.bind(to: self.indicatorView.rx.isAnimating).disposed(by: disposeBag)
        cyriptoVM.error.observe(on: MainScheduler.asyncInstance).subscribe{errorString in
            print(errorString)
        }.disposed(by: disposeBag)
       /* cyriptoVM.cyriptos.observe(on: MainScheduler.asyncInstance).subscribe { cyriptoList in
            self.cyrptos = cyriptoList
            self.tableview.reloadData()
            
        }.disposed(by: disposeBag)*/
        
        cyriptoVM.cyriptos.observe(on: MainScheduler.asyncInstance).bind(to: tableview.rx.items(cellIdentifier: "cell",cellType: CyriptoTableViewCell.self)){row,item,cell in
            cell.item = item
        }.disposed(by: disposeBag)
            
         
         
    }


}

