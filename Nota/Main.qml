import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore

import Nota

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

    RowLayout {
        id: sectionsLayout

        objectName: "sectionsLayout"
        anchors.fill: parent

        SideBar {
            id: sidebarSection

            objectName: "sidebarSection"
            Layout.preferredWidth: parent.width * 0.15
            Layout.fillHeight: true
        }

        WorkspaceSection {
            id: workspaceSection

            objectName: "workspaceSection"
            Layout.preferredWidth: parent.width * 0.3
            Layout.fillHeight: true
        }

        MarkdownSection {
            id: markdownSection

            objectName: "markdownSection"
            Layout.fillWidth: true
            Layout.fillHeight: true
        }
    }
}
