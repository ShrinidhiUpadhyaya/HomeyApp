import QtQuick 2.12

Item {
    id: root

    property real lineWidth: AppThemes.arcProgressBarStrokeSize
    property string strokeColor: AppThemes.redColor
    property string backgroundColor: AppThemes.arcProgressBarBackgroundColor

    property int value: 10
    property int maxValue: 30
    property int midValue: root.maxValue / 2

    property real knobpositionX: 0
    property real knobpositionY: 0

    onValueChanged: {
        canvas.requestPaint()
    }

    Behavior on value {
        enabled: true
        NumberAnimation {
            duration: AppThemes.averageAnimationDuration
            easing.type: Easing.InOutQuad
        }
    }

    DText {
        text: root.value + "°"
        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.bottomMargin: AppThemes.setSize(4)
        color: root.value < root.midValue ? AppThemes.temperatureCoolColor : AppThemes.temperatureHotColor
        font.pixelSize: AppThemes.largeFontSize
    }

    Canvas {
        id: canvas
        width: parent.width
        height: parent.height

        onPaint: {
            var ctx = getContext("2d")

            var x = width / 2,
            y = height,
            radius = width / 2.5;

            var progressValue = 1 + (root.value / root.maxValue)
            var start = 1 * Math.PI
            var end = progressValue * Math.PI

            ctx.reset()

            //Create gradient
            var gradient = ctx.createLinearGradient(x,0,0, 0);
            gradient.addColorStop(0, AppThemes.temperatureHotColor);
            gradient.addColorStop(0.5, AppThemes.temperatureCoolColor);


            ctx.beginPath();
            ctx.arc(x,y,radius,start,0*Math.PI,false)
            ctx.lineWidth = AppThemes.arcProgressBarBackgroundSize
            ctx.strokeStyle = root.backgroundColor
            ctx.stroke()

            ctx.beginPath();
            ctx.arc(x,y,radius,start,end)
            ctx.lineWidth = root.lineWidth
            ctx.strokeStyle = root.strokeColor

            //Gradient
            ctx.strokeStyle = gradient;

            ctx.lineWidth = root.lineWidth;
            ctx.stroke();

            root.getPoint(x,y,radius,end)
        }
    }

    Rectangle {
        width: AppThemes.circularButtonHeight
        height: width
        radius:  width / 2
        color: AppThemes.transparentColor
        border.color: root.value < root.midValue ? AppThemes.temperatureCoolColor : AppThemes.temperatureHotColor
        border.width: AppThemes.arcProgressBarKnobSize
        x: root.knobpositionX - (width/2)
        y: root.knobpositionY - (height/2)

        Rectangle {
            width: parent.width / 2
            height: width
            radius: width / 2
            color: AppThemes.whiteColor
            border.color: root.value < root.midValue ? AppThemes.temperatureCoolColor : AppThemes.temperatureHotColor
            border.width: parent.border.width / 2
            anchors.centerIn: parent
        }
    }

    function getPoint(x,y,radius,angle){
        root.knobpositionX = x+Math.cos(angle)*radius;
        root.knobpositionY = y+Math.sin(angle)*radius;
    }
}
