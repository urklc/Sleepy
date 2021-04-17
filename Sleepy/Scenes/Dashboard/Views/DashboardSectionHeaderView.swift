//
//  DashboardSectionHeaderView.swift
//  Sleepy
//
//  Created by Ugur Kilic on 17.04.2021.
//

import UIKit

final class DashboardSectionHeaderView: UICollectionReusableView {

    static var expectedHeight: CGFloat = 50

    var text: String = "" {
        didSet {
            sectionHeaderlabel.text = text
        }
    }

    private var sectionHeaderlabel: UILabel!

    override init(frame: CGRect) {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }

    private func setupView() {
        sectionHeaderlabel = UILabel()
        sectionHeaderlabel.translatesAutoresizingMaskIntoConstraints = false
        sectionHeaderlabel.applyDefaultStyling(weight: .bold, style: .title2)
        sectionHeaderlabel.text = text
        addSubview(sectionHeaderlabel)

        NSLayoutConstraint.activate([
            sectionHeaderlabel.leadingAnchor.constraint(equalTo: leadingAnchor,
                                                        constant: Margin.large),
            sectionHeaderlabel.topAnchor.constraint(equalTo: topAnchor),
            sectionHeaderlabel.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
