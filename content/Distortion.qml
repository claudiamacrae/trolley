import QtQuick
import QtQuick.Controls

Image {
    id:distortion
    width: 300
    height: 500
    source: "images/dist.png"
    property real gain
    property real output

    MouseArea {
        anchors.fill: parent
        onClicked: root.openDistConfig()
    }
    MouseArea {
        id: mouseArea
        x: 18
        y: 317
        width: 264
        height: 169
        onClicked: root.shadeDist()
    }
}
