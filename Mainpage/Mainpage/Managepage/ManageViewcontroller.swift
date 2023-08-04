//
//  ManageViewcontroller.swift
//  Mainpage
//
//  Created by 두근두근 코딩타임 on 2023/08/02.
//

import UIKit
import DGCharts

class ManageViewcontroller: UIViewController {
    @IBOutlet weak var MonthSelectButton: UIButton!
    @IBOutlet weak var CustomButton: UIButton!
    @IBOutlet weak var expenseTextField: UITextField!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var BarChart: BarChartView!
    @IBOutlet weak var completeButton: UIButton!
    @IBOutlet weak var completeImageView: UIImageView!
    @IBOutlet weak var unpaidButton: UIButton!
    @IBOutlet weak var unpaidImageView: UIImageView!
    
    var menuInteraction: UIContextMenuInteraction?
    var selectedMonth: String?
    // BarChart 객체의 인스턴스를 저장하는 변수
    var barChartInstance: BarChartView?
    
    var currentExpense: Double = 0.0{
        didSet {
            // 관리비가 변경되면 차트를 업데이트합니다.
            fetchDataAndRefreshChart()
        }
    }
    
    var paymentStatus: Bool = false {
        didSet {
            // 납부 상태에 따라 버튼을 갱신하고 차트를 업데이트합니다.
            if paymentStatus {
                completeImageView.image = UIImage(named: "checkmark.square")
                unpaidImageView.image = UIImage(named:  "rectangle")
            } else {
                completeImageView.image = UIImage(named:  "rectangle")
                unpaidImageView.image = UIImage(named: "checkmark.square")
            }
            fetchDataAndRefreshChart()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        MonthSelectButton.setTitle("", for: .normal)

        let months = MonthSelectButton.titleLabel?.text?.components(separatedBy: ", ") ?? []

        let menuItems = months.map { month in
            UIAction(title: month, handler: { [weak self] _ in
                self?.selectedMonth(month)
            })
        }

        let menuConfiguration = UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { _ in
            UIMenu(title: "", children: menuItems)
        })
        let interaction = UIContextMenuInteraction(delegate: self)
        MonthSelectButton.addInteraction(interaction)
        MonthSelectButton.isUserInteractionEnabled = true

        // BarChart 객체의 인스턴스를 저장합니다.
        barChartInstance = BarChart
        setChartData()
    }

    @IBAction func BackToMain(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func updateExpense(_ sender: UIButton) {
        guard let expenseText = expenseTextField.text, let expense = Double(expenseText) else {
                   // 유효하지 않은 입력일 경우 처리 (예를 들어, 숫자가 아닌 문자열이 입력된 경우)
                   return
               }
               
               // 임시적으로 변경된 관리비를 업데이트하고 차트를 다시 그립니다.
               currentExpense = expense
    }
    @IBAction func sendExpenseToServer(_ sender: UIButton) {
        // TODO: 서버로 관리비와 납부여부를 전송하는 로직 구현
                guard let selectedMonth = selectedMonth else {
                    print("월을 선택하세요.")
                    return
                }
                let paymentStatusString = paymentStatus ? "미납" : "완납"
                // 서버로 선택 월과 변경된 관리비, 납부여부를 전송하는 로직 추가 (여기서는 콘솔에 출력만 함)
                print("\(selectedMonth)의 관리비 \(currentExpense)가 서버로 전송되었습니다. 납부여부: \(paymentStatusString)")
            
       
    }
    @IBAction func completeButtonTapped(_ sender: UIButton) {
        paymentStatus = true

    }
    @IBAction func unpaidButtonTapped(_ sender: UIButton) {
        paymentStatus = false

    }
    func selectedMonth(_ month: String) {
        MonthSelectButton.setTitle(month, for: .normal)
        self.selectedMonth = month
        fetchDataAndRefreshChart()
    }

    func setChartData() {
        // 초기에 그래프 데이터가 없으므로 빈 데이터로 차트를 설정합니다.
        let data = BarChartData()
        BarChart.data = data
    }

    
    func fetchDataAndRefreshChart() {
            // 서버에서 관리비 데이터를 가져와서 해당 월과 이전 2개월의 데이터를 생성합니다.
        let currentMonth = Calendar.current.component(.month, from: Date())
            let selectedMonthIndex = currentMonth - 3 ..< currentMonth // 선택 월과 이전 2개월

            var entries = [BarChartDataEntry]()
            var maxYValue: Double = 0 // y축 최대 값 초기화

            for i in selectedMonthIndex {
                let yValue: Double
                if i == currentMonth - 1 {
                    // 선택 월의 경우 임시적으로 변경된 관리비를 사용합니다.
                    yValue = currentExpense
                } else {
                    yValue = Double.random(in: 0...100) // 임의의 관리비 데이터 (0부터 100 사이의 값)
                }
                maxYValue = max(maxYValue, yValue) // 최대 값 갱신

                entries.append(BarChartDataEntry(x: Double(i), y: yValue))
            }

            let dataSet = BarChartDataSet(entries: entries, label: "월별 데이터")
            dataSet.colors = [UIColor(red: 69/255, green: 207/255, blue: 148/255, alpha: 1.0)] // 그래프 색상 설정
            
            // 납부 여부에 따라 그래프 색상 변경
            if paymentStatus {
                dataSet.colors = [UIColor(red: 243/255, green: 72/255, blue: 34/255, alpha: 1.0)] // 미납인 경우 색상 변경
            } else {
                dataSet.colors = [UIColor(red: 69/255, green: 207/255, blue: 148/255, alpha: 1.0)] // 완납인 경우 색상 변경
            }
            
            dataSet.valueTextColor = UIColor.white // 값 텍스트 색상 설정

            let data = BarChartData(dataSet: dataSet)

            // x축 설정
            BarChart.xAxis.valueFormatter = IndexAxisValueFormatter(values: selectedMonthIndex.map { "\($0)월" }) // x축 레이블 포맷 설정

            // y축 설정
            BarChart.leftAxis.axisMinimum = 0 // y축 최소 값 설정
            BarChart.leftAxis.axisMaximum = maxYValue + 10 // y축 최대 값 설정 (최대 값보다 약간 높게 설정)

            BarChart.data = data
        }
    }

extension ManageViewcontroller: UIContextMenuInteractionDelegate {
    // 메뉴 구성을 정의하는 메서드를 구현합니다.
    func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
        let months = MonthSelectButton.titleLabel?.text?.components(separatedBy: ", ") ?? []

        let menuItems = months.map { month in
            UIAction(title: month, handler: { [weak self] _ in
                self?.selectedMonth(month)
            })
        }

        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { _ in
            UIMenu(title: "", children: menuItems)
        })
    }
}
extension Date {
    var monthComponent: Int {
        return Calendar.current.component(.month, from: self)
    }
}
