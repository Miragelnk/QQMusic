import Qt.QtQuick 2.15
import QtGraphicalEffects 1.15

//最大化、最小化、退出
Item{
    id:mimMax
    height: 60
    anchors.top: parent.top
    anchors.left: parent.left
    anchors.right: parent.right
    Row{
        id:miniRow
        spacing:15
        anchors.verticalCenter: parent.verticalCenter
        anchors.right: parent.right
        anchors.rightMargin: 0.02*parent.width
        spacing: 10

        //....投屏按钮
        Image{
            id:miniImg
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/image/title/ico_kefu_nor.png"
            layer.enabled: false
            layer.effect: ColorOverlay {
                color: "white"
                source: miniImg
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: function(){
                    miniImg.layer.enabled = true
                }
                onExited: function(){
                    miniImg.layer.enabled = false
                }                       
                onClicked: function(){
                    console.log("clicked")
                }
            }
        }

        //最小化
        Rectangle{
            id:miniRect
            width: 20
            height: 2                
            color: "#75777f"
            anchors.verticalCenter: parent.verticalCenter

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: function(){
                    miniRect.color = "white"
                }
                onExited: function(){
                    miniRect.color = "#75777f"
                }
                onClicked: function(){
                    console.log("clicked")
                    window.showMinimized()
                }
            }
        }

        //最大化
        Rectangle{
            id:maxRect
            width: 20
            height: 2
            color: "transparent"                   
            border.color: "#75777f"
            border.width: 1
            radius: 2
            anchors.verticalCenter: parent.verticalCenter

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: function(){
                    maxRect.border.color = "white"
                }
                onExited: function(){
                    maxRect.border.color = "#75777f"
                }
                onClicked: function(){
                    //maxRect.showFullScreen()
                    window.x = 0
                    window.y = 0
                    window.width = Screen.width - 1
                    window.height = Screen.height - 1
                }
            }
        }

        //关闭
        Image{
            id:closeImg
            anchors.verticalCenter: parent.verticalCenter
            source: "qrc:/img/image/title/icon_close_dialog.png"
            layer.enabled: false
            layer.effect: ColorOverlay {
                color: "white"
                source: closeImg
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: function(){
                    closeImg.layer.enabled = true
                }
                onExited: function(){
                    closeImg.layer.enabled = false
                }
                onClicked: function(){
                    console.log("clicked")
                    Qt.quit()
                }
            }                   
        }
    }
}
