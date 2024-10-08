//
//  ViewController.swift
//  Camera
//
//  Created by 김소진 on 9/3/24.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    var cameraPreviewView: CameraView!
    var captureSession: AVCaptureSession!

    override func viewDidLoad() {
        super.viewDidLoad()

        // CameraPreviewView 설정
        cameraPreviewView = CameraView(frame: view.bounds)
        view.addSubview(cameraPreviewView)
        
        // 카메라 세션 설정
        setupCameraSession()

        // 촬영 버튼 액션 설정
        cameraPreviewView.captureButton.addTarget(self, action: #selector(didTapCaptureButton), for: .touchUpInside)
    }
    
    // 카메라 세션 설정
    private func setupCameraSession() {
        captureSession = AVCaptureSession()
        captureSession.sessionPreset = .photo
        
        // 후면 카메라 설정
        guard let backCamera = AVCaptureDevice.default(for: .video) else {
            print("카메라를 찾을 수 없습니다.")
            return
        }
        
        do {
            let input = try AVCaptureDeviceInput(device: backCamera)
            if captureSession.canAddInput(input) {
                captureSession.addInput(input)
            }
            
            // 미리보기 레이어에 세션 연결
            cameraPreviewView.setSession(captureSession)
            
            captureSession.startRunning()
            
        } catch {
            print("카메라 설정 오류: \(error)")
        }
    }
    
    // 촬영 버튼이 눌렸을 때 호출되는 메서드
    @objc func didTapCaptureButton() {
        print("촬영 버튼이 눌렸습니다.")
        // 사진 촬영 로직 구현
    }
}
