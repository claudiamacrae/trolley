import QtQuick
import QtQuick.Controls 2.0
import "."

Window {
    id: editDrive

    width: 1024
    height: 600

    Image {
        id: blacktexture
        x: 0
        y: 0
        width:1024
        source: "images/black-texture.jpg"
        fillMode: Image.PreserveAspectFit
    }
    Image {
        id: pedalMock
        x: 91
        y: -154
        width: 306
        height: 923
        source: "images/drive.png"
        fillMode: Image.PreserveAspectFit

        BigKnob {
            id: gKnob
            x: 27
            y: 240
            value: ((gSlider.x/gSliderContainer.width) * 280) - 130

        }

        BigKnob {
            id: oKnob
            x: 176
            y: 240
            value: ((oSlider.x/oSliderContainer.width) * 280) - 130

        }

        SmallKnob {
            id: tKnob
            x: 128
            y: 320
            value: ((tSlider.x/tSliderContainer.width) * 280) - 130

        }


    }
    Rectangle {
        id: gSliderContainer
        y: 288
        anchors { bottom: parent.bottom; left: parent.left
            right: parent.right; leftMargin: 514; rightMargin: 84
            bottomMargin: 280
        }
        height: 32

        radius: 8
        opacity: 0.7
        antialiasing: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }

        Rectangle {
            id: gSlider
            x: 0; y: 0; width: 35; height: 31
            radius: 6
            antialiasing: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent; drag.axis: Drag.XAxis
                drag.minimumX: 2; drag.maximumX: gSliderContainer.width - 32
            }
        }
    }


    Rectangle {
        id: oSliderContainer
        y: 138
        anchors { bottom: parent.bottom; left: parent.left
            right: parent.right; leftMargin: 514; rightMargin: 84
            bottomMargin: 430
        }
        height: 32

        radius: 8
        opacity: 0.7
        antialiasing: true
        gradient: Gradient {
            GradientStop { position: 0.0; color: "gray" }
            GradientStop { position: 1.0; color: "white" }
        }

        Rectangle {
            id: oSlider
            x: 0; y: 0; width: 35; height: 31
            radius: 6
            antialiasing: true
            gradient: Gradient {
                GradientStop { position: 0.0; color: "#424242" }
                GradientStop { position: 1.0; color: "black" }
            }

            MouseArea {
                anchors.fill: parent
                anchors.margins: -16 // Increase mouse area a lot outside the slider
                drag.target: parent; drag.axis: Drag.XAxis
                drag.minimumX: 2; drag.maximumX: oSliderContainer.width - 32
            }
        }
    }

    Text {
        id: barLabel
        x: 514
        y: 80
        width: 102
        height: 52
        color: "#dadada"
        text: qsTr("Gain")
        font.letterSpacing: 1
        font.pixelSize: 30
        font.family: "Arial"
    }

    Button {
        id: button
        x: 816
        y: 504
        width: 124
        height: 60
        text: qsTr("Done")
        font.pointSize: 20
        onClicked: {
            root.driveGain = gKnob.value
            root.driveOutput = oKnob.value
            root.driveTone = tKnob.value
            editDrive.close();
        }
    }

    Text {
        id: barLabel1
        x: 514
        y: 230
        width: 235
        height: 52
        color: "#dadada"
        font.letterSpacing: 1
        text: qsTr("Output Level")
        font.pixelSize: 30
    }

    Text {
        id: barLabel2
        x: 514
        y: 382
        width: 187
        height: 52
        color: "#dadada"
        text: qsTr("Tone Control")
        font.letterSpacing: 1
        font.pixelSize: 30
    }

    Rectangle {
        id: tSliderContainer
        x: -6
        y: 433
        height: 32
        opacity: 0.7
        radius: 8
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 514
        anchors.bottomMargin: 135
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#808080"
            }

            GradientStop {
                position: 1
                color: "#ffffff"
            }
        }
        Rectangle {
            id: tSlider
            x: 0
            y: 0
            width: 35
            height: 31
            radius: 6
            gradient: Gradient {
                GradientStop {
                    position: 0
                    color: "#424242"
                }

                GradientStop {
                    position: 1
                    color: "#000000"
                }
            }
            MouseArea {
                anchors.fill: parent
                anchors.margins: -16
                drag.minimumX: 2
                drag.maximumX: tSliderContainer.width - 32
                drag.target: parent
                drag.axis: Drag.XAxis
            }
            antialiasing: true
        }
        antialiasing: true
        anchors.rightMargin: 84
    }
}
