import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import AppThemes 1.0
import DModels 1.0

import "../components"

AppScreen {
    id: root

    property real securitySliderMaxValue: 5
    property real securitySliderValue: 4

    Rectangle {
        anchors.fill: parent
        color: AppThemes.screenColor

        ColumnLayout {
            anchors.fill: parent

            Rectangle {
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: AppThemes.setSize(56)
                color: AppThemes.topBarColor

                DText {
                    text: qsTr("Homey")
                    font.pixelSize: AppThemes.topBarFontSize
                    anchors.left: parent.left
                    anchors.leftMargin: AppThemes.setSize(16)
                    anchors.verticalCenter: parent.verticalCenter
                }

                Image {
                    width: AppThemes.topBarIconSize
                    height: width
                    source: AppThemes.setImageSource("settingsIcon.png")
                    anchors.right: parent.right
                    anchors.rightMargin: AppThemes.setSize(16)
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            ColumnLayout {
                id: rootLayout

                Layout.fillHeight: true
                Layout.fillWidth: false
                Layout.preferredWidth: parent.width - 32
                Layout.alignment: Qt.AlignCenter
                spacing: 5

                ColumnLayout {
                    Layout.fillHeight: true
                    Layout.preferredHeight: parent.height * 0.4
                    Layout.fillWidth: true

                    DText {
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        Layout.preferredHeight: AppThemes.setSize(48)
                        text: qsTr("Security Level")
                        font.pixelSize: AppThemes.primaryFontSize
                    }

                    GridLayout {
                        id: roomButtonGridView

                        Layout.fillHeight: true
                        Layout.fillWidth: true
                        columnSpacing: rootLayout.width * 0.05
                        rowSpacing: rootLayout.width * 0.05

                        rows: 2
                        columns: 3

                        property int currentIndex: 0

                        Repeater {
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            model: DModels.roomsButtonModel

                            delegate: DGlowButton {
                                Layout.fillWidth: true
                                Layout.fillHeight: false
                                Layout.preferredHeight: width
                                text: model.text
                                enabledSource: model.enabledSource
                                disabledSource: model.disabledSource
                                buttonEnabled: roomButtonGridView.currentIndex === index

                                onClicked: {
                                    roomButtonGridView.currentIndex = index
                                }
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillHeight: true
                    Layout.preferredHeight: parent.height * 0.2
                    Layout.fillWidth: true
                    color: AppThemes.transparentColor

                    Rectangle {
                        width: parent.width
                        height: AppThemes.dividerLineSize
                        color: AppThemes.dividerLineColor
                        opacity: AppThemes.dividerLineOpacity
                        radius: AppThemes.dividerLineRadius
                        anchors.top: parent.top
                        anchors.topMargin: AppThemes.setSize(2)
                    }

                    Rectangle {
                        width: parent.width
                        height: AppThemes.dividerLineSize
                        color: AppThemes.dividerLineColor
                        opacity: AppThemes.dividerLineOpacity
                        radius: AppThemes.dividerLineRadius
                        anchors.bottom: parent.bottom
                    }

                    ColumnLayout {
                        width: parent.width
                        height: parent.height * 0.9
                        anchors.centerIn: parent

                        RowLayout {
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            DIconText {
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                text: qsTr("Light Control")
                                source: lightControlSwitch.switchOn ?
                                            AppThemes.setImageSource("bulbEnabled.png") : AppThemes.setImageSource("bulbDisabled.png")
                            }

                            DTextSwitch {
                                id: lightControlSwitch

                                Layout.fillHeight: false
                                Layout.fillWidth: false
                                Layout.preferredHeight: AppThemes.primarySwitchHeight
                                Layout.preferredWidth: height * 3
                            }
                        }

                        RowLayout {
                            Layout.fillHeight: true
                            Layout.fillWidth: true

                            DIconText {
                                Layout.fillHeight: true
                                Layout.fillWidth: true
                                text: qsTr("Power Supply")
                                source: powerSupplySwitch.switchOn ?
                                            AppThemes.setImageSource("powerSupplyEnabled.png") : AppThemes.setImageSource("powerSupplyDisabled.png")
                            }

                            DTextSwitch {
                                id:powerSupplySwitch

                                Layout.fillHeight: false
                                Layout.fillWidth: false
                                Layout.preferredHeight: AppThemes.primarySwitchHeight
                                Layout.preferredWidth: height * 3
                            }
                        }
                    }
                }

                Rectangle {
                    Layout.fillHeight: false
                    Layout.preferredHeight: parent.height * 0.3
                    Layout.fillWidth: true
                    color: AppThemes.transparentColor

                    ColumnLayout {
                        anchors.fill: parent

                        DText {
                            Layout.fillWidth: true
                            Layout.fillHeight: false
                            Layout.preferredHeight: AppThemes.setSize(48)
                            text: qsTr("Security Level")
                            font.pixelSize: AppThemes.primaryFontSize
                        }

                        DSlider {
                            Layout.fillWidth: true
                            Layout.fillHeight: true
                            maxValue: root.securitySliderMaxValue
                            value: root.securitySliderValue
                        }
                    }
                }
            }
        }
    }
}
