import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import "../commonUI"

Row{
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

    ZYYSearchBox{
        id:searchTextField
        width: 240
        height: backForwardRect.height
        color: "white"
        placeholderText: "搜索"
        //placeholderTextColor: "#666666"
        font.family: "Microsoft YaHei"
        font.pixelSize: 16
        font.weight: Font.Normal
    }

    Popup{
        id:searchPop
        width: parent.width
        height: 600
        y: searchTextField.height + 10
        background: Rectangle{
            anchors.fill: parent
            color: "#2d2d37"
            radius: 10
            Item{
                id: historyItem
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.topMargin: 30
                anchors.leftMargin: 30
                //height: 30
                Label{
                    id: searchLabel
                    text: "搜索历史"
                    font.family: "Microsoft YaHei"
                    font.pixelSize: 18
                    color: "#7f7f85"
                }

                Image{
                    id: removeIconImg
                    source: "qrc:/img/Resources/searchBox/remove.png"
                    anchors.verticalCenter: searchLabel.verticalCenter
                    anchors.right: parent.right
                    anchors.rightMargin: 30
                    width: 20
                    height: 20
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
