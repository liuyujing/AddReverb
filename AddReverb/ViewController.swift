//
//  ViewController.swift
//  AddReverb
//
//  Created by Bruce on 16/6/7.
//  Copyright © 2016年 Bruce. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    //    创建音频引擎
    lazy var engine = AVAudioEngine()
    //    创建混响效果
    lazy var reverb = AVAudioUnitReverb()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        音频输入口
        let intput = engine.inputNode!
        //        音频输出口
        let output = engine.outputNode
        
        //        设置混响效果器 为教堂的效果
        reverb.loadFactoryPreset(.Cathedral)
        //        设置混响的干湿比 是从0-100的值 干湿比影响到咱们混响与原声的一个混合比例
        reverb.wetDryMix = 30
        
        //        把混响附着到音频引擎
        engine.attachNode(reverb)
        
        //        使用音频引擎连接各个节点
        //        1.输入口 连接效果器 可对比咱们的图来看
        //        Format:格式 是咱们输入口在主线的一个格式
        engine.connect(intput, to: reverb, format: intput.inputFormatForBus(0))
        //        2.效果器 连接 输出口
        engine.connect(reverb, to: output, format: intput.inputFormatForBus(0))
        
        //        所有节点都连接好了,那咱们可以开启引擎，享受咱们的效果器了
        try! engine.start()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

