import QtQuick 2.12


Text {
    id: root

    font.bold: false
    elide: Text.ElideRight
    horizontalAlignment: Text.AlignHCenter
    verticalAlignment: Text.AlignVCenter
//    font.family: AppThemes.fontFamilyType

    color:"white"

    Behavior on scale {
        SmoothedAnimation { duration: 150 }
    }
}
