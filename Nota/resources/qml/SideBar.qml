import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root

    property int _margin: 20

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
        source: "qrc:/Nota/resources/icons/logo.png"
    }

    ColumnLayout {
        id: sectionsLayout

        objectName: "sectionsLayout"
        anchors {
            top: logo.bottom
            left: parent.left
            topMargin: root._margin
            leftMargin: root._margin
        }

        Button {
            id: templatesBtn

            objectName: "templatesBtn"
            text: "Templates"
            icon.source: "qrc:/Nota/resources/icons/svg/duplicate.svg"
            icon.width: 15
            icon.height: 15
            flat: true
        }

        Button {
            id: importBtn

            objectName: "importBtn"
            text: "Import"
            icon.source: "qrc:/Nota/resources/icons/svg/download.svg"
            icon.width: 15
            icon.height: 15
            flat: true
        }

        Button {
            id: trashBtn

            objectName: "trashBtn"
            text: "Trash"
            icon.source: "qrc:/Nota/resources/icons/svg/trash.svg"
            icon.width: 15
            icon.height: 15
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
        font.family: "Ubuntu"
        color: "#808080"
    }

    ColumnLayout {
        id: workspaceLayout

        objectName: "workspaceLayout"
        anchors {
            top: workspaceTitle.bottom
            left: parent.left
            topMargin: root._margin
            leftMargin: root._margin
        }

        Button {
            id: templatesBtn2

            objectName: "templatesBtn"
            text: "Templates"
            icon.source: "qrc:/Nota/resources/icons/svg/duplicate.svg"
            icon.width: 15
            icon.height: 15
            flat: true
        }

        Button {
            id: importBtn2

            objectName: "importBtn"
            text: "Import"
            icon.source: "qrc:/Nota/resources/icons/svg/download.svg"
            icon.width: 15
            icon.height: 15
            flat: true
        }

        Button {
            id: trashBtn2

            objectName: "trashBtn"
            text: "Trash"
            icon.source: "qrc:/Nota/resources/icons/svg/trash.svg"
            icon.width: 15
            icon.height: 15
            flat: true
        }
    }

    Button {
        id: addPageBtn

        objectName: "addPageBtn"
        anchors {
            bottom: parent.bottom
            horizontalCenter: parent.horizontalCenter
            bottomMargin: root._margin
        }
        text: "New Page"
        icon.source: "qrc:/Nota/resources/icons/svg/add-solid.svg"
        icon.width: 15
        icon.height: 15
        flat: true
    }
}
