pragma Singleton

import QtQuick 2.12
import QtQuick.Window 2.12

Item {
    id: root

    property real dpi: Screen.pixelDensity*25.4


    property string enabledColor: "#01428B"
    property string disabledColor: "#FFFFFF"
    property string enabledTextColor: "#FFFFFF"
    property string disabledTextColor: "#01428B"
    property string transparentColor: "transparent"
    property string screenColor: "#001053"
    property string onStatusColor: "#00FEE6"
    property string offStatusColor: "#01428B"
    property string dividerLineColor: "#01428B"
    property string topBarColor: "#003173"


    property real topBarSize: AppThemes.setSize(56)
    property real topBarFontSize: AppThemes.setSize(20)
    property real topBarIconSize: AppThemes.setSize(24)

    property real primaryFontSize: AppThemes.setSize(22)
    property real dividerLineSize: AppThemes.setSize(2)
    property double dividerLineOpacity: 0.6
    property real dividerLineRadius: 4

    property real primarySwitchHeight: AppThemes.setSize(40)


    property string fontFamilyType: fontType.name

    FontLoader {
        id: fontType

        source: "Fonts/NexaBold.otf"
    }

//    function setSize(x) {
//        return Math.max(inchr(x/1000),1);
//    }

//    function inchr(x) {
//        return Math.ceil(x * dpi * 25.4);
//    }

    function setSize(x) {
        return x*(dpi/160)
    }

    function getDate(value,dateFormat) {
        console.log(value)
        console.log(dateFormat)
        return Qt.formatDateTime(value,dateFormat);
    }

    function setImageSource(source) {
        return "qrc:/icons/" + source
    }
}
