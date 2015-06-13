import QtQuick 2.0

Item {

    signal keyPressed(var event)

    Rectangle {
        x: 0
        y: 0
        width: parent.width
        height: parent.height / 15

        color: "black"
        opacity: 0.5

    }

    Item {
        width: parent.width
        height: parent.height / 15
        x: 0
        y: 0

        TextInput {
            anchors.fill: parent
            focus: true

            font.bold: true;
            font.pixelSize: height * 0.6
            verticalAlignment: TextInput.AlignVCenter
            color: "#ffff00"

            Keys.onPressed: {
                keyPressed(event);
                switch(event.key) {
                case Qt.Key_Backspace:
                case Qt.Key_Tab:
                case Qt.Key_Home:
                case Qt.Key_End:
                case Qt.Key_Left:
                case Qt.Key_Right:
                        event.accepted = true;
                }

                console.log(event.key)
            }

            onTextChanged: {
                if(text.length > 512) text = text.substring(400)
                if(text.indexOf("exitexit") != -1) Qt.quit()
            }

        }
    }

}


