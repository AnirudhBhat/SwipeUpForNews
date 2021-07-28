
import Foundation
import UIKit

class MyRootViewController: UIViewController {
    
    private var newsCollectionView: UICollectionView?
    private var data  =  [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .red
        print ("enter")
        data = ["abc","def", "hig", "klm"]
        initCollectionView()
        initData()
        // Do any additional setup after loading the view.
    }
    
    func initCollectionView() {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: view.frame.size.width, height: view.frame.size.height)
        layout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        newsCollectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        newsCollectionView?.isPagingEnabled = true
        newsCollectionView?.dataSource = self
        newsCollectionView?.register(NewsCollectionViewCell.self, forCellWithReuseIdentifier: NewsCollectionViewCell.identifier)
        view.addSubview(newsCollectionView!)
    }
    
    func initData() {
        let api = NetworkingService()
        api.getTwitterTimelineForUser(id: "55964332")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        newsCollectionView?.frame = view.bounds
    }
    
}

extension MyRootViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = newsCollectionView?.dequeueReusableCell(withReuseIdentifier: NewsCollectionViewCell.identifier, for: indexPath) as! NewsCollectionViewCell
        cell.contentView.backgroundColor = .red
        cell.configureNewsLable()
        return cell
    }
    
    
}

