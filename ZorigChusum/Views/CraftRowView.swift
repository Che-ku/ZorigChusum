import SwiftUI

struct CraftRowView: View {
    let craft: Craft

    var body: some View {
        HStack(spacing: 16) {
            Image(systemName: craft.imageName)
                .font(.title2)
                .foregroundStyle(.white)
                .frame(width: 48, height: 48)
                .background(Color.bhutanOrange.gradient)
                .clipShape(RoundedRectangle(cornerRadius: 12))

            VStack(alignment: .leading, spacing: 4) {
                Text(craft.name)
                    .font(.headline)
                    .foregroundStyle(.primary)

                Text(craft.englishName)
                    .font(.subheadline)
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 6)
        .accessibilityElement(children: .combine)
        .accessibilityLabel("\(craft.name), \(craft.englishName)")
    }
}

#Preview {
    List {
        CraftRowView(craft: CraftData.all[0])
    }
}

