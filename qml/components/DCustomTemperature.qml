import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: root

    property bool switchOn: true

    signal iconClicked()

    implicitHeight: AppThemes.setSize(18)
    implicitWidth: AppThemes.setSize(18)
    radius: width/2

    color: AppThemes.transparentColor
    border.color: "#01B0FA"

    RowLayout {
        width: parent.width / 2
        height: parent.height / 1.8
        spacing: 1
        anchors.centerIn: parent

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: width / 1.2
            color:"#01428B"

            Rectangle {
                width: parent.width
                height: switchOn ? parent.height : 0
                radius: width / 1.2
                color: "#e91e63"

                Behavior on height { SmoothedAnimation { duration: AppThemes.averageAnimationDuration } }

            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: width / 1.2
            color:"#01428B"

            Rectangle {
                width: parent.width
                height: switchOn ? parent.height : 0
                radius: width / 1.2
                anchors.bottom: parent.bottom
                color: "#e91e63"

                Behavior on height { SmoothedAnimation { duration: AppThemes.averageAnimationDuration } }

            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: width / 1.2
            color:"#01428B"

            Rectangle {
                width: parent.width
                height: 0
                radius: width / 1.2

                color: "#F64A7B"
            }
        }

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            radius: width / 1.2
            color: "#01428B"

            Rectangle {
                width: parent.width
                height: 0
                radius: width / 1.2
                color: "#F64A7B"
            }
        }
    }


    MouseArea {
        anchors.fill: parent
        preventStealing: true
        onClicked: {
            switchOn = !switchOn
            root.iconClicked();
        }
    }
}
