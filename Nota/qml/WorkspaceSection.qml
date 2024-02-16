import QtQuick
import QtQuick.Layouts
import QtQuick.Controls

Item {
    id: root

    property int _margin: 20

    implicitWidth: 400
    implicitHeight: 700

    ColumnLayout {
        id: pageLayout

        objectName: "pageLayout"
        anchors.fill: parent

        Item {
            id: searchBarArea

            objectName: "searchBarArea"
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.topMargin: root._margin

            Rectangle {
                id: searchBarContainer

                objectName: "searchBarContainer"
                anchors.centerIn: parent
                height: parent.height * 0.8
                width: parent.width * 0.8
                border.width: 1
                border.color: Theme.borderBackgroundColor
                radius: width / 2

                RowLayout {
                    anchors.centerIn: parent

                    Image {
                        Layout.preferredWidth: Theme.mediumIconSize
                        Layout.preferredHeight: Theme.mediumIconSize
                        source: "qrc:/icons/svg/search.svg"
                        fillMode: Image.PreserveAspectFit
                        sourceSize: Qt.size(Layout.preferredWidth * 1.5,
                                            Layout.preferredHeight * 1.5)
                    }

                    TextField {
                        Layout.maximumWidth: 200
                        placeholderText: "Search notes"
                        // transparent background
                        background: null
                    }
                }
            }
        }

        Item {
            id: workspaceArea

            objectName: "workspaceArea"
            Layout.fillHeight: true
            Layout.fillWidth: true

            Text {
                id: workspaceTitle

                objectName: "workspaceTitle"
                topPadding: 30
                bottomPadding: 30
                text: "Workspace"
                font.pixelSize: 25
                font.bold: true
            }

            // just for test
            ListView {
                id: workspaceListView

                objectName: "workspaceListView"
                anchors {
                    top: workspaceTitle.bottom
                    bottom: parent.bottom
                    left: parent.left
                    right: parent.right
                }
                model: 15
                clip: true
                spacing: 10

                // TODO: we should design scrollBar for our application
                ScrollBar.vertical: ScrollBar {}

                delegate: Rectangle {
                    width: workspaceListView.width
                    height: 150
                    radius: 25
                    color: Theme.secondaryBackgroundColor
                }
            }
        }
    }
}
