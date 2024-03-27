//
//  Header.swift
//  IOS12-HomeWork14
//
//  Created by Kaiten Aiko on 27.03.2024.
//

import UIKit

class HeaderForAlbums: UICollectionReusableView {
    
    static let identifire = "HeaderForAlbums"
    
    // MARK: - Outlets -
    
    private let nameAlbum: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        label.textAlignment = .left
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    // MARK: - Inits -
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("Error in Cell")
    }
    
    // MARK: - Setup -
    
    private func setupHierarchy() {
        addSubview(separator)
        addSubview(nameAlbum)
    }
    
    private func setupLayout() {
        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.topAnchor.constraint(equalTo: topAnchor)
        ])
        
        nameAlbum.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameAlbum.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            nameAlbum.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    func setupNames(model: PhotoalbumSection) {
        self.nameAlbum.text = model.mainName
    }
}

