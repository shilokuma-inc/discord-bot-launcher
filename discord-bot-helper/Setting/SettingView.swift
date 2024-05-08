//
//  SettingView.swift
//  discord-bot-helper
//
//  Created by 村石 拓海 on 2024/04/30.
//

import SwiftUI

struct SettingView: View {
    let appInfo = AppInfo()
    @State private var isURLSettingPresented = false
    @State private var isPrivacyPolicyPresented = false

    var body: some View {
        NavigationStack {
            ZStack {
                Color.discordDarkGray
                    .ignoresSafeArea(edges: [.top])
                List {
                    Section(content: {
                        Button {
                            isURLSettingPresented = true
                        } label: {
                            Text("URL設定")
                                .foregroundStyle(.white)
                        }
                        .listRowBackground(Color.discordGray)
                        .navigationDestination(isPresented: $isURLSettingPresented) {
                            WebhookURLSettingView()
                        }
                        .disabled(true)
                    }, header: {
                        Text("送信先URL設定")
                            .foregroundStyle(.white)
                    })

                    Section(content: {
                        Text("このアプリについて")
                            .foregroundStyle(.white)
                            .listRowBackground(Color.discordGray)

                        Button {
                            isPrivacyPolicyPresented = true
                        } label: {
                            HStack {
                                Text("プライバシーポリシー")
                                    .foregroundStyle(.white)

                                Spacer()

                                Image(systemName: "chevron.right")
                                    .foregroundStyle(.gray)
                            }
                        }
                        .listRowBackground(Color.discordGray)
                        .navigationDestination(isPresented: $isPrivacyPolicyPresented) {
                            PrivacyPolicyView()
                        }

                        Text("ライセンス")
                            .foregroundStyle(.white)
                            .listRowBackground(Color.discordGray)

                        HStack {
                            Text("アプリバージョン")
                                .foregroundStyle(.white)

                            Spacer()

                            Text(appInfo.getVersion())
                                .foregroundStyle(.gray)
                        }
                        .listRowBackground(Color.discordGray)
                    }, header: {
                        Text("アプリ情報")
                            .foregroundStyle(.white)
                    })
                }
                .scrollContentBackground(.hidden)
                .background(.clear)
            }
        }
    }
}
