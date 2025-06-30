import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import "./Src/leftPage"
import "./Src/rightPage"
import "./Src/playMusic"
import "./Src/commonUI"
import "./Src/title"

ZYYWindow {
    id: window
    width: 1317
    height: 933

    LeftPage{
        id: leftRect
        width: 255
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        color: "#1a1a21"
    }

    RightPage {
        id: rightRect
        anchors.left: leftRect.right
        anchors.top: parent.top
        anchors.bottom: bottomRect.top
        anchors.right: parent.right
        color: "#13131a"
    }

    PlayMusic {
        id: bottomRect
        height: 100
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
        color: "#2d2d37"
    }
}

