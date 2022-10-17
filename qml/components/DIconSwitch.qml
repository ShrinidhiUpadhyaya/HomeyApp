import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: root

    color: "transparent"

    implicitHeight: AppThemes.setSize(18)
    implicitWidth: height * 2
    border.color: "#01428B"
    radius: width / 1.2

    property bool switchOn: true

    Rectangle {
        id: slideRect

        width: parent.width / 2
        height: parent.height
        radius: width / 1.2
        x: switchOn ? root.width / 2 : 0
        border.color: "#00FEE6"
        color: "transparent"

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
            Layout.fillHeight: true
            Layout.fillWidth: true

            Image {
                height: parent.height / 2
                width: height
                source: root.switchOn ? "qrc:/icons/disabledHome1.png" : "qrc:/icons/enabledHome1.png"
                anchors.centerIn: parent
            }
        }

        Item {
            Layout.fillHeight: true
            Layout.fillWidth: true

            Image {
                height: parent.height / 2
                width: height
                source: root.switchOn ? "qrc:/icons/enabledHome2.png" : "qrc:/icons/disabledHome2.png"
                anchors.centerIn: parent
            }
        }
    }

}
