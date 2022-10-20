import QtQuick 2.12
import QtQuick.Controls 2.5
import QtGraphicalEffects 1.0

Item {
    id: root

    property string text: ""
    signal clicked()

    implicitWidth: AppThemes.circularButtonHeight
    implicitHeight: AppThemes.circularButtonHeight

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
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            elide: Text.ElideRight
            color: AppThemes.whiteColor
            font.pixelSize: AppThemes.primaryFontSize
        }

        background: Rectangle {
            implicitWidth: AppThemes.circularButtonHeight
            implicitHeight: AppThemes.circularButtonHeight
            radius: root.height / 2
            color: AppThemes.circularButtonColor
            scale: button.pressed ? 0.8 : 1

            Behavior on scale {
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

