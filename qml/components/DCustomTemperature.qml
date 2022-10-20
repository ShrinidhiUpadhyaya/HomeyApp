import QtQuick 2.12
import QtQuick.Layouts 1.12

Rectangle {
    id: root

    property bool switchOn: false
    property int maxValue: 100
    property int value: 60
    property int count: 4
    property var heightValues: []
    property var temp: []

    signal iconClicked()

    implicitWidth: AppThemes.circularButtonHeight
    implicitHeight: AppThemes.circularButtonHeight
    radius: width/2

    color: AppThemes.transparentColor
    border.color: AppThemes.disabledColor

    RowLayout {
        width: parent.width / 2
        height: parent.height / 1.8
        spacing: 1
        anchors.centerIn: parent

        Repeater {
            model: root.count

            Rectangle {
                Layout.fillWidth: true
                Layout.fillHeight: true
                radius: width / 1.2
                color: AppThemes.offStatusColor

                Rectangle {
                    width: parent.width
                    height: root.switchOn ? parent.height * root.getValue(index) : 0
                    anchors.bottom: parent.bottom
                    radius: width / 1.2
                    color: AppThemes.redColor

                    Behavior on height { SmoothedAnimation { duration: AppThemes.complexAnimationDuration } }
                }
            }
        }
    }

    MouseArea {
        anchors.fill: parent
        preventStealing: true
        onClicked: {
            root.switchOn = !root.switchOn
            root.iconClicked();
        }
    }

    function getValue(index) {
        return Math.max(0, Math.min(1,(root.value - ((root.maxValue / root.count) * index)) / (root.maxValue / root.count)))
    }
}
