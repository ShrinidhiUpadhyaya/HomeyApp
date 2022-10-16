import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    id: root

    property int type: 1

    //    Rectangle {
    //        width: parent.width / 2
    //        height: width
    //        radius: width / 2
    //        color: "transparent"
    //        border.color: "#01B0FA"
    //        border.width: 10
    //        visible: root.type == 2
    //        anchors.verticalCenter: parent.verticalCenter
    //    }

    onTypeChanged:  {
        console.log("Type Changed:",type)
    }

    RowLayout {
        anchors.fill: parent


        Rectangle {
            id: circleRect

            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredWidth: height
            Layout.preferredHeight: parent.height * 0.2
            radius: width / 2
            color: !(root.type === 3) ? "#0464AB" : "transparent"
            border.color: !(root.type === 3) ? "#01B0FA" : "#98A6C1"
            border.width: 1
            Layout.alignment: Qt.AlignVCenter

            Rectangle {
                width: parent.width / 3
                height: width
                radius: width / 2
                color: "#01B0FA"
                anchors.centerIn: parent
                visible: !(root.type === 3)
            }
        }

        Rectangle {
            Layout.fillHeight: false
            Layout.fillWidth: true
            Layout.preferredHeight: AppThemes.setSize(4)
            color: "#8B92B2"
            visible: !(root.type === 3)
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
