import SwiftUI

struct CraftDetailView: View {
    let craft: Craft
    @State private var isVisited = false

    var body: some View {
        ZStack {
            LinearGradient(
                colors: [Color.bhutanGold.opacity(0.28), Color.bhutanCream, .white],
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()

            ScrollView {
                VStack(alignment: .leading, spacing: 24) {
                Group {
                    if let photoName = craft.photoName {
                        Image(photoName)
                            .resizable()
                            .scaledToFill()
                    } else {
                        Image(systemName: craft.imageName)
                            .resizable()
                            .scaledToFit()
                            .symbolRenderingMode(.hierarchical)
                            .foregroundStyle(Color.bhutanOrange)
                            .padding(44)
                            .background(Color.bhutanGold.opacity(0.22).gradient)
                    }
                }
                .frame(maxWidth: .infinity)
                .frame(height: 260)
                .clipShape(RoundedRectangle(cornerRadius: 24))
                .overlay(alignment: .bottomLeading) {
                    if craft.photoName != nil {
                        Text(craft.englishName)
                            .font(.headline)
                            .foregroundStyle(.white)
                            .padding(.horizontal, 14)
                            .padding(.vertical, 8)
                            .background(.black.opacity(0.62), in: Capsule())
                            .padding(14)
                    }
                }
                .accessibilityLabel("Photo representing \(craft.englishName)")

                    VStack(alignment: .leading, spacing: 8) {
                        Text(craft.name)
                            .font(.largeTitle.bold())

                        Text(craft.englishName)
                            .font(.title3)
                            .foregroundStyle(Color.bhutanOrange)
                    }

                    Divider()
                        .overlay(Color.bhutanOrange.opacity(0.55))

                    Text("About this craft")
                        .font(.headline)
                        .foregroundStyle(Color.bhutanOrange)

                    Text(craft.description)
                        .font(.body)
                        .foregroundStyle(.secondary)
                        .lineSpacing(6)

                    Toggle(isOn: $isVisited) {
                        HStack(spacing: 10) {
                            Image(systemName: isVisited ? "checkmark.seal.fill" : "checkmark.seal")
                                .foregroundStyle(isVisited ? .green : Color.bhutanOrange)
                            Text("I have seen this craft")
                                .fontWeight(.medium)
                        }
                    }
                    .tint(Color.bhutanOrange)
                    .padding()
                    .background(Color.bhutanGold.opacity(0.24))
                    .clipShape(RoundedRectangle(cornerRadius: 16))
                    .overlay {
                        RoundedRectangle(cornerRadius: 16)
                            .stroke(Color.bhutanOrange.opacity(0.25), lineWidth: 1)
                    }

                    Spacer(minLength: 12)
                }
                .padding()
            }
        }
        .navigationTitle(craft.name)
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(Color.bhutanOrange, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        CraftDetailView(craft: CraftData.all[9])
    }
}
