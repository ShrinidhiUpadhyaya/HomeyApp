import QtQuick 2.12
import QtGraphicalEffects 1.0

Item {
    id: root

    property alias text: text.text

    property bool buttonEnabled: false

    property string enabledSource: ""
    property string disabledSource: ""

    signal clicked();

    RectangularGlow {
        id: effect
        anchors.fill: rect
        glowRadius: 10
        spread: 0.5
        color: AppThemes.glowColor
        cornerRadius: rect.radius + glowRadius
        visible: root.buttonEnabled
    }

    Rectangle {
        id: rect
        color: AppThemes.glowButtonColor
        anchors.fill: parent
        radius: parent.height * 0.05
    }

    Image {
        id: icon

        width: AppThemes.setSize(48)
        height: width
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: parent.verticalCenter
        anchors.verticalCenterOffset: AppThemes.setSize(-8)
        source: root.buttonEnabled ? root.enabledSource : root.disabledSource
    }

    DText {
        id: text

        text: root.text
        font.pixelSize: AppThemes.setSize(16)
        anchors.top: icon.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        color: root.buttonEnabled ? AppThemes.enabledColor : AppThemes.disabledColor
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked();
        }
    }
}
