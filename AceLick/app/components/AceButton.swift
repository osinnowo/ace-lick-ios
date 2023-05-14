//
//  AceButton.swift
//  AceLick
//
//  Created by Osinnowo Emmanuel on 14/05/2023.
//

import UIKit

enum AceTextStyle {
    case `default`
    case bold
}

enum AceButtonStyle {
    case flat
    case rounded
    case other
}

enum AceButtonColor {
    case `default`
    case primary
    case secondary
    case tertiary
    case white
    case other
    
    func tintEquivalent() -> UIColor {
        switch self {
            case .default:
                return .primary
            case .primary:
                return .white
            default:
                return .black
        }
    }
}

protocol AceButtonDelegate {
    func onClick(sender: AceButton)
}

enum Dimension {
    static var cornerRadius: CGFloat = 14
    static var defaultFontSize: CGFloat = 16
}

final class AceButton: UIButton {

    public var delegate: AceButtonDelegate? = nil
    
    public var fontSize: CGFloat {
        didSet {
            updateButtonUI()
        }
    }
    
    public var textStyle: AceTextStyle {
        didSet {
            updateButtonUI()
        }
    }
    
    public var style: AceButtonStyle {
        didSet {
            updateButtonUI()
        }
    }
    
    public var color: AceButtonColor {
        didSet {
            updateButtonUI()
        }
    }
    
    public var title: String {
        didSet {
            updateButtonUI()
        }
    }
    
    public var height: CGFloat {
        didSet {
            updateButtonUI()
        }
    }
    
    public var width: CGFloat {
        didSet {
            updateButtonUI()
        }
    }
    
    init(
        title: String = "Default",
        style: AceButtonStyle = .rounded,
        color: AceButtonColor = .default,
        fontSize: CGFloat = Dimension.defaultFontSize,
        width: CGFloat = 200,
        height: CGFloat = 50,
        textStyle: AceTextStyle = .default,
        delegate: AceButtonDelegate? = nil
    ) {
        self.color = color
        self.fontSize = fontSize
        self.style = style
        self.title = title
        self.width = width
        self.height = height
        self.delegate = delegate
        self.textStyle = textStyle
        
        super.init(frame: .zero)
        
        self.initConfiguration()
        
        updateButtonUI()
    }
    
    private func initConfiguration() {
        updateTitleConfiguration()
    }
    
    private func updateTitleConfiguration() {
        setTextStyle()
        setTextColor()
        setTitle(title, for: .normal)
    }
    
    private func setTextColor() {
        setTitleColor(color.tintEquivalent(), for: .normal)
    }
    
    private func setTextStyle() {
        switch (textStyle) {
            case .default:
                titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
            case .bold:
                titleLabel?.font = .boldSystemFont(ofSize: fontSize)
        }
    }
    
    private func updateButtonStyle() {
        switch style {
        case .flat:
            layer.cornerRadius = 0
        case .rounded:
            layer.cornerRadius = Dimension.cornerRadius
        case .other:
            break
        }
    }
    
    private func updateButtonBackgroundColor() {
        switch color {
        case .default:
            backgroundColor = .white
        case .primary:
            backgroundColor = .primary
        case .secondary:
            backgroundColor = .green
        case .tertiary:
            backgroundColor = .yellow
        case .white:
            backgroundColor = .white
        case .other:
            backgroundColor = .purple
        }
    }
    
    private func setButtonDimension() {
        self.translatesAutoresizingMaskIntoConstraints = false
        self.widthAnchor.constraint(equalToConstant: width).isActive = true
        self.heightAnchor.constraint(equalToConstant: height).isActive = true
    }
    
    private func updateButtonUI() {
        updateButtonStyle()
        updateButtonBackgroundColor()
        setButtonDimension()
        addTarget(self, action: #selector(handleClick(_:)), for: .touchUpInside)
    }
    
    @objc private func handleClick(_ sender: AceButton) {
        self.delegate?.onClick(sender: sender)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

