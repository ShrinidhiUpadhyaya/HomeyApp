import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    id: root

    property int maxValue: 5
    property int value: 4

    RowLayout {
        anchors.fill: parent

        Repeater {
            id: repeater

            model: root.maxValue

            delegate: DSliderSubComponent {
                Layout.fillHeight: true
                Layout.fillWidth: true
                type: root.getType(index+1)
            }
        }
    }

    function getType(index) {
        console.log("Get Type:")
        if(index === root.value) {
            return 2;
        } else if(index === root.maxValue) {
            return 3;
        } else {
            return 1;
        }
    }
}
