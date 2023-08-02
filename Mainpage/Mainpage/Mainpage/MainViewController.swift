//
//  ViewController.swift
//  Mainpage
//
//  Created by 이권민 on 2023/08/02.
//

import UIKit

class MainViewController: UIViewController {

    
    
    @IBOutlet weak var AddressButton1: UIButton!
    @IBOutlet weak var AddressButton2: UIButton!

    @IBOutlet weak var PopularButton1: UIButton!
    
    @IBOutlet weak var PopularButton2: UIButton!
    @IBOutlet weak var PopularButton3: UIButton!
    @IBOutlet weak var PopularButton4: UIButton!
    @IBOutlet weak var FreeButton: UIButton!
    @IBOutlet weak var ShareButton: UIButton!
    @IBOutlet weak var BattleButton: UIButton!
    @IBOutlet weak var InformationButton: UIButton!
    @IBOutlet weak var QuestionButton: UIButton!
    @IBOutlet weak var UsedButton: UIButton!
    @IBOutlet weak var ManageExpense: UILabel!
    @IBOutlet weak var ManageImage: UIImageView!
    @IBOutlet weak var NewHappening: UIButton!
    @IBOutlet var HomeImage: [UIImageView]!
    @IBOutlet var UsedImage: [UIImageView]!
    var address1: String?
    var address2: String?
    var popularPosts: [String] = []
    var freePosts: [String] = []
    var battlePosts: [String] = []
    var sharePosts: [String] = []
    var usedPosts: [String] = []
    var informationPosts: [String] = []
    var questionPosts: [String] = []
    var expense: Double = 0.0
    var isPaid: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        fetchDataFromServer()
    }

    func fetchDataFromServer() {
        // 서버로부터 데이터를 가져오는 로직을 구현합니다.
        // 서버 API가 미정인 상태이므로 더미(dummy) 데이터를 사용합니다.

        // 시~동 이후 주소
        address1 = "서울특별시 강남구"
        // 시~동까지 주소
        address2 = "강남대로 123"

        // 인기 게시물 데이터
        popularPosts = ["인기게시물1", "인기게시물2", "인기게시물3", "인기게시물4"]

        // 자유 소통 게시판 데이터
        freePosts = ["자유게시물1", "자유게시물2", "자유게시물3", "자유게시물4"]

        // 갈등 소통 게시판 데이터
        battlePosts = ["갈등게시물1", "갈등게시물2", "갈등게시물3", "갈등게시물4"]

        // 공구 나눔 게시판 데이터
        sharePosts = ["공구게시물1", "공구게시물2", "공구게시물3", "공구게시물4"]

        // 중고장터 게시판 데이터
        usedPosts = ["중고게시물1", "중고게시물2", "중고게시물3", "중고게시물4"]

        // 정보공유 게시판 데이터
        informationPosts = ["정보게시물1", "정보게시물2", "정보게시물3", "정보게시물4"]

        // 질문 게시판 데이터
        questionPosts = ["질문게시물1", "질문게시물2", "질문게시물3", "질문게시물4"]

        // 관리비 데이터
        expense = 100000
        // 납부 여부
        isPaid = false

        // 미확인 이미지
        let dummyNewHappeningImage = UIImage(named: "스크린샷 2023-07-18 오후 8.34.42")

        // UI 업데이트를 위해 각각의 변수들을 저장합니다.
        // (더미 데이터를 서버에서 가져온 데이터로 대체합니다.)
        // address1, address2, popularPosts, freePosts, battlePosts, sharePosts, usedPosts,
        // informationPosts, questionPosts, expense, isPaid

        // 미확인 이미지를 확인 후 원래 이미지로 변경합니다.
        NewHappening.setImage(dummyNewHappeningImage, for: .normal)

        // UI 업데이트를 호출합니다.
        updateUI()
    }

    func updateUI() {
        AddressButton1.setTitle(address1, for: .normal)
        AddressButton2.setTitle(address2, for: .normal)
        PopularButton1.setTitle(popularPosts[0], for: .normal)
        PopularButton2.setTitle(popularPosts[1], for: .normal)
        PopularButton3.setTitle(popularPosts[2], for: .normal)
        PopularButton4.setTitle(popularPosts[3], for: .normal)
        ManageExpense.text = "관리비: \(expense) 원"
        ManageImage.image = isPaid ? UIImage(named: "스크린샷 2023-07-18 오후 9.19.03") : UIImage(named: "스크린샷 2023-07-18 오후 9.17.54")

        // 자유 소통 게시판 최근 게시물 데이터 업데이트
        FreeButton.setTitle(freePosts[0], for: .normal)

        // 갈등 소통 게시판 최근 게시물 데이터 업데이트
        BattleButton.setTitle(battlePosts[0], for: .normal)

        // 공구 나눔 게시판 최근 게시물 데이터 업데이트
        ShareButton.setTitle(sharePosts[0], for: .normal)

        // 중고장터 게시판 최근 게시물 데이터 업데이트
        UsedButton.setTitle(usedPosts[0], for: .normal)

        // 정보공유 게시판 최근 게시물 데이터 업데이트
        InformationButton.setTitle(informationPosts[0], for: .normal)

        // 질문 게시판 최근 게시물 데이터 업데이트
        QuestionButton.setTitle(questionPosts[0], for: .normal)
    }

    @IBAction func ToFreeButton(_ sender: UIButton) {
        // 자유 소통 게시판으로 화면 전환하는 로직을 구현하세요.
    }

    @IBAction func ToBattleButton(_ sender: UIButton) {
        // 갈등 소통 게시판으로 화면 전환하는 로직을 구현하세요.
    }

    @IBAction func ToShareButton(_ sender: UIButton) {
        // 공구 나눔 게시판으로 화면 전환하는 로직을 구현하세요.
    }

    @IBAction func ToUsedButton(_ sender: UIButton) {
        // 중고장터 게시판으로 화면 전환하는 로직을 구현하세요.
    }

    @IBAction func ToInformationButton(_ sender: UIButton) {
        // 정보공유 게시판으로 화면 전환하는 로직을 구현하세요.
    }

    @IBAction func ToPopularButton(_ sender: UIButton) {
        // 인기게시물 화면으로 전환하는 로직을 구현하세요.
    }

    @IBAction func ToQuestionButton(_ sender: UIButton) {
        // 질문게시판으로 화면 전환하는 로직을 구현하세요.
    }

    @IBAction func ToSearchButton(_ sender: UIButton) {
        // 검색화면으로 전환하는 로직을 구현하세요.
    }

    @IBAction func ToHappening(_ sender: UIButton) {
        // 알림 화면으로 전환하는 로직을 구현하세요.
    }

    @IBAction func ToManageButton(_ sender: UIButton) {
        guard let viewController = self.storyboard?.instantiateViewController(withIdentifier: "ManageViewcontroller") else {
            return
        }

        self.present(viewController, animated: true, completion: nil)
    }
}
