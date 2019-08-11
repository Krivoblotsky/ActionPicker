//
//  ActionSheetViewController.swift
//  VPN-iOS
//
//  Created by Sergii Kryvoblotskyi on 8/9/19.
//  Copyright © 2019 MacPaw. All rights reserved.
//

import UIKit

final public class ActionSheetViewController: UIViewController {
    
    private enum ViewState {
        
        case hidden, visible
    }
    
    @IBOutlet private weak var transitionView: UIView!
    @IBOutlet private weak var backgroundView: UIView!
    @IBOutlet private weak var containerView: UIView!
    
    private let panGestureRecognizer = UIPanGestureRecognizer()
    private let tapGestureRecognizer = UITapGestureRecognizer()
    private let animator: UIViewPropertyAnimator = {
        let timing = UISpringTimingParameters(dampingRatio: 1.0, initialVelocity: CGVector(dx: 0, dy: 1))
        return UIViewPropertyAnimator(duration: 0.4, timingParameters: timing)
    }()
    
    private let contentViewController: UIViewController
    
    public init(contentViewController: UIViewController) {
        self.contentViewController = contentViewController
        super.init(nibName: "\(ActionSheetViewController.self)", bundle: Bundle(for: ActionSheetViewController.self))
        modalPresentationStyle = .overCurrentContext
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) is not supported. Use init(rootViewController:)")
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        setupContentView()
        setupGestures()
        transitionTo(state: .hidden)
    }
    
    override public func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        animator.addAnimations { [weak self] in
            guard let self = self else { return }
            self.transitionTo(state: .visible)
        }
        self.animator.startAnimation()
    }
    
    override public func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        guard flag else {
            super.dismiss(animated: flag, completion: completion)
            return
        }
        animator.addAnimations { [weak self] in
            guard let self = self else { return }
            self.transitionTo(state: .hidden)
        }
        animator.addCompletion { _ in
            super.dismiss(animated: false, completion: completion)
        }
        animator.startAnimation()
    }
    
    override public var prefersHomeIndicatorAutoHidden: Bool {
        return true
    }
}

private extension ActionSheetViewController {
    
    func setupContentView() {
        let rootView = contentViewController.view!
        rootView.translatesAutoresizingMaskIntoConstraints = false
        rootView.backgroundColor = .clear
        
        contentViewController.willMove(toParent: self)
        addChild(contentViewController)
        contentViewController.didMove(toParent: self)
        
        containerView.embed(rootView)
    }
    
    func setupGestures() {
        panGestureRecognizer.addTarget(self, action: #selector(handlePan))
        transitionView.addGestureRecognizer(panGestureRecognizer)
        
        tapGestureRecognizer.addTarget(self, action: #selector(handleTap))
        backgroundView.addGestureRecognizer(tapGestureRecognizer)
    }
}

private extension ActionSheetViewController {
    
    @objc func handleTap(gesture: UITapGestureRecognizer) {
        if gesture.state == .ended {
            dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func handlePan(gesture: UIPanGestureRecognizer) {
        switch gesture.state {
        case .changed:
            let point = gesture.translation(in: view)
            let updatedTransform = CGAffineTransform(translationX: 0.0, y: point.y)
            transitionView.transform = transitionView.transform.concatenating(updatedTransform)
            gesture.setTranslation(CGPoint(x: 0, y: 0), in: view)
        case .ended, .cancelled:
            //Let's consider to close the view if 30% of its height is beneath the screen
            let shouldClose = transitionView.transform.ty > (transitionView.bounds.size.height / 3)
            animator.addAnimations { [weak self] in
                guard let self = self else { return }
                shouldClose ?
                    self.transitionTo(state: .hidden) :
                    self.transitionTo(state: .visible)
            }
            animator.startAnimation()
            guard shouldClose else { return }
            animator.addCompletion { [weak self] _ in
                guard let self = self else { return }
                self.dismiss(animated: false, completion: nil)
            }
        default:
            break
        }
    }
}

private extension ActionSheetViewController {
    
    private func transitionTo(state: ActionSheetViewController.ViewState) {
        switch state {
        case .hidden:
            self.backgroundView.alpha = 0
            self.transitionView.transform = CGAffineTransform(translationX: 0, y: transitionView.bounds.size.height + view.safeAreaInsets.bottom)
        case .visible:
            self.backgroundView.alpha = 1
            self.transitionView.transform = .identity
        }
    }
}
