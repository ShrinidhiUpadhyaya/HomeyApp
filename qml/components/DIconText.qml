import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: root

    property alias source: icon.source
    property alias text: text.text

    RowLayout {
        anchors.fill: parent

        Image {
            id: icon

            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredHeight: width
            Layout.preferredWidth: AppThemes.primaryIconSize
            source: root.source
        }

        DText {
            id: text

            Layout.fillHeight: true
            Layout.fillWidth: true
            text: root.text
            font.pixelSize: AppThemes.secondaryFontSize
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
        }
    }
}
