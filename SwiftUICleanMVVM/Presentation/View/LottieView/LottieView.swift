//
//  LottieView.swift
//  SwiftUICleanMVVM
//
//  Created by okudera on 2020/10/26.
//

import SwiftUI
import Lottie

struct LottieView: UIViewRepresentable {

    var lottieViewType: LottieViewType!
    var animationView = AnimationView()

    func makeUIView(context: UIViewRepresentableContext<LottieView>) -> UIView {
        let view = UIView()

        self.animationView.animation = Animation.named(self.lottieViewType.rawValue)
        self.animationView.contentMode = .scaleAspectFit
        self.animationView.loopMode = .loop

        self.animationView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(self.animationView)

        NSLayoutConstraint.activate([
            self.animationView.widthAnchor.constraint(equalTo: view.widthAnchor),
            self.animationView.heightAnchor.constraint(equalTo: view.heightAnchor)
        ])

        return view
    }

    func updateUIView(_ uiView: UIView, context: UIViewRepresentableContext<LottieView>) {
        self.animationView.play()
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
}

extension LottieView {
    class Coordinator: NSObject {
        var parent: LottieView

        init(_ animationView: LottieView) {
            self.parent = animationView
            super.init()
        }
    }
}
