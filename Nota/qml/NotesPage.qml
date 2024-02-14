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
                border.color: "#808080"
                radius: width / 2

                RowLayout {
                    anchors.centerIn: parent

                    Image {
                        Layout.preferredWidth: 18
                        Layout.preferredHeight: 18
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

        Rectangle {
            Layout.fillHeight: true
            Layout.fillWidth: true
            color: "#f6761f"
        }
    }
}
