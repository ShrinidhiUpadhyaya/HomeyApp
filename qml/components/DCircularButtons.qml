import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Item {
    id: root

    implicitHeight: AppThemes.setSize(18)
    implicitWidth: AppThemes.setSize(18)

    property string text: ""
    signal clicked()

    DropShadow {
        anchors.fill: button
        horizontalOffset: -2
        verticalOffset: 2
        radius: 2
        samples: 5
        color: AppThemes.blackColor
        source: button
    }

    Button {
        id: button

        anchors.fill: parent

        contentItem: Text {
            text: root.text
            opacity: enabled ? 1.0 : 0.3
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            color: AppThemes.whiteColor
            font.pixelSize: AppThemes.setSize(8)
        }

        background: Rectangle {
            implicitHeight: AppThemes.setSize(18)
            implicitWidth: AppThemes.setSize(18)
            radius: root.height / 2
            color: "#0A1E62"
            scale: button.pressed ? 0.8 : 1

            Behavior on scale {
                id: animationArcBegin
                enabled: true
                SmoothedAnimation {
                    duration: AppThemes.averageAnimationDuration
                }
            }
        }

        Behavior on scale {
            enabled: true
            SmoothedAnimation {
                duration: AppThemes.simpleAnimationDuration
                easing.type: Easing.InOutQuad
            }
        }

        onClicked: {
            root.clicked()
        }
    }
}

