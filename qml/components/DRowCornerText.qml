import QtQuick 2.12
import QtQuick.Layouts 1.12

Item {
    id: root

    property alias firstText: firstText.text;
    property alias secondText: secondText.text;
    property alias firstTextSize: firstText.font.pixelSize
    property alias secondTextSize: secondText.font.pixelSize

    implicitHeight: Math.max(firstTextSize,secondTextSize)

    RowLayout {
        anchors.fill: parent

        DText {
            id: firstText

            Layout.fillWidth: true
            Layout.fillHeight: true
            verticalAlignment: Text.AlignVCenter
            font.pixelSize:  AppThemes.secondaryFontSize
            color: AppThemes.whiteColor
        }

        DText {
            id: secondText

            Layout.fillWidth: true
            Layout.fillHeight: true
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignRight
            font.pixelSize: AppThemes.setSize(18)
            color: AppThemes.whiteColor
        }
    }
}
