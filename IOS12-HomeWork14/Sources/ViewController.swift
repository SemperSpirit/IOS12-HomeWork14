//
//  ViewController.swift
//  IOS12-HomeWork14
//
//  Created by Kaiten Aiko on 27.03.2024.
//

import UIKit

final class PhotoAlbums: UIViewController {

    let sectionModel = PhotoalbumSection.sections

    //    MARK: - Outlets -

    private lazy var collectionView: UICollectionView = {
        let layout = createLayout()
        let collectionView = UICollectionView(frame: .zero,
                                              collectionViewLayout: layout)
        collectionView.register(PhotoForAlbums.self,
                                forCellWithReuseIdentifier: PhotoForAlbums.identifier)
        collectionView.register(HeaderForAlbums.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderForAlbums.identifire)
        collectionView.register(CellsForAlbums.self,
                                forCellWithReuseIdentifier: CellsForAlbums.identifier)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()

   // MARK: - Inits -

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Альбомы"
        setupHierarchy()
        setupLayout()
    }

    //    MARK: - Setup -

    private func setupHierarchy() {
        view.addSubview(collectionView)
    }

    private func setupLayout() {
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { section, _ in

            switch section {
            case 0:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(0.5)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5,
                                                                   bottom: 10, trailing: 0)

                let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(0.47),
                                                       heightDimension: .fractionalWidth(1.2)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    repeatingSubitem: layoutItem,
                    count: 2
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5,
                                                                    bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6,
                                                                      bottom: 10, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .paging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(
                    widthDimension: .absolute((self.view.frame.width) - 6),
                    heightDimension: .estimated(48)
                )

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            case 1:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .fractionalHeight(1)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5,
                                                                   bottom: 10, trailing: 0)

                let groupSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(0.47),
                    heightDimension: .fractionalWidth(0.6)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    repeatingSubitem: layoutItem,
                    count: 1
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5,
                                                                    bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 6,
                                                                      bottom: 10, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .paging

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute((self.view.frame.width) - 6),
                                                                     heightDimension: .estimated(48)
                )
                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            default:
                let itemSize = NSCollectionLayoutSize(
                    widthDimension: .fractionalWidth(1),
                    heightDimension: .absolute(44)
                )

                let layoutItem = NSCollectionLayoutItem(layoutSize: itemSize)
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0,
                                                                   bottom: 0, trailing: 0)

                let groupHeight = itemSize.heightDimension.dimension * CGFloat(self.sectionModel[section].model.count)

                let groupSize = NSCollectionLayoutSize(widthDimension: .absolute((self.view.frame.width) - 6),
                                                       heightDimension: .absolute(groupHeight)
                )

                let layoutGroup = NSCollectionLayoutGroup.vertical(
                    layoutSize: groupSize,
                    repeatingSubitem: layoutItem,
                    count: self.sectionModel[section].model.count
                )
                layoutGroup.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0,
                                                                    bottom: 0, trailing: 0)

                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0,
                                                                      bottom: 20, trailing: 15)
                layoutSection.orthogonalScrollingBehavior = .none

                let layoutSectionHeaderSize = NSCollectionLayoutSize(widthDimension: .absolute((self.view.frame.width) - 6),
                                                                     heightDimension: .estimated(48)
                )

                let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(
                    layoutSize: layoutSectionHeaderSize,
                    elementKind: UICollectionView.elementKindSectionHeader,
                    alignment: .topLeading
                )
                layoutSection.boundarySupplementaryItems = [layoutSectionHeader]
                return layoutSection
            }
        }
    }
}

   // MARK: - Extensions -

extension PhotoAlbums: UICollectionViewDelegate, UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        sectionModel[section].model.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        switch indexPath.section {
        case 0...1:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoForAlbums.identifier, for: indexPath) as? PhotoForAlbums else { return UICollectionViewCell() }
            item.setupPhotoAlbums(model: sectionModel[indexPath.section].model[indexPath.row])
            return item
        case 2...3:
            guard let item = collectionView.dequeueReusableCell(withReuseIdentifier: CellsForAlbums.identifier, for: indexPath) as? CellsForAlbums else { return UICollectionViewCell() }
            item.setupMediafiles(model: sectionModel[indexPath.section].model[indexPath.row])
            return item
        default:
            return UICollectionViewCell()
        }
    }

    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderForAlbums.identifire, for: indexPath) as? HeaderForAlbums else { return UICollectionReusableView() }
        header.setupNames(model: sectionModel[indexPath.section])
        return header
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return sectionModel.count
    }
}

