//
//  play_VC.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class play_VC: UIViewController {

    //Variables
    var player: AVPlayer = AVPlayer()
    var videoPlayed:Bool = false
    var currentStarCount : Int = 0
    var bigStarCount: Int = 0
    var commentsList:Comments_Model = Comments_Model()
    var userLists:Users_Model = Users_Model()
    
    
    //IBOutlets & IBAction
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var avatarPlusView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var followersCountLabel: UILabel!
    @IBOutlet weak var commentImgView: UIImageView!
    @IBOutlet weak var shareImgView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var shareLabel: UILabel!
    @IBOutlet weak var bigStarBtn: UIButton!
    @IBOutlet weak var starCountLabel: UILabel!
    @IBOutlet weak var shareView: UIView!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var gradientView: UIView!
    
    
    @IBAction func bigStarBtnAction(_ sender: UIButton) {
        animateCircleBtn(object: bigStarBtn)
    }
    
    //TableView
    @IBOutlet weak var tableView: UITableView!
    
    //Video Player area
    @IBOutlet weak var playerView: UIView!
    
    //TopView//
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topSubtitleLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBAction func moreBtnAction(_ sender: UIButton) {
        let actionSheet = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        for i in 1...3 {
            actionSheet.addAction(UIAlertAction(title: "Action \(i)", style: .default, handler: nil))
        }
        actionSheet.addAction(UIAlertAction(title: "Delete", style: .destructive, handler: nil))
        actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        
        self.present(actionSheet, animated: true, completion: nil)
    }
    
    @IBOutlet weak var starTopView: UIView!
    @IBOutlet weak var starTopImgView: UIImageView!
    @IBOutlet weak var starTopCountLabel: UILabel!
    
    
    
    //OverLayerView
    @IBOutlet weak var overLayerView: UIView!
    @IBOutlet weak var overLayerTopLabel: UILabel!
    @IBOutlet weak var overLayerSubLabel: UILabel!
    @IBOutlet weak var overLayerNextBtn: UIButton!
    @IBAction func overLayerNextBtnAction(_ sender: UIButton) {
    }
    
    
    //CollectionView
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = AppColors.mainAppColor
       
        setInitialData()
        setInitialObjects()
        addTouchRecognations()
        setupCollectionView()
        setUpTableView()
        setGradient()
        setListsData()
        
        
    }
    

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        playVideo()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        stopVideo()
    }
    
    func setInitialData(){
        currentStarCount = 100
        bigStarCount = 30
        
        setStarCounters()
    }
    
    func setStarCounters(){
        starCountLabel.text = String(bigStarCount)
        starTopCountLabel.text = String(currentStarCount)
    }
    
    
    func setInitialObjects(){
        let boldAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let regularGrayColorAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: AppColors.grayColor]
        let orangcolorAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: AppColors.orangeColor]
        
        
        ///BottomView
        avatarImgView.image = UIImage(named: "avatar2")
        avatarImgView.round()
        
        avatarPlusView.image = fontImages.plusIcon
        avatarPlusView.backgroundColor = AppColors.purpleColor
        avatarPlusView.round()
        
        shareImgView.image = fontImages.shareIcon
        commentImgView.image = fontImages.commentIcon
        
        bigStarBtn.setImage(fontImages.starBigIcon, for: .normal)
        bigStarBtn.backgroundColor = AppColors.orangeColor
        bigStarBtn.tintColor = .white
        bigStarBtn.round()
        
        userNameLabel.textColor = AppColors.textColor
        followersCountLabel.textColor = AppColors.grayColor
        shareLabel.textColor = AppColors.grayColor
        commentLabel.textColor = AppColors.grayColor
        starCountLabel.textColor = AppColors.orangeColor
        
        userNameLabel.text = "Sajjad (Verified)"
        userNameLabel.attributedText = userNameLabel.text?.addImageInText(replaceWith: "(Verified)", image: UIImage(named: "verifiedTick")!,imageSize: 20)
        
        
        ///TopView
        topLabel.textColor = AppColors.textColor
        topSubtitleLabel.textColor = AppColors.grayColor
        
        starTopView.round(radius: 4)
        starTopView.backgroundColor = AppColors.orangeColorAlpha
        starTopImgView.image = fontImages.starIcon(color: AppColors.mainAppColor, size: 10)
        starTopImgView.round()
        starTopImgView.backgroundColor = AppColors.orangeColor
        starTopCountLabel.textColor = AppColors.orangeColor
        

        
        let subtopAtttext = NSMutableAttributedString(string: "32.1k views", attributes: regularGrayColorAttrs)
        subtopAtttext.append(NSMutableAttributedString(string: " Jinjuh", attributes: boldAttrs))
        subtopAtttext.append(NSMutableAttributedString(string: " clipped 5h ago", attributes: regularGrayColorAttrs))
        topSubtitleLabel.attributedText = subtopAtttext
        
        //Video OverLayer View
        overLayerNextBtn.setImage(fontImages.nextIconGray, for: .normal)
        overLayerNextBtn.tintColor = AppColors.lightGrayColor
        overLayerTopLabel.textColor = AppColors.textColor
 
        let orangAttText = NSMutableAttributedString(string: "$1k Prize Pool", attributes: orangcolorAttrs)
        let subOverText = NSMutableAttributedString(string: " 3h 45m 32s  1,029 Entries", attributes: regularGrayColorAttrs)
        let attributedString = orangAttText
        attributedString.append(subOverText)
        overLayerSubLabel.attributedText = attributedString
        
    }
    
  

    func addTouchRecognations(){
        let shareViewTouch = UITapGestureRecognizer(target: self, action: #selector(touchTriggerd))
        shareView.addGestureRecognizer(shareViewTouch)
        
        let commentViewTouch = UITapGestureRecognizer(target: self, action: #selector(touchTriggerd))
        commentView.addGestureRecognizer(commentViewTouch)
        
    }

    func setListsData(){
        
        ///Converting message fake json data to the list
        guard let messageData: Data = messagesFakeJSON.data(using: .utf8) else {
            return
        }
        guard let comments = try? JSONDecoder().decode(Comments_Model.self, from: messageData) else {
            return
        }
        self.commentsList = comments
        
        
        ///Converting users fake json data to the list
        guard let userData: Data = userNameFakeJSON.data(using: .utf8) else {
            return
        }
        guard let users = try? JSONDecoder().decode(Users_Model.self, from: userData) else {
            return
        }
        self.userLists = users
        
        ///Relodaing tabledata and collection view
        collectionView.reloadData()
        tableView.reloadData()
    }
    
    func setupCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
    }
    
    func setUpTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    @objc func touchTriggerd(_ sender:UITapGestureRecognizer){
        
        switch  sender.view{
        case shareView:
            print("Share")
            let text = "This is the text....."
            let textShare = [ text ]
            let activityViewController = UIActivityViewController(activityItems: textShare , applicationActivities: nil)
            activityViewController.popoverPresentationController?.sourceView = self.view
            self.present(activityViewController, animated: true, completion: nil)
            break
        case commentView:
            print("Comment")
            break
        default:
            break
        }
    }
    

}


