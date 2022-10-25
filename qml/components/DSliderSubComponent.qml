import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    id: root

    property bool active: false
    property bool textActive: false

    property alias text: text.text

    signal clicked();

    DText {
        id: text

        color: root.textActive ? AppThemes.activeColor : AppThemes.sliderKnobInactiveBorderColor
        font.pixelSize: root.textActive ? AppThemes.setSize(32) : AppThemes.setSize(24)
        anchors.top: parent.top
        anchors.topMargin: AppThemes.setSize(16)
        anchors.leftMargin: AppThemes.sliderKnobSize / 2
    }

    RowLayout {
        anchors.fill: parent
        spacing: 5

        DSliderKnob {
            id: sliderKnob

            Layout.fillWidth: false
            Layout.preferredWidth: height
            Layout.fillHeight: false
            Layout.preferredHeight: AppThemes.sliderKnobSize
            Layout.alignment: Qt.AlignVCenter
            active: root.active

            onClicked: {
                root.clicked();
            }
        }

        Rectangle {
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.preferredHeight: sliderKnob.height / 5
            color: "#8B92B2"
            Layout.alignment: Qt.AlignVCenter
        }
    }
}
