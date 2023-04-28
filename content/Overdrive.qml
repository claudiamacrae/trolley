import QtQuick
import QtQuick.Controls

Image {
    id:overdrive
    width: 300
    height: 500
    source: "images/drive.png"
    property real gain
    property real output
    property real tone

    MouseArea {
        anchors.fill: parent
        onClicked: root.openDriveConfig()
    }
    MouseArea {
        id: mouseArea
        x: 18
        y: 317
        width: 264
        height: 169
        onClicked: root.shadeDrive()
    }
}
