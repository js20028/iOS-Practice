//
//  ViewController.swift
//  MovieList
//
//  Created by 곽재선 on 2022/04/22.
//

import UIKit

//let name = ["aaa", "bbb", "ccc", "ddd", "eee"]
//"https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=eaeb10d7faf1e1a760fb46f6b5050836&targetDt=20220424"
// s를 붙여서 https로 넣어줌

struct MovieData: Codable {
    let boxOfficeResult: BoxOfficeResult
}
struct BoxOfficeResult: Codable {
    let dailyBoxOfficeList: [DailyBoxOfficeList]
}
struct DailyBoxOfficeList: Codable {
    let movieNm: String
    let audiCnt: String
    let movieCd: String
    let openDt: String
}

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieData: MovieData?
    var movieURL = "https://kobis.or.kr/kobisopenapi/webservice/rest/boxoffice/searchDailyBoxOfficeList.json?key=eaeb10d7faf1e1a760fb46f6b5050836&targetDt="
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        
        movieURL += makeYesterdayURL()
        getData()
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            if let selectedIndex = self.tableView.indexPathForSelectedRow?.row {
                detailViewController.movieCode = movieData?.boxOfficeResult.dailyBoxOfficeList[selectedIndex].movieCd
            }
        }
    }
    
    func makeYesterdayURL() -> String {
        let yesterday = Calendar.current.date(byAdding: .day, value: -1, to: Date())
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyyMMdd"
        let yesterdayDate = formatter.string(from: yesterday!)
        return yesterdayDate
    }
    
    func getData() {
        if let url = URL(string: movieURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                if let JSONdata = data {
                    //print(JSONdata)
                    //let dataString = String(data: JSONdata, encoding: .utf8)
                    //print(dataString!)
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(MovieData.self, from: JSONdata)
                        //print(decodeData.boxOfficeResult.dailyBoxOfficeList[0].movieNm)
                        //print(decodeData.boxOfficeResult.dailyBoxOfficeList[0].audiCnt)
                        self.movieData = decodeData
                        DispatchQueue.main.async {
                            self.tableView.reloadData()
                        }
                        
                    } catch {
                        print(error)
                    }
                }
            }
            task.resume()
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyTableViewCell
        cell.movieName.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieNm//indexPath.description
        cell.openDate.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].openDt
        cell.movieCode.text = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieCd
    
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let movieCode = movieData?.boxOfficeResult.dailyBoxOfficeList[indexPath.row].movieCd
        else { return }
        print(movieCode)
    }

}
