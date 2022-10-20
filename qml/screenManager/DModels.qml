pragma Singleton

import QtQuick 2.12
import QtQuick.Controls 2.5

Item {
    id: root

    property alias roomsButtonModel: roomsButtonModel
    property alias topHeaderButtonModel: topHeaderButtonModel

    ListModel {
        id: roomsButtonModel

        ListElement {
            text:"Bedroom"
            enabledSource: "qrc:/icons/headerIcons/bedroomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/bedroomDisabled.png"
        }

        ListElement {
            text:"Livingroom"
            enabledSource: "qrc:/icons/headerIcons/livingroomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/livingroomDisabled.png"
        }

        ListElement {
            text:"Kitchen"
            enabledSource: "qrc:/icons/headerIcons/kitchenEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/kitchenDisabled.png"
        }

        ListElement {
            text:"Bathroom"
            enabledSource: "qrc:/icons/headerIcons/bathroomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/bathroomDisabled.png"
        }

        ListElement {
            text:"Kidsroom"
            enabledSource: "qrc:/icons/headerIcons/kidsRoomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/kidsRoomDisabled.png"
        }

        ListElement {
            text:"Diningroom"
            enabledSource: "qrc:/icons/headerIcons/diningRoomEnabled.png"
            disabledSource: "qrc:/icons/headerIcons/diningRoomDisabled.png"
        }
    }

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

}
