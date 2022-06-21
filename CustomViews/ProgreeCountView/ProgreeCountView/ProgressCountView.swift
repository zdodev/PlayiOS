import UIKit

final class ProgressCountView: UIView {
    private let stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        return stackView
    }()
    private var progressViews = [UIView]()
    private var progressCount = 0
    private var current = -1
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(stackView)
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setProgress(count: Int) {
        progressCount = count
        
        for _ in 0..<progressCount {
            progressViews.append(UIView())
        }
        
        progressViews.forEach { progressView in
            configure(progressView)
            stackView.addArrangedSubview(progressView)
        }
    }
    
    func increase() {
        calculateCurrent(1)
        drawProgressView()
    }
    
    func decrease() {
        calculateCurrent(-1)
        drawProgressView()
    }
    
    private func drawProgressView() {
        progressViews.enumerated().forEach { view in
            if view.offset <= current {
                view.element.backgroundColor = .black
                return
            }
            
            view.element.backgroundColor = .white
        }
    }
    
    private func calculateCurrent(_ count: Int) {
        current += count
        
        if current < -1 {
            current = -1
        }
        
        if current > progressCount - 1 {
            current = progressCount - 1
        }
    }
    
    private func configure(_ view: UIView) {
        let viewSize: CGFloat = 15
        
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = viewSize / 2
        
        NSLayoutConstraint.activate([
            view.widthAnchor.constraint(equalToConstant: viewSize),
            view.heightAnchor.constraint(equalToConstant: viewSize)
        ])
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ])
    }
}
