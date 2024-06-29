//
//  CameraView.swift
//  lab
//
//  Created by Sam Franusic on 5/1/24.
//

import SwiftUI
import AVFoundation

struct CameraView: UIViewControllerRepresentable {
    class Coordinator: NSObject, AVCaptureVideoDataOutputSampleBufferDelegate {
        var parent: CameraView
        var captureSession: AVCaptureSession

        init(parent: CameraView) {
            self.parent = parent
            self.captureSession = AVCaptureSession()
            super.init()

            guard
                let videoDevice = AVCaptureDevice.default(.builtInWideAngleCamera, for: .video, position: .back),
                let videoDeviceInput = try? AVCaptureDeviceInput(device: videoDevice),
                captureSession.canAddInput(videoDeviceInput),
                captureSession.canAddOutput(AVCaptureVideoDataOutput())
            else {
                return
            }

            captureSession.addInput(videoDeviceInput)

            let videoOutput = AVCaptureVideoDataOutput()
            videoOutput.setSampleBufferDelegate(self, queue: DispatchQueue(label: "videoQueue"))
            captureSession.addOutput(videoOutput)

            DispatchQueue.global(qos: .background).async {
                self.captureSession.startRunning()
            }
        }

        func captureOutput(
            _ output: AVCaptureOutput,
            didOutput sampleBuffer: CMSampleBuffer,
            from connection: AVCaptureConnection
        ) {
            // TODO: process sample buffer with Vision to detect object
        }
    }

    func makeCoordinator() -> Coordinator {
        Coordinator(parent: self)
    }

    func makeUIViewController(context: Context) -> UIViewController {
        let controller = UIViewController()
        let captureLayer = AVCaptureVideoPreviewLayer(session: context.coordinator.captureSession)
        captureLayer.videoGravity = .resizeAspectFill
        controller.view.layer.addSublayer(captureLayer)
        captureLayer.frame = controller.view.bounds
        return controller
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        let captureLayer = uiViewController.view.layer.sublayers?.first as? AVCaptureVideoPreviewLayer
        captureLayer?.frame = uiViewController.view.bounds
    }
}
