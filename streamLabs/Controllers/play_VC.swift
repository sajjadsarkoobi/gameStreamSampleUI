//
//  play_VC.swift
//  streamLabs
//
//  Created by Sajjad Sarkoobi on 5/14/19.
//  Copyright © 2019 sarkoobi. All rights reserved.
//

import UIKit

class play_VC: UIViewController {

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
    
    
    
    //TopView//
    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var topSubtitleLabel: UILabel!
    @IBOutlet weak var moreBtn: UIButton!
    @IBAction func moreBtnAction(_ sender: UIButton) {
        
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
       
        setInitialObjects()
        addTouchRecognations()
        setupCollectionView()
        
    }
    
    
    
    func setInitialObjects(){
        let boldAttrs = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: 14)]
        let regularGrayColorAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: AppColors.grayColor]
        let orangcolorAttrs = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 13),NSAttributedString.Key.foregroundColor: AppColors.orangeColor]
        
        
        ///BottomView
        avatarImgView.image = UIImage(named: "avatar00002")
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

    
    func setupCollectionView(){
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        collectionView.reloadData()
    }
    
    @objc func touchTriggerd(_ sender:UITapGestureRecognizer){
        
        switch  sender.view{
        case shareView:
            print("Share")
            break
        case commentView:
            print("Comment")
            break
        default:
            break
        }
    }
}

extension play_VC:UICollectionViewDelegate,UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "usersCollectionViewCell", for: indexPath) as! usersCollectionViewCell
        return cell
    }
    
    
}


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
