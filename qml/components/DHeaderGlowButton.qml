import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Rectangle {
    id: root


    property string text: ""
    property string enabledSource: ""
    property string disabledSource: ""

    property bool buttonEnabled: false

    signal clicked()

    color: "transparent"




    ColumnLayout {
        width: parent.width
        height: parent.height * 0.8

        Image {
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredHeight: AppThemes.setSize(12)
            Layout.preferredWidth: height
            source: root.buttonEnabled ? root.enabledSource : root.disabledSource
            scale: root. buttonEnabled ? 1 : 0.9
            Layout.alignment: Qt.AlignCenter

            Behavior on scale {
                SmoothedAnimation { duration: 200 }
            }
        }

        DText {
            Layout.fillHeight: false
            Layout.preferredHeight: AppThemes.setSize(4)
            Layout.fillWidth: true
            text: root.text
            color: root.buttonEnabled ? "white" : "#01428B"
        }
    }



    Image {
        source: "qrc:/icons/headerButtonGlow.png"
        width: parent.width / 1.2
        height: parent.height * 0.12
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        visible: root.buttonEnabled
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}
