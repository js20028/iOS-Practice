//
//  DetailViewController.swift
//  MovieList
//
//  Created by 곽재선 on 2022/05/01.
//

import UIKit

struct DetailMovieData: Codable {
    let movieInfoResult: MovieInfoResult
}
struct MovieInfoResult: Codable {
    let movieInfo: MovieInfo
}
struct MovieInfo: Codable {
    let movieNm: String
    let showTm: String
    let openDt: String
}

class DetailViewController: UIViewController {
    
    @IBOutlet weak var movieCodeLabel: UILabel!
    @IBOutlet weak var showTimeLabel: UILabel!
    @IBOutlet weak var openDateLabel: UILabel!
    
    var movieCode: String?
    var detailMovieData: DetailMovieData?
    var detailURL = "https://www.kobis.or.kr/kobisopenapi/webservice/rest/movie/searchMovieInfo.json?key=eaeb10d7faf1e1a760fb46f6b5050836&movieCd="

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let movieCode = movieCode {
            detailURL += movieCode
        }
        getData()
    }
    
    func getData() {
        if let url = URL(string: detailURL) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { data, response, error in
                if let error = error {
                    print(error)
                    return
                }
                if let JSONdata = data {
                    
                    let decoder = JSONDecoder()
                    do {
                        let decodeData = try decoder.decode(DetailMovieData.self, from: JSONdata)
                        print(decodeData.movieInfoResult.movieInfo.movieNm)
                        self.detailMovieData = decodeData
                        DispatchQueue.main.async {
                            self.movieCodeLabel.text = self.detailMovieData?.movieInfoResult.movieInfo.movieNm
                            self.showTimeLabel.text = self.detailMovieData?.movieInfoResult.movieInfo.showTm
                            self.openDateLabel.text = self.detailMovieData?.movieInfoResult.movieInfo.openDt
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
