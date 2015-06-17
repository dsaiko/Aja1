import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtMultimedia 5.0

import "global.js" as Global

Item {   
    property real relativeX
    property real relativeY
    property real relativeWidth
    property real relativeHeight

    property var text
    property var key

    signal       keyPressed(var event)

    x:                                      Math.floor(parent.width * relativeX)
    y:                                      Math.floor(parent.height * relativeY)
    id:                                     button

    width:                                  Math.min(parent.width * relativeWidth)
    height:                                 Math.min(parent.height * relativeHeight)
    opacity:                                0.8

    LinearGradient {
            anchors.fill: parent
            anchors.margins: Math.min(10, Math.max(2, parent.width / 10)) / 2
            start: Qt.point(0, 0)
            end: Qt.point(width, height)

            gradient: Gradient {
                GradientStop { position: 0.0; color: "#cccccc" }
                GradientStop { position: 0.2; color: "#666666" }
                GradientStop { position: 1; color: "black" }
            }
    }

    Rectangle {
        anchors.fill: parent
        radius: height / 10
        border.color: "gray"
        border.width: Math.min(10, Math.max(2, parent.height / 10))
        color: "transparent"
    }

    Text {
        id: label

        text:  parent.text
        font.pointSize: Math.max(Math.min(parent.height * 0.3, parent.width * 0.3), 2)
        font.bold: true
        anchors.verticalCenter: parent.verticalCenter
        anchors.horizontalCenter: parent.horizontalCenter
        color: "#ffffff"
    }


    ParallelAnimation {
        id: animation
        loops: 1

        SequentialAnimation {
            PropertyAnimation {
                target: button
                property: "scale"
                to: 1.5;
                duration: 200; easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: button
                property: "scale"
                to: 1;
                duration: 200; easing.type: Easing.InOutQuad
            }
        }

        SequentialAnimation {
            PropertyAnimation {
                target: button
                property: "opacity"
                to: 1;
                duration: 200; easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: button
                property: "opacity"
                to: 0.7;
                duration: 200; easing.type: Easing.InOutQuad
            }
        }

        SequentialAnimation {

            PropertyAnimation {
                target: label
                property: "color"
                to: "red";
                duration: 200; easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: label
                property: "color"
                to: "white";
                duration: 200; easing.type: Easing.InOutQuad
            }
        }

        onStarted: {
            button.z = 1
        }

        onStopped: {
            button.z = 0
        }

    }

    SoundEffect {
        id: playSound
        source: "qrc:/hit/"+Math.floor(Math.random()*13)+".wav"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            animation.start()
            playSound.play()
        }
    }

    onKeyPressed: {
        if(key.constructor === Array) {
            for(var i=0; i< key.length; i++) {
                if (event.key === key[i]) {
                    animation.start()
                    playSound.play()
                    break
                }
            }
        } else
        if (event.key === key) {
            animation.start()
            playSound.play()
        }
    }
}

