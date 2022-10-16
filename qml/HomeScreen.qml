import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

import AppThemes 1.0

import "components"

Item {
    id: root

    ListModel {
        id: roomsButtonModel

        ListElement {
            text:"Bedroom"
            enabledSource:"qrc:/icons/headerIcons/bedroomEnabled.png"
            disabledSource:"qrc:/icons/headerIcons/bedroomDisabled.png"
        }

        ListElement {
            text:"Livingroom"
            enabledSource:"qrc:/icons/headerIcons/livingroomEnabled.png"
            disabledSource:"qrc:/icons/headerIcons/livingroomDisabled.png"
        }

        ListElement {
            text:"Kitchen"
            enabledSource:"qrc:/icons/headerIcons/kitchenEnabled.png"
            disabledSource:"qrc:/icons/headerIcons/kitchenDisabled.png"
        }

        ListElement {
            text:"Bathroom"
            enabledSource:"qrc:/icons/headerIcons/bathroomEnabled.png"
            disabledSource:"qrc:/icons/headerIcons/bathroomDisabled.png"
        }

        ListElement {
            text:"Kidsroom"
            enabledSource:"qrc:/icons/headerIcons/kidsRoomEnabled.png"
            disabledSource:"qrc:/icons/headerIcons/kidsRoomDisabled.png"
        }

        ListElement {
            text:"Diningroom"
            enabledSource:"qrc:/icons/headerIcons/diningRoomEnabled.png"
            disabledSource:"qrc:/icons/headerIcons/diningRoomDisabled.png"
        }
    }

    Rectangle {
        anchors.fill: parent
        color: "#001053"

        ColumnLayout {
            id: rootLayout

            width: parent.width - 32
            height: parent.height - AppThemes.setSize(56)
            anchors.centerIn: parent
            spacing: 5

            Rectangle {
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: AppThemes.setSize(56)
                color: "transparent"

                DText {
                    text: "Homey"
                    font.pixelSize: AppThemes.setSize(20)
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                }

                Image {
                    width: AppThemes.setSize(24)
                    height: width
                    source: "qrc:/icons/settingsIcon.png"
                    anchors.right: parent.right
                    anchors.verticalCenter: parent.verticalCenter
                }
            }

            ColumnLayout {
                Layout.fillHeight: true
                Layout.preferredHeight: parent.height * 0.4
                Layout.fillWidth: true

                DText {
                    Layout.fillWidth: true
                    Layout.fillHeight: false
                    Layout.preferredHeight: AppThemes.setSize(22)
                    text: "Security Level"
                    font.pixelSize: AppThemes.setSize(22)
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

                        model: roomsButtonModel

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
                color: "transparent"

                Rectangle {
                    width: parent.width
                    height: 2
                    color: "#01428B"
                    opacity: 0.6
                    radius: 4
                    anchors.bottom: parent.bottom
                }

                Rectangle {
                    width: parent.width
                    height: 2
                    color: "#01428B"
                    opacity: 0.6
                    radius: 4
                    anchors.top: parent.top
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
                                                    text: "Light Control"
                                                    source: lightControlSwitch.switchOn ? "qrc:/icons/bulbEnabled.png" : "qrc:/icons/bulbDisabled.png"
                                                }

                                                DTextSwitch {
                                                    id: lightControlSwitch

                                                    Layout.fillHeight: false
                                                    Layout.fillWidth: false
                                                    Layout.preferredHeight: AppThemes.setSize(40)
                                                    Layout.preferredWidth: height * 3
                                                }


                    }

                    RowLayout {
                        Layout.fillHeight: true
                        Layout.fillWidth: true

                        DIconText {
                            Layout.fillHeight: true
                            Layout.fillWidth: true
                            text: "Power Supply"
                            source: powerSupplySwitch.switchOn ? "qrc:/icons/powerSupplyEnabled.png" : "qrc:/icons/powerSupplyDisabled.png"
                        }

                        DTextSwitch {
                            id:powerSupplySwitch

                            Layout.fillHeight: false
                            Layout.fillWidth: false
                            Layout.preferredHeight: AppThemes.setSize(40)
                            Layout.preferredWidth: height * 3
                        }

                    }
                }
            }

            Rectangle {
                Layout.fillHeight: false
                Layout.preferredHeight: parent.height * 0.3
                Layout.fillWidth: true
                color: "transparent"

                ColumnLayout {
                    anchors.fill: parent

                    DText {
                        Layout.fillWidth: true
                        Layout.fillHeight: false
                        Layout.preferredHeight: AppThemes.setSize(48)
                        text: "Security Level"
                        font.pixelSize: AppThemes.setSize(22)
                    }

                    DSlider {
                        Layout.fillWidth: true
                        Layout.fillHeight: true
                        maxValue: 5
                        value: 4

                        Rectangle {
                            anchors.fill: parent
                            color: "transparent"
                            border.color: "green"
                        }
                    }
                }
            }
        }
    }
}
