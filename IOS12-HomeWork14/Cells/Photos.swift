//
//  Photos.swift
//  IOS12-HomeWork14
//
//  Created by Kaiten Aiko on 27.03.2024.
//

import UIKit

class PhotoForAlbums: UICollectionViewCell {

    static let identifier = "PhotoForAlbums"

    //    MARK: - Outlets -

    private lazy var albumsName: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return label
    }()
    
    private let image: UIImageView = {
        let imageView = UIImageView()
        imageView.layer.cornerRadius = 5
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var descriptionAlbums: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 15)
        return label
    }()
    
    lazy var stack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        return stack
    }()

    //     MARK: - Inits -

    override init(frame: CGRect) {
        super.init(frame: frame)
        clipsToBounds = true
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }
    
    //    MARK: - Setup -

    private func setupHierarchy() {
        contentView.addSubview(stack)
        contentView.addSubview(image)
        stack.addArrangedSubview(albumsName)
        stack.addArrangedSubview(descriptionAlbums)
    }

    private func setupLayout() {
        stack.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stack.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 6)
        ])
        
        image.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            image.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            image.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            image.topAnchor.constraint(equalTo: contentView.topAnchor),
            image.heightAnchor.constraint(equalTo: image.widthAnchor)
        ])
    }

   func setupPhotoAlbums(model: PhotoalbumModel) {
        self.albumsName.text = model.name
        self.image.image = model.image
        self.descriptionAlbums.text = model.description
    }
}

