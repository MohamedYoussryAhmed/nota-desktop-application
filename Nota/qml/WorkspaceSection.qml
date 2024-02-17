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

                ScrollIndicator.vertical: ScrollIndicator {
                    contentItem: Rectangle {
                        implicitWidth: 5
                        implicitHeight: 100
                        radius: width
                        color: Theme.accentColor
                        opacity: parent.active ? 1 : 0

                        Behavior on opacity {
                            NumberAnimation {
                                duration: 1000
                                easing.type: Easing.Linear
                            }
                        }
                    }
                }

                delegate: Rectangle {
                    width: workspaceListView.width - 15 // margins for the scrollIndicator
                    height: 150
                    radius: 25
                    color: Theme.secondaryBackgroundColor
                }
            }
        }
    }
}
