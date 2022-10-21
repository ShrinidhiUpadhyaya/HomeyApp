pragma Singleton

import QtQuick 2.12
import QtQuick.Window 2.12

Item {
    id: root

    property real dpi: Screen.pixelDensity*25.4


    property string disabledColor: "#01428B"
    property string enabledColor: "#FFFFFF"
    property string enabledTextColor: "#FFFFFF"
    property string disabledTextColor: "#01428B"
    property string transparentColor: "transparent"
    property string screenColor: "#001053"
    property string onStatusColor: "#00FEE6"
    property string offStatusColor: "#01428B"
    property string dividerLineColor: "#01428B"
    property string topBarColor: "#003173"
    property string whiteColor: "#FFFFFF"
    property string blackColor: "#000000"
    property string glowColor: "#003173"
    property string glowButtonColor: "#0C1C62"
    property string circularButtonColor: "#0A1E62"
    property string activeColor: "#01B0FA"
    property string yellowColor: "#FCE570"
    property string redColor: "#e91e63"
    property string temperatureCoolColor: "#01B0FA"
    property string temperatureHotColor: "#e91e63"
    property string arcProgressBarBackgroundColor: "#313767"

    property real topBarSize: AppThemes.setSize(56)
    property real topBarFontSize: AppThemes.setSize(20)
    property real topBarIconSize: AppThemes.setSize(40)
    property real topBarNavigationIconSize: AppThemes.setSize(16)
    property real primaryIconSize: AppThemes.setSize(40)
    property real valueTextSize: AppThemes.setSize(16)

    property real primaryFontSize: AppThemes.setSize(22)
    property real secondaryFontSize: AppThemes.setSize(16)
    property real largeFontSize: AppThemes.setSize(48)
    property real dividerLineSize: AppThemes.setSize(2)
    property double dividerLineOpacity: 0.6
    property real dividerLineRadius: 4

    property real primarySwitchHeight: AppThemes.setSize(56)
    property real circularButtonHeight: AppThemes.setSize(56)

    property real arcProgressBarStrokeSize: AppThemes.setSize(12)
    property real arcProgressBarBackgroundSize: AppThemes.setSize(8)
    property real arcProgressBarKnobSize: AppThemes.setSize(8)

    property real simpleAnimationDuration: 100
    property real averageAnimationDuration: 200
    property real complexAnimationDuration: 500


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
