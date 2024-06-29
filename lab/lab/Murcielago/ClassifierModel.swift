//
//  ClassifierModel.swift
//  lab
//
//  Created by Sam Franusic on 5/10/24.
//
//

import CoreML
import UIKit
import Vision

actor ClassifierModel {
    let classifier = ImageClassifier()

    func confidenceFor(image: UIImage) async -> Float {
        let value: Float
        do {
            value = try await checkMatch(image: image)
        } catch {
            value = 0
        }
        return value
    }

    private func checkMatch(image: UIImage) async throws -> Float {
        return try await withCheckedThrowingContinuation { continuation in
            classifier.checkForMatch(in: image) { result in
                switch result {
                case .success(let value):
                    continuation.resume(returning: value)
                    return
                case .failure(let error):
                    continuation.resume(throwing: error)
                }
            }
        }
    }
}

class ImageClassifier {
    let model: VNCoreMLModel

    init() {
        do {
            model = try VNCoreMLModel(for: MockModel().model)
        } catch {
            fatalError("Failed to load Core ML model: \(error)")
        }
    }

    func checkForMatch(in image: UIImage, completion: @escaping (Result<Float, Error>) -> Void) {

        guard let cgImage = image.cgImage else {
            completion(.failure(NSError(domain: "InvalidImage", code: 0, userInfo: nil)))
            return
        }

        // Create a Vision request to classify the image
        let request = VNCoreMLRequest(model: model) { request, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            if let results = request.results as? [VNClassificationObservation], !results.isEmpty {
                completion(.success(results.first?.confidence ?? 0))
            } else {
                completion(.failure(NSError(domain: "NoResults", code: 0, userInfo: nil)))
            }
        }

        // Execute the request
        let handler = VNImageRequestHandler(cgImage: cgImage, options: [:])
        do {
            try handler.perform([request])
        } catch {
            completion(.failure(error))
        }
    }
}

struct MockModel {
    let model = MLModel()
}
