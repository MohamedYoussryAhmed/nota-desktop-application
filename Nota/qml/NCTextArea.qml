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
        background: null
        placeholderText: "TextArea ...."

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
                                     || deleteBtn.hovered
                                     || underlineBtn.hovered
                                     || italicBtn.hovered || boldBtn.hovered

        anchors {
            bottom: parent.top
            bottomMargin: -15
            right: parent.right
        }
        width: childrenRect.width
        height: 40
        opacity: containerMouseArea.containsMouse || _textArea.hovered
                 || _controls.containsMouse ? 1 : 0
        border.color: Theme.grayShade1
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

                Layout.rightMargin: parent.spacing
                icon.source: "qrc:/icons/svg/trash.svg"

                onClicked: {
                    container.destroy()
                }
            }

            NCToolButton {
                id: underlineBtn

                text: "underlineBtn"
                icon.source: checked ? "qrc:/icons/svg/underline.svg" : "qrc:/icons/svg/u.svg"
                checkable: true

                onClicked: {
                    _textArea.font.underline = !_textArea.font.underline
                }
            }

            NCToolButton {
                id: italicBtn

                text: "italicBtn"
                icon.source: checked ? "qrc:/icons/svg/italic.svg" : "qrc:/icons/svg/i.svg"
                checkable: true

                onClicked: {
                    _textArea.font.italic = !_textArea.font.italic
                }
            }

            NCToolButton {
                id: boldBtn

                text: "boldBtn"
                Layout.leftMargin: parent.spacing
                icon.source: checked ? "qrc:/icons/svg/bold.svg" : "qrc:/icons/svg/b.svg"
                checkable: true

                onClicked: {
                    _textArea.font.bold = !_textArea.font.bold
                }
            }
        }
    }
}
