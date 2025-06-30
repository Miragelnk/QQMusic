import QtQuick 2.15
import QtQuick.Window 2.15
import QtGraphicalEffects 1.15

Window {
    id: window
    width: 1317
    height: 933
    visible: true
    title: qsTr("Hello World")

    flags: Qt.FramelessWindowHint | Qt.Window | Qt.WindowSystemMenuHint |
           Qt.WindowMaximizeButtonHint | Qt.WindowMinimizeButtonHint  // 无边框，无标题栏，有系统菜单，最大化最小化按钮

    MouseArea {
        anchors.fill: parent
        property point clickPos: Qt.point(0, 0)

        onPressed : function(mouse) {
            clickPos = Qt.point(mouse.x, mouse.y)
        }

        onPositionChanged: function(mouse) {
            let delta = Qt.point(mouse.x - clickPos.x, mouse.y - clickPos.y)
            window.x += delta.x
            window.y += delta.y
        }
    }
}
