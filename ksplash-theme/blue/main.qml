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

        progress = stage * 320 / 6
    }

    Behavior on progress {
        NumberAnimation {          
            duration: 2000
        }
    }

    Rectangle {
        id: topRect
        width: parent.width
        height: (root.height / 3) - bottomRect.height - 1
        y: - root.height
        color: "#4C000000"
        Image {
            source: "images/logo.png"
            smooth: true
            anchors.centerIn: parent
            sourceSize.height: 200
            sourceSize.width: 200
        }
    }

    Rectangle {
        id: bottomRect
        width: parent.width
        y: root.height
        height: 50
        color: "#4C000000"

        Rectangle {
            radius: 2
            color: "#31363b"
            anchors.centerIn: parent
            height: 10
            width: height * 32
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

    SequentialAnimation {
        id: introAnimation
        running: false

        ParallelAnimation {
            PropertyAnimation {
                property: "y"
                target: topRect
                to: root.height / 3
                duration: 1000
                easing.type: Easing.OutExpo                
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 3) - bottomRect.height
                duration: 1000
                easing.type: Easing.OutExpo                
            }
        }
    }
}