//Gradient
extension play_VC {
    func setGradient(){
        let gradient = CAGradientLayer()
        gradient.frame = tableView.bounds
        gradient.colors = [UIColor.clear.cgColor, AppColors.mainAppColor.cgColor]
        gradient.frame = CGRect(x: 0, y: 0, width: gradientView.frame.width, height: gradientView.frame.height)
        gradientView.layer.addSublayer(gradient)
    }
}


//Play video
extension play_VC {
    func playVideo(){
        guard let path = Bundle.main.path(forResource: "small", ofType:"mp4") else {
            debugPrint("video not found")
            return
        }
        
        if videoPlayed {
            player.play()
            return
        }

        player = AVPlayer(url: URL(fileURLWithPath: path))
        let playerLayer = AVPlayerLayer(player: player)
        playerLayer.frame = self.playerView.bounds
        playerLayer.videoGravity = .resizeAspectFill
        self.playerView.layer.addSublayer(playerLayer)
        self.playerView.bringSubviewToFront(overLayerView)
        player.play()
        videoPlayed = true
        
        player.actionAtItemEnd = .none
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(playerItemDidReachEnd(notification:)),
                                               name: .AVPlayerItemDidPlayToEndTime,
                                               object: player.currentItem)
        
    }
    
    func stopVideo(){
        player.pause()
        
    }
    
    @objc func playerItemDidReachEnd(notification: Notification) {
        if let playerItem = notification.object as? AVPlayerItem {
            playerItem.seek(to: CMTime.zero, completionHandler: nil)
        }
    }
}

//TableView
extension play_VC: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.commentsList.comments.messages.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        
        if( !(cell != nil))
        {
            cell = UITableViewCell(style: .value1, reuseIdentifier: "Cell")
        }
        
        let data = commentsList.comments.messages[indexPath.row]
        
        cell?.backgroundColor = .clear
        cell?.contentView.backgroundColor = .clear
        
        let boldAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 16),NSAttributedString.Key.foregroundColor: AppColors.textColor]
        let regularGrayColorAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 15),NSAttributedString.Key.foregroundColor: AppColors.grayColor]
        
        let AttText = NSMutableAttributedString(string: data.name, attributes: boldAttrs)
        AttText.append(NSMutableAttributedString(string: "   \(data.message)", attributes: regularGrayColorAttrs))
        
        cell!.textLabel?.attributedText = AttText
        return cell!
    }
}



