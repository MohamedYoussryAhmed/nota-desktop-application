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

        Rectangle {
            id: markdownScrollView

            objectName: "markdownScrollView"
            Layout.fillWidth: true
            Layout.fillHeight: true
            color: Theme.secondaryBackgroundColor
        }
    }
}
