import UIKit

final class ToolTipView: UIView {
    private let lineWidth: CGFloat = 1
    private let cornerRadius: CGFloat = 10
    private let calloutSize: CGFloat = 5
    private let fillColor: UIColor = .yellow
    private let strokeColor: UIColor = .black
    
    override func draw(_ rect: CGRect) {
        let rect = bounds.insetBy(dx: lineWidth / 2, dy: lineWidth / 2)
        let path = UIBezierPath()
        
        // lower left corner
        path.move(to: CGPoint(x: rect.minX + cornerRadius, y: rect.maxY - calloutSize))
        path.addQuadCurve(to: CGPoint(x: rect.minX, y: rect.maxY - calloutSize - cornerRadius),
                          controlPoint: CGPoint(x: rect.minX, y: rect.maxY - calloutSize))
        
        // left
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + cornerRadius))
        
        // upper left corner
        path.addQuadCurve(to: CGPoint(x: rect.minX + cornerRadius, y: rect.minY),
                          controlPoint: CGPoint(x: rect.minX, y: rect.minY))
        
        // top
        path.addLine(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.minY))
        
        // upper right corner
        path.addQuadCurve(to: CGPoint(x: rect.maxX, y: rect.minY + cornerRadius),
                          controlPoint: CGPoint(x: rect.maxX, y: rect.minY))
        
        // right
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - calloutSize - cornerRadius))
        
        // lower right corner
        path.addQuadCurve(to: CGPoint(x: rect.maxX - cornerRadius, y: rect.maxY - calloutSize),
                          controlPoint: CGPoint(x: rect.maxX, y: rect.maxY - calloutSize))
        
        path.addLine(to: CGPoint(x: rect.midX + calloutSize, y: rect.maxY - calloutSize))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX - calloutSize, y: rect.maxY - calloutSize))
        path.close()
        
        fillColor.setFill()
        path.fill()
        
        strokeColor.setStroke()
        path.lineWidth = lineWidth
        path.stroke()
    }
}
