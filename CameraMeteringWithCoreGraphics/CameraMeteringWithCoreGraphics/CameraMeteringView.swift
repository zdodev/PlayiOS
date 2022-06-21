import UIKit

final class CameraMeteringView: UIView {
    // MARK: Line Color
    
    private let lineColor = UIColor.systemGray

    // MARK: Rectangle Vertex Line
    
    private let topLeadingVertex = UIBezierPath()
    private let topTrailingVertex = UIBezierPath()
    private let bottomLeadingVertex = UIBezierPath()
    private let bottomTrailingVertex = UIBezierPath()
    
    // MARK: Rectangle Vertex Lines
    
    private lazy var vertexes = [
        topLeadingVertex,
        topTrailingVertex,
        bottomLeadingVertex,
        bottomTrailingVertex,
    ]
    
    // MARK: Coordinate Rates
    
    private let topCoordinateRate = 0.3
    private let bottomCoordinateRate = 0.7
    private let leadingCoordinateRate = 0.2
    private let trailingCoordinateRate = 0.8
    
    // MARK: Rectangle Vertexes
    
    private var topLeadingCoordinate = CGPoint(x: 0.0, y: 0.0)
    private var topTrailingCoordinate = CGPoint(x: 0.0, y: 0.0)
    private var bottomLeadingCoordinate = CGPoint(x: 0.0, y: 0.0)
    private var bottomTrailingCoordinate = CGPoint(x: 0.0, y: 0.0)
    
    // MARK: Line Length Rate
    
    private let lineLengthRate = 0.1
    
    // MARK: Line Length
    
    private var lineLength = 0.0
    
    override func draw(_ rect: CGRect) {
        setLineColor(.systemGray)
        setLineWidth(2)
        setVertexCoordinates(rect)
        setLineLength(rect)
        setVertexStartCoordinates()
        addVertexLines()
    }
    
    private func setLineColor(_ color: UIColor) {
        color.set()
    }
    
    private func setLineWidth(_ width: CGFloat) {
        vertexes.forEach { vertex in
            vertex.lineWidth = width
        }
    }
    
    private func setVertexCoordinates(_ rect: CGRect) {
        topLeadingCoordinate = CGPoint(x: rect.maxX * leadingCoordinateRate, y: rect.maxY * topCoordinateRate)
        topTrailingCoordinate = CGPoint(x: rect.maxX * trailingCoordinateRate, y: rect.maxY * topCoordinateRate)
        bottomLeadingCoordinate = CGPoint(x: rect.maxX * leadingCoordinateRate, y: rect.maxY * bottomCoordinateRate)
        bottomTrailingCoordinate = CGPoint(x: rect.maxX * trailingCoordinateRate, y: rect.maxY * bottomCoordinateRate)
    }
    
    private func setVertexStartCoordinates() {
        topLeadingVertex.move(to: topLeadingCoordinate)
        topTrailingVertex.move(to: topTrailingCoordinate)
        bottomLeadingVertex.move(to: bottomLeadingCoordinate)
        bottomTrailingVertex.move(to: bottomTrailingCoordinate)
    }
    
    private func setLineLength(_ rect: CGRect) {
        lineLength = rect.maxX * lineLengthRate
    }
    
    private func addVertexLines() {
        topLeadingVertex.addLine(to: topLeadingCoordinate + CGPoint(x: lineLength, y: 0))
        topLeadingVertex.close()
        topLeadingVertex.addLine(to: topLeadingCoordinate + CGPoint(x: 0, y: lineLength))
        topLeadingVertex.close()
        
        topTrailingVertex.addLine(to: topTrailingCoordinate + CGPoint(x: -lineLength, y: 0))
        topTrailingVertex.close()
        topTrailingVertex.addLine(to: topTrailingCoordinate + CGPoint(x: 0, y: lineLength))
        topTrailingVertex.close()
        
        bottomLeadingVertex.addLine(to: bottomLeadingCoordinate + CGPoint(x: lineLength, y: 0))
        bottomLeadingVertex.close()
        bottomLeadingVertex.addLine(to: bottomLeadingCoordinate + CGPoint(x: 0, y: -lineLength))
        bottomLeadingVertex.close()
        
        bottomTrailingVertex.addLine(to: bottomTrailingCoordinate + CGPoint(x: -lineLength, y: 0))
        bottomTrailingVertex.close()
        bottomTrailingVertex.addLine(to: bottomTrailingCoordinate + CGPoint(x: 0, y: -lineLength))
        bottomTrailingVertex.close()
        
        vertexes.forEach { vertex in
            vertex.stroke()
        }
    }
}

private extension CGPoint {
    static func + (_ lhs: CGPoint, _ rhs: CGPoint) -> CGPoint {
        CGPoint(x: lhs.x + rhs.x, y: lhs.y + rhs.y)
    }
}
