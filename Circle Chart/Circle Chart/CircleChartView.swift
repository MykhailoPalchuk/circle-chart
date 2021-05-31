//
//  CircleChartView.swift
//  Circle Chart
//
//  Created by Mykhailo Palchuk on 5/30/21.
//

import UIKit



class CircleChartView: UIView {

    struct Sector {
        /// Percentage from 0 to 1
        let part: CGFloat
        let color: UIColor
    }


    private let sectors: [Sector]
    private var circleRect: CGRect
    private let lineWidth: CGFloat = 2.0


    init(sectors: [Sector]) {
        self.sectors = sectors
        circleRect = CGRect.zero
        super.init(frame: .zero)
        clipsToBounds = false
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


    override func draw(_ rect: CGRect) {
        super.draw(rect)
        drawCircle(rect: rect)
        drawSectors(rect: rect)
    }


    private func drawCircle(rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.saveGState()
        defer { context.restoreGState() }
        circleRect = CGRect(x: lineWidth,
                            y: lineWidth,
                            width: rect.width - lineWidth * 2,
                            height: rect.height - lineWidth * 2)
        context.setFillColor(UIColor.white.cgColor)
        context.addRect(rect)
        context.fillPath()
        context.setStrokeColor(UIColor.black.cgColor)
        context.setLineWidth(lineWidth)
        context.addEllipse(in: circleRect)
        context.strokePath()
    }


    private func drawSectors(rect: CGRect) {
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        context.saveGState()
        defer { context.restoreGState() }
        let radius = (rect.width - lineWidth * 2) / 2
        let center = CGPoint(x: rect.width / 2, y: rect.height / 2)
        var angle: CGFloat = -1.0 * CGFloat.pi / 2
        for sector in sectors {
            let sectorAngle = sector.part * 2 * CGFloat.pi
            let endAngle = angle + sectorAngle
            context.setFillColor(sector.color.cgColor)
            context.beginPath()
            context.move(to: center)
            context.addArc(center: center, radius: radius, startAngle: angle, endAngle: endAngle, clockwise: false)
            context.addLine(to: center)
            context.closePath()
            context.fillPath()
            angle = endAngle
        }
    }

}
