//
//  WriteDiaryViewController.swift
//  Diary
//
//  Created by 곽재선 on 2022/03/30.
//

import UIKit

enum DiaryEditorMode {
    case new
    case edit(IndexPath, Diary)
}

protocol WriteDiaryViewDelegate: AnyObject {
    func didSelectRegister(diary: Diary)
}

class WriteDiaryViewController: UIViewController {

    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var contentsTextView: UITextView!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var confirmButton: UIBarButtonItem!
    
    private let datePicker = UIDatePicker()
    private var diaryDate: Date?        // 데이트피커에서 선택한 날짜를 저장하는 프로퍼티
    weak var delegate: WriteDiaryViewDelegate?
    var diaryEditorMode: DiaryEditorMode = .new
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureContentsTextView()
        self.configureDatePicker()
        self.configureInputField()
        self.configureEidtMode()
        self.confirmButton.isEnabled = false
    }
    
    private func configureEidtMode() {
        switch self.diaryEditorMode {
        case let .edit(_, diary):
            self.titleTextField.text = diary.title
            self.contentsTextView.text = diary.contents
            self.dateTextField.text = self.dateToString(date: diary.date)
            self.diaryDate = diary.date
            self.confirmButton.title = "수정"
        
        default:
            break
        }
    }
    
    private func dateToString(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        return formatter.string(from: date)
    }
    
    private func configureContentsTextView() {  // 텍스트뷰의 테두리생성 함수
        let borderColor = UIColor(red: 220/255, green: 220/255, blue: 220/255, alpha: 1.0)  // rgb값에는 0.0~1.0 사이의 값이 들어가서 설정하려는값/255를 넣어야함
        self.contentsTextView.layer.borderColor = borderColor.cgColor // 레이어 관련 색상을 설정할때는 cgColor로 설정해야함
        self.contentsTextView.layer.borderWidth = 0.5   // 테두리 너비
        self.contentsTextView.layer.cornerRadius = 5.0  // 모서리 둥글기
    }
    
    private func configureDatePicker() {
        self.datePicker.datePickerMode = .date
        self.datePicker.preferredDatePickerStyle = .wheels
        self.datePicker.addTarget(self, action: #selector(datePickerValueDidChange(_:)), for: .valueChanged)
        self.datePicker.locale = Locale(identifier: "ko_KR")  // 데이트피커 한국어로 표시
        self.dateTextField.inputView = self.datePicker  // 텍스트필드를 선택했을때 키보드가 아닌 데이트피커가 표시됨(데이트피커로 변경하면 메서드가 호출되지않음)
    }
    
    private func configureInputField() {
        self.contentsTextView.delegate = self
        self.titleTextField.addTarget(self, action: #selector(titleTextFieldDidChange(_:)), for: .editingChanged)   // 제목 텍스트필드에 텍스트가 입력될때마다 메서드 호출
        self.dateTextField.addTarget(self, action: #selector(dateTextFieldDidChange(_:)), for: .editingChanged)   // 날짜 텍스트필트에 텍스트가 입력될때마다 메서드 호출(데이트피커로 변경할때는 메서드호출 X, 아래 sendActions 통해서 해결)
    }
    
    @IBAction func tapConfirmButton(_ sender: UIBarButtonItem) {
        guard let title = self.titleTextField.text else { return }
        guard let contents = self.contentsTextView.text else { return }
        guard let date = self.diaryDate else { return }

        
        switch self.diaryEditorMode {
        case .new:
            let diary = Diary(
                uuidString: UUID().uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: false
            )
            self.delegate?.didSelectRegister(diary: diary)
            
        case let .edit(indexPath, diary):
            let diary = Diary(
                uuidString: diary.uuidString,
                title: title,
                contents: contents,
                date: date,
                isStar: diary.isStar
            )
            NotificationCenter.default.post(
                name: NSNotification.Name("editDiary"),
                object: diary,
                userInfo: nil //["indexPath.row": indexPath.row]
            )
            
        }
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc private func datePickerValueDidChange(_ datePicker: UIDatePicker) {
        let formatter = DateFormatter() // 날짜와 텍스트를 변환해줌, 데이트타입을 사람이 읽을수 있는 형태로 변환하거나 반대로도 변환가능
        formatter.dateFormat = "yyyy년 MM월 dd일(EEEEE)"
        formatter.locale = Locale(identifier: "ko_KR")
        self.diaryDate = datePicker.date
        self.dateTextField.text = formatter.string(from: datePicker.date)
        self.dateTextField.sendActions(for: .editingChanged)    // 날짜가 변경될때마다 에디팅체인지드 액션을 발생시킴
    }
    
    @objc private func titleTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    @objc private func dateTextFieldDidChange(_ textField: UITextField) {
        self.validateInputField()
    }
    
    // 유저가 화면을 터치했을떄 호출되는 메서드
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true) // 빈화면을 누를때마다 키보드나 데이트피커가 사라짐
    }
    
    private func validateInputField() {
        self.confirmButton.isEnabled = !(self.titleTextField.text?.isEmpty ?? true) && !(self.dateTextField.text?.isEmpty ?? true) && !self.contentsTextView.text.isEmpty
    }
}

extension WriteDiaryViewController: UITextViewDelegate {
    func textViewDidChange(_ textView: UITextView) {    // 텍스트뷰에 텍스트가 입력될때마다 호출됨
        self.validateInputField()
    }
}
