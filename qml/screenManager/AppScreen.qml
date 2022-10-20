import QtQuick 2.12

import AppThemes 1.0

Item {
    id: root

    property alias backgroundColor: background.color
    property real screenIndex: -1
    property bool isOverlay: false

//    visible: isOverlay ? true : currentScreenIndex === screenIndex
    focus: true

    Rectangle {
        id: background

        anchors.fill: parent
        color: AppThemes.screenColor
    }

    Keys.onPressed: {
        if (isOverlay && event.key === Qt.Key_Back) {
            if(stackView.depth > 1) {
                stackView.pop();
            } else {
                stackView.clear();
            }
            event.accepted = true;
        }
    }

    Component.onCompleted: {
        root.forceActiveFocus()
    }
}
