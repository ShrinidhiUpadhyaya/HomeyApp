import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: root

    property string first: "Hello";
    property string second: "World";

    property real firstTextSize: AppThemes.setSize(4)
    property real secondTextSize: AppThemes.setSize(6)

    implicitHeight: Math.max(firstTextSize,secondTextSize)


    RowLayout {
        anchors.fill: parent

        Item {
            id: firstText

            Layout.fillHeight: true
            Layout.fillWidth: true

            DText {
                anchors.verticalCenter: parent.verticalCenter
                text: root.first
                font.pixelSize: root.firstTextSize
                color: "white"
            }
        }

        Item {
            id: secondText

            Layout.fillHeight: true
            Layout.fillWidth: true

            DText {
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                text: root.second
                font.pixelSize: root.secondTextSize
                color: "white"
            }
        }
    }
}
