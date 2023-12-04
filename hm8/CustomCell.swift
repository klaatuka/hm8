

import UIKit

class CustomCell: UICollectionViewCell {
    
    var delegate: ViewControllerDelegate?

    static var reusId = "cell"
    let collectData: [CollectData] = CollectData.getData()
    
    func config(data: CollectData, view: UIView){
        let text: UILabel = {
            $0.text = data.title
            $0.numberOfLines = 0
            $0.font = .systemFont(ofSize: 20, weight: .bold)
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UILabel())
        
        let image: UIImageView = {
            $0.contentMode = .scaleAspectFill
            $0.layer.cornerRadius = 20
            $0.clipsToBounds = true
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UIImageView(image: UIImage(named: data.photo)))
        let text2: UILabel = {
            $0.text = data.text
            $0.numberOfLines = 0
            $0.translatesAutoresizingMaskIntoConstraints = false
            return $0
        }(UILabel())
        
        lazy var btnAct = UIAction { _ in
            print(1)
            self.delegate?.getHref(link: data.href)
            
            // код ниже открывает браузер и загружает ссылку
            //            if let url = URL(string: data.href) {
            //                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            //            }
        }
        lazy var btnRef: UIButton = {
            $0.setTitle(data.href, for: .normal)
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.contentHorizontalAlignment = .left
            return $0
        }(UIButton(primaryAction: btnAct))
  
        let cellView: UIView = {
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.backgroundColor = #colorLiteral(red: 0.9341433644, green: 0.9341433644, blue: 0.9341433644, alpha: 1)
            $0.clipsToBounds = true
            $0.layer.cornerRadius = 20
            $0.addSubview(text)
            $0.addSubview(image)
            $0.addSubview(text2)
            $0.addSubview(btnRef)
            return $0
        }(UIView())
        
        let ratio = (image.image?.size.height ?? 0) / (image.image?.size.width ?? 0)
        let imgHeight = (UIScreen.main.bounds.width - 20) * ratio
        
        view.addSubview(cellView)
        
        NSLayoutConstraint.activate([
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            cellView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 40),
            
            text.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 21),
            text.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 30),
            text.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -30),
            //            text.bottomAnchor.constraint(equalTo: image.topAnchor, constant: -10),
            
            image.topAnchor.constraint(equalTo: text.bottomAnchor, constant: 10),
            image.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            image.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -10),
            image.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width - 60),
            image.heightAnchor.constraint(equalToConstant: imgHeight),
            
            text2.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 20),
            text2.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 30),
            text2.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -30),
            
            btnRef.topAnchor.constraint(equalTo: text2.bottomAnchor, constant: 10),
            btnRef.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 30),
            btnRef.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -30),
            btnRef.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -25),
        ])
    }
}
