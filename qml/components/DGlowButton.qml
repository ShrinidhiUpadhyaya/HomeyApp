import QtQuick 2.12
import QtGraphicalEffects 1.0

import AppThemes 1.0


Item {
    id: root

    property bool buttonEnabled: false
    property string text: ""
    property string enabledSource: ""
    property string disabledSource: ""

    signal clicked();

    RectangularGlow {
        id: effect
        anchors.fill: rect
        glowRadius: 10
        spread: 0.5
        color: "#003173"
        cornerRadius: rect.radius + glowRadius
        visible: root.buttonEnabled
    }

    Rectangle {
        id: rect
        color: "#0C1C62"
        anchors.fill: parent
        radius: parent.height * 0.05
    }

    Image {
        width: AppThemes.setSize(48)
        height: width
        anchors.centerIn: parent
        source: root.buttonEnabled ? root.enabledSource : root.disabledSource
    }

    DText {
        text: root.text
        font.pixelSize: AppThemes.setSize(16)
        anchors.bottom: parent.bottom
        anchors.bottomMargin: parent.height * 0.05
        anchors.horizontalCenter: parent.horizontalCenter
        color: root.buttonEnabled ? "white" : "#01428B"
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked();
        }
    }
}
