//
//  File.swift
//  
//
//  Created by Alexandra Afonasova on 12.01.2023.
//

import SwiftUI
import SDWebImageSwiftUI


struct ChatNavigationModifier: ViewModifier {

    @Environment(\.presentationMode) private var presentationMode
    @Environment(\.chatTheme) private var theme
    
    let title: String
    let status: String?
    let cover: URL?
    
    func body(content: Content) -> some View {
        content
            .toolbar {
                //backButton
                infoToolbarItem
            }
    }
    
    private var backButton: some ToolbarContent {
        ToolbarItem(placement: .navigationBarLeading) {
            Button { presentationMode.wrappedValue.dismiss() } label: {
                theme.images.backButton
            }
        }
    }
    
    private var infoToolbarItem: some ToolbarContent {
        ToolbarItem(placement: .principal) {
            HStack {
                if let url = cover {
					WebImage(url: url)
						.resizable()
						.placeholder {
							Rectangle().fill(theme.colors.grayStatus)
						}
						.scaledToFill()
						.frame(width: 35, height: 35)
						.clipShape(Circle())
                }
                
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .fontWeight(.semibold)
                        .font(.headline)
						.foregroundColor(Color.gray800)
                    if let status = status {
                        Text(status)
                            .font(.footnote)
                            .foregroundColor(theme.colors.grayStatus)
                    }
                }
                Spacer()
            }
            .padding(.leading, 10)
        }
    }
    
}
