import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: root

    property alias leftText: leftText.text
    property alias rightText: rightText.text

    color: AppThemes.transparentColor

    implicitHeight: AppThemes.primarySwitchHeight
    implicitWidth: height * 2
    border.color: AppThemes.offStatusColor
    radius: width / 1.2

    property bool switchOn: true

    Rectangle {
        id: slideRect

        width: parent.width / 2
        height: parent.height
        radius: width / 1.2
        x: switchOn ? root.width / 2 : 0
        border.color: AppThemes.onStatusColor
        color: AppThemes.transparentColor

        Behavior on x { SmoothedAnimation { duration: AppThemes.simpleAnimationDuration } }


    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.switchOn = !root.switchOn
        }
    }

    //    RowLayout {
    //        anchors.fill: parent

    //        DText {
    //            Layout.fillHeight: true
    //            Layout.fillWidth: true
    //            text:"OFF"
    //            color: !root.switchOn ? "#00FEE6" : "#01428B"
    //            horizontalAlignment: Text.AlignHCenter
    //            verticalAlignment: Text.AlignVCenter
    //        }

    //        DText {
    //            Layout.fillHeight: true
    //            Layout.fillWidth: true
    //            text:"ON"
    //            color: root.switchOn ? "#00FEE6" : "#01428B"
    //            horizontalAlignment: Text.AlignHCenter
    //            verticalAlignment: Text.AlignVCenter
    //        }
    //    }

    Row {
        anchors.fill: parent

        Rectangle {
            width: parent.width / 2
            height: parent.height
            color: AppThemes.transparentColor
//            border.color: "red"

            DText {
                id: leftText

                Layout.fillHeight: true
                Layout.fillWidth: true
                text: qsTr("OFF")
                color: !root.switchOn ? AppThemes.onStatusColor : AppThemes.offStatusColor
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.centerIn: parent
                font.pixelSize: AppThemes.setSize(14)
            }
        }

        Rectangle {
            width: parent.width / 2
            height: parent.height
            color: "transparent"
//            border.color: "red"

            DText {
                id: rightText

                text:"ON"
                color: root.switchOn ? "#00FEE6" : "#01428B"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.centerIn: parent
                font.pixelSize: AppThemes.setSize(14)
            }
        }
    }

}
