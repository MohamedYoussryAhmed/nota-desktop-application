import QtQuick
import QtQuick.Controls
import QtCore

Window {
    id: window

    width: 1200
    height: 700
    minimumWidth: 1200
    minimumHeight: 700
    visible: true
    title: "Nota Application"

    Settings {
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }


}
