import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: root

    property alias leftIcon: leftIcon.source
    property alias rightIcon: rightIcon.source

    property bool switchOn: true

    implicitWidth: height * 2.5
    implicitHeight: AppThemes.primarySwitchHeight
    radius: (width / 1.2)

    color: AppThemes.transparentColor
    border.color: AppThemes.disabledColor

    Rectangle {
        id: slideRect

        width: parent.width / 2
        height: parent.height
        x: root.switchOn ? (root.width / 2) : 0
        radius: width / 1.2
        color: AppThemes.transparentColor
        border.color: AppThemes.onStatusColor

        Behavior on x { SmoothedAnimation { duration: AppThemes.simpleAnimationDuration } }
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.switchOn = !root.switchOn
        }
    }

    RowLayout {
        anchors.fill: parent

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Image {
                id: leftIcon

                width: height
                height: parent.height / 2
                anchors.centerIn: parent
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            Image {
                id: rightIcon

                width: height
                height: parent.height / 2
                anchors.centerIn: parent
            }
        }
    }
}
