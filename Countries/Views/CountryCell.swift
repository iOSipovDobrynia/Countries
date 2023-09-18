//
//  CountryCell.swift
//  Countries
//
//  Created by Goodwasp on 18.09.2023.
//

import UIKit

class CountryCell: UICollectionViewCell {
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var countryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with country: Country) {
        nameLabel.text = country.name.common
    }
}
