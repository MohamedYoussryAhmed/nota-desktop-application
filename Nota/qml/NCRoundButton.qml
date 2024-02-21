import QtQuick
import QtQuick.Controls
import QtQuick.Templates as T

T.RoundButton {
    id: control

    implicitWidth: Math.max(implicitBackgroundWidth + leftInset + rightInset,
                            implicitContentWidth + leftPadding + rightPadding)
    implicitHeight: Math.max(implicitBackgroundHeight + topInset + bottomInset,
                             implicitContentHeight + topPadding + bottomPadding)

    icon.width: Theme.smallIconSize
    icon.height: Theme.smallIconSize

    contentItem: IconLabel {
        spacing: control.spacing
        mirrored: control.mirrored
        display: control.display

        icon: control.icon
        text: control.text
        font: control.font
    }

    background: Rectangle {
        implicitWidth: 40
        implicitHeight: 40
        radius: control.radius
        opacity: enabled ? 1 : 0.3
        color: {
            if (control.down)
                return Theme.grayShade2
            else if (control.hovered)
                return Theme.grayShade3
            else
                return Theme.grayShade4
        }
    }

    HoverHandler {
        cursorShape: control.hovered ? Qt.PointingHandCursor : Qt.ArrowCursor
    }
}
