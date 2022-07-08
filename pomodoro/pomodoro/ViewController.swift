//
//  ViewController.swift
//  pomodoro
//
//  Created by 곽재선 on 2022/07/05.
//

import UIKit
import AudioToolbox

enum TimerStatus {
    case start
    case pause
    case end
}

class ViewController: UIViewController {

    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var toggleButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    var duration = 60
    var timerStatus: TimerStatus = .end
    var timer: DispatchSourceTimer?
    var currentSeconds = 0  // 현재 카운트다운 되고있는 시간을 초로 저장
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureToggleButton()
    }
    
    func setTimerInfoViewVisible(isHidden: Bool) {
        self.timerLabel.isHidden = isHidden
        self.progressView.isHidden = isHidden
    }
    
    func configureToggleButton() {
        self.toggleButton.setTitle("시작", for: .normal)
        self.toggleButton.setTitle("일시정지", for: .selected)
    }
    
    func startTimer() {
        if self.timer == nil {
            self.timer = DispatchSource.makeTimerSource(flags: [], queue: .main) // queue에는 어떤 쓰레드큐에서 반복동작할 것인지 설정, main쓰레드는 인터페이스쓰레드라고도 함(인터페이스(ui)에 관련된 코드는 메인쓰레드에서 구현되어야 함)
            self.timer?.schedule(deadline: .now(), repeating: 1) // 어떤주기로 타이머를 실행시킬지 설정, .now()는 즉시실행(뒤에 +1 등으로 몇초후에 실행시킬지 설정가능), repeating은 몇초마다 반복할지 설정
            
            // 타이머가 동작할때마다 핸들러 함수가 동작, 1초마다 동작
            self.timer?.setEventHandler(handler: { [weak self] in   // 캡쳐목록 정의
                guard let self = self else { return }   // 일시적으로 self가 strong 레퍼런스가 되도록 만들어줌 이렇게하면 아래의 self?에서 ?를 지울수있음
                self.currentSeconds -= 1
                
                let hour = self.currentSeconds / 3600
                let minutes = (self.currentSeconds % 3600) / 60
                let seconds = (self.currentSeconds % 3600) % 60
                self.timerLabel.text = String(format: "%02d:%02d:%02d", hour, minutes, seconds)
                
                self.progressView.progress = Float(self.currentSeconds) / Float(self.duration)
                
                UIView.animate(withDuration: 0.5, delay: 0, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi)    // 이미지뷰를 180도로 회전
                })
                UIView.animate(withDuration: 0.5, delay: 0, animations: {
                    self.imageView.transform = CGAffineTransform(rotationAngle: .pi * 2)// 이미지뷰를 360도로 회전
                })
                
                if self.currentSeconds <= 0 {
                    // 타이머가 종료
                    self.stopTimer()
                    AudioServicesPlaySystemSound(1005) // 시스템사운드아이디값은 iphonedev.wiki 사이트에서 확인 가능
                }
            })
            self.timer?.resume()    // 타이머 시작
        }
    }
    
    func stopTimer() {
        if self.timerStatus == .pause {
            self.timer?.resume()
        }
        self.timerStatus = .end
        self.cancelButton.isEnabled = false
        UIView.animate(withDuration: 0.5, animations: {
            self.timerLabel.alpha = 0
            self.progressView.alpha = 0
            self.datePicker.alpha = 1
            self.imageView.transform = .identity    // 이미지뷰를 원상태로 돌아오게함
        })
        self.toggleButton.isSelected = false
        self.timer?.cancel()
        self.timer = nil    // 메모리에서 해제, 해제하지않으면 화면을 벗어나도 타이머가 계속 동작함
    }

    @IBAction func tapCancelButton(_ sender: UIButton) {
        switch self.timerStatus {
        case .start, .pause:
            self.stopTimer()
            
        default:
            break
        }
    }
    
    @IBAction func tapToggleButton(_ sender: UIButton) {
        // datePicker에서 선택한 시간이 몇초인지 알려줌
        self.duration = Int(self.datePicker.countDownDuration)
        switch self.timerStatus {
        case .end:
            self.currentSeconds = self.duration
            self.timerStatus = .start
            UIView.animate(withDuration: 0.5, animations: {
                self.timerLabel.alpha = 1
                self.progressView.alpha = 1
                self.datePicker.alpha = 0
            })
            self.toggleButton.isSelected = true
            self.cancelButton.isEnabled = true
            self.startTimer()
            
        case .start:
            self.timerStatus = .pause
            self.toggleButton.isSelected = false
            self.timer?.suspend()   // 타이머 일시정지
            
        case .pause:
            self.timerStatus = .start
            self.toggleButton.isSelected = true
            self.timer?.resume()
        }
    }
}

