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
        width: 280
        height: backForwardRect.height
        color: "white"
        placeholderText: "搜索"
        //placeholderTextColor: "#666666"
        font.family: "Microsoft YaHei"
        font.pixelSize: 16
        font.weight: Font.Normal
    }
    
    ListModel{
        id: searchSingModel
        ListElement{
            singName: "历史"
        }
        ListElement{
            singName: "搜索"
        }
        ListElement{
            singName: "其他问题"
        }   
        ListElement{
            singName: "根元素"
        }
        ListElement{
            singName: "修复"
        }   
        ListElement{
            singName: "主要的问题"
        }
        ListElement{
            singName: "确保它也有正确"
        }
        ListElement{
            singName: "新的错误"
        }       
        ListElement{
            singName: "组件被赋予"
        }
        ListElement{
            singName: "QML文件语法错误"
        }     
    }

    ListModel{
        id: hotSearchSingModel
        ListElement{
            singName: "想象之中"
        }
        ListElement{
            singName: "雨道"
        }
        ListElement{
            singName: "哪里都是你"
        }
        ListElement{
            singName: "入戏太深"
        }
        ListElement{
            singName: "素然"
        }
        ListElement{
            singName: "ABC"
        }
        ListElement{
            singName: "确保正确"
        }
        ListElement{
            singName: "错误"
        }
        ListElement{
            singName: "赋予"
        }
        ListElement{
            singName: "语法错误"
        }
    }

    Popup{
        id:searchPop
        width: parent.width
        height: 600
        y: searchTextField.height + 10
        clip: true
        background: Rectangle{
            anchors.fill: parent
            color: "#2d2d37"
            radius: 10

            Flickable{
                anchors.fill: parent
                contentHeight: 800
                ScrollBar.vertical: ScrollBar{
                    anchors.right: parent.right
                    anchors.rightMargin: 5
                    width: 10     
                    contentItem: Rectangle{
                        visible: parent.active
                        implicitWidth: 10
                        radius: 4
                        color: "#42424b"
                    }             
                }

                ScrollBar.horizontal: ScrollBar{
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 5
                    height: 10     
                    contentItem: Rectangle{
                        visible: parent.active
                        implicitHeight: 10
                        radius: 4
                        color: "#42424b"
                    }             
                }

                Column{
                    spacing: 40
                    anchors.fill: parent
                    Item{
                        id: historyTotalItem
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: historyItem.implicitHeight + singFlow.implicitHeight + 50
                        
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
                                MouseArea{
                                    anchors.fill: parent
                                    onClicked: {
                                        searchSingModel.clear()
                                    }
                                }
                            }              
                        }

                        Flow{
                            id: singFlow
                            anchors.left: historyItem.left
                            anchors.right: historyItem.right
                            anchors.top: historyItem.bottom
                            anchors.topMargin: 30
                            spacing: 10

                            Repeater{
                                id: historyRep
                                anchors.fill: parent
                                model: searchSingModel
                                property bool showAll: true
                                delegate: Rectangle{
                                    width: dataLabel.implicitWidth + 20
                                    height: 40
                                    color: "#2d2d37"
                                    radius: 15
                                    border.color: "#45454e"
                                    border.width: 1
                                    visible: index < (historyRep.showAll ? 10 : 7)

                                    Label{
                                        id:dataLabel
                                        text: undefined === singName ? "" : (historyRep.showAll ? (index === 9 ? ">" : singName) : (index === 6 ? ">" : singName))
                                        rotation: undefined === singName ? 0 : (historyRep.showAll ? (index === 9 ? -90 : 0) : (index === 6 ? 90 : 0))
                                        font.family: "Microsoft YaHei"
                                        font.pixelSize: 20
                                        color: "#dddde3"
                                        anchors.centerIn: parent
                                        height: 25
                                    }           
                                    MouseArea{
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            dataLabel.color = "white"
                                            parent.color = "#393943"
                                            cursorShape: Qt.PointingHandCursor
                                        }
                                        onExited: {
                                            dataLabel.color = "#dddde3"
                                            parent.color = "#2d2d37"
                                            cursorShape: Qt.ArrowCursor
                                        }

                                        onClicked: {
                                            if(historyRep.showAll && index === 9){
                                                historyRep.showAll = false
                                            }else if(!historyRep.showAll && index === 6){
                                                historyRep.showAll = true
                                            }else{
                                                searchTextField.text = singName
                                                searchPop.close()
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Item{
                        id: singListItem
                        anchors.left: parent.left
                        anchors.right: parent.right
                        height: searchPop.height - historyTotalItem.implicitHeight
                        Label{
                            id: hotSearchLabel
                            text: "热门搜索"
                            font.family: "Microsoft YaHei"
                            anchors.left: parent.left
                            anchors.leftMargin: 30
                            anchors.top: parent.top
                            anchors.topMargin: 20
                            height: 30
                            font.pixelSize: 18
                            color: "#7f7f85"
                        } 

                        Column{
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: hotSearchLabel.bottom
                            anchors.topMargin: 10
                            spacing: 5
                            Repeater{
                                model: hotSearchSingModel
                                delegate: Rectangle{
                                    width: singFlow.implicitWidth
                                    height: 40
                                    color: "transparent"
                                    Label{
                                        id: hotSearchIndexLabel
                                        color: index < 3 ? "#eb4d44" : "#818187"
                                        text: String(index + 1)
                                        font.family: "Microsoft YaHei"
                                        font.pixelSize: 18
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: parent.left
                                        anchors.leftMargin: 20
                                    }

                                    Label{
                                        id: hotSearchNameLabel
                                        text: singName
                                        font.family: "Microsoft YaHei"
                                        font.pixelSize: 18
                                        color: "#dddde3"
                                        anchors.verticalCenter: parent.verticalCenter
                                        anchors.left: hotSearchIndexLabel.right
                                        anchors.leftMargin: 30
                                    }

                                    MouseArea{
                                        anchors.fill: parent
                                        hoverEnabled: true
                                        onEntered: {
                                            parent.color = "#393943"
                                            cursorShape: Qt.PointingHandCursor
                                        }
                                        onExited: {
                                            parent.color = "transparent"
                                            cursorShape: Qt.ArrowCursor
                                        }

                                        onClicked: {
                                            searchTextField.text = singName
                                            searchPop.close()
                                        }
                                    }
                                }
                            }
                        }
                    }
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
