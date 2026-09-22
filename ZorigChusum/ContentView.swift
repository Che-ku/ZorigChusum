import SwiftUI

struct ContentView: View {
    @State private var searchText = ""

    private var filteredCrafts: [Craft] {
        guard !searchText.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return CraftData.all
        }

        return CraftData.all.filter { craft in
            craft.name.localizedCaseInsensitiveContains(searchText)
                || craft.englishName.localizedCaseInsensitiveContains(searchText)
        }
    }

    var body: some View {
        NavigationStack {
            List {
                Section {
                    HStack(spacing: 14) {
                        Image(systemName: "sun.max.fill")
                            .font(.title2)
                            .foregroundStyle(.white)
                            .frame(width: 48, height: 48)
                            .background(Color.bhutanOrange, in: Circle())

                        VStack(alignment: .leading, spacing: 3) {
                            Text("བཟོ་རིག་པ་བཅུ་གསུམ།")
                                .font(.headline)
                            Text("The Thirteen Traditional Arts of Bhutan")
                                .font(.caption)
                                .foregroundStyle(.secondary)
                        }
                    }
                    .padding(.vertical, 8)
                }
                .listRowBackground(Color.bhutanGold.opacity(0.30))

                Section {
                    ForEach(filteredCrafts) { craft in
                        NavigationLink(value: craft) {
                            CraftRowView(craft: craft)
                        }
                        .listRowBackground(Color.bhutanCream.opacity(0.94))
                    }
                } header: {
                    Text("Bhutan's traditional arts and crafts")
                } footer: {
                    Text("\(filteredCrafts.count) of \(CraftData.all.count) crafts")
                }
            }
            .listStyle(.insetGrouped)
            .scrollContentBackground(.hidden)
            .background {
                LinearGradient(
                    colors: [Color.bhutanGold.opacity(0.45), Color.bhutanOrange.opacity(0.16)],
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .ignoresSafeArea()
            }
            .navigationTitle("Zorig Chusum")
            .toolbarBackground(Color.bhutanOrange, for: .navigationBar)
            .toolbarBackground(.visible, for: .navigationBar)
            .toolbarColorScheme(.dark, for: .navigationBar)
            .navigationDestination(for: Craft.self) { craft in
                CraftDetailView(craft: craft)
            }
            .searchable(text: $searchText, prompt: "Search crafts")
            .overlay {
                if filteredCrafts.isEmpty {
                    ContentUnavailableView.search(text: searchText)
                }
            }
        }
        .tint(Color.bhutanOrange)
    }
}

extension Color {
    static let bhutanOrange = Color(red: 0.91, green: 0.34, blue: 0.08)
    static let bhutanGold = Color(red: 1.00, green: 0.76, blue: 0.18)
    static let bhutanCream = Color(red: 1.00, green: 0.96, blue: 0.82)
}

#Preview {
    ContentView()
}
