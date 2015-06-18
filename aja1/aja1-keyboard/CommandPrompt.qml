import QtQuick 2.0

Item {

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

        TextInput {

            anchors.fill:  parent;
            anchors.leftMargin: bgRect.border.width * 1.5
            anchors.rightMargin: bgRect.border.width * 1.5

            focus: true
            clip: true

            font.bold: true;
            font.pixelSize: height * 0.55
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
                        event.accepted = true;
                }
            }

            onTextChanged: {
                if(text.length > 512) text = text.substring(400)
                if(text.indexOf("exit") != -1) Qt.quit()
            }

        }
    }
}


