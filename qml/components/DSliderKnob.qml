import QtQuick 2.12
import QtQuick.Controls 2.5

import AppThemes 1.0

Rectangle {
    id: root

    property bool active: true

    signal clicked();

    implicitWidth: height
    implicitHeight: AppThemes.sliderKnobSize
    radius: width / 2
    color: root.active ? AppThemes.sliderKnobFillColor : AppThemes.transparentColor
    border.color:  root.active ? AppThemes.sliderKnobActiveBorderColor : AppThemes.sliderKnobInactiveBorderColor
    border.width: 1

    Rectangle {
        width: parent.width / 2.5
        height: width
        radius: width / 2
        color: AppThemes.sliderKnobActiveBorderColor
        anchors.centerIn: parent
        visible: root.active
    }

    MouseArea {
        anchors.fill: parent
        onClicked: {
            root.clicked();
        }
    }
}
