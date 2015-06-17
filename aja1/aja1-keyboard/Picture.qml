import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtMultimedia 5.0

import "global.js" as Global


Item {

    Rectangle {
        anchors.fill: parent;
        anchors.margins: parent.parent.width / 100

        border.color: "#123574"
        border.width: background.border.width
        radius: background.radius
        opacity: 0.7
    }

    y: parent.height - height
    width:parent.width / 5
    height: parent.height / 3.3

}

