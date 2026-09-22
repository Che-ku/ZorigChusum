import SwiftUI

struct CraftDetailView: View {
    let craft: Craft
    @State private var isVisited = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                Image(systemName: craft.imageName)
                    .resizable()
                    .scaledToFit()
                    .symbolRenderingMode(.hierarchical)
                    .foregroundStyle(Color.bhutanOrange)
                    .padding(44)
                    .frame(maxWidth: .infinity)
                    .frame(height: 260)
                    .background(Color.bhutanGold.opacity(0.22).gradient)
                    .clipShape(RoundedRectangle(cornerRadius: 24))
                    .accessibilityHidden(true)

                VStack(alignment: .leading, spacing: 8) {
                    Text(craft.name)
                        .font(.largeTitle.bold())

                    Text(craft.englishName)
                        .font(.title3)
                        .foregroundStyle(Color.bhutanOrange)
                }

                Divider()

                Text("About this craft")
                    .font(.headline)

                Text(craft.description)
                    .font(.body)
                    .foregroundStyle(.secondary)
                    .lineSpacing(6)

                Toggle(isOn: $isVisited) {
                    HStack(spacing: 10) {
                        Image(systemName: isVisited ? "checkmark.seal.fill" : "checkmark.seal")
                            .foregroundStyle(isVisited ? .green : .secondary)
                        Text("I have seen this craft")
                            .fontWeight(.medium)
                    }
                }
                .tint(Color.bhutanOrange)
                .padding()
                .background(Color(.secondarySystemBackground))
                .clipShape(RoundedRectangle(cornerRadius: 16))

                Spacer(minLength: 12)
            }
            .padding()
        }
        .navigationTitle(craft.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationStack {
        CraftDetailView(craft: CraftData.all[9])
    }
}

