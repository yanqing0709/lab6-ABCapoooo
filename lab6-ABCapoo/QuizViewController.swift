//
//  QuizViewController.swift
//  lab6-ABCapoo
//
//  Created by 陳嬿晴 on 2019/6/17.
//  Copyright © 2019 陳嬿晴. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var Qnum: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var ScoreLabel: UILabel!
    @IBOutlet var choiceButton: [UIButton]!
    
    struct QA {
        var question:String
        var choice:[String]=[]
        var answer:String
    }
    
    var correctAnswer: String = "";
    var score = 0
    var questionCount = 0
    var list: [Int] = []
    var Questions: [QA] = []
    var pickedQuestions:[QA] = []
    var correctList: [Int] = []
    var correctList_q: [String] = []
    var correctList_a: [String] = []
    let zero = 0
    
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        return true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destination = segue.destination as?FinalTableViewController
        // 成績
        destination?.data = self.score
        // 答對的題號們
        destination?.circleList = self.correctList
        // 亂數選出的的問題們
        destination?.questionList_q = self.correctList_q
        // 亂數選出的問題們對應到的答案們
        destination?.questionList_a = self.correctList_a
        
    }
    
    override func viewDidLoad() {
        setQuestions()
        nextQuestion()
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //QA(question:"", choice:["","","",""], answer:""),
    func setQuestions() {
        Questions.append(QA(question:"yell", choice:["叫喊","多餘的","項圈","照耀"], answer:"叫喊"))
        Questions.append(QA(question:"include", choice:["文化","會議","冬季","包括"], answer:"包括"))
        Questions.append(QA(question:"refuse", choice:["西方","或許","拒絕","旅行"], answer:"拒絕"))
        Questions.append(QA(question:"adult", choice:["珍珠","得分","成人","照耀"], answer:"成人"))
        Questions.append(QA(question:"upset", choice:["使安靜","電報","心煩的","日報"], answer:"心煩的"))
        Questions.append(QA(question:"main", choice:["機器人","主要的","誠實","簡單的"], answer:"主要的"))
        Questions.append(QA(question:"bottom", choice:["詩","驕傲的","村莊","底部"], answer:"底部"))
        Questions.append(QA(question:"laundry", choice:["防水的","洗衣店","公文","片語"], answer:"洗衣店"))
        Questions.append(QA(question:"cover", choice:["蓋子","機場","區域","力量"], answer:"蓋子"))
        Questions.append(QA(question:"type", choice:["羨慕","吋","今晚","類型"], answer:"類型"))
        Questions.append(QA(question:"緩解", choice:["ease","cease","tease","erase"], answer:"ease"))
        Questions.append(QA(question:"恐慌", choice:["panic","picnick","pick","preceive"], answer:"panic"))
        Questions.append(QA(question:"引起", choice:["rise","arise","raise","arous"], answer:"arous"))
        Questions.append(QA(question:"致力於", choice:["intend","attend","pretend","tend"], answer:"attend"))
        Questions.append(QA(question:"吸收", choice:["reform","absolute","absorb","inject"], answer:"absorb"))
        Questions.append(QA(question:"免職", choice:["compose","deposit","depose","delicate"], answer:"depose"))
        Questions.append(QA(question:"原則", choice:["component","district","envelope","priciple"], answer:"priciple"))
        Questions.append(QA(question:"拘留", choice:["train","retain","detain","obtain"], answer:"detain"))
        Questions.append(QA(question:"影響", choice:["mansion","affect","alter","coherant"], answer:"affect"))
        Questions.append(QA(question:"移植", choice:["transform","transport","translate","transplant"], answer:"transplant"))
        
        score = 0
        questionCount = 0
        ScoreLabel.text = "目前得分：\(score)";
        list=[0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19]
        
    }
    
    func nextQuestion(){
        questionCount = questionCount + 1
        
        let random = Int(arc4random()) % list.count
        let index = list[random]
        
        for i in 0 ..< choiceButton.count{
            choiceButton[i].setTitle("\(Questions[index].choice[i])", for: UIControl.State.normal)
        }
        
        // 亂數選出來的題目
        pickedQuestions.append(Questions[index])
        
        
        list.remove(at: random)
        Qnum.text = "第\(String(questionCount))題";
        questionLabel.text = Questions[index].question
        correctAnswer = Questions[index].answer
    }
    
    func checkGame(){
        if(questionCount == 10){
            
            // 答對的題號存在這裡
            print(correctList)
            
            // 亂數選出來的題目們印在這
            for i in 0 ..< questionCount {
                //print(pickedQuestions[i].question, pickedQuestions[i].answer)
                correctList_q.append(pickedQuestions[i].question)
                correctList_a.append(pickedQuestions[i].answer)
            }
            //print(correctList_q)
            //print(correctList_a)
            
            // 跳轉到Controller
            self.performSegue(withIdentifier: "toFinal", sender: nil)
            
            //make an alertController
            let alertController = UIAlertController(title:"答題結束", message:"得分：\(score)", preferredStyle: UIAlertController.Style.alert)
            //make[確認]button
            let okAction = UIAlertAction(title:"OK", style:.default, handler:{action in self.setQuestions()})
            alertController.addAction(okAction)
            //show the alertController
            self.present(alertController, animated: true, completion: nil)
            
            
            
            setQuestions()
            nextQuestion()
        }
        else{
            nextQuestion()
        }
    }
    
    @IBAction func chooseAns(_ sender: UIButton) {
        let userChooser=sender.currentTitle
        if(userChooser == correctAnswer){
            self.score = self.score + 10
            self.ScoreLabel.text = "目前得分：\(self.score)";
            //print(questionCount)
            self.correctList.append(self.questionCount)
        }
        else{
            self.correctList.append(self.zero)
        }
        checkGame()
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
