import QtQuick
import QtQuick.Controls 2.0
import "."

Window {
    id: editDist
    property real gain: root.boostGain
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
        x: 90
        y: -152
        width: 306
        height: 923
        source: "images/dist.png"
        fillMode: Image.PreserveAspectFit

        BigKnob {
            id: gKnob
            x: 45
            y: 250
            value: ((gSlider.x/gSliderContainer.width) * 280) - 130
        }

        BigKnob {
            id: oKnob
            x: 172
            y: gKnob.y
            value: ((oSlider.x/oSliderContainer.width) * 280) - 130
        }
    }
    Rectangle {
        id: gSliderContainer
        y: 174
        anchors { bottom: parent.bottom; left: parent.left
            right: parent.right; leftMargin: 514; rightMargin: 84
            bottomMargin: 394
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
        y: 326
        anchors { bottom: parent.bottom; left: parent.left
            right: parent.right; leftMargin: 514; rightMargin: 84
            bottomMargin: 242
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
        x: gSliderContainer.x
        y: gSliderContainer.y - 50
        width: 102
        height: 52
        text: qsTr("Gain")
        font.pixelSize: 30
        color: "#dadada"
        font.letterSpacing: 1
    }

    Button {
        id: quit
        x: 816
        y: 440
        width: 124
        height: 60
        text: qsTr("Done")
        font.pointSize: 20
        onClicked: {
            root.distGain = gKnob.value
            root.distOutput = oKnob.value
            editDist.close();
        }
    }

    Text {
        id: barLabel1
        x: oSliderContainer.x
        y: oSliderContainer.y - 50
        width: 102
        height: 52
        text: qsTr("Output Level")
        font.pixelSize: 30
        color: "#dadada"
        font.letterSpacing: 1
    }
}
