# TLFile Mods

Place each additional TLFile mod in its own folder inside `{game_root}/mods/tlfile`. Mods load in alphabetical folder order; later folders override earlier ones when they modify the same files.

## Restored Content

Corrects regressions introduced in *Tales of Symphonia Chronicles* and restores details from the GameCube version:

- Restores Sword Dancer's skull colour.
- Corrects Vidarr's fall speed when defeated at Iselia Chapel.
- Restores Remiel's dialogue and audio in Iselia Chapel.
- Corrects Presea's dialogue after defeating Abyssion and when getting the EC.
- Corrects Presea and Regal's dialogue at Alicia's grave.
- Corrects dialogue at Long-Range Mode monuments.
- Corrects Raine's battle animations in her Chosen Beauty costume and restores her swimsuit bracelet.
- Corrects Sheena's dialogue when getting the zircon shipment log and her run animation before the Ossa Trail battle.
- Corrects the colour and geometry of Volt's lightning before his boss fight.
- Fixes a view beyond the map boundaries in Gaoracchia Forest.
- Corrects the "For Depressed People..." typo.

## 60FPS Fixes

Corrects artes and animations that behave improperly at 60FPS.

**Artes:**
- Fanged Finality
- Dragon's Talon
- Swallow Dance
- Dragon Dance
- Super Swallow Dance

**Animations:**
- Lloyd victory pose 0
- Lloyd victory pose 3
- Genis victory pose 0

## English Debug Maps

Translates the debug maps into English. Enable `DebugMapLoader=1` to access them; see the [debug map instructions](../asm/README.md#debug) for details.
