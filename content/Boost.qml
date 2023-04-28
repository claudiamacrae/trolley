import QtQuick
import QtQuick.Controls

Item {
    id:boost
    width:300
    height: 500
    gain: 140 // 0-280
    Image{
        anchors.fill: parent
        source: "images/boost.png"
    }
    property real gain

    MouseArea {
        anchors.fill: parent
        onClicked: root.openBoostConfig()
    }
    MouseArea {
        id: mouseArea
        x: 18
        y: 317
        width: 264
        height: 169
        onClicked: root.shadeBoost()
    }
}
