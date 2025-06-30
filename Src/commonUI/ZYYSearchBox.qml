import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

TextField{
    leftPadding: 40

    //外部矩形
    background: Rectangle{
        anchors.fill: parent
        radius: 8
        gradient: Gradient{
            orientation: Gradient.Horizontal
            GradientStop{
                color: "#241c26"
                position: 0
            }
            GradientStop{
                color: "#382635"
                position: 1
            }
        }
        Rectangle{//内部矩形
            id:innerRect
            anchors.fill: parent
            anchors.margins: 1
            color: "transparent"
            border.color: "#2b2b31"
            border.width: 1
            property real gradientStopPos: 1

            gradient: Gradient{
                orientation: Gradient.Horizontal
                GradientStop{
                    color: "#1a1d29"
                    position: 0
                }
                GradientStop{
                    color: "#241c26"
                    position: innerRect.gradientStopPos
                }
            }
        }

        Image{
            id:searchIcon
            source: "qrc:/img/Resources/title/search.png"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 16
            width: 20
            height: 20
        }

        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onClicked: {
                innerRect.gradientStopPos = 0
                searchPop.open()
            }
        }
    }
}
