//
//  GeneralSettingsTests.swift
//  CodeEditTests
//
//  Created by Diego Vogel on 11/6/26.
//

import Foundation
import Testing
@testable import CodeEdit

@Suite
struct GeneralSettingsTests {
    @Test("File info shows in the status bar when a settings file predates the setting")
    func statusBarFileInfoDefaultsToShown() throws {
        let settings = try JSONDecoder().decode(SettingsData.GeneralSettings.self, from: Data("{}".utf8))

        #expect(settings.showStatusBarFileInfo)
    }

    @Test("Hiding file info in the status bar survives saving and reloading settings")
    func hiddenStatusBarFileInfoPersists() throws {
        var settings = SettingsData.GeneralSettings()
        settings.showStatusBarFileInfo = false

        let data = try JSONEncoder().encode(settings)
        let reloaded = try JSONDecoder().decode(SettingsData.GeneralSettings.self, from: data)

        #expect(!reloaded.showStatusBarFileInfo)
    }
}
