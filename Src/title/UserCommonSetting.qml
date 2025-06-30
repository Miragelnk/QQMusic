import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15

//登录
Row{
    //VIP
    Item{
        height: 30
        width:140
        anchors.verticalCenter: parent.verticalCenter

        Row{
            anchors.verticalCenter: parent.verticalCenter
            spacing: 8

            //用户头像
            Rectangle{
                id:userIconRect
                height: width
                width: 25
                radius: width/2
                color: "#2d2d37"
                Image{
                    width: 20
                    height: 20
                    anchors.centerIn: parent
                    source: "qrc:/img/Resources/title/user.png"
                }
            }

            //未登录文本
            Text{
                id: loadStateText
                text: "未登录"
                color: "#75777f"
                font.pixelSize: 14
                font.family: "微软雅黑 Light"
                anchors.verticalCenter: userIconRect.verticalCenter
                MouseArea{
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        loadStateText.color = "white"
                    }
                    onExited: {
                        loadStateText.color = "#75777f"
                    }
                }
            }


            //会员标识
            Item{
                height: userIconRect.height
                width: loadStateText.implicitWidth * 1.2
                anchors.verticalCenter: parent.verticalCenter
                Rectangle{
                    id:vipRect
                    height: 12
                    width: parent.width
                    radius: height/2
                    color: "#dadada"
                    anchors.left: parent.left
                    anchors.verticalCenter: parent.verticalCenter
                    Label{
                        text: "VIP开通"
                        color: "#f8f9f9"
                        font.pixelSize: parent.height / 2 + 2
                        font.family: "微软雅黑 Light"
                        anchors.left: parent.left
                        anchors.leftMargin: parent.radius
                        anchors.verticalCenter: parent.verticalCenter
                    }
                }

                Rectangle{
                    id:bgBordRect
                    width: vipRect.height + 4
                    height: width
                    radius: width/2
                    color: "#dadada"
                    border.width: 1
                    border.color: "#13131a"
                    anchors.verticalCenter: parent.verticalCenter
                }


            }
        }
    }


    //登录下拉
    Image{
        id:loginImg
        width: 20
        height: 20
        source: "qrc:/img/Resources/title/arrow.png"
        anchors.verticalCenter: parent.verticalCenter

        layer.enabled: true
        layer.effect: ColorOverlay{
            color: "white"
            source: loginImg
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.layer.enabled  = true
            }
            onExited: {
                parent.layer.enabled = false
            }
        }
    }


    //消息中心
    Image{
        id:messageImg
        width: 20
        height: 20
        source: "qrc:/img/Resources/title/message.png"
        anchors.verticalCenter: parent.verticalCenter

        layer.enabled: true
        layer.effect: ColorOverlay{
            color: "white"
            source: messageImg
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.layer.enabled  = true
            }
            onExited: {
                parent.layer.enabled = false
            }
        }
    }


    //设置
    Image{
        id:settingImg
        width: 20
        height: 20
        source: "qrc:/img/Resources/title/setting.png"
        anchors.verticalCenter: parent.verticalCenter

        layer.enabled: true
        layer.effect: ColorOverlay{
            color: "white"
            source: settingImg
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.layer.enabled  = true
            }
            onExited: {
                parent.layer.enabled = false
            }
        }
    }


    //换肤
    Image{
        id:skinImg
        width: 20
        height: 20
        source: "qrc:/img/Resources/title/skin.png"
        anchors.verticalCenter: parent.verticalCenter

        layer.enabled: true
        layer.effect: ColorOverlay{
            color: "white"
            source: skinImg
        }
        MouseArea{
            anchors.fill: parent
            hoverEnabled: true
            onEntered: {
                parent.layer.enabled  = true
            }
            onExited: {
                parent.layer.enabled = false
            }
        }
    }

    Rectangle{
        height: 24
        width: 1
        color: "#2D2D37"
        anchors.verticalCenter: parent.verticalCenter
    }
}
