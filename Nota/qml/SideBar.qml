import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root

    property int _margin: 20
    property int _columnLeftMargin: 5

    implicitWidth: 180
    implicitHeight: 700

    Image {
        id: logo

        objectName: "logo"
        anchors {
            top: parent.top
            horizontalCenter: parent.horizontalCenter
            topMargin: root._margin
        }
        width: 50
        height: 50
        sourceSize: Qt.size(width, height)
        fillMode: Image.PreserveAspectFit
        source: "qrc:/icons/logo.png"
    }

    ColumnLayout {
        id: sectionsLayout

        objectName: "sectionsLayout"
        anchors {
            top: logo.bottom
            left: parent.left
            right: parent.right
            topMargin: root._margin
            leftMargin: root._columnLeftMargin
        }

        VerticalBarButton {
            id: templatesBtn

            objectName: "templatesBtn"
            Layout.fillWidth: true
            text: "Templates"
            icon.source: "qrc:/icons/svg/duplicate.svg"
            icon.width: 18
            icon.height: 18
            flat: true
        }

        VerticalBarButton {
            id: importBtn

            objectName: "importBtn"
            Layout.fillWidth: true
            text: "Import"
            icon.source: "qrc:/icons/svg/download.svg"
            icon.width: 18
            icon.height: 18
            flat: true
        }

        VerticalBarButton {
            id: trashBtn

            objectName: "trashBtn"
            Layout.fillWidth: true
            text: "Trash"
            icon.source: "qrc:/icons/svg/trash.svg"
            icon.width: 18
            icon.height: 18
            flat: true
        }
    }

    Text {
        id: workspaceTitle

        objectName: "workspaceTitle"
        anchors {
            top: sectionsLayout.bottom
            horizontalCenter: parent.horizontalCenter
            topMargin: root._margin
        }
        text: "WORKSPACE"
        color: "#808080"
    }

    ColumnLayout {
        id: workspaceLayout

        objectName: "workspaceLayout"
        anchors {
            top: workspaceTitle.bottom
            right: parent.right
            left: parent.left
            topMargin: root._margin
            leftMargin: root._columnLeftMargin
        }

        VerticalBarButton {
            id: tasksBtn

            objectName: "tasksBtn"
            Layout.fillWidth: true
            text: "Tasks"
            icon.source: "qrc:/icons/svg/hastag.svg"
            icon.width: 18
            icon.height: 18
            flat: true
        }

        VerticalBarButton {
            id: developmentBtn

            objectName: "developmentBtn"
            Layout.fillWidth: true
            text: "Development"
            icon.source: "qrc:/icons/svg/square-terminal.svg"
            icon.width: 18
            icon.height: 18
            flat: true
        }

        VerticalBarButton {
            id: achievementsBtn

            objectName: "achievementsBtn"
            Layout.fillWidth: true
            text: "Achievements"
            icon.source: "qrc:/icons/svg/trophy.svg"
            icon.width: 18
            icon.height: 18
            flat: true
        }
    }

    VerticalBarButton {
        id: addPageBtn

        objectName: "addPageBtn"
        anchors {
            bottom: parent.bottom
            left: parent.left
            right: parent.right
            bottomMargin: root._margin
            leftMargin: root._columnLeftMargin
        }
        text: "New Page"
        icon.source: "qrc:/icons/svg/add.svg"
        icon.width: 18
        icon.height: 18
        flat: true

        onClicked: Client.addTable("MY GOALS")
    }
}