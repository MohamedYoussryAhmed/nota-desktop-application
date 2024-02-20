import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore

Window {
    id: window

    width: 500
    height: 500
    minimumWidth: 500
    minimumHeight: 500
    visible: true
    title: "Nota Application"

    Settings {
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }

    Rectangle {
        id: rec

        anchors.centerIn: parent
        width: 50
        height: 50
        color: "red"
    }
}
