import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

T.ToolButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    icon.width: Theme.tinyIconSize
    icon.height: Theme.tinyIconSize

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: AbstractButton.IconOnly

        icon: control.icon
        text: control.text
        font: control.font
    }

    background: Rectangle {
        implicitWidth: 28
        implicitHeight: 28
        opacity: enabled ? 1 : 0.3
        radius: 5
        color: {
            if (control.down)
                return Theme.grayShade3
            else if (control.hovered)
                return Theme.grayShade4
            else
                return "transparent"
        }
    }

    HoverHandler {
        cursorShape: control.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
