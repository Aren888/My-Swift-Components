//
//  Home.swift
//  TabIconsAnimatedSFSymbols
//
//  Created by Solicy Ios on 27.11.23.
//

import SwiftUI

struct Home: View {
    // MARK: - Properties
    
    // State to track the active tab
    @State private var activeTab: Tab = .photos
    
    // State to store all tabs as AnimatedTab objects
    @State private var allTabs: [AnimatedTab] = Tab.allCases.compactMap { tab in
        return .init(tab: tab)
    }
    
    // MARK: - Body
    
    var body: some View {
        VStack(spacing: 0) {
            TabView(selection: $activeTab) {
                // MARK: - Photos Tab
                
                NavigationStack {
                    VStack {
                        // TODO: Add content for the Photos tab
                    }
                    .navigationTitle(Tab.photos.title)
                }
                .setUpTab(.photos)
                
                // MARK: - Chat Tab
                
                NavigationStack {
                    VStack {
                        // TODO: Add content for the Chat tab
                    }
                    .navigationTitle(Tab.chat.title)
                }
                .setUpTab(.chat)
                
                // MARK: - Apps Tab
                
                NavigationStack {
                    VStack {
                        // TODO: Add content for the Apps tab
                    }
                    .navigationTitle(Tab.apps.title)
                }
                .setUpTab(.apps)
                
                // MARK: - Notifications Tab
                
                NavigationStack {
                    VStack {
                        // TODO: Add content for the Notifications tab
                    }
                    .navigationTitle(Tab.notifications.title)
                }
                .setUpTab(.notifications)
                
                // MARK: - Profile Tab
                
                NavigationStack {
                    VStack {
                        // TODO: Add content for the Profile tab
                    }
                    .navigationTitle(Tab.profile.title)
                }
                .setUpTab(.profile)
            }
            
            // Custom Tab Bar
            CustomTabBar()
        }
    }
    
    // MARK: - Custom Tab Bar
    
    @ViewBuilder
    func CustomTabBar() -> some View {
        HStack(spacing: 0) {
            ForEach($allTabs) { $animatedTab in
                let tab = animatedTab.tab
                VStack(spacing: 4) {
                    Image(systemName: tab.rawValue)
                        .font(.title2)
                        .symbolEffect(.bounce.down.byLayer, value: animatedTab.isAnimating)
                    Text(tab.title)
                        .font(.caption2)
                        .textScale(.secondary)
                }
                .frame(maxWidth: .infinity)
                .foregroundStyle(activeTab == tab ? Color.primary : Color.gray.opacity(0.8))
                .padding(.top, 15)
                .padding(.bottom, 10)
                .contentShape(.rect)
                .onTapGesture {
                    withAnimation(.bouncy, completionCriteria: .logicallyComplete, {
                        activeTab = tab
                        animatedTab.isAnimating = true
                    }, completion: {
                        var transaction = Transaction()
                        transaction.disablesAnimations = true
                        withTransaction(transaction) {
                            animatedTab.isAnimating = nil
                        }
                    })
                }
            }
        }
        .background(.bar)
    }
}

// MARK: - Preview

#Preview {
    ContentView()
}

// MARK: - Extension

extension View {
    @ViewBuilder
    func setUpTab(_ tab: Tab) -> some View {
        self
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .tag(tab)
            .toolbar(.hidden, for: .tabBar)
    }
}
