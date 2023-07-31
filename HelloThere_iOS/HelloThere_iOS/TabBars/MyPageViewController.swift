//
//  MyPageViewController.swift
//  HelloThere_iOS
//
//  Created by 서보현 on 2023/07/23.
//

import UIKit

class MyPageViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var profileImg: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    let data = [["주소 인증","비밀번호 변경"],["푸시알림 설정","쪽지 설정"],["내 게시물","내가 댓글 단 게시물"],["회원 탈퇴","로그아웃"]]
    let header = ["계정","설정","커뮤니티","기타"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImg.layer.cornerRadius = profileImg.frame.height/2
        profileImg.layer.borderWidth = 1
        profileImg.clipsToBounds = true
        
        
      
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = 35
       
        self.tableView.contentInset = UIEdgeInsets(top: 20, left: 0, bottom: 0, right: 0)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: .none)
        
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 13)
        return cell
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return header.count
    }
    

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return header[section]
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let header = view as? UITableViewHeaderFooterView else { return }
        header.textLabel?.textColor = UIColor.black
        header.textLabel?.font = UIFont.boldSystemFont(ofSize: 15)
        header.textLabel?.frame = header.bounds
        
    
    }
    


    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30.0
    }
    func tableView(_ tableView: UITableView, willDisplayFooterView view: UIView, forSection section: Int) {

        view.tintColor = UIColor.lightGray

    }
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footer = view as? UITableViewHeaderFooterView
        
        if footer?.contentView == nil {
            
            footer?.contentView.backgroundColor = .lightGray
        }
        
        return footer
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
                case 0: self.performSegue(withIdentifier: "showMyPost", sender: nil)
                case 1: self.performSegue(withIdentifier: "showMyComments", sender: nil)
                default:
                    return
        }
        case 3:
            switch indexPath.row{
            
            case 0:self.performSegue(withIdentifier: "showWithDrawl", sender: nil)
            case 1:
                let sheet = UIAlertController(title: nil, message: "로그아웃 하시겠습니까?", preferredStyle: .alert)
                sheet.addAction(UIAlertAction(title: "네", style: .default, handler: nil))
                sheet.addAction(UIAlertAction(title: "아니오", style: .cancel, handler: nil))
                self.present(sheet, animated: true)
                
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
