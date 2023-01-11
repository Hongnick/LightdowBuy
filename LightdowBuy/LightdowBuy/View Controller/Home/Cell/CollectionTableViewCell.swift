//
//  CollectionTableViewCell.swift
//  LightdowBuy
//
//  Created by Nick on 2023/1/10.
//

import UIKit
import SnapKit

struct CollectionTableViewCellViewModel {
    let viewModels:[TileCollectionViewCellViewModel]
}

protocol CollectionTableViewCellDelegate: AnyObject {
    func collectionTableViewCellDidTapItem(with viewModel: TileCollectionViewCellViewModel)
}


class CollectionTableViewCell: UITableViewCell {
    static let identifier = "CollectionTableViewCell"
    
    weak var delegate: CollectionTableViewCellDelegate?
    
    // viewModels 存放新增的物件
    private var viewModels: [TileCollectionViewCellViewModel] = []

   lazy var artcollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.sectionInset = UIEdgeInsets(top: 2, left: 2, bottom: 2, right: 2)
        let artcollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
       artcollectionView.register(TileCollectionViewCell.self, forCellWithReuseIdentifier: TileCollectionViewCell.identifier)
       artcollectionView.showsHorizontalScrollIndicator = false
       artcollectionView.backgroundColor = .systemBackground
       artcollectionView.delegate = self
       artcollectionView.dataSource = self
       
       
        return artcollectionView
    }()
   
    // MARK: - Init
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
       initMethod()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension CollectionTableViewCell: SetupProtocol {
    func initMethod() {
        setupUI()
        setupLayout()
    }
    
    func setupUI() {
        contentView.backgroundColor = .systemBackground
        contentView.addSubview(artcollectionView)
    }
    
    func setupLayout() {
        artcollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(contentView)
            $0.height.equalTo(contentView).multipliedBy(1)
        }
    }
}

extension CollectionTableViewCell: UICollectionViewDelegate,UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TileCollectionViewCell.identifier, for: indexPath) as? TileCollectionViewCell else {
            fatalError()
        }
        cell.configure(with: viewModels[indexPath.row])
        return cell
    }
    
    
    func configure(with viewModel: CollectionTableViewCellViewModel) {
        self.viewModels = viewModel.viewModels
        artcollectionView.reloadData()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        // 物件大小
        let width: CGFloat = contentView.frame.size.width/1.3

        return CGSize(width: width, height: width/0.8)
    
    
       
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        let viewModel = viewModels[indexPath.row]
        
        delegate?.collectionTableViewCellDidTapItem(with: viewModel)
    }
    
    
    
}
