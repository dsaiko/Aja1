import QtQuick 2.4
import "global.js" as Global

Item {

    id: root

    signal keyPressed(var event)

    Item {
        x: parent.width / 100
        width: parent.width - parent.width / 50
        height: parent.height / 15

        Rectangle {
            id: bgRect

            anchors.fill:  parent;

            radius: border.width
            border.color: "#123574"
            color: "#eeeeee";
            border.width: Math.max(2, parent.width / 150)
            opacity: 0.7
        }

        Component {
            id: textCursor
            Item {
                visible: false;
            }
        }

        Component {
            id: flyLetter
            FlyLetter {

                font: textInput.font
                color: textInput.color
            }
        }

        TextInput {
            focus: true

            id: textInput
            anchors.fill:  parent;
            anchors.leftMargin: bgRect.border.width * 1.5
            anchors.rightMargin: bgRect.border.width * 1.5

            text: Global.generateUUID(new Array(400).join("?"))

            clip: false
            echoMode: TextInput.NoEcho
            cursorDelegate: textCursor

            font.bold: true;
            font.pixelSize: height * 0.55
            font.family: "Monospace"

            verticalAlignment: TextInput.AlignVCenter
            color: "#366e43"

            Keys.onPressed: {
                keyPressed(event);

                switch(event.key) {
                case Qt.Key_Backspace:
                case Qt.Key_Tab:
                case Qt.Key_Home:
                case Qt.Key_End:
                case Qt.Key_Left:
                case Qt.Key_Right:
                case Qt.Key_CapsLock:
                case Qt.Key_Space:
                case 16777250: event.accepted = true;
                }
            }


            Component.onCompleted: onTextChanged()

            TextMetrics {
                id: textMetrics
                font: textInput.font
                text: "w"
            }


            Text {
                id: displayText
                text: "$ "

                anchors.fill:  parent;
                clip: true;
                font: textInput.font
                verticalAlignment: TextInput.AlignVCenter
                color: parent.color

            }

            onTextChanged: {
                var t = "$ " + text.split("").reverse().join("");
                displayText.text =  t;

                if(text.length > 512) text = text.substring(400)
                if(text.indexOf("exit") != -1) Qt.quit()
            }


            Timer {
                interval: 50
                repeat: true
                running: true

                onTriggered: {
                    var t = displayText.text;

                    var maxIndex = displayText.width / textMetrics.width
                    var i = Math.floor(Math.random() * Math.min(maxIndex, t.length))
                    flyLetter.createObject(textInput, {
                                               text: t.charAt(i),
                                               x: i * textMetrics.width,
                                               y: textMetrics.height
                    });

                }
            }

        }
    }
}
