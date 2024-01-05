import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore

import "resources/qml"

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

    ColumnLayout {
        id: windowLayout

        objectName: "windowLayout"
        anchors.fill: parent

        Header {
            id: header

            objectName: "header"
            Layout.fillWidth: true
            Layout.preferredHeight: parent.height * 0.1
        }

        RowLayout {
            id: sectionsLayout

            objectName: "sectionsLayout"
            Layout.preferredWidth: parent.width
            Layout.fillHeight: true

            Rectangle {
                id: sidebarSection

                objectName: "sidebarSection"
                Layout.preferredWidth: parent.width * 0.15
                Layout.fillHeight: true
                color: "#a0a6a5"
            }

            Rectangle {
                id: notesSection

                objectName: "notesSection"
                Layout.preferredWidth: parent.width * 0.35
                Layout.fillHeight: true
                color: "#f6761f"
            }

            Rectangle {
                id: goalsSection

                objectName: "goalsSection"
                Layout.preferredWidth: parent.width * 0.5
                Layout.fillHeight: true
                color: "#474e41"
            }
        }
    }

    Component.onCompleted: {
        Driver.printHello()
    }
}
