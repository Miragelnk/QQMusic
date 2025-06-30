import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import "../title"


Rectangle {
    //搜索
    Row{
        id:searchRow
        anchors.verticalCenter: othersRow.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 36
        spacing: 10
        Rectangle{
            id:backForwardRect
            width: 24
            height: 35
            color: "transparent"
            radius: 4
            border.color: "#2b2b31"
            border.width: 1
            Image{
                id:backForwardImg
                source: "qrc:/img/Resources/title/arrow.png"  
                anchors.centerIn: parent
                width: 20
                height: 20    
                rotation: 90
            } 
        }

        TextField{
            id:searchTextField
            width: 240
            height: backForwardRect.height
            color: "white"
            placeholderText: "搜索"
            //placeholderTextColor: "#666666"
            font.family: "Microsoft YaHei"
            font.pixelSize: 16
            font.weight: Font.Normal
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
                    onEntered: {
                        innerRect.gradientStopPos = 0
                    }
                }
            }
        }

        Rectangle{
            id:soundHoundRect
            radius: 8
            width: height
            height: backForwardRect.height
            color: "#241c26"
            border.color: "#36362f"
            border.width: 1
            Image{
                width: 20
                height: 20
                anchors.centerIn: parent
                source: "qrc:/img/Resources/title/audio.png"           
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    soundHoundRect.color = "white"
                }
                onExited: {
                    soundHoundRect.color = "#241c26"
                }
            }
        }
    }

    //登录
    UserCommonSetting{
        id:othersRow
        spacing: 5
        anchors.verticalCenter: minMax.verticalCenter
        anchors.right: minMax.left
        anchors.rightMargin: 10
    }

    //最大化、最小化、退出
    MinAndMax{
        id: minMax
        height: 60
        anchors.top: parent.top
        anchors.right: parent.right
        width:180
        //anchors.left: parent.left
    }
}
