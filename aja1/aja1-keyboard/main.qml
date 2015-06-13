import QtQuick 2.4
import QtQuick.Window 2.1
import QtQuick.Controls 1.2

import "global.js" as Global

ApplicationWindow {
    visible: true
    //visibility: Window.FullScreen

    id: mainWnd

    width: Screen.width * 2/3
    height: Screen.height * 2/3;
    x: (Screen.width - width)/2
    y: (Screen.height - height)/2

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
    }

    Component {
        id: keyButtonFactory
        KeyButton {

            Component.onCompleted: {
                commandPrompt.keyPressed.connect(keyPressed)
            }
        }
    }

    Component.onCompleted: {

//        var nW = 0.09
//        var nH = 0.075


//        var ry = 0.1
//        var rx = 0.01

//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx), relativeY: ry, relativeWidth:nW * 1.8, relativeHeight:nH, text: 'ESC', key: Qt.Key_Escape});
//        rx += nW * 0.5

//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F1', key: Qt.Key_F1});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F2', key: Qt.Key_F2});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F3', key: Qt.Key_F3});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F4', key: Qt.Key_F4});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F5', key: Qt.Key_F5});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F6', key: Qt.Key_F6});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F7', key: Qt.Key_F7});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F8', key: Qt.Key_F8});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F9', key: Qt.Key_F9});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F10', key: Qt.Key_F10});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F11', key: Qt.Key_F11});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 0.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F12', key: Qt.Key_F12});

//        ry += nH
//        rx = 0.1

//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '`', key: 96});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '1', key: Qt.Key_1});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '2', key: Qt.Key_2});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '3', key: Qt.Key_3});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '4', key: Qt.Key_4});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '5', key: Qt.Key_5});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '6', key: Qt.Key_6});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '7', key: Qt.Key_7});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '8', key: Qt.Key_8});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '9', key: Qt.Key_9});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '0', key: Qt.Key_0});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '-', key: Qt.Key_Minus});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '=', key: Qt.Key_Equal});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'BCK', key: Qt.Key_Backspace});


//        ry += nH
//        rx = 0.1

//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'TAB', key: Qt.Key_Tab});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'Q', key: Qt.Key_Q});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'W', key: Qt.Key_W});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'E', key: Qt.Key_E});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'R', key: Qt.Key_R});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'T', key: Qt.Key_T});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'Y', key: Qt.Key_Y});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'U', key: Qt.Key_U});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'I', key: Qt.Key_I});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'O', key: Qt.Key_O});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'P', key: Qt.Key_P});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '[', key: 91});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: ']', key: 93});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '\\', key: Qt.Key_Backslash});

//        ry += nH
//        rx = 0.1

//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'CAPS', key: Qt.Key_CapsLock});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'A', key: Qt.Key_A});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'S', key: Qt.Key_S});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'D', key: Qt.Key_D});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'F', key: Qt.Key_F});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'G', key: Qt.Key_G});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'H', key: Qt.Key_H});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'J', key: Qt.Key_J});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'K', key: Qt.Key_K});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'L', key: Qt.Key_L});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: ';', key: Qt.Key_Semicolon});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: "'", key: Qt.Key_Apostrophe});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: "ENTER", key: [Qt.Key_Return, Qt.Key_Enter]});

//        ry += nH
//        rx = 0.1

//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'SHIFT', key: Qt.Key_Shift});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'Z', key: Qt.Key_Z});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'X', key: Qt.Key_X});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'C', key: Qt.Key_C});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'V', key: Qt.Key_V});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'B', key: Qt.Key_B});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'N', key: Qt.Key_N});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'M', key: Qt.Key_M});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: ',', key: Qt.Key_Comma});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '.', key: Qt.Key_Period});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: '/', key: Qt.Key_Slash});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'SHIFT', key: Qt.Key_Shift});


//        ry += nH
//        rx = 0.1

//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'CTR', key: Qt.Key_Control});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'WIN', key: 16777250});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'ALT', key: Qt.Key_Alt});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'SPACE', key: Qt.Key_Space});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'ALT', key: 16781694});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'WIN', key: 16777301});
//        keyButtonFactory.createObject(mainWnd, { relativeX: (rx += nW * 1.5), relativeY: ry, relativeWidth:nW, relativeHeight:nH, text: 'CTR', key: Qt.Key_Control});

    }
}
