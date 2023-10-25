//
//  Created by Alex.M on 20.06.2022.
//

import SwiftUI
import SDWebImageSwiftUI


struct AttachmentsPage: View {

    @EnvironmentObject var mediaPagesViewModel: FullscreenMediaPagesViewModel
    @Environment(\.chatTheme) private var theme

    let attachment: Attachment

    var body: some View {
        if attachment.type == .image {
			WebImage(url: attachment.full)
				.resizable()
				.indicator(.activity)
				.aspectRatio(contentMode: .fit)
		} else if attachment.type == .video {
            VideoView(viewModel: VideoViewModel(attachment: attachment))
        } else {
            Rectangle()
                .foregroundColor(Color.gray)
                .frame(minWidth: 100, minHeight: 100)
                .frame(maxHeight: 200)
                .overlay {
                    Text("Unknown")
                }
        }
    }
}
