pragma Singleton

import QtQuick

QtObject {
    id: root


    // Main
    property color accentColor: "#F6761F"

    // Font
    property string primaryFontFamily: "Ubuntu"
    property color secondaryFontColor: "#808080"

    // Background
    property color primaryBackgroundColor: "transparent"
    property color secondaryBackgroundColor: "#EEEEEE"
    property color borderBackgroundColor: "#808080"

    // Icon
    property int smallIconSize: 15
    property int mediumIconSize: 17
}
