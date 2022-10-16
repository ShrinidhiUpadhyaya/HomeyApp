import QtQuick 2.12

import AppThemes 1.0

Rectangle {
    id: root

    property string source: icon.source

    property alias icon: icon

    property bool buttonEnabled: false

    signal iconClicked()

    implicitHeight: AppThemes.setSize(18)
    implicitWidth: AppThemes.setSize(18)
    radius: width/2

    color: "transparent"


    Item {
        id: semiRoot

        anchors.fill: parent
//        scale: buttonEnabled ? 2 : 1

        Image {
            id: icon

            source: root.source
            width: height
            height: parent.height / 2
            mipmap: true
            fillMode: Image.PreserveAspectFit
            smooth: true
            asynchronous: true
            anchors.centerIn: parent

            RotationAnimator {
                id: anim
                target: icon;
                from: 0;
                to: 45;
                duration: 400
            }
        }

    }

    SequentialAnimation {
           id: scaleAnim

           running: true
           ScaleAnimator { target: semiRoot; to: 1.2; duration: 100 }
           ScaleAnimator { target: semiRoot; to: 1; duration: 100 }
       }

    MouseArea {
        anchors.fill: parent
        preventStealing: true
        onClicked: {
            buttonEnabled = !buttonEnabled
            scaleAnim.start()
            root.iconClicked();
            anim.start()
        }
    }
}
