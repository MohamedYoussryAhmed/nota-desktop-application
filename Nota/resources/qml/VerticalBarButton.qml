import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtQuick.Templates as T

T.Button {
    id: _control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    padding: 10

    contentItem: RowLayout {
        spacing: 10

        Image {
            id: _contentIcon

            Layout.alignment: Qt.AlignVCenter
            Layout.preferredHeight: _control.icon.height
            Layout.preferredWidth: _control.icon.width
            fillMode: Image.PreserveAspectFit
            source: _control.icon.source
            sourceSize: Qt.size(_control.icon.width * 2,
                                _control.icon.height * 2)
        }

        Text {
            id: _contentTxt

            Layout.alignment: Qt.AlignVCenter
            Layout.fillWidth: true
            Layout.fillHeight: true
            font.family: "Ubuntu"
            text: _control.text
        }
    }

    background: Rectangle {
        id: _background

        implicitWidth: 120
        implicitHeight: 20
        radius: 5
        color: _control.hovered ? "#EEEEEE" : "transparent"
    }

    MouseArea {
        anchors.fill: parent
        cursorShape: _control.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
