//
//  Model.swift
//  IOS12-HomeWork14
//
//  Created by Kaiten Aiko on 27.03.2024.
//

import UIKit

struct PhotoalbumModel: Hashable {
    var name: String
    var description: String
    var image: UIImage?
}

struct PhotoalbumSection {
    let mainName: String
    let model: [PhotoalbumModel]
}

func createCircularImage(named: String) -> UIImage? {
    guard let image = UIImage(named: named) else { return nil }
    
    let diameter = min(image.size.width, image.size.height)
    let size = CGSize(width: diameter, height: diameter)
    let renderer = UIGraphicsImageRenderer(size: size)
    return renderer.image { context in
        let bounds = CGRect(origin: .zero, size: size)
        let clipPath = UIBezierPath(ovalIn: bounds)
        clipPath.addClip()
        
        let drawRect = CGRect(x: (size.width - image.size.width) / 2,
                              y: (size.height - image.size.height) / 2,
                              width: image.size.width,
                              height: image.size.height)
        
        image.draw(in: drawRect)
    }
}

extension PhotoalbumSection {
    static let sections: [PhotoalbumSection] = [
        PhotoalbumSection(mainName: "Мои альбомы", model: [
            PhotoalbumModel(name: "Недавние",
                               description: "9357",
                               image: UIImage(named: "1")),
            PhotoalbumModel(name: "Избранное",
                               description: "728",
                               image: UIImage(named: "2")),
            PhotoalbumModel(name: "Для переписки",
                               description: "0",
                               image: UIImage(named: "3")),
            PhotoalbumModel(name: "WhatsApp",
                               description: "71",
                               image: UIImage(named: "4")),
            PhotoalbumModel(name: "Snapseed",
                               description: "1419",
                               image: UIImage(named: "5")),
            PhotoalbumModel(name: "PS Express",
                               description: "5347",
                               image: UIImage(named: "6")),
            PhotoalbumModel(name: "Lightroom",
                               description: "4376",
                               image: UIImage(named: "7"))
        ]),
        PhotoalbumSection(mainName: "Люди и места", model: [
            PhotoalbumModel(name: "Люди",
                               description: "2",
                               image: createCircularImage(named: "8")),
            PhotoalbumModel(name: "Места",
                               description: "295",
                               image: UIImage(named: "9"))
        ]),
        PhotoalbumSection(mainName: "Типы медиафайлов", model: [
            PhotoalbumModel(name: "Видео",
                               description: "412",
                               image: UIImage(systemName: "video")),
            PhotoalbumModel(name: "Селфи",
                               description: "141",
                               image: UIImage(systemName: "person.crop.square")),
            PhotoalbumModel(name: "Фото Live Photo",
                               description: "37",
                               image: UIImage(systemName: "livephoto")),
            PhotoalbumModel(name: "Портреты",
                               description: "27",
                               image: UIImage(systemName: "f.cursive.circle")),
            PhotoalbumModel(name: "Панорамы",
                               description: "13",
                               image: UIImage(systemName: "pano")),
            PhotoalbumModel(name: "Снимки экрана",
                               description: "577",
                               image: UIImage(systemName: "camera.viewfinder")),
            PhotoalbumModel(name: "Записи экрана",
                               description: "1",
                               image: UIImage(systemName: "record.circle")),
        ]),
        PhotoalbumSection(mainName: "Другое", model: [
            PhotoalbumModel(name: "Импортированные",
                               description: "0",
                               image: UIImage(systemName: "square.and.arrow.down")),
            PhotoalbumModel(name: "Дубликаты",
                               description: "34",
                               image: UIImage(systemName: "square.on.square")),
            PhotoalbumModel(name: "Скрытые",
                               description: "0",
                               image: UIImage(systemName: "eye.slash")),
            PhotoalbumModel(name: "Недвано удаленные",
                               description: "654",
                               image: UIImage(systemName: "trash"))
        ])
    ]
}
