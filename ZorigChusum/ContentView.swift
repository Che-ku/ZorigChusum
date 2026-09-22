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
                    ForEach(filteredCrafts) { craft in
                        NavigationLink(value: craft) {
                            CraftRowView(craft: craft)
                        }
                    }
                } header: {
                    Text("Bhutan's traditional arts and crafts")
                } footer: {
                    Text("\(filteredCrafts.count) of \(CraftData.all.count) crafts")
                }
            }
            .listStyle(.insetGrouped)
            .navigationTitle("Zorig Chusum")
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
}

#Preview {
    ContentView()
}

