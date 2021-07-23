//
//  QuestionViewController.swift
//  QuestionViewController
//
//  Created by Wolfpack Digital on 22.07.2021.
//

import UIKit

class QuestionViewController: UIViewController {
    //START DATA
    
    var answersChosen: [Answer] = []

    
    var questions: [Question] = [
        Question(text: "Which food do you like the most?",
                 type: .single,
                 answers: [
                    Answer(text: "Steak", type: .dog),
                    Answer(text: "Corn", type: .chicken),
                    Answer(text: "Honey", type: .bear),
                    Answer(text: "Flowers ??", type: .bee)

                 ]
        ),
        Question(
            text: "Which activities do you enjoy?",
            type: .multiple,
            answers: [
                Answer(text: "Travelling", type: .bee),
              Answer(text: "Cot cotdac", type: .chicken),
              Answer(text: "Sleeping", type: .bear),
              Answer(text: "Eating", type: .dog)
            ]
          ),
        
          Question(
            text: "How much do you enjoy car rides?",
            type: .ranged,
            answers: [
              Answer(text: "I get bored", type: .chicken),
              Answer(text: "I get a little nervous", type: .bear),
              Answer(text: "Speed I am speed", type: .bee),
              Answer(text: "I love them", type: .dog)
            ]
          )
    ]
    
    
    
    
    
    
    
    //END DATA
    var questionIndex = 0
    

    
    
    @IBOutlet weak var SingleStackView: UIStackView!
    
    @IBOutlet weak var singleButton1: UIButton!
    
    @IBOutlet weak var singleButton2: UIButton!
    
    @IBOutlet weak var singleButton3: UIButton!
    
    @IBOutlet weak var singleButton4: UIButton!
    
    
    
    @IBOutlet weak var MultipleStackView: UIStackView!
    
    @IBOutlet weak var multiLabel1: UILabel!
    
    @IBOutlet weak var multiLabel2: UILabel!
    
    @IBOutlet weak var multiLabel3: UILabel!
    
    @IBOutlet weak var multiLabel4: UILabel!
    
    
    
    @IBOutlet weak var multiSwitch1: UISwitch!
    
    @IBOutlet weak var multiSwitch2: UISwitch!
    
    @IBOutlet weak var multiSwitch3: UISwitch!
    
    @IBOutlet weak var multiSwitch4: UISwitch!
    
    
    
    @IBOutlet weak var RangedStackView: UIStackView!
    
    @IBOutlet weak var rangedLabel1: UILabel!

    @IBOutlet weak var rangedLabel2: UILabel!
    
    
    
    @IBOutlet weak var questionProgressView: UIProgressView!
    
    @IBOutlet weak var questionLabel: UILabel!
    
    
    @IBOutlet weak var rangedSlider: UISlider!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func singleAnswerButtonPressed(_ sender: UIButton) {
        let currentAnswers = questions[questionIndex].answers
     
        switch sender {
        case singleButton1:
            answersChosen.append(currentAnswers[0])
        case singleButton2:
            answersChosen.append(currentAnswers[1])
        case singleButton3:
            answersChosen.append(currentAnswers[2])
        case singleButton4:
            answersChosen.append(currentAnswers[3])
        default:
            break
        }
     
        nextQuestion()
    }
    
    
    @IBAction func multipleAnswerButtonPressed(_ sender: Any) {
            let currentAnswers = questions[questionIndex].answers
         
            if multiSwitch1.isOn {
                answersChosen.append(currentAnswers[0])
            }
            if multiSwitch2.isOn {
                answersChosen.append(currentAnswers[1])
            }
            if multiSwitch3.isOn {
                answersChosen.append(currentAnswers[2])
            }
            if multiSwitch4.isOn {
                answersChosen.append(currentAnswers[3])
            }
         
            nextQuestion()
    }
    
    
    
    @IBAction func rangedAnswerButtonPressed(_ sender: Any) {
            let currentAnswers = questions[questionIndex].answers
                let index = Int(round(rangedSlider.value *
                  Float(currentAnswers.count - 1)))
             
                answersChosen.append(currentAnswers[index])
             
                nextQuestion()
        
    }
    
    func updateUI(){
        SingleStackView.isHidden = true
        MultipleStackView.isHidden = true
        RangedStackView.isHidden = true
        
        navigationItem.title = "Question #\(questionIndex + 1)"
        
        let currentQuestion = questions[questionIndex]
        let currentAnswers = questions[questionIndex].answers
        let totalProgress = Float(questionIndex)/Float(questions.count)
        
        questionLabel.text = currentQuestion.text
        questionProgressView.setProgress(totalProgress, animated: true)
        
        
    
        
        switch currentQuestion.type {
        case .single:
            updateSingleStack(using: currentAnswers)
        case .multiple:
            updateMultipleStack(using: currentAnswers)
        case .ranged:
            updateRangedStack(using: currentAnswers)
        }
    }
    
    func updateSingleStack(using answers: [Answer]) {
        SingleStackView.isHidden = false
        singleButton1.setTitle(answers[0].text, for: .normal)
        singleButton2.setTitle(answers[1].text, for: .normal)
        singleButton3.setTitle(answers[2].text, for: .normal)
        singleButton4.setTitle(answers[3].text, for: .normal)
    }
    
    func updateMultipleStack(using answers: [Answer]) {
        MultipleStackView.isHidden = false
        multiSwitch1.isOn = false
        multiSwitch2.isOn = false
        multiSwitch3.isOn = false
        multiSwitch4.isOn = false

        multiLabel1.text = answers[0].text
        multiLabel2.text = answers[1].text
        multiLabel3.text = answers[2].text
        multiLabel4.text = answers[3].text
    }
    
    func updateRangedStack(using answers: [Answer]) {
        RangedStackView.isHidden = false
        rangedLabel1.text = answers.first?.text
        rangedSlider.setValue(0.5, animated: false)

       
        rangedLabel2.text = answers.last?.text
    }
    
    func nextQuestion(){
        questionIndex += 1
         
            if questionIndex < questions.count {
                updateUI()
            } else {
                performSegue(withIdentifier: "Results", sender: nil)
            }

    }
    
    @IBSegueAction func showResults(_ coder: NSCoder) -> ResultsViewController? {
        return ResultsViewController(coder: coder, responses: answersChosen)
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
