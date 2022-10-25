import QtQuick 2.12


Text {
    id: root

    font.bold: false
    font.family: AppThemes.fontFamilyType

    color: AppThemes.whiteColor

    Behavior on scale {
        SmoothedAnimation { duration: AppThemes.simpleAnimationDuration }
    }

    Behavior on font.pixelSize {
        NumberAnimation {
            target: root
            property: "font.pixelSize"
            duration: AppThemes.averageAnimationDuration
            easing.type: Easing.InOutQuad
        }
    }
}
