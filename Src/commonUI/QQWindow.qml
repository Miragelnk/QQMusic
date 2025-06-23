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