import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: root

    property alias leftText: leftText.text
    property alias rightText: rightText.text

    property bool switchOn: true

    implicitWidth: height * 2
    implicitHeight: AppThemes.primarySwitchHeight
    radius: width / 1.2

    color: AppThemes.transparentColor
    border.color: AppThemes.offStatusColor

    Rectangle {
        id: slideRect

        width: parent.width / 2
        height: parent.height
        x: root.switchOn ? root.width / 2 : 0
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
        spacing: 0

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            DText {
                id: leftText

                anchors.centerIn: parent
                text: qsTr("OFF")
                font.pixelSize: AppThemes.secondaryFontSize
                color: !root.switchOn ? AppThemes.onStatusColor : AppThemes.offStatusColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            DText {
                id: rightText

                anchors.centerIn: parent

                text: qsTr("ON")
                font.pixelSize: AppThemes.secondaryFontSize
                color: root.switchOn ? AppThemes.onStatusColor : AppThemes.offStatusColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
            }
        }
    }
}
