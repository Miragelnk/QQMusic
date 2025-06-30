import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15


Item{
    id:minMax

    //最大化、最小化、退出
    Row{
        id: miniRow
        spacing: 15
        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter
        anchors.rightMargin: 0.02*window.width

        //...
        Image{
            id: miniImg
            source: "qrc:/img/Resources/title/audio.png"
            width: 20
            height: 20
            layer.enabled: true
            layer.effect: ColorOverlay{
                source: miniImg
                color: "white"
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    miniImg.layer.enabled = true
                }
                onExited: {
                    miniImg.layer.enabled = false
                }
                onClicked: {

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
                onEntered: {
                    miniRect.color = "white"
                }
                onExited: {
                    miniRect.color = "#75777f"
                }
                onClicked: {
                    window.showMinimized()
                }
            }
        }

        //最大化
        Rectangle{
            id: maxRect
            width: 20
            height: width
            border.width: 1
            border.color: "transparent"
            color: "transparent"
            anchors.verticalCenter: parent.verticalCenter

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    maxRect.border.color = "white"
                }
                onExited: {
                    maxRect.border.color = "#75777f"
                }
                onClicked: {
                    window.x = 0
                    window.y = 0
                    window.width = Screen.width - 1
                    window.height = Screen.height - 1
                }
            }
        }

        Image{
            id: closeImg
            source: "qrc:/img/Resources/title/close.png"
            width: 20
            height: 20

            layer.enabled: true
            layer.effect: ColorOverlay{
                source: closeImg
                color: "white"
            }

            MouseArea{
                anchors.fill: parent
                hoverEnabled: true
                onEntered: {
                    closeImg.layer.enabled = true
                }
                onExited: {
                    closeImg.layer.enabled = false
                }
                onClicked: {
                    Qt.quit()
                }
            }
        }
    }

}
