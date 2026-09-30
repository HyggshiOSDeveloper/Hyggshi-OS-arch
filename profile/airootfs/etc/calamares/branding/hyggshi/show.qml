import QtQuick 2.0
import calamares.slideshow 1.0

Presentation {
    id: presentation

    Timer {
        interval: 6000
        running: presentation.activatedInCalamares
        repeat: true
        onTriggered: presentation.goToNextSlide()
    }

    Slide {
        Rectangle { anchors.fill: parent; color: "#1f2430" }
        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
            font.pixelSize: 26
            text: "Welcome to Hyggshi OS\nLightweight Arch + XFCE"
        }
    }
    Slide {
        Rectangle { anchors.fill: parent; color: "#1f2430" }
        Text {
            anchors.centerIn: parent
            horizontalAlignment: Text.AlignHCenter
            color: "#ffffff"
            font.pixelSize: 26
            text: "Installing...\nThis takes a few minutes."
        }
    }
}
