import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Window 2.12
import QtQuick.Controls 2.5

import "qml/screenManager"

Window {
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Hello World")


    DModels {
        id: dmodel
    }

    StackView {
        anchors.fill: parent
        initialItem: "qrc:/qml/screenManager/HomeScreen.qml"
    }
}
