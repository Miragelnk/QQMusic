import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import "./Src/leftPage"
import "./Src/rightPage"
import "./Src/playMusic"
import "./Src/commonUI"


QQWindow {
    id:window
    width: 1317
    height: 933

    LeftPage{
        id:leftRect
        width: 255
        anchors.top:  parent.top
        anchors.bottom: bottomRect.top
        color: "#1a1a21"
    }

    RightPage{
        id:rightRect
        color: "#13131a" 
        anchors.top: leftRect.top
        anchors.bottom: bottomRect.top
        anchors.left: leftRect.right
        anchors.right: parent.right   
    }

    PlayMusic{
        id:bottomRect
        height: 100
        color: "#2d2d37"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }
}
