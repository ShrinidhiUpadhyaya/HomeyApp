import QtQuick 2.12

Item {
    id: root

    property bool showBackground: false
    property real lineWidth: 10
    property string colorCircle: "#CC3333"
    property string colorBackground: "#779933"

    property real value: 10

    onValueChanged: {
        canvas.requestPaint()
    }

    Behavior on value {
        id: animationArcBegin
        enabled: true
        NumberAnimation {
            duration: AppThemes.averageAnimationDuration
            easing.type: Easing.InOutQuad
        }
    }

    Canvas {
        id: canvas
        width: parent.width
        height: parent.height

        onPaint: {
            var ctx = getContext("2d")
            var x = width / 2
            var y = height

            var progressValue = 1 + (root.value / 30)
            progressValue = Math.max(1, Math.min(2, 1 + (root.value / 30)))
            progressValue = progressValue >= 2 ? 0 : progressValue

            var start = 1 * Math.PI
            var end = progressValue * Math.PI

            ctx.reset()

            ctx.beginPath();
            ctx.arc(x,y,120,1*Math.PI,0*Math.PI, false)
            ctx.lineWidth = 8
            ctx.strokeStyle = "#313767"
            ctx.stroke()

            ctx.beginPath();
            ctx.arc(x,y,120,start,end, false)
            ctx.lineWidth = root.lineWidth

            var gradient = ctx.createLinearGradient(0,0,20,50);
            gradient.addColorStop(0.2, "#00FEE6");
            gradient.addColorStop(0.6, "#e91e63");

            ctx.strokeStyle = gradient

            ctx.stroke()
        }
    }
}
