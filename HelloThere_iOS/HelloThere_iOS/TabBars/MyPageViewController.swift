//
//  MyPageViewController.swift
//  HelloThere_iOS
//
//  Created by 서보현 on 2023/07/23.
//

import UIKit

class MyPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var ProfileImageView: UIImageView!
    
    @IBOutlet weak var tableView: UITableView!
    
    let data = [["주소 인증","비밀번호 변경"],["알림 설정","쪽지 설정"],["내 게시물","내가 댓글 단 게시물"],["회원 탈퇴","로그아웃"]]
    let header = ["계정","설정","커뮤니티","기타"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = .white
        
        //ProfileImageView.image = UIImage(named: "MyTab")
         
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //performSegue(withIdentifier: "showChangePw", sender: nil)
        switch indexPath.section {
            case 0:
                switch indexPath.row{
                    case 0: self.performSegue(withIdentifier: "showAddressAuth", sender: nil)
                    case 1: self.performSegue(withIdentifier: "showChangePw", sender: nil)
                    default:
                        return
                }
            case 1:
                switch indexPath.row{
                    case 0: self.performSegue(withIdentifier: "showSetAlarm", sender: nil)
                    case 1: self.performSegue(withIdentifier: "showSetMessage", sender: nil)
                    default:
                        return
            }
            
        case 2:
            switch indexPath.row{
                case 0: self.performSegue(withIdentifier: "showChangePw", sender: nil)
                case 1: self.performSegue(withIdentifier: "showChangePw", sender: nil)
                default:
                    return
        }
            

                //case 2: self.performSegue(withIdentifier: "facialAnalysis", sender: nil)

                default:

                    return

        }
        
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension ViewController: UITableViewDelegate {
    
}
