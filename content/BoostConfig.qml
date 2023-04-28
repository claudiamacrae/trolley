import QtQuick
import QtQuick.Controls 2.0
import "."

Window {
    id: editBoost
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
        x: 91
        y: -154
        width: 306
        height: 923
        source: "images/boost.png"
        fillMode: Image.PreserveAspectFit

        Knob1 {
            id: knob
            value: ((slider.x/sliderContainer.width) * 280) - 140
            x: 79
            y: 213
        }

    }

    Rectangle {
        id: sliderContainer
        y: 292
        anchors { bottom: parent.bottom; left: parent.left
            right: parent.right; leftMargin: 514; rightMargin: 84
            bottomMargin: 276
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
            id: slider
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
                drag.minimumX: 2; drag.maximumX: sliderContainer.width - 32
            }
        }
    }

    Text {
        id: barLabel
        x: 514
        y: 200
        width: 102
        height: 52
        text: qsTr("Gain")
        font.pixelSize: 30
        color: "#dadada"
        font.letterSpacing: 1
    }

    Button {
        id: button
        x: 816
        y: 440
        width: 124
        height: 60
        text: qsTr("Done")
        font.pointSize: 20
        onClicked: {
            root.boostGain = knob.value
            editBoost.close();
        }
    }

}
