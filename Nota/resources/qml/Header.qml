import QtQuick
import QtQuick.Layouts

Item {
    id: root

    implicitWidth: 1200
    implicitHeight: 700

    RowLayout {
        id: headerLayout

        objectName: "headerLayout"
        anchors {
            fill: parent
            margins: 20
        }

        Image {
            id: logo

            Layout.alignment: Qt.AlignLeft | Qt.AlignHCenter
            Layout.preferredHeight: 50
            Layout.preferredWidth: 50
            fillMode: Image.PreserveAspectFit
            sourceSize: Qt.size(50, 50)
            source: "qrc:/Nota/resources/icons/logo.png"
        }
    }
}
