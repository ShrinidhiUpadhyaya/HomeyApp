import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    id: root

    property alias text: text.text

    property bool buttonEnabled: false

    property string enabledSource: ""
    property string disabledSource: ""

    signal clicked()

    ColumnLayout {
        width: parent.width
        height: parent.height * 0.8

        Image {
            Layout.fillWidth: false
            Layout.preferredWidth: height
            Layout.fillHeight: false
            Layout.preferredHeight: AppThemes.setSize(48)
            Layout.alignment: Qt.AlignCenter
            source: root.buttonEnabled ? root.enabledSource : root.disabledSource
            scale: root. buttonEnabled ? 1 : 0.9

            Behavior on scale {
                SmoothedAnimation { duration: AppThemes.averageAnimationDuration }
            }
        }

        DText {
            id: text

            Layout.fillWidth: true
            Layout.fillHeight: true
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            color: root.buttonEnabled ? AppThemes.enabledColor : AppThemes.disabledColor
            font.pixelSize: AppThemes.secondaryFontSize
        }
    }

    Image {
        width: parent.width / 1.2
        height: parent.height * 0.14
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        source: AppThemes.setImageSource("headerButtonGlow.png")
        visible: root.buttonEnabled
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked()
        }
    }
}
