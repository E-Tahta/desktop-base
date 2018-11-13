import Qt 4.7


Image {
    id: root
    source: "/usr/share/images/desktop-base/login-background.svg"

    property int stage

    property real progress : 0.0

    onStageChanged: {

        if (stage == 1) {
            introAnimation.running = true
        }

        progress = stage * 320
    }

    Behavior on progress {
        NumberAnimation {          
            duration: 2000
        }
    }

    Rectangle {
        id: topRect
        width: 200
        height: 200
        anchors.horizontalCenter: parent.horizontalCenter
        y: - root.height
        color: "transparent"
        Image {
            source: "images/logo.png"
            smooth: true
            anchors.centerIn: parent
            sourceSize.height: 180
            sourceSize.width: 180
        }
    }

    Rectangle {
        id: progressRectTop
        anchors.top: parent.top
        width: parent.width
        height: 10
        opacity: 0.0
        color: "transparent"

        Rectangle {
            radius: 2
            color: "#383838"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            height: 10
            width: parent.width
            Rectangle {
                radius: 2
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: progress
                color: "#ff6c00"
            }
        }
    }

    Rectangle {
        id: progressRectBottom
        anchors.bottom: parent.bottom
        width: parent.width
        height: 10
        opacity: 0.0
        color: "transparent"

        Rectangle {
            radius: 2
            color: "#383838"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            height: 10
            width: parent.width
            Rectangle {
                radius: 2
                anchors {
                    right: parent.right
                    top: parent.top
                    bottom: parent.bottom
                }
                width: progress
                color: "#ff6c00"
            }
        }
    }

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                easing.overshoot: 1.1
                target: topRect
                to: root.height / 3 + 24
                duration: 800
                easing.type: Easing.OutBack
            }

            PropertyAnimation {
                property: "opacity"
                target: progressRectTop
                to: 1.0
                duration: 1000
            }
            PropertyAnimation {
                property: "opacity"
                target: progressRectBottom
                to: 1.0
                duration: 1000
            }
        }
    }
}

