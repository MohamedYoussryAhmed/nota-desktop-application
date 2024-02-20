import QtQuick
import QtQuick.Controls
import QtQuick.Layouts

import Nota

Rectangle {
    id: container

    property alias placeholderText: _textArea.placeholderText

    objectName: "container"
    implicitWidth: 200
    height: _textArea.height + 20 // top and bottom margins
    color: containerMouseArea.containsMouse || _textArea.hovered
           || _controls.containsMouse ? "#f6f6f6" : "transparent"

    MouseArea {
        id: containerMouseArea

        objectName: "containerMouseArea"
        anchors.fill: parent
        hoverEnabled: true
    }

    TextArea {
        id: _textArea

        anchors {
            verticalCenter: parent.verticalCenter
            left: parent.left
            leftMargin: 10
        }

        placeholderText: "TextArea ...."

        background: null

        Keys.onReturnPressed: function (event) {
            if (event.modifiers & Qt.ControlModifier)
                insert(_textArea.text.length, "\n")
            else
                editingFinished()
        }

        onEditingFinished: {
            _textArea.text = text
            focus = false
        }
    }

    Rectangle {
        id: _controls

        property bool containsMouse: controlsMouseArea.containsMouse
                                     || deleteBtn.hovered || d.hovered
                                     || f.hovered || c.hovered

        anchors {
            bottom: parent.top
            bottomMargin: -15
            right: parent.right
        }
        width: childrenRect.width
        height: 40
        opacity: containerMouseArea.containsMouse || _textArea.hovered
                 || _controls.containsMouse ? 1 : 0
        border.color: "gray"
        radius: 5

        MouseArea {
            id: controlsMouseArea

            anchors.fill: parent
            hoverEnabled: true
        }

        RowLayout {
            layoutDirection: Qt.RightToLeft
            anchors.verticalCenter: parent.verticalCenter

            NCToolButton {
                id: deleteBtn

                icon.source: "qrc:/icons/svg/trash.svg"
                icon.width: 15
                icon.height: 15
                Layout.preferredWidth: 30
                Layout.preferredHeight: 30
                Layout.rightMargin: parent.spacing

                onClicked: {
                    container.destroy()
                }
            }

            NCToolButton {
                id: d

                text: "d"
                Layout.preferredWidth: 30
                Layout.preferredHeight: 30

                onClicked: {
                    _textArea.font.pixelSize -= 1
                }
            }

            NCToolButton {
                id: f

                text: "f"
                Layout.preferredWidth: 30
                Layout.preferredHeight: 30

                onClicked: {
                    _textArea.font.family = "Helvetica"
                }
            }

            NCToolButton {
                id: c

                text: "c"
                Layout.preferredWidth: 30
                Layout.preferredHeight: 30
                Layout.leftMargin: parent.spacing

                onClicked: {
                    _textArea.color = "red"
                }
            }
        }

        Behavior on opacity {
            NumberAnimation {
                duration: 200
                easing.type: Easing.Linear
            }
        }
    }
}
