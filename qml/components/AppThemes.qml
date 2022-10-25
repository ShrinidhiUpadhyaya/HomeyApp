pragma Singleton

import QtQuick 2.12
import QtQuick.Window 2.12

Item {
    id: root

    readonly property real dpi: Screen.pixelDensity*25.4


    readonly property string disabledColor: "#01428B"
    readonly property string enabledColor: "#FFFFFF"
    readonly property string enabledTextColor: "#FFFFFF"
    readonly property string disabledTextColor: "#01428B"
    readonly property string transparentColor: "transparent"
    readonly property string screenColor: "#001053"
    readonly property string onStatusColor: "#00FEE6"
    readonly property string offStatusColor: "#01428B"
    readonly property string dividerLineColor: "#01428B"
    readonly property string topBarColor: "#003173"
    readonly property string whiteColor: "#FFFFFF"
    readonly property string blackColor: "#000000"
    readonly property string glowColor: "#003173"
    readonly property string glowButtonColor: "#0C1C62"
    readonly property string circularButtonColor: "#0A1E62"
    readonly property string activeColor: "#01B0FA"
    readonly property string yellowColor: "#FCE570"
    readonly property string redColor: "#e91e63"
    readonly property string temperatureCoolColor: "#01B0FA"
    readonly property string temperatureHotColor: "#e91e63"
    readonly property string arcProgressBarBackgroundColor: "#313767"

    readonly property string sliderKnobActiveBorderColor: "#01B0FA"
    readonly property string sliderKnobInactiveBorderColor: "#01428B"
    readonly property string sliderKnobFillColor: "#0464AB"

    readonly property real topBarSize: root.setSize(56)
    readonly property real topBarFontSize: root.setSize(20)
    readonly property real topBarIconSize: root.setSize(40)
    readonly property real topBarNavigationIconSize: root.setSize(16)
    readonly property real primaryIconSize: root.setSize(40)
    readonly property real valueTextSize: root.setSize(16)

    readonly property real primaryFontSize: root.setSize(22)
    readonly property real secondaryFontSize: root.setSize(16)
    readonly property real largeFontSize: root.setSize(48)
    readonly property real dividerLineSize: root.setSize(2)
    readonly property double dividerLineOpacity: 0.6
    readonly property real dividerLineRadius: 4

    readonly property real primarySwitchHeight: root.setSize(56)
    readonly property real circularButtonHeight: root.setSize(56)

    readonly property real arcProgressBarStrokeSize: root.setSize(12)
    readonly property real arcProgressBarBackgroundSize: root.setSize(8)
    readonly property real arcProgressBarKnobSize: root.setSize(8)

    readonly property real sliderHandleSize: root.setSize(25)
    readonly property real sliderKnobSize: root.setSize(24)

    readonly property real simpleAnimationDuration: 100
    readonly property real averageAnimationDuration: 200
    readonly property real complexAnimationDuration: 500

    property string fontFamilyType: fontType.name

    FontLoader {
        id: fontType

        source: "../fonts/NexaBold.otf"
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
