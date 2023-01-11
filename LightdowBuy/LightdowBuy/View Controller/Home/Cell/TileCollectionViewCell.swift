//
//  TileCollectionViewCell.swift
//  LightdowBuy
//
//  Created by Nick on 2023/1/10.
//

import UIKit
import SnapKit

// CollectionView物件設計
struct TileCollectionViewCellViewModel {
    let name: String
    let image: UIImage
    let backgroundColor: UIColor
}

class TileCollectionViewCell: UICollectionViewCell {
    static let identifier = "TileCollectionViewCell"
    
    
    let artlabel: UILabel = {
        let artlabel = UILabel()
        artlabel.textColor = .white
        artlabel.textAlignment = .center
        artlabel.font = .systemFont(ofSize: 20, weight:.medium)
        return artlabel
    }()
    
    let artImage: UIImageView = {
        let artImage = UIImageView()
        artImage.contentMode = .scaleToFill
        artImage.layer.cornerRadius = 20
        artImage.layer.masksToBounds = true
       
        return artImage
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
       initMethod()
    }
    
    required init?(coder: NSCoder) {
       fatalError()
    }
    
}

extension TileCollectionViewCell: SetupProtocol {
    func initMethod() {
        setupUI()
        setupLayout()
    }
    
    func setupUI() {
        contentView.addSubview(artlabel)
        contentView.addSubview(artImage)
        contentView.layer.cornerRadius = 20
        contentView.layer.borderWidth = 2
        contentView.layer.borderColor = UIColor.quaternaryLabel.cgColor
    }
    
    func setupLayout() {
        
        artImage.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView)
            $0.height.equalTo(contentView).multipliedBy(1)
        }
    
    }
    
    
    // 物件配置資料
    func configure(with viewModel: TileCollectionViewCellViewModel) {
        contentView.backgroundColor = viewModel.backgroundColor
        artlabel.text = viewModel.name
        artImage.image = viewModel.image
       
        
        
    }
}
