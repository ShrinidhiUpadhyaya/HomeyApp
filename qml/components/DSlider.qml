import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.12

Item {
    id: root

    property int value: 0
    property int maxValue: 0

    property var sliderKnobXCordinates: [0]

    onValueChanged: {
        console.log("Value Changed of slider",value)
        root.setHandleCoordinates(value-1);
    }

    Timer {
        running: true
        interval: 100
        onTriggered: {
            root.setHandleCoordinates(value-1);
        }
    }

    RowLayout {
        id: rowLayout

        anchors.fill: parent

        Repeater {
            id: repeater

            model: root.maxValue - 1

            delegate: DSliderSubComponent {
                Layout.fillWidth: true
                Layout.fillHeight: true
                active: (index + 1) <= root.value
                textActive: (index+1) === root.value
                text: index+1

                onClicked: {
                    root.value = index + 1;
                }

                onXChanged: {
                    root.sliderKnobXCordinates[index] = x
                }
            }
        }

        Item {
            Layout.fillWidth: false
            Layout.preferredWidth: AppThemes.sliderKnobSize
            Layout.fillHeight: true

            onXChanged: {
                root.sliderKnobXCordinates[root.maxValue-1] = x
            }

            DText {
                text: root.maxValue
                color: root.value === root.maxValue ? AppThemes.activeColor : AppThemes.sliderKnobInactiveBorderColor
                font.pixelSize: root.value === root.maxValue ? AppThemes.setSize(32) : AppThemes.setSize(24)
                anchors.top: parent.top
                anchors.topMargin: AppThemes.setSize(16)
                anchors.horizontalCenter: parent.horizontalCenter
            }

            DSliderKnob {
                width: AppThemes.sliderKnobSize
                height: width
                anchors.centerIn: parent
                active: root.value == root.maxValue

                onClicked: {
                    root.value = root.maxValue;
                }
            }
        }
    }

    DSliderHandle {
        id: handle

        width: AppThemes.setSize(25)
        height: width
        y: (root.height / 2) - (height / 2)
        minDrag: 0
        maxDrag: root.width - AppThemes.setSize(24)

        onReleased: {
            root.setNearestPoint(handle.x)
        }
    }

    PropertyAnimation {
        id: handleAnimation;

        target: handle;
        property: "x";
        duration: AppThemes.simpleAnimationDuration
    }

    function setNearestPoint(number) {
        var tempVal = root.getNearestPoint(number);

        if(root.value !== (tempVal+1)) {
            root.value = tempVal+1;
            root.setHandleCoordinates(root.value-1)
        } else {
            root.setHandleCoordinates(root.value-1)
        }
    }

    function getNearestPoint(number) {
        var index = 0;
        for (var i = root.sliderKnobXCordinates.length - 1; i >= 0; i--) {
            if(Math.abs(number - root.sliderKnobXCordinates[i]) < Math.abs(number - root.sliderKnobXCordinates[index])){
                index = i;
            }
        }

        return index;
    }

    function startHandleAnimation(xValue) {
        handleAnimation.to = xValue;
        handleAnimation.start();
    }

    function setHandleCoordinates(value) {
        console.log("Set Handle Coordinates",value,root.sliderKnobXCordinates[value])
        root.startHandleAnimation(root.sliderKnobXCordinates[value])
    }

    function setValue(value) {
        root.value = value;
        root.setHandleCoordinates(value-1)
    }
}
