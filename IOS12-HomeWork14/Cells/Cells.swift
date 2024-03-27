//
//  Cells.swift
//  IOS12-HomeWork14
//
//  Created by Kaiten Aiko on 27.03.2024.
//

import UIKit

class CellsForAlbums: UICollectionViewCell {
    
    static let identifier = "CellsForAlbums"

    // MARK: - Outlets -

    private let separator: UIView = {
        let view = UIView()
        view.backgroundColor = .systemGray4
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    private let imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let chevron: UIImageView = {
        let image = UIImage(systemName: "chevron.right")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 16, weight: .semibold, scale: .small))
        let imageView = UIImageView(image: image)
        imageView.tintColor = .systemGray
        imageView.alpha = 0.6
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    private let nameMediafile: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .left
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        label.textAlignment = .right
        label.textColor = .systemGray
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    // MARK: - Inits -

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupHierarchy()
        setupLayout()
    }

    required init?(coder: NSCoder) {
        fatalError("ERROR")
    }

    // MARK: - Setup -

    private func setupHierarchy() {
        addSubview(imageView)
        addSubview(nameMediafile)
        addSubview(descriptionLabel)
        addSubview(chevron)
        addSubview(separator)
    }

    private func setupLayout() {
        imageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            imageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 11),
            imageView.widthAnchor.constraint(equalToConstant: 26),
            imageView.heightAnchor.constraint(equalToConstant: 26)
        ])

        nameMediafile.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameMediafile.centerYAnchor.constraint(equalTo: centerYAnchor),
            nameMediafile.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 15)
        ])

        chevron.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            chevron.centerYAnchor.constraint(equalTo: centerYAnchor),
            chevron.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -15)
        ])

        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            descriptionLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            descriptionLabel.trailingAnchor.constraint(equalTo: chevron.leadingAnchor, constant: -8)
        ])

        separator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            separator.heightAnchor.constraint(equalToConstant: 0.5),
            separator.trailingAnchor.constraint(equalTo: trailingAnchor),
            separator.bottomAnchor.constraint(equalTo: bottomAnchor),
            separator.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 41)
        ])
    }

    func setupMediafiles(model: PhotoalbumModel) {
        self.nameMediafile.text = model.name
        self.descriptionLabel.text = model.description
        self.imageView.image = model.image
    }
}