//CollectionView
extension play_VC:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.userLists.items.users.count
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usersCollectionViewCell", for: indexPath) as! usersCollectionViewCell
        
        let data = self.userLists.items.users[indexPath.row]
        
        cell.userNameLabel.text = data.name
        cell.counterLabel.isHidden = !data.showCounter
        cell.starImgView.isHidden = !data.showStar
        cell.indicatorView.isHidden = !data.showCounter && !data.showStar
        
        cell.counterLabel.text = "\(data.counter)"
        cell.avatarImgView.image = randomImage()
        
        cell.userNameLabel.textColor = cell.starImgView.isHidden ? AppColors.grayColor : AppColors.textColor
        
        cell.backAvatarImgView.image = cell.starImgView.isHidden ? UIImage(named: "backGradient") : nil
        
        return cell
    }
    
    
}

//CollectionView Cell
class usersCollectionViewCell:UICollectionViewCell {
    @IBOutlet weak var avatarView: UIView!
    @IBOutlet weak var backAvatarImgView: UIImageView!
    @IBOutlet weak var avatarImgView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var indicatorView: UIView!
    @IBOutlet weak var counterLabel: UILabel!
    @IBOutlet weak var starImgView: UIImageView!
    
    
    override func awakeFromNib() {
        avatarView.round()
        backAvatarImgView.round()
        avatarImgView.round()
        
        avatarImgView.layer.borderColor = AppColors.mainAppColor.cgColor
        avatarImgView.layer.borderWidth = 3
        userNameLabel.textColor = AppColors.grayColor
        indicatorView.round()
        starImgView.image = fontImages.starIcon(color: AppColors.mainAppColor, size: 14)
        starImgView.round()
        
    }
    
}



//Set the status bar color to white
extension play_VC {
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
}



//Animate Star Btn
extension play_VC {

    func animateCircleBtn(object:UIView){
        
        ///Make Big star button bouncing
        var isObjectSmall :Bool = false
        UIView.animate(withDuration: 2.2, delay: 0, usingSpringWithDamping: 0.3, initialSpringVelocity: 0.5, options: .curveEaseInOut, animations: {

            if isObjectSmall {
                object.transform = CGAffineTransform(scaleX: 0.9, y: 0.9)
            }else{
                object.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            }
            
            isObjectSmall = !isObjectSmall
        }) { _ in
            
            UIView.animate(withDuration: 0.3, animations: {
                  object.transform = .identity
              
            })
          
        }
        
       
        self.animatePoints(from: 1 , to: 10)
        ///animate
        for i in 0...7{
            let animateView:UIView = UIView()
                animateView.backgroundColor = object.backgroundColor
                animateView.alpha = 0.3
                animateView.clipsToBounds = true
                animateView.frame = object.convert(object.bounds, to: self.view)
                animateView.round()

                self.view.addSubview(animateView)
            
                self.view.bringSubviewToFront(object.superview!.superview!)
  
            UIView.animate(withDuration: 3, delay: (Double(i) * 0.3), options: .curveEaseOut, animations: {
                animateView.transform = CGAffineTransform(scaleX: 8, y: 8)
                animateView.alpha = 0
            }) { (_) in
                animateView.removeFromSuperview()
            }
            
        }

    }
    
    
    
    func animatePoints(from downPoints:Int,to upperPoints:Int){
     
        
        for i in 0...(upperPoints - downPoints) {
            let n = Int(arc4random_uniform(30))
            let label = UILabel()
            label.textColor = UIColor.random
            label.font = UIFont.boldSystemFont(ofSize: CGFloat(i + 18))
            label.text = "+\(downPoints + i)"
            label.alpha = 0
            
            let frame = bigStarBtn.convert(bigStarBtn.bounds, to: self.view)
            label.frame = CGRect(x: frame.origin.x - 10 + CGFloat(n), y: frame.minY - CGFloat(35 + n), width: 50, height: 50)
            self.view.addSubview(label)
            
           
            
            UIView.animate(withDuration: 0.4, delay: (Double(i) * 0.4), options: .curveEaseOut, animations: {
                label.alpha = 1
                self.view.bringSubviewToFront(label)

            }) { (_) in
                UIView.animate(withDuration: 1, delay: 0, options: .curveEaseOut, animations: {
                    label.frame.origin.y = label.frame.maxY/2
                    label.alpha = 0
                    self.view.bringSubviewToFront(label)
                    
                    self.bigStarCount += 1
                    self.currentStarCount -= 1
                    self.setStarCounters()
                }, completion: { _ in
                    label.removeFromSuperview()
                })
            }
            
            
        }
    }
    
}
