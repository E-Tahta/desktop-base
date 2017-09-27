import Qt 4.7


Image {
    id: root
    source: "images/background.png"

    property int stage

    onStageChanged: {
        if (stage == 1) {
            introAnimation.running = true
        }
    }
    Rectangle {
        id: topRect
        width: parent.width
        height: (root.height / 3) - bottomRect.height - 1
        y: root.height
        color: "#4C000000"
        Image {
            source: "images/logo.png"
            anchors.centerIn: parent
            sourceSize.height: 200
            sourceSize.width: 200
        }
    }

    Rectangle {
        id: bottomRect
        width: parent.width
        y: -height
        height: 50
        color: "#4C000000"

        Rectangle {
            radius: 3
            color: "#31363b"
            anchors.centerIn: parent
            height: 8
            width: height*32
            Rectangle {
                radius: 3
                anchors {
                    left: parent.left
                    top: parent.top
                    bottom: parent.bottom
                }
                width: (parent.width / 6) * (stage - 1)
                color: "#ff6c00"
                Behavior on width { 
                    PropertyAnimation {
                        duration: 250
                        easing.type: Easing.InOutQuad
                    }
                }
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
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }

            PropertyAnimation {
                property: "y"
                target: bottomRect
                to: 2 * (root.height / 3) - bottomRect.height
                duration: 1000
                easing.type: Easing.InOutBack
                easing.overshoot: 1.0
            }
        }
    }
}
