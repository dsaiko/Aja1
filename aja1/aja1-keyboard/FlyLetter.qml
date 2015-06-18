import QtQuick 2.4
import QtQuick.Window 2.2
import QtMultimedia 5.0

import "global.js" as Global

Text {
     id: letter
     readonly property int screenHeight: Screen.height

     Component.onCompleted: {
         animation.start()
     }

     ParallelAnimation {
         id: animation
         loops: 1

         PropertyAnimation {
             target: letter
             property: "y"
             to: screenHeight
             duration: Math.floor(Math.random()*5000)+2500
         }

         onStarted: {
             letter.z = 1
         }

         onStopped: {
             letter.destroy()
         }
     }
}
