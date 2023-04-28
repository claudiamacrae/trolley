import QtQuick

Item {
    property real value: 0
    Image{
        id: k
        source: "images/sKnob.png"
        transform: Rotation {origin.x: k.width/2; origin.y: k.height/2; angle: value}
    }
}
