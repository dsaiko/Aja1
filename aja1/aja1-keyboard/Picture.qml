import QtQuick 2.4
import QtGraphicalEffects 1.0
import QtMultimedia 5.0

import "global.js" as Global


Item {
    property alias source: image.source
    property var sound: []


    signal       keyPressed(var event)
    id: button

    Rectangle {
        anchors.fill: parent;
        anchors.margins: parent.parent.width / 100

        border.color: "#123574"
        border.width: background.border.width
        radius: background.radius
        opacity: 0.7
    }

    Image {
        id: image
        anchors.fill: parent
        anchors.margins: parent.width / 6
    }

    y: parent.height - height
    width:parent.width / 5
    height: parent.height / 3.3


    ParallelAnimation {
        id: animation
        loops: 1

        SequentialAnimation {
            PropertyAnimation {
                target: button
                property: "scale"
                to: 1.2;
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
                property: "rotation"
                to: 30
                duration: 150; easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: button
                property: "rotation"
                to: -30
                duration: 300; easing.type: Easing.InOutQuad
            }
            PropertyAnimation {
                target: button
                property: "rotation"
                to: 0;
                duration: 150; easing.type: Easing.InOutQuad
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


    function startAnimation() {
        if(sound.length > 0) {
            var effect = sound[Math.floor(Math.random()*sound.length)];
            if(effect.playing) {
                for(var i=0; i< sound.length; i++) {
                    if(!effect.playing) {
                        effect.play();
                        break;
                    }
                }
            } else {
                effect.play()
            }
        }

        animation.start()
    }

    MouseArea {
        anchors.fill: parent
        onClicked: startAnimation();
    }


    Component {
        id: timerFactory
        Timer {
           repeat: false
        }
    }


    onKeyPressed: {
        var rnd = Math.floor(Math.random() * 50)

        if(rnd == 1) {
            var timer = timerFactory.createObject(button, {
                  interval: Math.random() * 1500
            });

            timer.triggered.connect(function () {
                if(!animation.running)
                    startAnimation();
            })

            timer.start();
        }
    }
}

