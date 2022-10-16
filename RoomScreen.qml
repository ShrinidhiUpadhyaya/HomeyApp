import QtQuick 2.0
import QtQuick.Layouts 1.12
import "components"

Item {
    id: root

    Rectangle {
        anchors.fill: parent
        color: "#001053"

        ColumnLayout {
            anchors.fill: parent

            Item {
                id: navigationBar
                Layout.fillWidth: true
                Layout.fillHeight: false
                Layout.preferredHeight: 56;
            }

            Item {
                Layout.fillHeight: true
                Layout.fillWidth: true

                DRowCornerText {
                    width: parent.width
                }

                DRowCornerText {
                    width: parent.width
                }

                DRowCornerText {
                    width: parent.width
                }
            }

            Item {
                Layout.fillHeight: false
                Layout.fillWidth: true
                Layout.preferredHeight: parent.height * 0.30
            }
        }
    }
}
