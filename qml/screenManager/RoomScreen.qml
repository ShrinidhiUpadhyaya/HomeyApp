import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import AppThemes 1.0

import "../components"

AppScreen {
    id: root

    property real temperatureValue: 25

    ListModel {
        id: topHeaderButtonModel

        ListElement {
            enabledSource: "qrc:/icons/headerIcons/livingroomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/livingroomDisabled.png"
            text: "Living Room"
        }

        ListElement {
            enabledSource: "qrc:/icons/headerIcons/bedroomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/bedroomDisabled.png"
            text: "Bedroom"
        }

        ListElement {
            enabledSource: "qrc:/icons/headerIcons/kitchenEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/kitchenDisabled.png"
            text: "Kitchen"
        }

        ListElement {
            enabledSource: "qrc:/icons/headerIcons/bathroomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/bathroomDisabled.png"
            text: "Bathroom"
        }


    }

    Rectangle {
        anchors.fill: parent
        color: "#001053"

        ColumnLayout {
            width: parent.width - 32
            height: parent.height
            anchors.centerIn: parent
            spacing: 5

            Item {
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight: AppThemes.setSize(24)

                Rectangle {
                    width: parent.width
                    height: 2
                    color: "#01428B"
                    opacity: 0.6
                    anchors.bottom: parent.bottom
                }

                Item {
                    id: backButton

                    height: AppThemes.setSize(10)
                    width: height
                    anchors.top: parent.top
                    anchors.topMargin: parent.height * 0.1

                    Image {
                        anchors.fill: parent
                        source: "qrc:/icons/backButton.png"
                    }
                }

                ListView {
                    id: topHeaderButtonListView

                    width: parent.width - AppThemes.setSize(10)
                    height: parent.height
                    anchors.left: backButton.right

                    model: topHeaderButtonModel
                    contentWidth: AppThemes.setSize(28) * 6
                    orientation: ListView.Horizontal
                    currentIndex: 0
                    spacing: 5
                    clip: true

                    delegate: DHeaderGlowButton {
                        height: AppThemes.setSize(24);
                        width: height
                        text: model.text
                        enabledSource: model.enabledSource
                        disabledSource: model.disabledSource
                        buttonEnabled: topHeaderButtonListView.currentIndex == index

                        onClicked: {
                            console.log(topHeaderButtonListView.currentIndex,"--",index,buttonEnabled)
                            console.log(topHeaderButtonListView.currentIndex == index)
                            topHeaderButtonListView.currentIndex = index;
                        }
                    }
                }
            }

            Item {
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: AppThemes.setSize(16)

                RowLayout {
                    anchors.fill: parent

                    Image {
                        Layout.fillHeight: false
                        Layout.preferredHeight: AppThemes.setSize(12)
                        Layout.fillWidth: false
                        Layout.preferredWidth: height / 2.2
                        source: "qrc:/icons/thermometer.png"
                    }

                    DText {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text: "Temperature"
                        font.pixelSize: AppThemes.setSize(6)
                    }

                    DText {
                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        text: (root.temperatureValue - 2) + "°C"
                        font.pixelSize: AppThemes.setSize(16)
                    }
                }

            }

            Column {
                Layout.fillHeight: false
                Layout.fillWidth: true
                spacing: AppThemes.setSize(2)

                DRowCornerText {
                    width: parent.width
                    height: AppThemes.setSize(8)
                    first: "Energy Consumption"
                    second: "45.2KW"
                }

                DRowCornerText {
                    width: parent.width
                    height: AppThemes.setSize(8)
                    first: "Expenditure"
                    second: "5.2$"
                }

                DRowCornerText {
                    width: parent.width
                    height: AppThemes.setSize(8)
                    first: "Air Humidity"
                    second: "45%"
                }
            }

            Rectangle {
                Layout.fillHeight: true
                Layout.fillWidth: true
                color: "transparent"

                ColumnLayout {
                    anchors.fill: parent

                    RowLayout {
                        Layout.fillHeight: false
                        Layout.preferredHeight: AppThemes.setSize(14)
                        Layout.fillWidth: true

                        DText {
                            text: "Saving Mode"
                            color: savingModeSwitch.switchOn ? "#00FEE6" : "#01428B"
                            horizontalAlignment: Text.AlignLeft
                            verticalAlignment: Text.AlignVCenter
                        }


                        Item {
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            DTextSwitch {
                                id: savingModeSwitch

                                height: parent.height
                                width: height * 2
                                anchors.right: parent.right
                            }
                        }
                    }


                    RowLayout {
                        Layout.fillHeight: false
                        Layout.preferredHeight: AppThemes.setSize(18)
                        Layout.fillWidth: true

                        Item {
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            DIconSwitch {
                            }
                        }

                        Rectangle {
                            width: 2
                            height: parent.height
                            color: "#253167"
                        }

                        RowLayout {
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            DIconButton {
                                Layout.fillHeight: false
                                Layout.fillWidth: false
                                source: buttonEnabled ? "qrc:/icons/enabledSun.png" : "qrc:/icons/disabledSun.png"
                                border.color: buttonEnabled ? "#FCE570" : "#01428B"
                            }

                            DIconButton {
                                id: ic

                                Layout.fillHeight: false
                                Layout.fillWidth: false
                                border.color: buttonEnabled ? "#01B0FA" : "#01428B"

                                Image {
                                    id: img1

                                    width: parent.width * 0.4
                                    height: parent.height * 0.2
                                    anchors.bottom: parent.bottom
                                    anchors.bottomMargin: parent.height * 0.2
                                    anchors.horizontalCenter: parent.horizontalCenter
                                    source: parent.buttonEnabled ? "qrc:/icons/webCamBaseEnabled.png" : "qrc:/icons/webCamBaseDisabled.png"
                                }

                                Image {
                                    id: img2

                                    width: parent.width * 0.5
                                    height: parent.height * 0.5
                                    x: parent.width / 2 - (width / 2)
                                    y:  parent.height * 0.15
                                    source: parent.buttonEnabled ? "qrc:/icons/webCamEnabled.png" : "qrc:/icons/webCamDisabled.png"
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
                                Layout.fillHeight: false
                                Layout.fillWidth: false
                            }
                        }
                    }
                }

            }


            Item {
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.30

                Rectangle {
                    anchors.fill: parent
                    color: "transparent"

                    RowLayout {
                        width: parent.width
                        height: AppThemes.setSize(8)
                        anchors.top: parent.top
                        anchors.topMargin: AppThemes.setSize(5)

                        DCircularButtons {
                            Layout.fillHeight: false
                            Layout.fillWidth: false
                            text: "-"

                            onClicked: {
                                root.increaseTemperature()
                            }
                        }

                        DText {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text: "Set Temperature"
                            font.pixelSize: AppThemes.setSize(6)
                        }

                        DCircularButtons {
                            Layout.fillHeight: false
                            Layout.fillWidth: false
                            text: "+"

                            onClicked: {
                                root.decreaseTemperature()
                            }
                        }
                    }

                    DText {
                        text: root.temperatureValue + "°"
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.bottomMargin: AppThemes.setSize(2)
                        color: "#e91e63"
                        font.pixelSize: AppThemes.setSize(16)
                    }

                    DArcProgressBar {
                        id: progress5
                        colorCircle: "red"
                        colorBackground: "#E6E6E6"
                        showBackground: true
                        anchors.fill: parent
                        value: root.temperatureValue
                    }
                }
            }
        }
    }


    function increaseTemperature() {
        temperatureValue = Math.max(0,temperatureValue-1)
    }

    function decreaseTemperature() {
        temperatureValue = Math.min(30,temperatureValue+1)
    }
}
