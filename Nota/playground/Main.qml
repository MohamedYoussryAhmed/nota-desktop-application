import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import QtCore

Window {
    id: window

    width: 500
    height: 500
    minimumWidth: 500
    minimumHeight: 500
    visible: true
    title: "Nota Application"

    Settings {
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }

    Component {
        id: ncTextArea

        Rectangle {
            id: textAreaContainer

            property alias placeholderText: _textArea.placeholderText

            objectName: "textAreaContainer"
            implicitWidth: 200
            height: _textArea.height + 20 // top and bottom margins
            color: containerMouseArea.containsMouse || _textArea.hovered
                   || _textControls.containsMouse ? "#f6f6f6" : "transparent"

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

                background: Item {}

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
                id: _textControls

                property bool containsMouse: textControlsMouseaArea.containsMouse
                                             || i.hovered || d.hovered
                                             || f.hovered || c.hovered

                anchors {
                    bottom: parent.top
                    bottomMargin: -15
                    right: parent.right
                }
                width: childrenRect.width
                height: 40
                opacity: containerMouseArea.containsMouse || _textArea.hovered
                         || _textControls.containsMouse ? 1 : 0
                border.color: "gray"
                radius: 5

                MouseArea {
                    id: textControlsMouseaArea

                    anchors.fill: parent
                    hoverEnabled: true
                }

                RowLayout {
                    id: controlsLayout

                    anchors.verticalCenter: parent.verticalCenter

                    Button {
                        id: i
                        text: "i"
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30
                        Layout.leftMargin: parent.spacing

                        onClicked: {
                            _textArea.font.pixelSize += 1
                        }
                    }

                    Button {
                        id: d

                        text: "d"
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30

                        onClicked: {
                            _textArea.font.pixelSize -= 1
                        }
                    }

                    Button {
                        id: f

                        text: "f"
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30

                        onClicked: {
                            _textArea.font.family = "Helvetica"
                        }
                    }

                    Button {
                        id: c

                        text: "c"
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30
                        Layout.rightMargin: parent.spacing

                        onClicked: {
                            _textArea.color = "red"
                        }
                    }
                }

                Behavior on opacity {
                    NumberAnimation {
                        duration: 500
                        easing.type: Easing.Linear
                    }
                }
            }
        }
    }

    ColumnLayout {
        id: mainLayout

        objectName: "mainLayout"
        anchors.centerIn: parent
        width: 300

        Component.onCompleted: {
            // to create instance from ncTextArea
            ncTextArea.createObject(mainLayout, {
                                               "placeholderText": "New TextArea ... ",
                                               "Layout.preferredWidth": mainLayout.width
                                           })
        }
    }
}
