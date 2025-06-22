import QtQuick 2.15
import QtQuick.Window 2.15

Window {
    id:window
    width: 1317
    height: 933
    visible: true
    title: qsTr("Hello World")
    flags: Qt.FramelessWindowHint | Qt.Window| Qt.WindowSystemMenuHint
           | Qt.WindowMaximizeButtonHint | Qt.WindowMinimizeButtonHint

    Rectangle{
        id:leftRect
        width: 255
        anchors.top:  parent.top
        anchors.bottom: bottomRect.top
        color: "#1a1a21"
    }

    Rectangle{
        id:rightRect
        color: "#13131a" 
        anchors.top: leftRect.top
        anchors.bottom: bottomRect.top
        anchors.left: leftRect.right
        anchors.right: parent.right   

        Item{
            id:rightTopRect
            height: 60
            anchors.top: parent.top
            anchors.left: parent.left
            anchors.right: parent.right
            Row{
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 0.02*parent.width
                spacing: 10
                Image{
                    id:miniImg
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/image/title/ico_kefu_nor.png"
                }

                Rectangle{
                    width: 20
                    height: 2                
                    color: "#75777f"
                    anchors.verticalCenter: parent.verticalCenter
                }

                Rectangle{
                    width: 20
                    height: 2
                    color: "transparent"                   
                    border.color: "#75777f"
                    border.width: 1
                    anchors.verticalCenter: parent.verticalCenter
                }

                Image{
                    id:closeImg
                    anchors.verticalCenter: parent.verticalCenter
                    source: "qrc:/img/image/title/ico_close_nor.png"
                }
            }
        }
    }

    Rectangle{
        id:bottomRect
                height: 100
        color: "#2d2d37"
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        anchors.right: parent.right
    }


    MouseArea{
        anchors.fill: parent
        property point clickPos: "0,0"
        onPressed: function(mouse) {
            clickPos = Qt.point(mouse.x, mouse.y)
        }
        onPositionChanged: function(mouse) {
            var delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            window.x = window.x + delta.x   
            window.y = window.y + delta.y
        }
    }
}
