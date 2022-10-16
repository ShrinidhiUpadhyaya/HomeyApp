import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Window 2.12
import "qml"

Window {
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

//    RoomScreen {
//        id: roomScrn

//        width: parent.width
//        height: parent.height
//    }

    HomeScreen {
        id: homeScrn

        width: parent.width
        height: parent.height

        onHeightChanged:  {
            console.log("The Height of the screen changed:-",height,Screen.desktopAvailableHeight)
        }
    }
}
