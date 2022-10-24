import QtQuick 2.12


Text {
    id: root

    font.bold: false
//    font.family: AppThemes.fontFamilyType

    color:"white"

    Behavior on scale {
        SmoothedAnimation { duration: AppThemes.simpleAnimationDuration }
    }

    Behavior on font.pixelSize {
        NumberAnimation {
            target: text
            property: "font.pixelSize"
            duration: AppThemes.averageAnimationDuration
            easing.type: Easing.InOutQuad
        }
    }
}
