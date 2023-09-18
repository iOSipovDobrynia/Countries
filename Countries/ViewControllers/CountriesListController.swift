//
//  CountriesListController.swift
//  Countries
//
//  Created by Goodwasp on 18.09.2023.
//

import UIKit

class CountriesListController: UICollectionViewController {

    // MARK: - Private properties
    private var countries: [Country] = []
    
    // MARK: - View's life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCountries()
        collectionView.register(UINib(nibName: "CountryCell", bundle: nil), forCellWithReuseIdentifier: "country")
    }
    
    // MARK: UICollectionViewDataSource
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return countries.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "country", for: indexPath)
        guard let cell = cell as? CountryCell else { return UICollectionViewCell() }
        cell.configure(with: countries[indexPath.item])
        return cell
    }
    
    // MARK: - Private func
    private func fetchCountries() {
        NetworkManager.shared.fetchCountries(from: Link.countries.rawValue) { [weak self] result in
            switch result {
            case .success(let countries):
                self?.countries = countries
                self?.collectionView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    
}

// MARK: - UICollectionViewDelegateFlowLayout
extension CountriesListController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 30) / 2
        let height: CGFloat = 50
        
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}
