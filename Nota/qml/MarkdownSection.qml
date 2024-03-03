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
            id: headerArea

            objectName: "headerArea"
            Layout.preferredHeight: 50
            Layout.fillWidth: true
            Layout.topMargin: root._margin

            Rectangle {
                id: headerContainer

                objectName: "headerContainer"
                anchors.centerIn: parent
                height: parent.height
                width: parent.width
                color: Theme.secondaryBackgroundColor
                radius: width
            }
        }

        Item {
            id: illustrationArea

            objectName: "illustrationArea"
            Layout.preferredHeight: pageLayout.height * 0.35
            Layout.fillWidth: true

            Image {
                anchors.centerIn: parent
                width: parent.width
                height: parent.height
                source: "qrc:/icons/illustrations/study.svg"
                fillMode: Image.PreserveAspectFit
            }
        }

        ScrollView {
            id: markdownScrollView

            objectName: "markdownScrollView"
            Layout.fillWidth: true
            Layout.fillHeight: true
            contentHeight: markdownLayout.height
            clip: false

            // TODO: Customize the ScrollBar
            Flow {
                id: markdownLayout

                objectName: "markdownLayout"
                anchors {
                    top: parent.top
                    left: parent.left
                    right: parent.right
                    topMargin: 25
                    leftMargin: 10
                    rightMargin: 20
                }

                onWidthChanged: {
                    // reset the width of the compnoent when change window width
                    for (var ncComponent of children)
                        ncComponent.width = width
                }
            }
        }

        Rectangle {
            id: markdownToolBar

            objectName: "markdownToolBar"
            Layout.fillWidth: true
            Layout.preferredHeight: 80

            RowLayout {
                id: toolBarLayout

                objectName: "toolBarLayout"
                anchors {
                    right: parent.right
                    verticalCenter: parent.verticalCenter
                    rightMargin: 30
                }
                layoutDirection: Qt.RightToLeft
                spacing: 10

                NCRoundButton {
                    id: addTextAreaBtn

                    icon.source: "qrc:/icons/svg/plus.svg"

                    onClicked: {
                        ncTextAreaComponent.createObject(markdownLayout, {
                                                             "width": markdownLayout.width
                                                         })
                    }
                }

                NCRoundButton {
                    icon.source: "qrc:/icons/svg/list.svg"
                }
            }
        }
    }

    Component {
        id: ncTextAreaComponent

        NCTextArea {}
    }
}
