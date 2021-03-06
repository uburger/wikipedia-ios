import UIKit

/// Provides image, font, and color styles based on theme and notification type
struct NotificationsCenterCellStyle {

    // MARK: - Properties

    let theme: Theme
    let traitCollection: UITraitCollection
    let notificationType: RemoteNotificationType

    // MARK: - Colors

    var cellSeparatorColor: UIColor {
        return theme.colors.tertiaryText.withAlphaComponent(0.5)
    }

    func headerTextColor(_ displayState: NotificationsCenterCellDisplayState) -> UIColor {
        guard displayState.isUnread else {
            return theme.colors.secondaryText
        }

        switch notificationType {
        case .loginFailKnownDevice, .loginFailUnknownDevice, .loginSuccessUnknownDevice, .unknownAlert, .unknownSystemAlert:
            return theme.colors.error
        default:
            return theme.colors.primaryText
        }
    }

    func subheaderTextColor(_ displayState: NotificationsCenterCellDisplayState) -> UIColor {
        return theme.colors.secondaryText
    }

    var messageTextColor: UIColor {
        return theme.colors.secondaryText
    }

    var metadataTextColor: UIColor {
        return theme.colors.secondaryText
    }

    var relativeTimeAgoColor: UIColor {
        return theme.colors.secondaryText
    }

    var projectSourceColor: UIColor {
        return theme.colors.secondaryText
    }

    func leadingImageBackgroundColor(_ displayState: NotificationsCenterCellDisplayState) -> UIColor {
        if displayState.isSelectionDisplay {
            let color = displayState.isSelected ? theme.colors.link : .clear
            return color
        }

        return notificationType.imageBackgroundColorWithTheme(theme)
    }

    func leadingImageBorderColor(_ displayState: NotificationsCenterCellDisplayState) -> UIColor {
        if displayState.isSelectionDisplay {
            let color = displayState.isSelected ? theme.colors.link : theme.colors.secondaryText
            return color
        }

        return leadingImageBackgroundColor(displayState)
    }

    var leadingImageTintColor: UIColor {
        return theme.colors.paperBackground
    }

    var selectedCellBackgroundColor: UIColor {
        return theme.colors.batchSelectionBackground
    }

    // MARK: - Fonts

    func headerFont(_ displayState: NotificationsCenterCellDisplayState) -> UIFont {
        if displayState.isRead {
            return UIFont.wmf_font(.subheadline, compatibleWithTraitCollection: traitCollection)
        }

        return UIFont.wmf_font(.boldSubheadline, compatibleWithTraitCollection: traitCollection)
    }

    func subheaderFont(_ displayState: NotificationsCenterCellDisplayState) -> UIFont {
        if displayState.isRead {
            return UIFont.wmf_font(.footnote, compatibleWithTraitCollection: traitCollection)
        }

        return UIFont.wmf_font(.boldFootnote, compatibleWithTraitCollection: traitCollection)
    }

    var messageFont: UIFont {
        return UIFont.wmf_font(.footnote, compatibleWithTraitCollection: traitCollection)
    }

    func metadataFont(_ displayState: NotificationsCenterCellDisplayState) -> UIFont {
        if displayState.isRead {
            return UIFont.wmf_font(.footnote, compatibleWithTraitCollection: traitCollection)
        }

        return UIFont.wmf_font(.mediumFootnote, compatibleWithTraitCollection: traitCollection)
    }

    func relativeTimeAgoFont(_ displayState: NotificationsCenterCellDisplayState) -> UIFont {
        if displayState.isRead {
            return UIFont.wmf_font(.footnote, compatibleWithTraitCollection: traitCollection)
        }

        return UIFont.wmf_font(.boldFootnote, compatibleWithTraitCollection: traitCollection)
    }

    var projectSourceFont: UIFont {
        return UIFont.wmf_font(.caption2, compatibleWithTraitCollection: traitCollection)
    }

    // MARK: - Images

    func leadingImage(_ displayState: NotificationsCenterCellDisplayState) -> UIImage? {
        guard !displayState.isEditing else {
            let image = displayState.isSelected ? UIImage(named: "notifications-center-checkmark") : nil
            return image
        }
        
        if let imageName = notificationType.imageName {
            return UIImage(named: imageName)
        }
        
        return nil
    }

}
