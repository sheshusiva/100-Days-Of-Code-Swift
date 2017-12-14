//
//  record.swift
//  record phone call?
//
//  Created by Caleb Wells on 12/13/17.
//  Copyright © 2017 Caleb Wells. All rights reserved.
//

import AudioToolbox
import libkern

let kCTCallStatusChangeNotification = ""
let kCTCallStatus = ""
enum Enum1 : Int {
    case kCTCallStatusActive = 1
    case kCTCallStatusHeld = 2
    case kCTCallStatusOutgoing = 3
    case kCTCallStatusIncoming = 4
    case kCTCallStatusHanged = 5
}

var kMicFilePath = "/var/mobile/Media/DCIM/mic.caf"
var kSpeakerFilePath = "/var/mobile/Media/DCIM/speaker.caf"
var kResultFilePath = "/var/mobile/Media/DCIM/result.m4a"
var phoneCallIsActiveLock = 0 //as? os_unfair_lock()
var speakerLock = 0 //as? OSSpinLock
var micLock = 0 //as? OSSpinLock
var micFile: ExtAudioFileRef? = nil
var speakerFile: ExtAudioFileRef? = nil
var phoneCallIsActive = false
var = OSStatus()

func CTTelephonyCenterGetDefault() -> Any {
}

func CTTelephonyCenterAddObserver(ct: Any, observer: Void, callBack: CFNotificationCallback, name: CFString, object: Void, sb: CFNotificationSuspensionBehavior) {
}

func CTGetCurrentCallCount() -> Int {
}

func Convert() {
    //File URLs
    let micUrl: CFURL = CFURLCreateWithFileSystemPath(nil, (kMicFilePath as? CFString), .cfurlposixPathStyle, false)
    let speakerUrl: CFURL = CFURLCreateWithFileSystemPath(nil, (kSpeakerFilePath as? CFString), .cfurlposixPathStyle, false)
    let mixUrl: CFURL = CFURLCreateWithFileSystemPath(nil, (kResultFilePath as? CFString), .cfurlposixPathStyle, false)
    var micFile: ExtAudioFileRef? = nil
    var speakerFile: ExtAudioFileRef? = nil
    var mixFile: ExtAudioFileRef? = nil
    
    //Opening input files (speaker and mic)
    ExtAudioFileOpenURL(micUrl, &micFile)
    ExtAudioFileOpenURL(speakerUrl, &speakerFile)
    
    //Reading input file audio format (mono LPCM)
    var inputFormat: AudioStreamBasicDescription
    var outputFormat: AudioStreamBasicDescription
    //var descSize = UInt32(MemoryLayout<inputFormat>.size)
    ExtAudioFileGetProperty(micFile, kExtAudioFileProperty_FileDataFormat, descSize, inputFormat)
    let sampleSize = Int(inputFormat.mBytesPerFrame)
    //Filling input stream format for output file (stereo LPCM)
    FillOutASBDForLPCM(inputFormat, inputFormat.mSampleRate, 2, inputFormat.mBitsPerChannel, inputFormat.mBitsPerChannel, true, false, false)
    //Filling output file audio format (AAC)
    memset(outputFormat, 0, MemoryLayout<outputFormat>.size)
    outputFormat.mFormatID = kAudioFormatMPEG4AAC
    outputFormat.mSampleRate = 8000 as? Float64 ?? Float64()
    outputFormat.mFormatFlags = .aac_Main as? AudioFormatFlags ?? AudioFormatFlags()
    outputFormat.mChannelsPerFrame = 2
    //Opening output file
    ExtAudioFileCreateWithURL(mixUrl, kAudioFileM4AType, outputFormat, nil, .eraseFile, mixFile)
    ExtAudioFileSetProperty(mixFile, kExtAudioFileProperty_ClientDataFormat, MemoryLayout<inputFormat>.size, inputFormat)
    //Freeing URLs
    
    //Setting up audio buffers
    let bufferSizeInSamples: Int = 64 * 1024
    var micBuffer: AudioBufferList
    micBuffer.mNumberBuffers = 1
    micBuffer.mBuffers[0].mNumberChannels = 1
    micBuffer.mBuffers[0].mDataByteSize = UInt32((sampleSize * bufferSizeInSamples))
    micBuffer.mBuffers[0].mData = malloc(micBuffer.mBuffers[0].mDataByteSize)
    var speakerBuffer: AudioBufferList
    speakerBuffer.mNumberBuffers = 1
    speakerBuffer.mBuffers[0].mNumberChannels = 1
    speakerBuffer.mBuffers[0].mDataByteSize = UInt32((sampleSize * bufferSizeInSamples))
    speakerBuffer.mBuffers[0].mData = malloc(speakerBuffer.mBuffers[0].mDataByteSize)
    var mixBuffer: AudioBufferList
    mixBuffer.mNumberBuffers = 1
    mixBuffer.mBuffers[0].mNumberChannels = 2
    mixBuffer.mBuffers[0].mDataByteSize = UInt32((sampleSize * bufferSizeInSamples * 2))
    mixBuffer.mBuffers[0].mData = malloc(mixBuffer.mBuffers[0].mDataByteSize)

    //Converting
    
    while true {
        //Reading data from input files
        var framesToRead: UInt32 = bufferSizeInSamples
        ExtAudioFileRead(micFile, framesToRead, micBuffer)
        ExtAudioFileRead(speakerFile, framesToRead, speakerBuffer)
        if framesToRead == 0 {
            break
        }
        //Building interleaved stereo buffer - left channel is mic, right - speaker
        for i in 0..<framesToRead {
            memcpy(Int8(mixBuffer.mBuffers[0].mData) + i * sampleSize * 2, Int8(micBuffer.mBuffers[0].mData) + i * sampleSize, sampleSize)
            memcpy(Int8(mixBuffer.mBuffers[0].mData) + i * sampleSize * 2 + sampleSize, Int8(speakerBuffer.mBuffers[0].mData) + i * sampleSize, sampleSize)
        }
        //Writing to output file - LPCM will be converted to AAC
        ExtAudioFileWrite(mixFile, framesToRead, mixBuffer)
    }
    //Closing files
    ExtAudioFileDispose(micFile)
    ExtAudioFileDispose(speakerFile)
    ExtAudioFileDispose(mixFile)
    //Freeing audio buffers
    free(micBuffer.mBuffers[0].mData)
    free(speakerBuffer.mBuffers[0].mData)
    free(mixBuffer.mBuffers[0].mData)
}

