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

        Behavior on x { SmoothedAnimation { duration: 100 } }


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
            color: "transparent"
//            border.color: "red"

            DText {
                Layout.fillHeight: true
                Layout.fillWidth: true
                text:"OFF"
                color: !root.switchOn ? "#00FEE6" : "#01428B"
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
