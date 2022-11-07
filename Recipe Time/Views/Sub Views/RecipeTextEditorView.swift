//
//  RecipeTextEditor.swift
//  Recipe Time
//
//  Created by M W on 04/11/2022.
//

import SwiftUI

struct RecipeTextEditorView: View {
    @State var textEditorTitle: String
    @State var textEditorText: String

    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(textEditorTitle)
                Spacer()
            }.padding(.horizontal)

            TextEditor(text: $textEditorText)
                .lineLimit(2)
                .font(.title2)
                .frame(height: 100)
                .background(RoundedRectangle(cornerRadius: 0.5).stroke())
                .padding()
            Spacer()
        }
    }
}

struct RecipeTextEditor_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTextEditorView(textEditorTitle: "Title", textEditorText: "Lorem impsum")
    }
}
