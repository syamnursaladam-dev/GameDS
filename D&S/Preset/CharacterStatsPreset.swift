//
//  CharacterStatsPreset.swift
//  D&S
//
//  Preset nilai stats untuk setiap karakter.
//  Tambahkan preset baru di sini saat membuat karakter baru.
//

import Foundation

struct CharacterStatsPreset {
    static let hero = CharacterStats(hp: 100, maxHp: 100, atk: 15, element: .fire)
    static let enemy = CharacterStats(hp: 50, maxHp: 50, atk: 8, element: .earth)
}
