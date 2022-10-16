import QtQuick 2.12
import QtQuick.Layouts 1.12

import AppThemes 1.0

Item {
    id: root

    property string source: ""
    property string text: ""

    RowLayout {
        anchors.fill: parent

        Image {
            Layout.fillHeight: false
            Layout.fillWidth: false
            Layout.preferredHeight: width
            Layout.preferredWidth: AppThemes.setSize(40)
            source: root.source
        }

        DText {
            Layout.fillHeight: true
            Layout.fillWidth: true
            text: root.text
            font.pixelSize: AppThemes.setSize(16)
            horizontalAlignment: Text.AlignLeft
        }
    }
}
