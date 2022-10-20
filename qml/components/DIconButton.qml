import QtQuick 2.12

Rectangle {
    id: root

    property alias icon: icon

    property bool buttonEnabled: false
    property string source: icon.source

    signal iconClicked()

    implicitWidth: AppThemes.circularButtonHeight
    implicitHeight: AppThemes.circularButtonHeight
    radius: width/2

    color: AppThemes.transparentColor

    Item {
        id: semiRoot

        anchors.fill: parent

        Image {
            id: icon

            width: height
            height: parent.height / 2
            anchors.centerIn: parent
            source: root.source
            mipmap: true
            fillMode: Image.PreserveAspectFit
            smooth: true
            asynchronous: true

            RotationAnimator {
                id: rotationAnim
                target: icon;
                from: 0;
                to: 45;
                duration: AppThemes.complexAnimationDuration
            }
        }
    }

    SequentialAnimation {
           id: scaleAnim

           running: true
           ScaleAnimator { target: semiRoot; to: 1.2; duration: AppThemes.simpleAnimationDuration }
           ScaleAnimator { target: semiRoot; to: 1; duration: AppThemes.simpleAnimationDuration }
       }

    MouseArea {
        anchors.fill: parent
        preventStealing: true
        onClicked: {
            root.buttonEnabled = !root.buttonEnabled;
            scaleAnim.start();
            root.iconClicked();
            rotationAnim.start();
        }
    }
}
