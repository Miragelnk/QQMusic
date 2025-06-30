import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15
import QtQuick.Controls 2.15
import "../title"


Rectangle {
    //搜索
    Search{
        id:searchRow
        anchors.verticalCenter: othersRow.verticalCenter
        anchors.left: parent.left
        anchors.leftMargin: 36
        spacing: 10
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
