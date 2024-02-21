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
    title: "Nota Playground"

    Settings {
        property alias x: window.x
        property alias y: window.y
        property alias width: window.width
        property alias height: window.height
    }

    Component {
        id: ncTextArea

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

                placeholderText: "TextArea .... "

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

                    Button {
                        id: deleteBtn

                        icon.source: "qrc:/qt/qml/Nota/trash.svg"
                        icon.width: 15
                        icon.height: 15
                        Layout.preferredWidth: 30
                        Layout.preferredHeight: 30
                        Layout.rightMargin: parent.spacing

                        onClicked: {
                           container.destroy()
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
                        Layout.leftMargin: parent.spacing

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

    ScrollView {
        anchors.fill: parent

        Flow {
            id: mainLayout

            objectName: "mainLayout"
            width: parent.width

            Repeater {
                model: 30

                delegate: ncTextArea
            }
        }
    }


}
