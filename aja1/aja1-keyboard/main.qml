import QtQuick 2.4
import QtMultimedia 5.0

import "global.js" as Global

Item {
    id: mainWnd

    anchors.fill: parent

    Repeater {
        model: 250

        Rectangle {

            readonly property var rnd:              Global.generateRandomArray(8)

            readonly property real  preferredWidth: rnd[0] * parent.width / 10 + parent.width / 30
            readonly property real  preferredHeight:rnd[1] * parent.height / 10 + parent.height / 30

            x:                                      rnd[2] * parent.width - width / 2
            y:                                      rnd[3] * parent.height - height / 2

            width:                                  Math.min(preferredWidth, preferredHeight)
            height:                                 width

            color:                                  Qt.rgba(rnd[4] * 0.1, rnd[5] * 0.1, rnd[6] * 0.1, rnd[7] * 0.1)
        }
    }

    CommandPrompt {
        id: commandPrompt
        anchors.fill: parent
        anchors.topMargin: parent.height / 80
    }

    Component {
        id: keyButtonFactory
        KeyButton {

            Component.onCompleted: {
                commandPrompt.keyPressed.connect(keyPressed)
            }
        }
    }

    Item {
        id: keyBoard;
        Rectangle {
            id: background
            anchors.fill: parent;

            border.color: "#123574"
            border.width: Math.max(2, parent.width / 150)
            radius: border.width
            opacity: 0.7
        }

        x: parent.width / 100
        //y: parent.height /15 + (parent.height - parent.height / 15 - parent.height * 2/3) / 2
        y: parent.height / 13 + parent.height / 70
        width:parent.width - parent.width / 50
        height:parent.height * 0.6

    }


    Picture {
        id: p1
        source: "qrc:/svg/black-48472.svg"
        Component.onCompleted: commandPrompt.keyPressed.connect(keyPressed)


        SoundEffect {
            id: dogSound1
            source: "qrc:/sounds/dog-1.wav"
        }
        SoundEffect {
            id: dogSound2
            source: "qrc:/sounds/dog-2.wav"
        }
        SoundEffect {
            id: dogSound3
            source: "qrc:/sounds/dog-3.wav"
        }


        sound: [dogSound1, dogSound2, dogSound3]
    }

    Picture {
        id: p2
        x: p1.x + p1.width
        source: "qrc:/svg/cow-44697.svg"
        Component.onCompleted: commandPrompt.keyPressed.connect(keyPressed)

        SoundEffect {
            id: cowSound1
            source: "qrc:/sounds/cow-1.wav"
        }
        SoundEffect {
            id: cowSound3
            source: "qrc:/sounds/cow-2.wav"
        }
        SoundEffect {
            id: cowSound4
            source: "qrc:/sounds/cow-3.wav"
        }


        sound: [cowSound1, cowSound3, cowSound4]
    }

    Picture {
        id: p3
        x: p2.x + p1.width
        source: "qrc:/svg/cat-26648.svg"
        Component.onCompleted: commandPrompt.keyPressed.connect(keyPressed)

        SoundEffect {
            id: catSound2
            source: "qrc:/sounds/cat-2.wav"
        }
        SoundEffect {
            id: catSound3
            source: "qrc:/sounds/cat-3.wav"
        }


        sound: [catSound2, catSound3]
    }

    Picture {
        id: p4
        x: p3.x + p1.width
        source: "qrc:/svg/rooster-161546.svg"
        Component.onCompleted: commandPrompt.keyPressed.connect(keyPressed)

        SoundEffect {
            id: roosterSound1
            source: "qrc:/sounds/rooster-1.wav"
        }
        SoundEffect {
            id: roosterSound2
            source: "qrc:/sounds/rooster-2.wav"
        }
        SoundEffect {
            id: roosterSound3
            source: "qrc:/sounds/rooster-3.wav"
        }


        sound: [roosterSound1, roosterSound2, roosterSound3]
    }

    Picture {
        id: p5
        x: p4.x + p1.width
        source: "qrc:/svg/horse-48394.svg"
        Component.onCompleted: commandPrompt.keyPressed.connect(keyPressed)

        SoundEffect {
            id:  horseSound1
            source: "qrc:/sounds/horse-1.wav"
        }
        SoundEffect {
            id: horseSound2
            source: "qrc:/sounds/horse-2.wav"
        }
        SoundEffect {
            id: horseSound3
            source: "qrc:/sounds/horse-3.wav"
        }


        sound: [horseSound1, horseSound2, horseSound3]
    }

    Component.onCompleted: {


        var keyWidth = 0.055
        var keyHeight = 0.12
        var spacer = 0.01

        var ry = 0.1
        var rx = 0.01

        function placeKey(title, keyCode, w) {
            if (typeof(w)==='undefined') w = 1.0;
            var h = 1.0;

            keyButtonFactory.createObject(keyBoard, { relativeX: rx, relativeY: ry, relativeWidth: keyWidth * w, relativeHeight: keyHeight * h, text: title, key: keyCode});
            rx = rx + keyWidth * w + spacer;
        }

        function nl() {
            rx = 0;
            ry += keyHeight + spacer * 2
        }


        rx = (1 - (12 * keyWidth * 1.0 + keyWidth * 1.2) - 12 * spacer) / 2
        ry = (1 - 6 * keyHeight - 5 * spacer * 2) / 2

        placeKey('ESC', Qt.Key_Escape,  1.2);
        placeKey('F1', Qt.Key_F1);
        placeKey('F2', Qt.Key_F2);
        placeKey('F3', Qt.Key_F3);
        placeKey('F4', Qt.Key_F4);
        placeKey('F5', Qt.Key_F5);
        placeKey('F6', Qt.Key_F6);
        placeKey('F7', Qt.Key_F7);
        placeKey('F8', Qt.Key_F8);
        placeKey('F9', Qt.Key_F9);
        placeKey('F10', Qt.Key_F10);
        placeKey('F11', Qt.Key_F11);
        placeKey('F12', Qt.Key_F12,     1,  0);

        nl();
        rx = (1 - (13 * keyWidth * 1.0 + keyWidth * 1.5) - 13 * spacer) / 2

        placeKey('`', 96);
        placeKey('1', Qt.Key_1);
        placeKey('2', Qt.Key_2);
        placeKey('3', Qt.Key_3);
        placeKey('4', Qt.Key_4);
        placeKey('5', Qt.Key_5);
        placeKey('6', Qt.Key_6);
        placeKey('7', Qt.Key_7);
        placeKey('8', Qt.Key_8);
        placeKey('9', Qt.Key_9);
        placeKey('0', Qt.Key_0);
        placeKey('-', Qt.Key_Minus);
        placeKey('=', Qt.Key_Equal);
        placeKey('BCK', Qt.Key_Backspace, 1.5);

        nl();
        rx = (1 - (13 * keyWidth * 1.0 + keyWidth * 1.5) - 13 * spacer) / 2

        placeKey('TAB', Qt.Key_Tab, 1.5);
        placeKey('Q', Qt.Key_Q);
        placeKey('W', Qt.Key_W);
        placeKey('E', Qt.Key_E);
        placeKey('R', Qt.Key_R);
        placeKey('T', Qt.Key_T);
        placeKey('Y', Qt.Key_Y);
        placeKey('U', Qt.Key_U);
        placeKey('I', Qt.Key_I);
        placeKey('O', Qt.Key_O);
        placeKey('P', Qt.Key_P);
        placeKey('[', 91);
        placeKey(']', 93);
        placeKey('\\', Qt.Key_Backslash);

        nl();
        rx = (1 - (11 * keyWidth * 1.0 + 2 * keyWidth * 1.5) - 12 * spacer) / 2

        placeKey('CAPS', Qt.Key_CapsLock, 1.5);
        placeKey('A', Qt.Key_A);
        placeKey('S', Qt.Key_S);
        placeKey('D', Qt.Key_D);
        placeKey('F', Qt.Key_F);
        placeKey('G', Qt.Key_G);
        placeKey('H', Qt.Key_H);
        placeKey('J', Qt.Key_J);
        placeKey('K', Qt.Key_K);
        placeKey('L', Qt.Key_L);
        placeKey(';', Qt.Key_Semicolon);
        placeKey("'", Qt.Key_Apostrophe);
        placeKey("ENTER", [Qt.Key_Return, Qt.Key_Enter], 1.5);

        nl();
        rx = (1 - (10 * keyWidth * 1.0 + 2 * keyWidth * 1.9) - 11 * spacer) / 2
        placeKey('SHIFT', Qt.Key_Shift, 1.9,                0);
        placeKey('Z', Qt.Key_Z);
        placeKey('X', Qt.Key_X);

        placeKey('C', Qt.Key_C);
        placeKey('V', Qt.Key_V);
        placeKey('B', Qt.Key_B);
        placeKey('N', Qt.Key_N);
        placeKey('M', Qt.Key_M);
        placeKey(',', Qt.Key_Comma);

        placeKey('.', Qt.Key_Period);
        placeKey('/', Qt.Key_Slash);
        placeKey('SHIFT', Qt.Key_Shift, 1.9);


        nl();
        rx = (1 - (1 * keyWidth * 5 + 6 * keyWidth * 1.5) - 6 * spacer) / 2
        placeKey('CTR', Qt.Key_Control, 1.5);
        placeKey('WIN', 16777250, 1.5);
        placeKey('ALT', Qt.Key_Alt, 1.5);
        placeKey('SPACE', Qt.Key_Space, 5);
        placeKey('ALT', 16781694, 1.5);
        placeKey('WIN', 16777301, 1.5);
        placeKey('CTR', Qt.Key_Control, 1.5);
    }
}
