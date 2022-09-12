//
//  BeerListViewController.swift
//  Brewery
//
//  Created by 곽재선 on 2022/09/09.
//

import UIKit

class BeerListViewController: UITableViewController {
    var beerList: [Beer] = []
    var dataTasks = [URLSessionTask]()
    var currentPage = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UINavigaiontBar
        self.title = "브루어리"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        // UITableView 설정
        self.tableView.register(BeerListCell.self, forCellReuseIdentifier: "BeerListCell")
        self.tableView.rowHeight = 150  // 테이블뷰의 높이 설정. 델리게이트에서도 설정 가능하지만 간단하게 설정 가능
        self.tableView.prefetchDataSource = self    // 25개 이상 데이터를 받아오려면 설정해주어야 함
        // cellforRowAt에서는 나에게 보여지는 셀들을 가져오는데, prefetchRow는 화면에는 보이지 않지만 보여질 예정인 값들을 미리 불러올 수 있음
        
        fetchBeer(of: currentPage)
    }
}

// UITableView DataSource, Delegate
extension BeerListViewController: UITableViewDataSourcePrefetching {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("Rows: \(indexPath.row)")
        guard let cell = self.tableView.dequeueReusableCell(withIdentifier: "BeerListCell", for: indexPath) as? BeerListCell else { return UITableViewCell() }
        
        let beer = beerList[indexPath.row]
        cell.configure(with: beer)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedBeer = beerList[indexPath.row]
        let detailViewController = BeerDetailViewController()
        
        detailViewController.beer = selectedBeer
        self.show(detailViewController, sender: nil)
    }
    
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        
        guard currentPage != 1 else { return }  // 1번 페이지는 뷰디드로드에서 하므로 제외
        
        indexPaths.forEach {
//            print("PrefetchRows: \($0.row)")
            
            if ($0.row + 1)/25 + 1 == currentPage {
                self.fetchBeer(of: currentPage)
            }
        }
        
    }
}

// Data Fetching
private extension BeerListViewController {
    func fetchBeer(of page: Int) {
        guard let url = URL(string: "https://api.punkapi.com/v2/beers?page=\(page)"),
              dataTasks.firstIndex(where: { task in   // 전역변수에 추가되어 있다면(한번 실행한 URL이라면) 진행하지 않음
                  task.originalRequest?.url == url
              }) == nil
        else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        let dataTask = URLSession.shared.dataTask(with: request) {[weak self] data, response, error in
            guard error == nil,
                  let self = self,
                  let response = response as? HTTPURLResponse,
                  let data = data,
                  let beers = try? JSONDecoder().decode([Beer].self, from: data) else {
                print("ERROR: URLSession data task \(error?.localizedDescription ?? "")")
                return
            }
            
            switch response.statusCode {
            case (200...299): // 성공
                self.beerList += beers
                self.currentPage += 1
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case (400...499): // 클라이언트 에러
                print("""
                    ERROR: Client ERROR \(response.statusCode)
                    Response: \(response)
                """)
            case (500...599): // 서버 에러
                print("""
                    ERROR: Server ERROR \(response.statusCode)
                    Response: \(response)
                """)
            default:
                print("""
                    ERROR: \(response.statusCode)
                    Response: \(response)
                """)
            }
        }
        dataTask.resume()
        dataTasks.append(dataTask)  // 데이터 태스크가 실행 될 때마다 전역변수에 추가
    }
}
