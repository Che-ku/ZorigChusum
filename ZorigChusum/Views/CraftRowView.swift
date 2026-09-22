import SwiftUI

struct CraftRowView: View {
    let craft: Craft

    var body: some View {
        HStack(spacing: 16) {
            Group {
                if let photoName = craft.photoName {
                    Image(photoName)
                        .resizable()
                        .scaledToFill()
                } else {
                    Image(systemName: craft.imageName)
                        .font(.title2)
                        .foregroundStyle(.white)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.bhutanOrange.gradient)
                }
            }
            .frame(width: 58, height: 52)
            .clipShape(RoundedRectangle(cornerRadius: 12))
            .overlay {
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.bhutanGold.opacity(0.55), lineWidth: 1)
            }

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