var = OSStatus()

func Cleanup() {
    try? FileManager.default.removeItem(atPath: kMicFilePath)
    try? FileManager.default.removeItem(atPath: kSpeakerFilePath)
}

func CoreTelephonyNotificationCallback(center: CFNotificationCenterRef, observer: Void, name: CFString, object: Void, userInfo: CFDictionaryRef) {
    let data = userInfo as? [AnyHashable: Any]
    if ((name as? String) == (kCTCallStatusChangeNotification as? String)) {
        let currentCallStatus = Int((data[(kCTCallStatus as? String)]))
        if currentCallStatus == kCTCallStatusActive {
            OSSpinLockLock(phoneCallIsActiveLock)
            phoneCallIsActive = true
            OSSpinLockUnlock(phoneCallIsActiveLock)
        }
        else if currentCallStatus == kCTCallStatusHanged {
            if CTGetCurrentCallCount() > 0 {
                return
            }
            OSSpinLockLock(phoneCallIsActiveLock)
            phoneCallIsActive = false
            OSSpinLockUnlock(phoneCallIsActiveLock)
            //Closing mic file
            OSSpinLockLock(micLock)
            if micFile != nil {
                ExtAudioFileDispose(micFile)
            }
            micFile = nil
            OSSpinLockUnlock(micLock)
            //Closing speaker file
            OSSpinLockLock(speakerLock)
            if speakerFile != nil {
                ExtAudioFileDispose(speakerFile)
            }
            speakerFile = nil
            OSSpinLockUnlock(speakerLock)
            Convert()
            Cleanup()
        }
    }
}

OSStatus(AudioUnitProcess_orig)(AudioUnit, unit, AudioUnitRenderActionFlags, *, ioActionFlags, const, AudioTimeStamp, *, inTimeStamp, UInt32, inNumberFrames, AudioBufferList, *, ioData)
OSStatus
AudioUnitProcess_hook(AudioUnit, unit, AudioUnitRenderActionFlags, *, ioActionFlags, const, AudioTimeStamp, *, inTimeStamp, UInt32, inNumberFrames, AudioBufferList, *, ioData)
do {
    OSSpinLockLock(phoneCallIsActiveLock)
    if phoneCallIsActive == false {
        OSSpinLockUnlock(phoneCallIsActiveLock)
        return AudioUnitProcess_orig(unit, ioActionFlags, inTimeStamp, inNumberFrames, ioData)
    }
    OSSpinLockUnlock(phoneCallIsActiveLock)
    var currentFile: ExtAudioFileRef? = nil
    var currentLock: OSSpinLock? = nil
    var unitDescription = [0] as? AudioComponentDescription
    AudioComponentGetDescription(AudioComponentInstanceGetComponent(unit), unitDescription)
    //'agcc', 'mbdp' - iPhone 4S, iPhone 5
    //'agc2', 'vrq2' - iPhone 5C, iPhone 5S
    if unitDescription.componentSubType == cc | unitDescription.componentSubType == c2 {
        currentFile = micFile
        currentLock = micLock
    }
    else if unitDescription.componentSubType == dp | unitDescription.componentSubType == q2 {
        currentFile = speakerFile
        currentLock = speakerLock
    }
    
    if currentFile != nil {
        OSSpinLockLock(currentLock)
        //Opening file
        if currentFile == nil {
            //Obtaining input audio format
            var desc = AudioStreamBasicDescription()
            var descSize = UInt32(MemoryLayout<desc>.size)
            AudioUnitGetProperty(unit, kAudioUnitProperty_StreamFormat, kAudioUnitScope_Input, 0, desc, descSize)
            //Opening audio file
            var url: CFURLRef = CFURLCreateWithFileSystemPath(nil, CFStringRef((currentFile == micFile) ? kMicFilePath : kSpeakerFilePath), .cfurlposixPathStyle, false)
            var audioFile: ExtAudioFileRef? = nil
            var result: OSStatus = ExtAudioFileCreateWithURL(url, kAudioFileCAFType, desc, nil, .eraseFile, audioFile)
            if result != 0 {
                currentFile = nil
            }
            else {
                currentFile = audioFile
                //Writing audio format
                ExtAudioFileSetProperty(currentFile, kExtAudioFileProperty_ClientDataFormat, MemoryLayout<desc>.size, desc)
            }
        }
        else {
            //Writing audio buffer
            ExtAudioFileWrite(currentFile, inNumberFrames, ioData)
        }
        OSSpinLockUnlock(currentLock)
    }
    return AudioUnitProcess_orig(unit, ioActionFlags, inTimeStamp, inNumberFrames, ioData)
}
private var: void initialize?
do {
    CTTelephonyCenterAddObserver(CTTelephonyCenterGetDefault(), nil, CoreTelephonyNotificationCallback, nil, nil, .hold)
    MSHookFunction(AudioUnitProcess, AudioUnitProcess_hook, AudioUnitProcess_orig)
}
