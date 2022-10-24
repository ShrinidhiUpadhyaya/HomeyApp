import QtQuick 2.12
import QtQuick.Controls 2.5

Rectangle {
    id: root

    property int minDrag;
    property int maxDrag;

    signal released();

    width: AppThemes.sliderHandleSize
    height: width
    radius: width / 2
    color: AppThemes.whiteColor
    border.color: AppThemes.activeColor
    border.width: AppThemes.setSize(6)

    Drag.active: dragHandler.drag.active

    Rectangle {

        width: dragHandler.pressed ? 0 : AppThemes.circularButtonHeight
        height: width
        radius: width / 2
        border.color: AppThemes.activeColor
        border.width: AppThemes.setSize(8)
        color: AppThemes.transparentColor
        anchors.centerIn: parent

        Behavior on width { SmoothedAnimation { duration: AppThemes.simpleAnimationDuration } }
    }

    MouseArea {
        id: dragHandler


        width: AppThemes.circularButtonHeight
        height: AppThemes.circularButtonHeight

        drag.target: parent
        drag.axis: Drag.XAxis
        drag.minimumX: root.minDrag
        drag.maximumX: root.maxDrag

        onReleased: {
            console.log("Released")
            root.released()
        }
    }
}

