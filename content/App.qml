// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick 6.2

Rectangle {
    //holders for digital pot values
    property real boostGain: 0
    property real distGain: 0
    property real distOutput: 0
    property real driveGain: 0
    property real driveOutput: 0
    property real driveTone: 0

    function openBoostConfig(){
        console.log("opening config window");
        config1.visible = true
    }
    function openDistConfig(){
        console.log("opening config window");
        config2.visible = true
    }
    function openDriveConfig(){
        console.log("opening config window");
        config3.visible = true
    }
    function shadeDist(){
        if(shade1.visible === true)
            shade1.visible = false
        else
            shade1.visible = true
    }
    function shadeDrive(){
        if(shade2.visible === true)
            shade2.visible = false
        else
            shade2.visible = true
    }
    function shadeBoost(){
        if(shade3.visible === true)
            shade3.visible = false
        else
            shade3.visible = true
    }
    id:root
    height: 600
    width: 1024
    visible: true
    color: "black"

    Image {
        id: blacktexture
        x: 0
        y: 0
        width:1024
        source: "images/black-texture.jpg"
        fillMode: Image.PreserveAspectFit
    }

    Row {
        spacing: 20
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        Distortion {
            BigKnob {
                x: 43
                y: 39
                value: distGain
            }
            BigKnob {
                x: 163
                y: 39
                value: distOutput
            }
        }

        Overdrive { gain: driveGain; output: driveOutput; tone: driveTone
            BigKnob {
                x: 41
                y: 19
                value: driveGain
            }
            BigKnob {
                x: 161
                y: 19
                value: driveOutput
            }
            SmallKnob {
                x: 125
                y: 104
                value: driveTone
            }
        }
        Boost {
            id:boostPedal
            gain:boostGain
            Knob1 {
                x: 76
                y: 8
                value: boostGain
            }
        }
    }

    BoostConfig{
        id: config1
        visible: false
    }
    DistConfig{
        id: config2
        visible: false
    }
    DriveConfig{
        id: config3
        visible: false
    }

    Rectangle {
        id: shade2
        x: 373
        y: 50
        width: 278
        height: 500
        color: "#191014"
        radius: 23
        opacity: 0.8
        visible: false
    }

    Rectangle {
        id: shade3
        x: 693
        y: 50
        width: 278
        height: 500
        color: "#191014"
        radius: 23
        opacity: 0.8
        visible: false
    }
    Rectangle {
        id: shade1
        x: 53
        y: 50
        width: 278
        height: 500
        color: "#191014"
        radius: 23
        opacity: 0.8
        visible: false
    }
}

