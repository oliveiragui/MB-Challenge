//
//  GraphView.swift
//  CoinAPI
//
//  Created by Guiherme de Oliveira Macedo on 28/01/24.
//

import Foundation
import UIKit

class GraphView: UIView {
    
    struct Constants {
        static let spacingLabel: CGFloat = 20
        static let spacingValue: CGFloat = 40
        static let spacingCurrency: CGFloat = 60

        static let spacingBar: CGFloat = 100

        static let double2: CGFloat = 2
        static let int2 = 2

        static let double0: CGFloat = 0
        
        static let fontSize: CGFloat = 12
    }
    
    var volume1Hrs: Double = Constants.double0
    var volume1Day: Double = Constants.double0
    var volume1Month: Double = Constants.double0
    
    var segmentLabels: [String] = []
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        guard let context = UIGraphicsGetCurrentContext() else { return }
        
        let total = volume1Hrs + volume1Day + volume1Month
        let barWidth = bounds.width / CGFloat(segmentLabels.count * Constants.int2)
        let startX: CGFloat = barWidth / Constants.double2
        
        // Draw bars and subtitles
        for (index, label) in segmentLabels.enumerated() {
            let barX = startX + CGFloat(index) * barWidth * Constants.double2
            let barHeight = CGFloat(getVolume(forIndex: index) / total * (bounds.height - Constants.spacingBar))
            let labelY = Constants.spacingLabel  // Top spacing for subtitles
            let valueY = Constants.spacingValue  // Adjust the spacing for the value
            let currencyY = Constants.spacingCurrency  // Adjust the spacing for the currency
            
            drawBar(context: context, startX: barX, barWidth: barWidth, height: barHeight, color: getBarColor(forIndex: index))
            drawLabel(context: context, label: label, value: getVolume(forIndex: index), barX: barX, barWidth: barWidth, labelY: labelY, valueY: valueY, currencyY: currencyY)
        }
    }
    
    private func drawBar(context: CGContext, startX: CGFloat, barWidth: CGFloat, height: CGFloat, color: UIColor) {
        context.setFillColor(color.cgColor)
        let rect = CGRect(x: startX, y: bounds.height - height, width: barWidth, height: height)
        context.fill(rect)
    }
    
    private func drawLabel(context: CGContext, label: String, value: Double, barX: CGFloat, barWidth: CGFloat, labelY: CGFloat, valueY: CGFloat, currencyY: CGFloat) {
        let labelAttributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: UIColor.black,
            .font: UIFont.systemFont(ofSize: Constants.fontSize)
        ]
        
        // Draw subtitle
        let subtitleString = NSAttributedString(string: label, attributes: labelAttributes)
        let subtitleSize = subtitleString.size()
        subtitleString.draw(at: CGPoint(x: barX + (barWidth - subtitleSize.width) / Constants.double2, y: labelY))
        
        // Draw value
        let valueString = NSAttributedString(string: "\(value)", attributes: labelAttributes)
        let valueSize = valueString.size()
        valueString.draw(at: CGPoint(x: barX + (barWidth - valueSize.width) / Constants.double2, y: valueY))
        
        // Draw currency
        let currencyString = NSAttributedString(string: "USD", attributes: labelAttributes)
        let currencySize = currencyString.size()
        currencyString.draw(at: CGPoint(x: barX + (barWidth - currencySize.width) / Constants.double2, y: currencyY))
    }
    
    private func getVolume(forIndex index: Int) -> Double {
        switch index {
        case 0: return volume1Hrs
        case 1: return volume1Day
        case 2: return volume1Month
        default: return Constants.double0
        }
    }
    
    private func getBarColor(forIndex index: Int) -> UIColor {
        switch index {
        case 0: return .red
        case 1: return .green
        case 2: return .blue
        default: return .clear
        }
    }
    
    func updateGraph(volume1Hrs: Double, volume1Day: Double, volume1Month: Double, segmentLabels: [String]) {
        self.volume1Hrs = volume1Hrs
        self.volume1Day = volume1Day
        self.volume1Month = volume1Month
        self.segmentLabels = segmentLabels
        setNeedsDisplay()
    }
}
