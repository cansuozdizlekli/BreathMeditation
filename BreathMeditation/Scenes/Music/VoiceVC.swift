//
//  VoiceVC.swift
//  BreathMeditation
//
//  Created by Cansu Özdizlekli on 10/10/22.
//
import AVFoundation
import UIKit



class VoiceVC: UIViewController {
    @IBOutlet weak var playPauseButton: UIButton!
    @IBOutlet weak var playButtonTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var sliderBottomConstraint: NSLayoutConstraint!
    @IBOutlet weak var slider: UISlider!
    
    @IBOutlet weak var remainingTime: UILabel!
    @IBOutlet weak var currentTime: UILabel!
    @IBOutlet weak var soundNameLabel: UILabel!
    
    var audioPlayer: AVAudioPlayer?
//    var url = URL(fileURLWithPath: Bundle.main.path(forResource: "", ofType: "mp3")!)
//    var selectedName: String = ""
    
    weak var delegate: CourseVC!
    
    var selectedSound: Sound!
    
    
    private let backButton: UIButton = {
        let button = UIButton(frame: CGRect(x: 15, y: 45, width: 50, height: 50))
        button.backgroundColor = .primaryWhite
        button.setImage(UIImage(systemName: "arrow.backward",withConfiguration: UIImage.SymbolConfiguration(pointSize: 17)), for: UIControl.State.normal)
        button.tintColor = .primaryTitleColor
        button.layer.shadowRadius = 10
        button.layer.shadowOpacity = 0.1
        button.layer.cornerRadius = 25
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAudioPlayer()
        setUpUI()
        editConstraints()
    }
    
    private func setUpUI(){
        view.addSubview(backButton)
        backButton.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        playPauseButton.layer.cornerRadius = 47
        playPauseButton.layer.borderWidth = 10
        playPauseButton.layer.borderColor = CGColor.init(red: 231, green: 229, blue: 230, alpha: 0.8)
        playPauseButton.layer.masksToBounds = true
        tabBarController?.tabBar.isHidden = true
        soundNameLabel.text = selectedSound.name
        soundNameLabel.isHidden = false
    }
    
    private func setupAudioPlayer() {
        do {
            var url = URL(fileURLWithPath: Bundle.main.path(forResource: selectedSound.name, ofType: "mp3")!)
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.prepareToPlay()
            audioPlayer?.play()
        } catch let error{
            print("CANSU  <<<< hata var audio player", error.localizedDescription)
        }
        setupSlider()
    }
    
    private func setupSlider() {
        slider.maximumValue = Float(audioPlayer!.duration)
        Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateSlider), userInfo: nil, repeats: true)
    }
    
    
    @IBAction func playPauseButtonTapped(_ sender: UIButton) {
        if audioPlayer?.isPlaying == true {
            audioPlayer?.pause()
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
        } else {
            audioPlayer?.play()
            playPauseButton.setImage(UIImage(systemName: "pause.fill"), for: UIControl.State.normal)
        }
    }
    
    private func editConstraints(){
        if screenHeight > 600 && screenHeight < 800 {
            playButtonTopConstraint.constant = 80
            sliderBottomConstraint.constant = 120
        }
        if screenHeight > 800 && screenHeight < 900  {
            sliderBottomConstraint.constant = 200
        }
        if screenHeight > 900 {
            sliderBottomConstraint.constant = 250
        }
    }
    
    
    @IBAction func sliderDidSlide(_ sender: UISlider) {
        audioPlayer?.stop()
        audioPlayer?.currentTime = TimeInterval(sender.value)
        audioPlayer?.prepareToPlay()
        audioPlayer?.play()
    }
    
    @objc func updateSlider(){
        slider.value = Float(audioPlayer!.currentTime)
        
        let time = Int((audioPlayer?.currentTime)!)
        let minutes1 = time/60
        let seconds1 = time - minutes1 * 60
        currentTime.text = NSString(format: "%02d:%02d", minutes1,seconds1) as String
        
        let remaining = Int((audioPlayer?.duration)!) - Int((audioPlayer?.currentTime)!)
        let minutes2 = remaining/60
        let seconds2 = remaining - minutes2 * 60
        remainingTime.text = NSString(format: "%02d:%02d", minutes2,seconds2) as String
        
//        var endingTime: String
//        var ending = Int((audioPlayer?.duration)!)
//        let minutes3 = ending/60
//        let seconds3 = ending - minutes3 * 60
//        endingTime = NSString(format: "%02d:%02d", minutes3,seconds3) as String

        if audioPlayer?.currentTime == 0.0 {
            playPauseButton.setImage(UIImage(systemName: "play.fill"), for: UIControl.State.normal)
            print("bitti cnm")
        }
        
    }
    
    @objc private func backButtonTapped(_ sender: UIButton) {
        sender.bounceAnimate()
        audioPlayer?.stop()
        navigationController?.popViewController(animated: true)
        tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func backwardButtonTapped(_ sender: Any) {
        var time = Double((audioPlayer?.currentTime)!)
        time -= 16.0
        audioPlayer?.currentTime = time
        audioPlayer?.play()
    }
    
    @IBAction func forwardButtonTapped(_ sender: Any) {
        var time = Double((audioPlayer?.currentTime)!)
        time += 14.0
        audioPlayer?.currentTime = time
        audioPlayer?.play()
    }
    
    
}
