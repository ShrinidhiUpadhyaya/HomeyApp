import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import AppThemes 1.0
import DModels 1.0

import "../components"

AppScreen {
    id: root

    property real minTemperatureValue: 0
    property real temperatureValue: 25
    property real maxTemperatureValue: 30

    isOverlay: true

    ColumnLayout {
        width: parent.width - 32
        height: parent.height
        anchors.centerIn: parent
        spacing: 5

        Item {
            id: headerItem

            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.preferredHeight: AppThemes.setSize(106)

            Rectangle {
                width: parent.width
                height: AppThemes.dividerLineSize
                anchors.top: topHeaderButtonListView.bottom
                anchors.topMargin: -1
                color: AppThemes.dividerLineColor
                opacity: AppThemes.dividerLineOpacity
            }

            Image {
                id: backButton

                height: AppThemes.topBarIconSize
                width: height
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.1
                source: AppThemes.setImageSource("backButton.png")
            }

            ListView {
                id: topHeaderButtonListView

                width: parent.width - AppThemes.topBarNavigationIconSize
                height: parent.height -  AppThemes.setSize(16)
                contentWidth: width * model.count
                anchors.left: backButton.right
                anchors.verticalCenter: parent.verticalCenter

                model: DModels.topHeaderButtonModel
                orientation: ListView.Horizontal
                currentIndex: 0
                spacing: 5
                clip: true

                delegate: DHeaderGlowButton {
                    width: height
                    height: parent.height;
                    text: model.text
                    enabledSource: model.enabledSource
                    disabledSource: model.disabledSource
                    buttonEnabled: topHeaderButtonListView.currentIndex == index

                    onClicked: {
                        console.log("Header Index: ",index)
                        topHeaderButtonListView.currentIndex = index;
                    }
                }
            }
        }

        RowLayout {
            Layout.fillWidth: true
            Layout.fillHeight: false
            Layout.preferredHeight: AppThemes.setSize(56)

            Image {
                Layout.fillWidth: false
                Layout.preferredWidth: height / 2.2
                Layout.fillHeight: false
                Layout.preferredHeight: AppThemes.primaryIconSize
                source: AppThemes.setImageSource("thermometer.png")
            }

            DText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                text: qsTr("Temperature")
                font.pixelSize: AppThemes.primaryFontSize
            }

            DText {
                Layout.fillWidth: true
                Layout.fillHeight: true
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                text: (root.temperatureValue - 1.5) + "°C"
                font.pixelSize: AppThemes.largeFontSize
            }
        }

        ColumnLayout {
            Layout.fillWidth: true
            Layout.fillHeight: true
            spacing: AppThemes.setSize(2)

            DRowCornerText {
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight:AppThemes.setSize(56)
                firstText: qsTr("Energy Consumption")
                secondText: qsTr("45.2KW")
            }

            DRowCornerText {
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight:AppThemes.setSize(32)
                firstText: qsTr("Expenditure")
                secondText: qsTr("5.2$")
            }

            DRowCornerText {
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight:AppThemes.setSize(32)
                firstText: qsTr("Air Humidity")
                secondText: qsTr("45%")
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            RowLayout {
                width: parent.width
                height: AppThemes.setSize(64)
                anchors.top: parent.top
                anchors.topMargin: parent.height * 0.15

                DText {
                    text: qsTr("Saving Mode")
                    color: savingModeSwitch.switchOn ? AppThemes.onStatusColor : AppThemes.offStatusColor
                    horizontalAlignment: Text.AlignLeft
                    verticalAlignment: Text.AlignVCenter
                }

                DTextSwitch {
                    id: savingModeSwitch

                    Layout.fillWidth: false
                    Layout.preferredWidth: height * 2.5
                    Layout.fillHeight: false
                    Layout.preferredHeight: AppThemes.primarySwitchHeight
                    Layout.alignment: Qt.AlignRight
                }
            }

            RowLayout {
                width: parent.width
                height: AppThemes.setSize(64)
                anchors.bottom: parent.bottom
                anchors.bottomMargin: parent.height * 0.15

                DIconSwitch {
                    Layout.fillWidth: false
                    Layout.preferredWidth: height * 2.5
                    Layout.fillHeight: false
                    Layout.preferredHeight: AppThemes.primarySwitchHeight
                    leftIcon: switchOn ? AppThemes.setImageSource("disabledHome1.png") : AppThemes.setImageSource("enabledHome1.png")
                    rightIcon: switchOn ? AppThemes.setImageSource("enabledHome2.png") : AppThemes.setImageSource("disabledHome2.png")
                }

                Rectangle {
                    Layout.fillWidth: false
                    Layout.preferredWidth: 2
                    Layout.fillHeight: false
                    Layout.preferredHeight: AppThemes.setSize(56)
                    color: AppThemes.dividerLineColor
                }

                RowLayout {
                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    Layout.alignment: Qt.AlignRight

                    DIconButton {
                        Layout.fillWidth: false
                        Layout.fillHeight: false
                        source: buttonEnabled ? AppThemes.setImageSource("enabledSun.png") : AppThemes.setImageSource("disabledSun.png")
                        border.color: buttonEnabled ? AppThemes.yellowColor : AppThemes.offStatusColor
                    }

                    DIconButton {
                        id: ic

                        Layout.fillWidth: false
                        Layout.fillHeight: false
                        border.color: buttonEnabled ? AppThemes.activeColor : AppThemes.offStatusColor

                        Image {
                            id: img1

                            width: parent.width * 0.4
                            height: parent.height * 0.2
                            anchors.bottom: parent.bottom
                            anchors.bottomMargin: parent.height * 0.2
                            anchors.horizontalCenter: parent.horizontalCenter
                            source: parent.buttonEnabled ? AppThemes.setImageSource("webCamBaseEnabled.png") : AppThemes.setImageSource("webCamBaseDisabled.png")
                        }

                        Image {
                            id: img2

                            width: parent.width * 0.5
                            height: parent.height * 0.5
                            x: parent.width / 2 - (width / 2)
                            y:  parent.height * 0.15
                            source: parent.buttonEnabled ? AppThemes.setImageSource("webCamEnabled.png") : AppThemes.setImageSource("webCamDisabled.png")
                        }

                        onIconClicked: {
                            anim.start()
                        }

                        SequentialAnimation {
                            id: anim

                            ParallelAnimation {
                                PropertyAnimation { target: img2; property: "y";  to: ic.height * 0.12;}
                                PropertyAnimation { target: img2; property: "x";  to: ic.width / 2 - (img2.width / 2) - 10;}
                            }

                            PropertyAnimation { target: img2; property: "y";  to: ic.height * 0.15;}

                            ParallelAnimation {
                                PropertyAnimation { target: img2; property: "y";  to: ic.height * 0.12; }
                                PropertyAnimation { target: img2; property: "x";  to: ic.width / 2 - (img2.width / 2) + 10;}
                            }

                            PropertyAnimation { target: img2; property: "y";  to: ic.height * 0.15; }
                            PropertyAnimation { target: img2; property: "x";  to: ic.width / 2 - (img2.width / 2);}

                        }
                    }

                    DCustomTemperature {
                        Layout.fillWidth: false
                        Layout.fillHeight: false
                    }
                }
            }
        }

        Item {
            Layout.fillWidth: true
            Layout.fillHeight: true

            ColumnLayout {
                anchors.fill: parent

                DText {
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: qsTr("Set Temperature")
                    font.pixelSize: AppThemes.primaryFontSize
                }

                Item {
                    Layout.fillWidth: true
                    Layout.fillHeight: false

                    DCircularButtons {
                        width: AppThemes.circularButtonHeight
                        height: AppThemes.circularButtonHeight
                        anchors.left: parent.left
                        text: "-"

                        onClicked: {
                            root.decreaseTemperature()
                        }
                    }

                    DCircularButtons {
                        width: AppThemes.circularButtonHeight
                        height: AppThemes.circularButtonHeight
                        anchors.right: parent.right
                        text: qsTr("+")

                        onClicked: {
                            root.increaseTemperature()
                        }
                    }
                }

                DArcProgressBar {
                    id: progress5

                    Layout.fillWidth: true
                    Layout.fillHeight: true
                    value: root.temperatureValue
                    midValue: 14
                    maxValue: root.maxTemperatureValue
                }
            }
        }
    }

    function decreaseTemperature() {
        temperatureValue = Math.max(root.minTemperatureValue,root.temperatureValue-1)
    }

    function increaseTemperature() {
        temperatureValue = Math.min(root.maxTemperatureValue,root.temperatureValue+1)
    }
}
