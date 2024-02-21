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

    // GrayShades
    property color grayShade1: "#a2a2a2"
    property color grayShade2: "#bfbfbf"
    property color grayShade3: "#d3d3d3"
    property color grayShade4: "#f0f0f0"

}
