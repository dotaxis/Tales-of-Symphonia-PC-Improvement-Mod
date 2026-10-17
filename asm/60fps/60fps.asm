// Tales of Symphonia 60FPS, faithful port of TOS60-v0.0.46.
// Enable with [60FPS] Enabled=1; zero leaves the vanilla executable intact.
// Applies on a fresh launch. Do not combine with an xdelta-patched EXE.
// Vanilla SHA256: 01cad33820c383b938452acb60eed21262152b9f85f29bfbbcee04d51d3a7104
// Reference SHA256: a7eebf652b6dff389927994055784f83bfa96630ba155bd420df0a91fccb6719
// Source: v0.0.46 executable / IDB history c968f3b, verified research notes.
// Original VAs below identify the reference bytes, not installation addresses.
// Code and immutable constants are RX; all five scratch regions are separate RW allocations.
// The reference PE header edits only add .cave. Runtime allocations replace that section;
// neither the on-disk PE nor its section table / image size needs modification.
// This supported executable is fixed at 00400000 (enforced by patch.toml).
// Preserve the native-quad subtraction constants in the two dialogue pointer differences.
// CE numeric syntax: bare values are hexadecimal; # introduces decimal.

[ENABLE]
alloc(arte_helpers,1000)
alloc(arte_constants,1000)
alloc(chant_cache,4)
alloc(crimson_frame,2)
alloc(animation_cleanup,1000)
alloc(chant_timing,1000)
alloc(darkness_orb,1000)
alloc(darkness_orb_state,8A0)
alloc(darkness_shader,2000)
alloc(darkness_shader_state,A20)
alloc(timing_helpers,1000)
alloc(dialogue_corners,80)
alloc(dialogue_helpers,2000)

label(fps_crimson_duplicate_frame_guard)
label(fps_loc_007021AE)
label(fps_arte_animation_cooldown)
label(fps_loc_007021D4)
label(fps_double_one)
label(fps_double_negative_one)
define(fps_chant_voice_state_ptr,chant_cache)
define(fps_crimson_last_frame,crimson_frame)
label(fps_animation_pool_cleanup)
label(fps_loc_01E4A01B)
label(fps_loc_01E4A049)
label(fps_loc_01E4A04D)
label(fps_loc_01E4A054)
label(fps_loc_01E4A059)
label(fps_loc_01E4A067)
label(fps_loc_01E4A06C)
label(fps_loc_01E4A072)
label(fps_loc_01E4A0EA)
label(fps_loc_01E4A10B)
label(fps_loc_01E4A11C)
label(fps_loc_01E4A155)
label(fps_loc_01E4A176)
label(fps_loc_01E4A183)
label(fps_loc_01E4A1C5)
label(fps_loc_01E4A1D7)
label(fps_loc_01E4A206)
label(fps_loc_01E4A20E)
label(fps_loc_01E4A221)
label(fps_loc_01E4A223)
label(fps_chant_le32)
label(fps_chant_read_at)
label(fps_loc_01E4A335)
label(fps_loc_01E4A35C)
label(fps_chant_voice_get_state)
label(fps_loc_01E4A38B)
label(fps_chant_voice_ticks)
label(fps_loc_01E4A3D7)
label(fps_loc_01E4A3D9)
label(fps_chant_voice_build)
label(fps_loc_01E4A420)
label(fps_loc_01E4A432)
label(fps_loc_01E4A448)
label(fps_loc_01E4A44C)
label(fps_loc_01E4A458)
label(fps_loc_01E4A489)
label(fps_loc_01E4A59B)
label(fps_loc_01E4A5CF)
label(fps_loc_01E4A5E7)
label(fps_loc_01E4A65C)
label(fps_loc_01E4A6A4)
label(fps_loc_01E4A6A7)
label(fps_loc_01E4A6C6)
label(fps_loc_01E4A6CD)
label(fps_loc_01E4A6D6)
label(fps_chant_voice_ensure)
label(fps_loc_01E4A790)
label(fps_loc_01E4A79E)
label(fps_loc_01E4A7BF)
label(fps_loc_01E4A7F9)
label(fps_loc_01E4A800)
label(fps_loc_01E4A815)
label(fps_loc_01E4A818)
label(fps_loc_01E4A830)
label(fps_loc_01E4A838)
label(fps_loc_01E4A85A)
label(fps_loc_01E4A85E)
label(fps_chant_voice_bank_changed)
label(fps_loc_01E4A883)
label(fps_chant_voice_table_loaded)
label(fps_loc_01E4A89F)
label(fps_chant_hook_bank)
label(fps_chant_hook_table)
label(fps_chant_hook_selected)
label(fps_chant_hook_shared)
label(fps_chant_hook_audio_reset)
label(fps_orb_text_clone3)
label(fps_loc_02E9011A)
label(fps_orb_text_execute3)
label(fps_loc_02E90151)
label(fps_orb_text_orb_transform_constprop_0)
label(fps_loc_02E901E2)
label(fps_loc_02E90248)
label(fps_loc_02E9025F)
label(fps_loc_02E902A6)
label(fps_loc_02E902C3)
label(fps_loc_02E9033C)
label(fps_loc_02E90355)
label(fps_loc_02E9038B)
label(fps_loc_02E903AE)
label(fps_loc_02E903C9)
label(fps_loc_02E903D0)
label(fps_loc_02E903D5)
label(fps_loc_02E903DC)
label(fps_loc_02E903E1)
label(fps_loc_02E903E8)
label(fps_loc_02E903EF)
label(fps_loc_02E903F4)
label(fps_loc_02E903F9)
label(fps_loc_02E90402)
label(fps_loc_02E90407)
label(fps_loc_02E9040E)
label(fps_loc_02E90441)
label(fps_loc_02E90493)
label(fps_loc_02E9049C)
label(fps_loc_02E904A9)
label(fps_loc_02E904CF)
label(fps_loc_02E904E2)
label(fps_loc_02E904EF)
label(fps_loc_02E90500)
label(fps_orb_text_variant)
label(fps_loc_02E90524)
label(fps_loc_02E90542)
label(fps_loc_02E90582)
label(fps_loc_02E905A5)
label(fps_loc_02E905C8)
label(fps_loc_02E90646)
label(fps_loc_02E90650)
label(fps_loc_02E90657)
label(fps_loc_02E90660)
label(fps_loc_02E90677)
label(fps_loc_02E9069A)
label(fps_loc_02E906C8)
label(fps_loc_02E906DF)
label(fps_orb_text_draw)
label(fps_loc_02E90730)
label(fps_loc_02E9074B)
label(fps_loc_02E9074F)
label(fps_loc_02E90762)
label(fps_loc_02E90766)
label(fps_loc_02E90779)
label(fps_loc_02E90796)
label(fps_loc_02E907BC)
label(fps_loc_02E907BE)
label(fps_loc_02E907C6)
label(fps_loc_02E907F2)
label(fps_loc_02E90804)
label(fps_loc_02E9081A)
label(fps_loc_02E90827)
label(fps_loc_02E9083D)
label(fps_loc_02E90893)
label(fps_loc_02E9089D)
label(fps_loc_02E908CA)
label(fps_orb_text_submit3)
label(fps_loc_02E90937)
label(fps_loc_02E90A04)
label(fps_loc_02E90A2A)
label(fps_loc_02E90A38)
label(fps_loc_02E90A48)
label(fps_loc_02E90A58)
label(fps_loc_02E90A66)
label(fps_loc_02E90A6E)
label(fps_loc_02E90A74)
label(fps_loc_02E90A76)
label(fps_orb_vt3)
label(fps_orb_commonvt3)
label(fps_orb_rdata)
label(fps_orb_rdata_zzz)
label(fps_orb_data)
define(fps_orb_data_state,darkness_orb_state)
label(fps_darkness_text_dark_family)
label(fps_loc_02E94034)
label(fps_loc_02E9403A)
label(fps_loc_02E94064)
label(fps_loc_02E94077)
label(fps_loc_02E9408A)
label(fps_loc_02E9409B)
label(fps_loc_02E940AC)
label(fps_loc_02E940BD)
label(fps_loc_02E940C5)
label(fps_loc_02E940CB)
label(fps_loc_02E940CF)
label(fps_loc_02E940DB)
label(fps_loc_02E940E7)
label(fps_loc_02E940F5)
label(fps_loc_02E94103)
label(fps_loc_02E94111)
label(fps_loc_02E9411B)
label(fps_loc_02E9411F)
label(fps_loc_02E94129)
label(fps_loc_02E94131)
label(fps_loc_02E94139)
label(fps_loc_02E9413F)
label(fps_loc_02E94141)
label(fps_loc_02E94144)
label(fps_loc_02E94206)
label(fps_loc_02E942A3)
label(fps_loc_02E9430C)
label(fps_loc_02E94318)
label(fps_loc_02E9431E)
label(fps_darkness_text_clone2)
label(fps_loc_02E9433A)
label(fps_darkness_text_clone3)
label(fps_loc_02E94356)
label(fps_darkness_text_observe)
label(fps_loc_02E9438B)
label(fps_loc_02E94399)
label(fps_loc_02E943DA)
label(fps_loc_02E943DD)
label(fps_loc_02E9440A)
label(fps_loc_02E9442B)
label(fps_loc_02E94430)
label(fps_darkness_text_tag)
label(fps_loc_02E9445F)
label(fps_darkness_text_execute2)
label(fps_darkness_text_execute3)
label(fps_darkness_text_variant)
label(fps_loc_02E9449C)
label(fps_loc_02E944BA)
label(fps_loc_02E944FA)
label(fps_loc_02E9451D)
label(fps_loc_02E94540)
label(fps_loc_02E945BE)
label(fps_loc_02E945C8)
label(fps_loc_02E945CF)
label(fps_loc_02E945D8)
label(fps_loc_02E945EF)
label(fps_loc_02E94612)
label(fps_loc_02E94640)
label(fps_loc_02E94657)
label(fps_darkness_text_submit2)
label(fps_loc_02E946AA)
label(fps_darkness_text_submit3)
label(fps_loc_02E94702)
label(fps_darkness_text_draw)
label(fps_loc_02E94AC7)
label(fps_loc_02E94ACF)
label(fps_loc_02E94AFB)
label(fps_loc_02E94B08)
label(fps_darkness_vt3)
label(fps_darkness_vt2)
label(fps_darkness_text_dark_transform_constprop_0)
label(fps_loc_02E94C77)
label(fps_loc_02E94CD9)
label(fps_loc_02E94CF3)
label(fps_loc_02E94D38)
label(fps_loc_02E94D52)
label(fps_loc_02E94DD0)
label(fps_loc_02E94DE9)
label(fps_loc_02E94E1F)
label(fps_loc_02E94E45)
label(fps_loc_02E94E60)
label(fps_loc_02E94E67)
label(fps_loc_02E94E6C)
label(fps_loc_02E94E73)
label(fps_loc_02E94E78)
label(fps_loc_02E94E82)
label(fps_loc_02E94E89)
label(fps_loc_02E94E8E)
label(fps_loc_02E94E93)
label(fps_loc_02E94E9C)
label(fps_loc_02E94EA8)
label(fps_loc_02E94EDC)
label(fps_loc_02E94F35)
label(fps_loc_02E94F43)
label(fps_loc_02E94F69)
label(fps_loc_02E94F7C)
label(fps_loc_02E94F83)
label(fps_loc_02E94F91)
label(fps_darkness_rdata)
label(fps_darkness_rdata_zzz)
label(fps_darkness_data)
define(fps_darkness_data_state,darkness_shader_state)
label(fps_input_repeat_directions)
label(fps_input_repeat_buttons)
label(fps_animation_loop_wrap)
label(fps_float_half)
label(fps_legacy_npc_half_integrator)
label(fps_npc_animation_speed)
label(fps_emote_constants)
label(fps_emote_lifetime)
label(fps_loc_02EFF109)
label(fps_emote_case5_counter)
label(fps_elevator_bone_interpolation)
label(fps_scenario_cmd17_speed)
label(fps_legacy_terrain_velocity_adjustment)
label(fps_scene_texture_motion)
label(fps_scene_texture_animation_rate)
label(fps_field_effect_motion)
label(fps_spell_knockback_timer)
label(fps_target_camera_constants)
label(fps_attack_pending_compensation)
label(fps_loc_02EFF2A1)
label(fps_arte_pending_reset)
label(fps_ozette_waypoint_half)
label(fps_ozette_waypoint_input)
label(fps_ozette_waypoint_output)
label(fps_field_effect_parameter)
label(fps_loc_02EFF416)
label(fps_loc_02EFF419)
label(fps_dialogue_bottom_border)
label(fps_loc_02EFF45C)
label(fps_loc_02EFF535)
label(fps_loc_02EFF570)
label(fps_loc_02EFF581)
label(fps_loc_02EFF591)
label(fps_flight_single_arrival_compare)
label(fps_ground_single_arrival_compare)
label(fps_multi_arrival_compare_legacy)
label(fps_loc_02EFF657)
label(fps_ground_multi_arrival_compare)
label(fps_npc_half_delta_before_collision)
label(fps_npc_direct_delta_integration)
label(fps_ground_single_arrival_redirect)
label(fps_flight_multi_arrival_store)
label(fps_loc_02EFF74A)
label(fps_ground_multi_arrival_store)
label(fps_loc_02EFF76A)
label(fps_ring_transfer_speed_constants)
label(fps_npc_capped_arrival_store)
label(fps_loc_02EFF822)
label(fps_loc_02EFF826)
label(fps_loc_02EFF828)
label(fps_ring_stub_2eff840)
label(fps_ring_constant_2eff850)
label(fps_ring_constant_2eff854)
label(fps_ring_constant_2eff858)
label(fps_ring_constant_2eff860)
label(fps_ring_stub_2eff868)
label(fps_ring_constant_2eff880)
label(fps_ring_stub_2eff888)
label(fps_loc_02EFF89B)
label(fps_ring_stub_2eff8a4)
label(fps_loc_02EFF8B7)
label(fps_ring_stub_2eff8c0)
label(fps_ring_stub_2eff8e0)
label(fps_ring_stub_2eff8e8)
label(fps_ring_stub_2eff8f0)
label(fps_ring_stub_2eff8f8)
label(fps_chant_portrait_additive)
label(fps_loc_02EFF955)
label(fps_loc_02EFF95A)
label(fps_loc_02EFF971)
label(fps_loc_02EFF97B)
label(fps_loc_02EFF985)
label(fps_loc_02EFF995)
label(fps_npc_pursuit_positive_speed)
label(fps_loc_02EFFA0E)
label(fps_dialogue_style_a)
label(fps_loc_02EFFA37)
label(fps_loc_02EFFAF5)
label(fps_dialogue_top_left_hook)
label(fps_dialogue_top_right_hook)
label(fps_dialogue_bottom_left_hook)
label(fps_dialogue_bottom_right_hook)
label(fps_dialogue_tail_outline_hook)
label(fps_dialogue_entry)
label(fps_dialogue_previous_quad)
label(fps_loc_02EFFBC2)
label(fps_dialogue_tail_order_quad)
label(fps_loc_02EFFC9F)
label(fps_loc_02EFFCD0)
label(fps_loc_02EFFD00)
label(fps_loc_02EFFD13)
label(fps_loc_02EFFD29)
label(fps_loc_02EFFD40)
label(fps_loc_02EFFD60)
label(fps_loc_02EFFD67)
label(fps_loc_02EFFD73)
label(fps_loc_02EFFDA0)
label(fps_loc_02EFFDC8)
label(fps_loc_02EFFDD6)
label(fps_loc_02EFFE00)
define(fps_dialogue_pending,dialogue_corners)
label(fps_arte_callback_blend_guard)
label(fps_loc_02EFFF19)
label(fps_loc_02EFFF29)
label(fps_loc_02EFFF2B)
label(fps_loc_02EFFF35)
label(fps_loc_02EFFF3A)
label(fps_field_animation_slot_reuse_guard)
label(fps_loc_02EFFF8B)
label(fps_loc_02EFFF99)
label(fps_loc_02EFFFAC)
label(fps_loc_02EFFFB1)
label(fps_loc_02EFFFC2)
label(fps_dialogue_name_textured_hook)
label(fps_dialogue_name_pointer_fill_hook)
label(fps_dialogue_name_pointer_outline_hook)
label(fps_dialogue_name_fill_hook)
label(fps_dialogue_name_entry)
label(fps_dialogue_original_quad)
label(fps_loc_02F0005B)
label(fps_dialogue_native_quad)
label(fps_loc_02F00088)
label(fps_dialogue_clip)
label(fps_loc_02F00135)
label(fps_loc_02F00150)
label(fps_loc_02F00195)
label(fps_loc_02F001E1)
label(fps_loc_02F00228)
label(fps_loc_02F0022A)
label(fps_loc_02F00246)
label(fps_loc_02F00260)
label(fps_loc_02F00270)
label(fps_loc_02F00285)
label(fps_dialogue_dialog_covers_pointer)
label(fps_loc_02F00338)
label(fps_loc_02F00340)
label(fps_loc_02F00342)
label(fps_loc_02F00358)
label(fps_dialogue_masked_quad)
label(fps_loc_02F003FD)
label(fps_loc_02F004D9)
label(fps_loc_02F00570)
label(fps_loc_02F0057A)
label(fps_loc_02F00590)
label(fps_loc_02F005A0)
label(fps_loc_02F005A8)
label(fps_loc_02F005AA)
label(fps_loc_02F005B8)
label(fps_loc_02F005CD)
label(fps_loc_02F005E8)
label(fps_loc_02F005F8)
label(fps_loc_02F00620)
label(fps_loc_02F00627)
label(fps_loc_02F0063F)
label(fps_loc_02F00676)
label(fps_loc_02F00700)
label(fps_loc_02F00770)
label(fps_loc_02F007B8)
label(fps_loc_02F007BA)
label(fps_loc_02F0086D)
label(fps_loc_02F0087F)
label(fps_loc_02F00900)
label(fps_loc_02F00950)
label(fps_loc_02F00968)
label(fps_loc_02F00988)
label(fps_loc_02F009CC)
label(fps_loc_02F009DC)
label(fps_dialogue_name_quad)
label(fps_loc_02F00BB0)
label(fps_loc_02F00BE3)
label(fps_loc_02F00BF0)
label(fps_loc_02F00C16)
label(fps_loc_02F00C20)
label(fps_loc_02F00C38)
label(fps_loc_02F00C48)
label(fps_loc_02F00C4C)
label(fps_loc_02F00C52)
label(fps_loc_02F00C60)
label(fps_loc_02F00C66)
label(fps_loc_02F00C70)
label(fps_loc_02F00C76)
label(fps_loc_02F00C80)
label(fps_loc_02F00C86)
label(fps_loc_02F00C90)
label(fps_loc_02F00C94)
label(fps_loc_02F00CB8)
label(fps_loc_02F00CF0)
label(fps_loc_02F00D60)
label(fps_loc_02F00D68)
label(fps_loc_02F00D90)
label(fps_loc_02F00DB0)
label(fps_loc_02F00DE0)
label(fps_loc_02F00DFE)
label(fps_loc_02F00E37)
label(fps_dialogue_name_double)
label(fps_dialogue_name_floats)

// Guard native callbacks and continuations called by the relocated helpers.
assert(TOS.exe+D726,53 56 8B 75 08)
assert(TOS.exe+267D8,0F B7 C6 F7 C6)
assert(TOS.exe+27F2F,74 06 56 FF D0)
assert(TOS.exe+27F37,53 8B C6 E8 F1)
assert(TOS.exe+4083E,8B FF 83 3E 00)
assert(TOS.exe+41070,8B 8E F0 12 00)
assert(TOS.exe+45238,F6 87 20 13 00)
assert(TOS.exe+4BD52,5E 5D C3 CC CC)
assert(TOS.exe+4C1F6,8B 55 08 0F B6)
assert(TOS.exe+4D5B3,41 83 F9 03 0F)
assert(TOS.exe+5045D,83 CF FF BE F0)
assert(TOS.exe+504C6,66 39 90 26 02)
assert(TOS.exe+50527,66 39 90 42 02)
assert(TOS.exe+50588,0F B7 88 70 02)
assert(TOS.exe+505F3,0F B7 90 0C 13)
assert(TOS.exe+508A9,C3 CC CC CC CC)
assert(TOS.exe+632B6,A9 00 00 FF FF)
assert(TOS.exe+67B00,8B 45 08 8B 4D)
assert(TOS.exe+76237,F6 C3 03 0F 85)
assert(TOS.exe+7623A,0F 85 60 05 00)
assert(TOS.exe+7E7CA,0F B6 93 4C 93)
assert(TOS.exe+86CFD,80 BB EF 17 00)
assert(TOS.exe+8D7B2,8A 53 17 84 D2)
assert(TOS.exe+8D7F2,8A 53 17 84 D2)
assert(TOS.exe+8D831,8A 53 17 84 D2)
assert(TOS.exe+8D872,8A 53 17 84 D2)
assert(TOS.exe+9CC7C,8B 46 04 8B 4E)
assert(TOS.exe+A1338,FF 8B B0 00 00)
assert(TOS.exe+A1E05,D9 05 08 F4 72)
assert(TOS.exe+A2AA9,89 8B DC 09 00)
assert(TOS.exe+A2E7F,D9 9B 84 00 00)
assert(TOS.exe+A31FA,FF 8E B0 00 00)
assert(TOS.exe+A3D7B,FF 8B B0 00 00)
assert(TOS.exe+A4A89,6A 00 DD D8 6A)
assert(TOS.exe+A4B86,80 3D 88 0C C3)
assert(TOS.exe+A54D4,FF 8B B0 00 00)
assert(TOS.exe+A79F5,D9 05 08 F4 72)
assert(TOS.exe+C17F8,0F 86 85 03 00)
assert(TOS.exe+C1B76,5B 8B E5 5D C3)
assert(TOS.exe+C7F30,55 8B EC 83 EC)
assert(TOS.exe+C8936,8D 82 4C 08 00)
assert(TOS.exe+C9C2C,DF E0 F6 C4 41)
assert(TOS.exe+C9D4F,0F B6 C1 40 89)
assert(TOS.exe+C9D76,74 0C DC 0D 50)
assert(TOS.exe+C9F40,0F B6 D1 42 89)
assert(TOS.exe+C9F5F,74 0C DC 0D 50)
assert(TOS.exe+C9F6F,0F BE 83 33 09)
assert(TOS.exe+CA0B1,0F B6 D1 42 89)
assert(TOS.exe+CA0D0,74 0C DC 0D 50)
assert(TOS.exe+CCF53,D9 46 28 D9 EE)
assert(TOS.exe+CD55C,E8 6F 69 0C 00)
assert(TOS.exe+CF211,8B 53 04 8B 43)
assert(TOS.exe+CF5C4,88 44 24 19 E8)
assert(TOS.exe+D2388,66 83 BB CE 09)
assert(TOS.exe+D2EEE,C7 03 00 00 00)
assert(TOS.exe+D2EF4,8B 4C 24 7C 5F)
assert(TOS.exe+DB299,8A 4E 64 8A C1)
assert(TOS.exe+137EA6,09 88 D8 1A C3)
assert(TOS.exe+137EF2,09 90 18 1D C3)
assert(TOS.exe+156463,F6 83 C4 00 00)
assert(TOS.exe+156951,D8 83 D8 09 00)
assert(TOS.exe+15EF05,8B 8E 44 08 00)
assert(TOS.exe+15F72D,80 A6 34 09 00)
assert(TOS.exe+15F7BF,83 87 44 08 00)
assert(TOS.exe+17B7B8,D9 EE D8 16 DF)
assert(TOS.exe+17B9E6,D9 47 10 DE D9)
assert(TOS.exe+181682,D9 15 E8 BF B1)
assert(TOS.exe+182972,C6 86 6C AE B1)
assert(TOS.exe+1854B0,55 8B EC 83 E4)
assert(TOS.exe+185510,55 8B EC 6A FF)
assert(TOS.exe+185600,55 8B EC 83 EC)
assert(TOS.exe+186B20,55 8B EC F6 45)
assert(TOS.exe+1872E0,55 8B EC 83 EC)
assert(TOS.exe+187360,55 8B EC 83 E4)
assert(TOS.exe+1873D0,55 8B EC 6A FF)
assert(TOS.exe+1874C0,55 8B EC 83 EC)
assert(TOS.exe+187510,55 8B EC 83 EC)
assert(TOS.exe+188630,55 8B EC 83 E4)
assert(TOS.exe+18B6A7,85 D2 78 9D 8B)
assert(TOS.exe+19E6E0,C2 04 00 CC CC)

// Native edits. Each complete overwrite is checked against the unmodified EXE.

// Reference VA 004011A3..004011AA.
// 60fps patch: battle intro frame counter += 1 (was 2)
assert(TOS.exe+11A3,66 83 86 14 01 00 00 02)
TOS.exe+11A3:
// Vanilla: add word ptr [esi + 0x114], 2
  add word ptr [esi + 0x114], #1 // 004011A3

// Reference VA 00401807..00401809.
assert(TOS.exe+1807,8D 47 02)
TOS.exe+1807:
// Vanilla: lea eax, [edi + 2]
  lea eax, [edi + #1] // 00401807

// Reference VA 00401D7C..00401D7E.
// Battle_TickEnemyCutsceneAttack: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1D7C,83 06 02)
TOS.exe+1D7C:
// Vanilla: add dword ptr [esi], 2
  add dword ptr [esi], #1 // 00401D7C

// Reference VA 00401E47..00401E49.
// Battle_TickEnemyCutsceneAttack: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1E47,83 07 02)
TOS.exe+1E47:
// Vanilla: add dword ptr [edi], 2
  add dword ptr [edi], #1 // 00401E47

// Reference VA 00402A06..00402A08.
assert(TOS.exe+2A06,8D 47 02)
TOS.exe+2A06:
// Vanilla: lea eax, [edi + 2]
  lea eax, [edi + #1] // 00402A06

// Reference VA 004030AE..004030B0.
assert(TOS.exe+30AE,8D 47 02)
TOS.exe+30AE:
// Vanilla: lea eax, [edi + 2]
  lea eax, [edi + #1] // 004030AE

// Reference VA 00403AF6..00403AFD.
assert(TOS.exe+3AF6,66 83 86 14 01 00 00 02)
TOS.exe+3AF6:
// Vanilla: add word ptr [esi + 0x114], 2
  add word ptr [esi + 0x114], #1 // 00403AF6

// Reference VA 00403C8E..00403C9D.
assert(TOS.exe+3C8E,C7 44 24 10 00 00 03 03 C7 44 24 14 00 05 03 03)
TOS.exe+3C8E:
// Vanilla: mov dword ptr [esp + 0x10], 0x3030000; mov dword ptr [esp + 0x14], 0x3030500
  mov dword ptr [esp + 0x10], 0x3070000 // 00403C8E
  mov dword ptr [esp + 0x14], 0x3070500 // 00403C96

// Reference VA 00404E2B..00404E32.
assert(TOS.exe+4E2B,66 83 86 14 01 00 00 02)
TOS.exe+4E2B:
// Vanilla: add word ptr [esi + 0x114], 2
  add word ptr [esi + 0x114], #1 // 00404E2B

// Reference VA 0040570D..00405714.
assert(TOS.exe+570D,66 83 86 14 01 00 00 02)
TOS.exe+570D:
// Vanilla: add word ptr [esi + 0x114], 2
  add word ptr [esi + 0x114], #1 // 0040570D

// Reference VA 00405A50..00405A50.
assert(TOS.exe+5A50,48)
TOS.exe+5A50:
// Vanilla: dec eax
  nop // 00405A50

// Reference VA 0040666A..00406671.
assert(TOS.exe+666A,66 83 86 14 01 00 00 02)
TOS.exe+666A:
// Vanilla: add word ptr [esi + 0x114], 2
  add word ptr [esi + 0x114], #1 // 0040666A

// Reference VA 0040D720..0040D725.
assert(TOS.exe+D720,55 8B EC 83 EC 28)
TOS.exe+D720:
// Vanilla: push ebp; mov ebp, esp; sub esp, 0x28
  jmp near fps_crimson_duplicate_frame_guard // 0040D720
  nop // 0040D725

// Reference VA 0042669A..004266A1.
// PATCHED 60fps: movement script timer +2 -> +1
assert(TOS.exe+2669A,66 83 83 F8 12 00 00 02)
TOS.exe+2669A:
// Vanilla: add word ptr [ebx + 0x12f8], 2
  add word ptr [ebx + 0x12f8], #1 // 0042669A

// Reference VA 004267D2..004267D7.
// Active-bank chant durations: hook_selected. Executable correction; cache follows loaded BTLSTR bank.
assert(TOS.exe+267D2,8B B3 A0 3A 01 00)
TOS.exe+267D2:
// Vanilla: mov esi, dword ptr [ebx + 0x13aa0]
  jmp near fps_chant_hook_selected // 004267D2
  nop // 004267D7

// Reference VA 00427267..0042727A.
// Battle_TickEnemyAttackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+27267,0F B7 83 BE 01 00 00 66 85 C0 74 08 48 66 89 83 BE 01 00 00)
TOS.exe+27267:
// Vanilla: movzx eax, word ptr [ebx + 0x1be]; test ax, ax; je 0x42727b; dec eax; mov word ptr [ebx + 0x1be], ax
  nop // 00427267
  nop // 00427268
  nop // 00427269
  nop // 0042726A
  nop // 0042726B
  nop // 0042726C
  nop // 0042726D
  nop // 0042726E
  nop // 0042726F
  nop // 00427270
  nop // 00427271
  nop // 00427272
  nop // 00427273
  nop // 00427274
  nop // 00427275
  nop // 00427276
  nop // 00427277
  nop // 00427278
  nop // 00427279
  nop // 0042727A

// Reference VA 004274C9..004274D0.
// PATCHED 60fps: combat script timer +2 -> +1
assert(TOS.exe+274C9,66 83 83 FA 12 00 00 02)
TOS.exe+274C9:
// Vanilla: add word ptr [ebx + 0x12fa], 2
  add word ptr [ebx + 0x12fa], #1 // 004274C9

// Reference VA 004278E5..004278EC.
// Battle_LaunchArteCast: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+278E5,66 83 86 BE 01 00 00 02)
TOS.exe+278E5:
// Vanilla: add word ptr [esi + 0x1be], 2
  add word ptr [esi + 0x1be], #1 // 004278E5

// Reference VA 00427F28..00427F2E.
// Battle_TickEnemyAttackOuter: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+27F28,8B 46 18 33 DB 3B C3)
TOS.exe+27F28:
// Vanilla: mov eax, dword ptr [esi + 0x18]; xor ebx, ebx; cmp eax, ebx
  jmp near fps_arte_callback_blend_guard // 00427F28
  nop // 00427F2D
  nop // 00427F2E

// Reference VA 00427F58..00427F5F.
// Battle_TickEnemyAttackOuter: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+27F58,66 83 86 BE 01 00 00 02)
TOS.exe+27F58:
// Vanilla: add word ptr [esi + 0x1be], 2
  add word ptr [esi + 0x1be], #1 // 00427F58

// Reference VA 004280E6..004280E8.
// ArteScript_SharedTick: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+280E6,83 C0 02)
TOS.exe+280E6:
// Vanilla: add eax, 2
  add eax, #1 // 004280E6

// Reference VA 00429B8F..00429B97.
// 60fps: -= 1 (was -= 2) visual overlay timer countdown
assert(TOS.exe+29B8F,66 83 84 73 34 E7 00 00 FE)
TOS.exe+29B8F:
// Vanilla: add word ptr [ebx + esi*2 + 0xe734], -2
  db 66,83,84,73,34,E7,00,00,FF // add word ptr [ebx + esi*#2 + 0xe734], -#1 // 00429B8F

// Reference VA 00429CA3..00429CA4.
// 60fps: += 1 (was += 2) particle/visual animation frame timer
assert(TOS.exe+29CA3,04 02)
TOS.exe+29CA3:
// Vanilla: add al, 2
  add al, #1 // 00429CA3

// Reference VA 0042B3B6..0042B3B8.
// Battle_TickPlayerAttackOuter: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2B3B6,83 C0 02)
TOS.exe+2B3B6:
// Vanilla: add eax, 2
  add eax, #1 // 0042B3B6

// Reference VA 0042B401..0042B40C.
// Battle_TickPlayerAttackOuter: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2B401,E8 4A F6 00 00 8B CE E8 D3 F8 00 00)
TOS.exe+2B401:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 0042B401
  nop // 0042B402
  nop // 0042B403
  nop // 0042B404
  nop // 0042B405
  nop // 0042B406
  nop // 0042B407
  nop // 0042B408
  nop // 0042B409
  nop // 0042B40A
  nop // 0042B40B
  nop // 0042B40C

// Reference VA 0042B9CF..0042B9D4.
// Battle_UpdateCamera: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2B9CF,D9 05 B4 35 7A 00)
TOS.exe+2B9CF:
// Vanilla: fld dword ptr [0x7a35b4]
  fld dword ptr [TOS.exe+4833D0] // 0042B9CF

// Reference VA 0042BBEA..0042BBEF.
// Battle_UpdateCamera: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2BBEA,D9 05 54 04 73 00)
TOS.exe+2BBEA:
// Vanilla: fld dword ptr [0x730454]
  fld dword ptr [fps_target_camera_constants] // 0042BBEA

// Reference VA 0042BC01..0042BC06.
// Battle_UpdateCamera: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2BC01,D9 05 50 32 88 00)
TOS.exe+2BC01:
// Vanilla: fld dword ptr [0x883250]
  fld dword ptr [timing_helpers+26E] // 0042BC01

// Reference VA 0042BD2B..0042BD36.
// Battle_UpdateCamera: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2BD2B,DC 0D 50 2B 88 00 DC 05 88 2B 88 00)
TOS.exe+2BD2B:
// Vanilla: fmul qword ptr [0x882b50]; fadd qword ptr [0x882b88]
  fmul qword ptr [timing_helpers+272] // 0042BD2B
  fadd qword ptr [timing_helpers+27A] // 0042BD31

// Reference VA 0042BF41..0042BF43.
// Battle_UpdateCamera: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2BF41,83 F8 02)
TOS.exe+2BF41:
// Vanilla: cmp eax, 2
  cmp eax, #1 // 0042BF41

// Reference VA 0042DF94..0042DF99.
// Battle_TickScreenShake: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+2DF94,DC 25 B8 29 88 00)
TOS.exe+2DF94:
// Vanilla: fsub qword ptr [0x8829b8]
  fsub qword ptr [fps_double_one] // 0042DF94

// Reference VA 0043723E..0043723F.
// Battle_UpdateActorModelTransform: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+3723E,DC C0)
TOS.exe+3723E:
// Vanilla: fadd st(0), st(0)
  nop // 0043723E
  nop // 0043723F

// Reference VA 00437FA8..00437FAD.
// Battle_RenderActorAndWeapons: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+37FA8,DC 25 B8 29 88 00)
TOS.exe+37FA8:
// Vanilla: fsub qword ptr [0x8829b8]
  fsub qword ptr [fps_double_one] // 00437FA8

// Reference VA 004385EF..004385F6.
// Battle_RenderComboHitDisplay: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+385EF,66 83 86 EA 39 01 00 02)
TOS.exe+385EF:
// Vanilla: add word ptr [esi + 0x139ea], 2
  add word ptr [esi + 0x139ea], #1 // 004385EF

// Reference VA 0043A60A..0043A60B.
// Battle_UpdateActorFacing: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+3A60A,DC C0)
TOS.exe+3A60A:
// Vanilla: fadd st(0), st(0)
  nop // 0043A60A
  nop // 0043A60B

// Reference VA 0043A87C..0043A87D.
// Battle_RotateActorTowardDir: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+3A87C,DC C0)
TOS.exe+3A87C:
// Vanilla: fadd st(0), st(0)
  nop // 0043A87C
  nop // 0043A87D

// Reference VA 0043AA39..0043AA44.
assert(TOS.exe+3AA39,E8 12 00 00 00 8B CE E8 9B 02 00 00)
TOS.exe+3AA39:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 0043AA39
  nop // 0043AA3A
  nop // 0043AA3B
  nop // 0043AA3C
  nop // 0043AA3D
  nop // 0043AA3E
  nop // 0043AA3F
  nop // 0043AA40
  nop // 0043AA41
  nop // 0043AA42
  nop // 0043AA43
  nop // 0043AA44

// Reference VA 0043AC6D..0043AC72.
// Battle_AccumulateActorTimer: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+3AC6D,DC 05 B8 29 88 00)
TOS.exe+3AC6D:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 0043AC6D

// Reference VA 0043CDAA..0043CDAC.
// Battle_TickWeaponHitboxTracking: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+3CDAA,83 F8 02)
TOS.exe+3CDAA:
// Vanilla: cmp eax, 2
  cmp eax, #1 // 0043CDAA

// Reference VA 0043CEA2..0043CEA6.
// Primary actor emitter executes one iteration per update. Secondary/movement emitter loops retain their original two iterations.
assert(TOS.exe+3CEA2,BF 02 00 00 00)
TOS.exe+3CEA2:
// Vanilla: mov edi, 2
  mov edi, #1 // 0043CEA2

// Reference VA 0043E219..0043E21E.
// Battle_PredictActorPosition: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+3E219,DD 05 B8 29 88 00)
TOS.exe+3E219:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 0043E219

// Reference VA 00440836..0044083D.
// Collect unreachable outgoing battle animation nodes before allocation. Preserves active/pending/renderer-owned nodes and all blend timing. See arte-animation-stall-regression.
assert(TOS.exe+40836,33 C0 8D B7 70 11 00 00)
TOS.exe+40836:
// Vanilla: xor eax, eax; lea esi, [edi + 0x1170]
  jmp near fps_animation_pool_cleanup // 00440836
  nop // 0044083B
  nop // 0044083C
  nop // 0044083D

// Reference VA 00441009..0044100E.
// Battle_PlayArteAnimation: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+41009,02 97 FF 12 00 00)
TOS.exe+41009:
// Vanilla: add dl, byte ptr [edi + 0x12ff]
  nop // 00441009
  nop // 0044100A
  nop // 0044100B
  nop // 0044100C
  nop // 0044100D
  nop // 0044100E

// Reference VA 00441050..0044105D.
assert(TOS.exe+41050,C7 87 FC 12 00 00 00 00 01 00 8B E5 5D C3)
TOS.exe+41050:
// Vanilla: mov dword ptr [edi + 0x12fc], 0x10000; mov esp, ebp; pop ebp; ret 
  jmp near fps_arte_pending_reset // 00441050
  nop // 00441055
  nop // 00441056
  nop // 00441057
  nop // 00441058
  nop // 00441059
  nop // 0044105A
  nop // 0044105B
  nop // 0044105C
  nop // 0044105D

// Reference VA 00441069..0044106F.
// Battle_AdvanceAnimScript: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+41069,0F BE 86 FE 12 00 00)
TOS.exe+41069:
// Vanilla: movsx eax, byte ptr [esi + 0x12fe]
  jmp near fps_arte_animation_cooldown // 00441069
  nop // 0044106E
  nop // 0044106F

// Reference VA 004412D1..004412E9.
// Battle_AdvanceAnimScript: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+412D1,B8 11 00 00 00 5F 5E 8B E5 5D C3 66 83 86 FC 12 00 00 02 5F B8 01 00 00 00)
TOS.exe+412D1:
// Vanilla: mov eax, 0x11; pop edi; pop esi; mov esp, ebp; pop ebp; ret ; add word ptr [esi + 0x12fc], 2; pop edi; mov eax, 1
  mov byte ptr [esi + 0x12ff], #1 // 004412D1
  mov al, 0x11 // 004412D8
  jmp short TOS.exe+412E9 // 004412DA
  add word ptr [esi + 0x12fc], #1 // 004412DC
  mov eax, #1 // 004412E4
  pop edi // 004412E9

// Reference VA 00441716..0044171D.
assert(TOS.exe+41716,48 66 89 83 BE 01 00 00)
TOS.exe+41716:
// Vanilla: dec eax; mov word ptr [ebx + 0x1be], ax
  nop // 00441716
  nop // 00441717
  nop // 00441718
  nop // 00441719
  nop // 0044171A
  nop // 0044171B
  nop // 0044171C
  nop // 0044171D

// Reference VA 00441A6C..00441A73.
// Battle_ActorIdleDecision: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+41A6C,66 83 86 BE 01 00 00 FE)
TOS.exe+41A6C:
// Vanilla: add word ptr [esi + 0x1be], -2
  db 66,83,86,BE,01,00,00,FF // add word ptr [esi + 0x1be], -#1 // 00441A6C

// Reference VA 00444D85..00444D8C.
// PATCHED 60fps: combat script timer +2 -> +1
assert(TOS.exe+44D85,66 83 87 FA 12 00 00 02)
TOS.exe+44D85:
// Vanilla: add word ptr [edi + 0x12fa], 2
  add word ptr [edi + 0x12fa], #1 // 00444D85

// Reference VA 00445231..00445237.
// Battle_TickAttackScript: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+45231,83 87 10 01 00 00 20)
TOS.exe+45231:
// Vanilla: add dword ptr [edi + 0x110], 0x20
  jmp near fps_attack_pending_compensation // 00445231
  nop // 00445236
  nop // 00445237

// Reference VA 004467EE..004467F5.
// Battle_TickPlayerAttackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+467EE,66 83 86 F8 12 00 00 02)
TOS.exe+467EE:
// Vanilla: add word ptr [esi + 0x12f8], 2
  add word ptr [esi + 0x12f8], #1 // 004467EE

// Reference VA 004487EA..004487F1.
// Battle_TickHUDAndEffects: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+487EA,66 83 86 54 8C 00 00 A0)
TOS.exe+487EA:
// Vanilla: add word ptr [esi + 0x8c54], -0x60
  db 66,83,86,54,8C,00,00,E0 // add word ptr [esi + 0x8c54], -0x20 // 004487EA

// Reference VA 0044880B..00448812.
// Battle_TickHUDAndEffects: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+4880B,66 83 86 54 8C 00 00 60)
TOS.exe+4880B:
// Vanilla: add word ptr [esi + 0x8c54], 0x60
  add word ptr [esi + 0x8c54], 0x20 // 0044880B

// Reference VA 0044885D..00448863.
// Battle_TickHUDAndEffects: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+4885D,80 87 FE 85 00 00 02)
TOS.exe+4885D:
// Vanilla: add byte ptr [edi + 0x85fe], 2
  add byte ptr [edi + 0x85fe], #1 // 0044885D

// Reference VA 00449A22..00449A26.
// Persistent chanting portrait flash fix: call portrait_chant_additive (original call 0x47BCE0).
assert(TOS.exe+49A22,E8 B9 22 03 00)
TOS.exe+49A22:
// Vanilla: call 0x47bce0
  call fps_chant_portrait_additive // 00449A22

// Reference VA 0044BCF0..0044BCF7.
assert(TOS.exe+4BCF0,66 83 86 52 8C 00 00 D0)
TOS.exe+4BCF0:
// Vanilla: add word ptr [esi + 0x8c52], -0x30
  db 66,83,86,52,8C,00,00,F6 // add word ptr [esi + 0x8c52], -0xa // 0044BCF0

// Reference VA 0044BD05..0044BD0C.
assert(TOS.exe+4BD05,66 83 86 52 8C 00 00 30)
TOS.exe+4BD05:
// Vanilla: add word ptr [esi + 0x8c52], 0x30
  add word ptr [esi + 0x8c52], 0xa // 0044BD05

// Reference VA 0044BD48..0044BD49.
// 60fps patch: jge→jmp; skip 2nd inc → arte queue display timer (+2→+1)
assert(TOS.exe+4BD48,7D 08)
TOS.exe+4BD48:
// Vanilla: jge 0x44bd52
  jmp short TOS.exe+4BD52 // 0044BD48

// Reference VA 0044C1F0..0044C1F1.
assert(TOS.exe+4C1F0,7D 04)
TOS.exe+4C1F0:
// Vanilla: jge 0x44c1f6
  jmp short TOS.exe+4C1F6 // 0044C1F0

// Reference VA 0044D533..0044D534.
assert(TOS.exe+4D533,FE CA)
TOS.exe+4D533:
// Vanilla: dec dl
  nop // 0044D533
  nop // 0044D534

// Reference VA 0044D54B..0044D54C.
assert(TOS.exe+4D54B,FE C2)
TOS.exe+4D54B:
// Vanilla: inc dl
  nop // 0044D54B
  nop // 0044D54C

// Reference VA 0044D5A8..0044D5A9.
assert(TOS.exe+4D5A8,74 09)
TOS.exe+4D5A8:
// Vanilla: je 0x44d5b3
  jmp short TOS.exe+4D5B3 // 0044D5A8

// Reference VA 0044E163..0044E167.
assert(TOS.exe+4E163,80 44 08 0A 02)
TOS.exe+4E163:
// Vanilla: add byte ptr [eax + ecx + 0xa], 2
  add byte ptr [eax + ecx + 0xa], #1 // 0044E163

// Reference VA 004503FC..00450400.
// 60fps patch: mov ebx, 1 (was 2); shared fade-in addend for 5 status display blocks
assert(TOS.exe+503FC,BB 02 00 00 00)
TOS.exe+503FC:
// Vanilla: mov ebx, 2
  mov ebx, #1 // 004503FC

// Reference VA 00450426..00450427.
// 60fps patch: jz→jmp; skip 2nd dec → status display timer block 1 (-2→-1)
assert(TOS.exe+50426,74 35)
TOS.exe+50426:
// Vanilla: je 0x45045d
  jmp short TOS.exe+5045D // 00450426

// Reference VA 00450491..00450492.
// 60fps patch: jz→jmp; skip 2nd dec → status display timer block 2 (-2→-1)
assert(TOS.exe+50491,74 33)
TOS.exe+50491:
// Vanilla: je 0x4504c6
  jmp short TOS.exe+504C6 // 00450491

// Reference VA 004504F2..004504F3.
// 60fps patch: jz→jmp; skip 2nd dec → status display timer block 3 (-2→-1)
assert(TOS.exe+504F2,74 33)
TOS.exe+504F2:
// Vanilla: je 0x450527
  jmp short TOS.exe+50527 // 004504F2

// Reference VA 00450553..00450554.
// 60fps patch: jz→jmp; skip 2nd dec → status display timer block 4 (-2→-1)
assert(TOS.exe+50553,74 33)
TOS.exe+50553:
// Vanilla: je 0x450588
  jmp short TOS.exe+50588 // 00450553

// Reference VA 004505BD..004505BE.
// 60fps patch: jz→jmp; skip 2nd dec → status display timer block 5 (-2→-1)
assert(TOS.exe+505BD,74 34)
TOS.exe+505BD:
// Vanilla: je 0x4505f3
  jmp short TOS.exe+505F3 // 004505BD

// Reference VA 0045089F..004508A0.
assert(TOS.exe+5089F,74 08)
TOS.exe+5089F:
// Vanilla: je 0x4508a9
  jmp short TOS.exe+508A9 // 0045089F

// Reference VA 00451156..0045115D.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+51156,66 83 81 10 8D 00 00 02)
TOS.exe+51156:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 00451156

// Reference VA 00451180..00451187.
// Type-5 portrait fade-out -25 -> -13 (rounded half rate).
// "cutin portrait scales rel" u4ick
assert(TOS.exe+51180,66 83 81 12 8D 00 00 E7)
TOS.exe+51180:
// Vanilla: add word ptr [ecx + 0x8d12], -0x19
  db 66,83,81,12,8D,00,00,F3 // add word ptr [ecx + 0x8d12], -0xd // 00451180

// Reference VA 00451190..00451197.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+51190,66 83 81 10 8D 00 00 02)
TOS.exe+51190:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 00451190

// Reference VA 00451236..0045123D.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+51236,66 83 81 10 8D 00 00 02)
TOS.exe+51236:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 00451236

// Reference VA 0045127B..00451282.
// Type-0 horizontal cut-in fade-out -32 -> -16.
assert(TOS.exe+5127B,66 83 81 12 8D 00 00 E0)
TOS.exe+5127B:
// Vanilla: add word ptr [ecx + 0x8d12], -0x20
  db 66,83,81,12,8D,00,00,F0 // add word ptr [ecx + 0x8d12], -0x10 // 0045127B

// Reference VA 0045135B..00451362.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+5135B,66 83 81 10 8D 00 00 02)
TOS.exe+5135B:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 0045135B

// Reference VA 00451383..0045138A.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+51383,66 83 81 10 8D 00 00 02)
TOS.exe+51383:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 00451383

// Reference VA 0045139E..004513A5.
// Type-1 horizontal cut-in fade-out -32 -> -16.
assert(TOS.exe+5139E,66 83 81 12 8D 00 00 E0)
TOS.exe+5139E:
// Vanilla: add word ptr [ecx + 0x8d12], -0x20
  db 66,83,81,12,8D,00,00,F0 // add word ptr [ecx + 0x8d12], -0x10 // 0045139E

// Reference VA 0045142A..00451431.
// Type-2 portrait fade-out -32 -> -16.
assert(TOS.exe+5142A,66 83 81 12 8D 00 00 E0)
TOS.exe+5142A:
// Vanilla: add word ptr [ecx + 0x8d12], -0x20
  db 66,83,81,12,8D,00,00,F0 // add word ptr [ecx + 0x8d12], -0x10 // 0045142A

// Reference VA 00451508..0045150A.
// Battle_TickScreenTransition: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+51508,83 C0 02)
TOS.exe+51508:
// Vanilla: add eax, 2
  add eax, #1 // 00451508

// Reference VA 00451510..00451517.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+51510,66 83 81 10 8D 00 00 02)
TOS.exe+51510:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 00451510

// Reference VA 0045152B..00451532.
// Vertical Crimson cut-in pan -4 -> -2; phase timing remains separate.
// "vert cutin scroll" u4ick
assert(TOS.exe+5152B,66 83 81 0A 8D 00 00 FC)
TOS.exe+5152B:
// Vanilla: add word ptr [ecx + 0x8d0a], -4
  db 66,83,81,0A,8D,00,00,FE // add word ptr [ecx + 0x8d0a], -#2 // 0045152B

// Reference VA 0045154E..00451555.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+5154E,66 83 81 10 8D 00 00 02)
TOS.exe+5154E:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 0045154E

// Reference VA 00451567..0045156E.
// Type-3/4 vertical cut-in fade-out -16 -> -8.
assert(TOS.exe+51567,66 83 81 12 8D 00 00 F0)
TOS.exe+51567:
// Vanilla: add word ptr [ecx + 0x8d12], -0x10
  db 66,83,81,12,8D,00,00,F8 // add word ptr [ecx + 0x8d12], -#8 // 00451567

// Reference VA 0045158C..00451593.
// 60fps patch: screen transition progress += 1 (was 2)
assert(TOS.exe+5158C,66 83 81 10 8D 00 00 02)
TOS.exe+5158C:
// Vanilla: add word ptr [ecx + 0x8d10], 2
  add word ptr [ecx + 0x8d10], #1 // 0045158C

// Reference VA 004575EB..004575EF.
// 60fps patch: particle emitter anim timer += 1 (was 2)
assert(TOS.exe+575EB,66 83 47 36 02)
TOS.exe+575EB:
// Vanilla: add word ptr [edi + 0x36], 2
  add word ptr [edi + 0x36], #1 // 004575EB

// Reference VA 00457632..00457636.
// 60fps patch: particle lifetime counter += 1 (was 2)
assert(TOS.exe+57632,66 83 46 10 02)
TOS.exe+57632:
// Vanilla: add word ptr [esi + 0x10], 2
  add word ptr [esi + 0x10], #1 // 00457632

// Reference VA 0045B355..0045B35D.
assert(TOS.exe+5B355,66 C7 87 12 94 00 00 00 20)
TOS.exe+5B355:
// Vanilla: mov word ptr [edi + 0x9412], 0x2000
  mov word ptr [edi + 0x9412], 0x1000 // 0045B355

// Reference VA 0045B6C1..0045B6CA.
// Battle_Mode2_Setup: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5B6C1,81 BE D4 90 00 00 82 00 00 00)
TOS.exe+5B6C1:
// Vanilla: cmp dword ptr [esi + 0x90d4], 0x82
  db 81,BE,D4,90,00,00,50,00,00,00 // cmp dword ptr [esi + 0x90d4], 0x50 // 0045B6C1

// Reference VA 0045B6DA..0045B6DF.
// 60fps fix: inc [esi+90D4h] (was add [esi+90D4h], edx where edx=2). Counter +90D4h increments by 1 instead of 2. edx=2 preserved for g_battleTickDelta store at 0x45B6F2.
assert(TOS.exe+5B6DA,01 96 D4 90 00 00)
TOS.exe+5B6DA:
// Vanilla: add dword ptr [esi + 0x90d4], edx
  inc dword ptr [esi + 0x90d4] // 0045B6DA

// Reference VA 0045CF10..0045CF16.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5CF10,83 80 D8 90 00 00 02)
TOS.exe+5CF10:
// Vanilla: add dword ptr [eax + 0x90d8], 2
  add dword ptr [eax + 0x90d8], #1 // 0045CF10

// Reference VA 0045D4FA..0045D500.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) advances per tick; at 60fps there are 2 ticks/frame so original +2 would give +4/frame.
assert(TOS.exe+5D4FA,83 80 D8 90 00 00 02)
TOS.exe+5D4FA:
// Vanilla: add dword ptr [eax + 0x90d8], 2
  add dword ptr [eax + 0x90d8], #1 // 0045D4FA

// Reference VA 0045D7FC..0045D802.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5D7FC,83 86 D8 90 00 00 02)
TOS.exe+5D7FC:
// Vanilla: add dword ptr [esi + 0x90d8], 2
  add dword ptr [esi + 0x90d8], #1 // 0045D7FC

// Reference VA 0045D847..0045D84B.
assert(TOS.exe+5D847,B9 02 00 00 00)
TOS.exe+5D847:
// Vanilla: mov ecx, 2
  mov ecx, #1 // 0045D847

// Reference VA 0045DC01..0045DC07.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5DC01,83 80 D8 90 00 00 02)
TOS.exe+5DC01:
// Vanilla: add dword ptr [eax + 0x90d8], 2
  add dword ptr [eax + 0x90d8], #1 // 0045DC01

// Reference VA 0045DC9B..0045DCA1.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5DC9B,83 80 D8 90 00 00 02)
TOS.exe+5DC9B:
// Vanilla: add dword ptr [eax + 0x90d8], 2
  add dword ptr [eax + 0x90d8], #1 // 0045DC9B

// Reference VA 0045DCF6..0045DCF8.
// Battle_Mode11_Cleanup: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5DCF6,83 F9 3C)
TOS.exe+5DCF6:
// Vanilla: cmp ecx, 0x3c
  cmp ecx, 0x5a // 0045DCF6

// Reference VA 0045DD13..0045DD1B.
// Battle_Mode11_Cleanup: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5DD13,66 C7 80 12 94 00 00 01 08)
TOS.exe+5DD13:
// Vanilla: mov word ptr [eax + 0x9412], 0x801
  mov word ptr [eax + 0x9412], 0x401 // 0045DD13

// Reference VA 0045DD1E..0045DD26.
// Battle_Mode11_Cleanup: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5DD1E,66 C7 80 12 94 00 00 01 10)
TOS.exe+5DD1E:
// Vanilla: mov word ptr [eax + 0x9412], 0x1001
  mov word ptr [eax + 0x9412], 0x801 // 0045DD1E

// Reference VA 0045DD30..0045DD32.
// Battle_Mode11_Cleanup: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5DD30,83 F9 3C)
TOS.exe+5DD30:
// Vanilla: cmp ecx, 0x3c
  cmp ecx, 0x5a // 0045DD30

// Reference VA 0045DD90..0045DD92.
// 60fps fix: add [edi], 1 (was 2). Counter +90D4h transition timer in Mode11_Cleanup.
assert(TOS.exe+5DD90,83 07 02)
TOS.exe+5DD90:
// Vanilla: add dword ptr [edi], 2
  add dword ptr [edi], #1 // 0045DD90

// Reference VA 0045DD9A..0045DDA0.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5DD9A,83 80 D8 90 00 00 02)
TOS.exe+5DD9A:
// Vanilla: add dword ptr [eax + 0x90d8], 2
  add dword ptr [eax + 0x90d8], #1 // 0045DD9A

// Reference VA 0045DE64..0045DE6A.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5DE64,83 86 D8 90 00 00 02)
TOS.exe+5DE64:
// Vanilla: add dword ptr [esi + 0x90d8], 2
  add dword ptr [esi + 0x90d8], #1 // 0045DE64

// Reference VA 0045E0B8..0045E0BE.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5E0B8,83 86 D8 90 00 00 02)
TOS.exe+5E0B8:
// Vanilla: add dword ptr [esi + 0x90d8], 2
  add dword ptr [esi + 0x90d8], #1 // 0045E0B8

// Reference VA 0045E2CA..0045E2D0.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5E2CA,83 83 D8 90 00 00 02)
TOS.exe+5E2CA:
// Vanilla: add dword ptr [ebx + 0x90d8], 2
  add dword ptr [ebx + 0x90d8], #1 // 0045E2CA

// Reference VA 0045E6BF..0045E6C6.
// 60fps fix: unison event progress counter += 1 (was 2). Controls milestones: 110=animation blend, 120=screen flash, >150=ready to end.
assert(TOS.exe+5E6BF,66 83 83 D4 93 00 00 02)
TOS.exe+5E6BF:
// Vanilla: add word ptr [ebx + 0x93d4], 2
  add word ptr [ebx + 0x93d4], #1 // 0045E6BF

// Reference VA 0045E6CE..0045E6D4.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5E6CE,83 86 D8 90 00 00 02)
TOS.exe+5E6CE:
// Vanilla: add dword ptr [esi + 0x90d8], 2
  add dword ptr [esi + 0x90d8], #1 // 0045E6CE

// Reference VA 0045E75C..0045E762.
// 60fps fix: changed from 2 to 1. battleUpdateCounter(+90D8h) per tick.
assert(TOS.exe+5E75C,83 80 D8 90 00 00 02)
TOS.exe+5E75C:
// Vanilla: add dword ptr [eax + 0x90d8], 2
  add dword ptr [eax + 0x90d8], #1 // 0045E75C

// Reference VA 0045EB6C..0045EB75.
assert(TOS.exe+5EB6C,C7 80 D4 90 00 00 2D 00 00 00)
TOS.exe+5EB6C:
// Vanilla: mov dword ptr [eax + 0x90d4], 0x2d
  mov dword ptr [eax + 0x90d4], 0x4b // 0045EB6C

// Reference VA 0045EC6E..0045EC73.
// 60fps patch: changed from add ebx(=2) to inc(+1). ebx kept at 2 for bit-test at 0x45ECD0.
assert(TOS.exe+5EC6E,01 9F DC 90 00 00)
TOS.exe+5EC6E:
// Vanilla: add dword ptr [edi + 0x90dc], ebx
  inc dword ptr [edi + 0x90dc] // 0045EC6E

// Reference VA 0045ECF1..0045ECF6.
// 60fps patch: changed from add ebx(=2) to inc(+1). battleTimerA increments by 1 per tick.
assert(TOS.exe+5ECF1,01 9F E0 90 00 00)
TOS.exe+5ECF1:
// Vanilla: add dword ptr [edi + 0x90e0], ebx
  inc dword ptr [edi + 0x90e0] // 0045ECF1

// Reference VA 0045ED00..0045ED05.
// 60fps patch: changed from add ebx(=2) to inc(+1). battleTimerB increments by 1 per tick.
assert(TOS.exe+5ED00,01 9F E4 90 00 00)
TOS.exe+5ED00:
// Vanilla: add dword ptr [edi + 0x90e4], ebx
  inc dword ptr [edi + 0x90e4] // 0045ED00

// Reference VA 0045ED35..0045ED37.
// 60fps patch: timer decrement changed from -2 to -1 (0xFE -> 0xFF).
assert(TOS.exe+5ED35,83 C0 FE)
TOS.exe+5ED35:
// Vanilla: add eax, -2
  add eax, -#1 // 0045ED35

// Reference VA 0045ED93..0045EDA6.
// Battle_TickAndTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5ED93,0F B7 86 BA 90 00 00 66 85 C0 74 08 48 66 89 86 BA 90 00 00)
TOS.exe+5ED93:
// Vanilla: movzx eax, word ptr [esi + 0x90ba]; test ax, ax; je 0x45eda7; dec eax; mov word ptr [esi + 0x90ba], ax
  nop // 0045ED93
  nop // 0045ED94
  nop // 0045ED95
  nop // 0045ED96
  nop // 0045ED97
  nop // 0045ED98
  nop // 0045ED99
  nop // 0045ED9A
  nop // 0045ED9B
  nop // 0045ED9C
  nop // 0045ED9D
  nop // 0045ED9E
  nop // 0045ED9F
  nop // 0045EDA0
  nop // 0045EDA1
  nop // 0045EDA2
  nop // 0045EDA3
  nop // 0045EDA4
  nop // 0045EDA5
  nop // 0045EDA6

// Reference VA 0045EDB9..0045EDCA.
// Battle_TickAndTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5EDB9,8A 86 E8 90 00 00 84 C0 74 08 FE C8 88 86 E8 90 00 00)
TOS.exe+5EDB9:
// Vanilla: mov al, byte ptr [esi + 0x90e8]; test al, al; je 0x45edcb; dec al; mov byte ptr [esi + 0x90e8], al
  nop // 0045EDB9
  nop // 0045EDBA
  nop // 0045EDBB
  nop // 0045EDBC
  nop // 0045EDBD
  nop // 0045EDBE
  nop // 0045EDBF
  nop // 0045EDC0
  nop // 0045EDC1
  nop // 0045EDC2
  nop // 0045EDC3
  nop // 0045EDC4
  nop // 0045EDC5
  nop // 0045EDC6
  nop // 0045EDC7
  nop // 0045EDC8
  nop // 0045EDC9
  nop // 0045EDCA

// Reference VA 0045EDDD..0045EDEE.
// Battle_TickAndTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5EDDD,8A 86 CD 93 00 00 84 C0 74 08 FE C8 88 86 CD 93 00 00)
TOS.exe+5EDDD:
// Vanilla: mov al, byte ptr [esi + 0x93cd]; test al, al; je 0x45edef; dec al; mov byte ptr [esi + 0x93cd], al
  nop // 0045EDDD
  nop // 0045EDDE
  nop // 0045EDDF
  nop // 0045EDE0
  nop // 0045EDE1
  nop // 0045EDE2
  nop // 0045EDE3
  nop // 0045EDE4
  nop // 0045EDE5
  nop // 0045EDE6
  nop // 0045EDE7
  nop // 0045EDE8
  nop // 0045EDE9
  nop // 0045EDEA
  nop // 0045EDEB
  nop // 0045EDEC
  nop // 0045EDED
  nop // 0045EDEE

// Reference VA 0045F288..0045F289.
// Battle_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+5F288,75 40)
TOS.exe+5F288:
// Vanilla: jne 0x45f2ca
  nop // 0045F288
  nop // 0045F289

// Reference VA 00460C2E..00460C2F.
// 60fps fix: NOP'd 'sar edi, 1' to double the unison attack timer duration. At 60fps the timer at +93E8h decrements twice per frame, so the initial value must be 2x to maintain correct real-time duration.
assert(TOS.exe+60C2E,D1 FF)
TOS.exe+60C2E:
// Vanilla: sar edi, 1
  nop // 00460C2E
  nop // 00460C2F

// Reference VA 00460D32..00460D34.
assert(TOS.exe+60D32,8D 0C 3F)
TOS.exe+60D32:
// Vanilla: lea ecx, [edi + edi]
  lea ecx, [edi] // 00460D32
  nop // 00460D34

// Reference VA 00460D42..00460D48.
assert(TOS.exe+60D42,66 39 96 54 93 00 00)
TOS.exe+60D42:
// Vanilla: cmp word ptr [esi + 0x9354], dx
  jmp short TOS.exe+60D54 // 00460D42
  nop // 00460D44
  nop // 00460D45
  nop // 00460D46
  nop // 00460D47
  nop // 00460D48

// Reference VA 00460D54..00460D5B.
assert(TOS.exe+60D54,66 83 86 56 93 00 00 20)
TOS.exe+60D54:
// Vanilla: add word ptr [esi + 0x9356], 0x20
  add word ptr [esi + 0x9356], 0x10 // 00460D54

// Reference VA 00460D81..00460D82.
assert(TOS.exe+60D81,8B EC)
TOS.exe+60D81:
// Vanilla: mov ebp, esp
  mov ebp, esp // 00460D81

// Reference VA 00460D95..00460DD8.
assert(TOS.exe+60D95,BA 00 04 00 00 66 3B CA 7C 0D 8B CA 66 89 88 54 93 00 00 B0 01 5D C3 83 C1 FC 66 89 88 54 93 00 00 66 85 C9 79 1C 33 D2 66 83 80 56 93 00 00 F0 66 89 90 54 93 00 00 79 09 33 C9 66 89 88 56 93 00 00 32 C0)
TOS.exe+60D95:
  sub cx, #2 // 00460D95
  mov word ptr [eax + 0x9354], cx // 00460D99
  test cx, cx // 00460DA0
  jns short TOS.exe+60DBF // 00460DA3
  xor ecx, ecx // 00460DA5
  mov word ptr [eax + 0x9354], cx // 00460DA7
  sub word ptr [eax + 0x9356], #8 // 00460DAE
  jns short TOS.exe+60DBF // 00460DB6
  mov word ptr [eax + 0x9356], cx // 00460DB8
  cmp cx, 0x400 // 00460DBF
  jle short TOS.exe+60DD7 // 00460DC4
  mov word ptr [eax + 0x9354], 0x400 // 00460DC6
  mov al, #1 // 00460DCF
  pop ebp // 00460DD1
  ret // 00460DD2
  nop // 00460DD3
  nop // 00460DD4
  nop // 00460DD5
  nop // 00460DD6
  xor al, al // 00460DD7

// Reference VA 00461278..0046127F.
// 60fps fix: NOP'd second intensity increment. Original did +2/tick (inc twice). At 60fps with 2 ticks/frame, only need +1/tick.
assert(TOS.exe+61278,FE C1 88 88 28 9A 00 00)
TOS.exe+61278:
// Vanilla: inc cl; mov byte ptr [eax + 0x9a28], cl
  nop // 00461278
  nop // 00461279
  nop // 0046127A
  nop // 0046127B
  nop // 0046127C
  nop // 0046127D
  nop // 0046127E
  nop // 0046127F

// Reference VA 0046128F..00461296.
// 60fps fix: NOP'd second duration decrement. Original did -2/tick. At 60fps with 2 ticks/frame, only need -1/tick.
assert(TOS.exe+6128F,49 66 89 88 24 9A 00 00)
TOS.exe+6128F:
// Vanilla: dec ecx; mov word ptr [eax + 0x9a24], cx
  nop // 0046128F
  nop // 00461290
  nop // 00461291
  nop // 00461292
  nop // 00461293
  nop // 00461294
  nop // 00461295
  nop // 00461296

// Reference VA 004612AF..004612B6.
// 60fps fix: NOP'd second intensity decrement. Original did -2/tick. At 60fps with 2 ticks/frame, only need -1/tick.
assert(TOS.exe+612AF,FE C9 88 88 28 9A 00 00)
TOS.exe+612AF:
// Vanilla: dec cl; mov byte ptr [eax + 0x9a28], cl
  nop // 004612AF
  nop // 004612B0
  nop // 004612B1
  nop // 004612B2
  nop // 004612B3
  nop // 004612B4
  nop // 004612B5
  nop // 004612B6

// Reference VA 00461525..0046152A.
assert(TOS.exe+61525,D8 80 0C FF FF FF)
TOS.exe+61525:
// Vanilla: fadd dword ptr [eax - 0xf4]
  nop // 00461525
  nop // 00461526
  nop // 00461527
  nop // 00461528
  nop // 00461529
  nop // 0046152A

// Reference VA 00461543..00461548.
assert(TOS.exe+61543,D8 80 10 FF FF FF)
TOS.exe+61543:
// Vanilla: fadd dword ptr [eax - 0xf0]
  nop // 00461543
  nop // 00461544
  nop // 00461545
  nop // 00461546
  nop // 00461547
  nop // 00461548

// Reference VA 00461561..00461566.
assert(TOS.exe+61561,D8 80 18 FF FF FF)
TOS.exe+61561:
// Vanilla: fadd dword ptr [eax - 0xe8]
  nop // 00461561
  nop // 00461562
  nop // 00461563
  nop // 00461564
  nop // 00461565
  nop // 00461566

// Reference VA 00461591..004615B4.
assert(TOS.exe+61591,D9 80 58 FF FF FF D8 80 60 FF FF FF D9 98 58 FF FF FF D9 80 64 FF FF FF D8 80 5C FF FF FF D9 98 5C FF FF FF)
TOS.exe+61591:
// Vanilla: fld dword ptr [eax - 0xa8]; fadd dword ptr [eax - 0xa0]; fstp dword ptr [eax - 0xa8]; fld dword ptr [eax - 0x9c]; fadd dword ptr [eax - 0xa4]; fstp dword ptr [eax - 0xa4]
  nop // 00461591
  nop // 00461592
  nop // 00461593
  nop // 00461594
  nop // 00461595
  nop // 00461596
  nop // 00461597
  nop // 00461598
  nop // 00461599
  nop // 0046159A
  nop // 0046159B
  nop // 0046159C
  nop // 0046159D
  nop // 0046159E
  nop // 0046159F
  nop // 004615A0
  nop // 004615A1
  nop // 004615A2
  nop // 004615A3
  nop // 004615A4
  nop // 004615A5
  nop // 004615A6
  nop // 004615A7
  nop // 004615A8
  nop // 004615A9
  nop // 004615AA
  nop // 004615AB
  nop // 004615AC
  nop // 004615AD
  nop // 004615AE
  nop // 004615AF
  nop // 004615B0
  nop // 004615B1
  nop // 004615B2
  nop // 004615B3
  nop // 004615B4

// Reference VA 004615CD..004615D2.
assert(TOS.exe+615CD,D8 80 6C FF FF FF)
TOS.exe+615CD:
// Vanilla: fadd dword ptr [eax - 0x94]
  nop // 004615CD
  nop // 004615CE
  nop // 004615CF
  nop // 004615D0
  nop // 004615D1
  nop // 004615D2

// Reference VA 004615F9..004615FB.
assert(TOS.exe+615F9,83 C0 02)
TOS.exe+615F9:
// Vanilla: add eax, 2
  add eax, #1 // 004615F9

// Reference VA 0046165F..00461663.
assert(TOS.exe+6165F,BE 82 00 00 00)
TOS.exe+6165F:
// Vanilla: mov esi, 0x82
  mov esi, 0x78 // 0046165F

// Reference VA 0046166D..0046166F.
assert(TOS.exe+6166D,83 F9 43)
TOS.exe+6166D:
// Vanilla: cmp ecx, 0x43
  cmp ecx, 0x39 // 0046166D

// Reference VA 0046167D..00461681.
assert(TOS.exe+6167D,BE 0B 02 00 00)
TOS.exe+6167D:
// Vanilla: mov esi, 0x20b
  mov esi, 0x1e3 // 0046167D

// Reference VA 004632B0..004632B5.
// Active-bank chant durations: hook_shared. Executable correction; cache follows loaded BTLSTR bank.
assert(TOS.exe+632B0,8B 0D DC 2E AD 00)
TOS.exe+632B0:
// Vanilla: mov ecx, dword ptr [0xad2edc]
  jmp near fps_chant_hook_shared // 004632B0
  nop // 004632B5

// Reference VA 00467AFA..00467AFF.
// Active-bank chant durations: hook_table. Executable correction; cache follows loaded BTLSTR bank.
assert(TOS.exe+67AFA,89 87 3C 9A 00 00)
TOS.exe+67AFA:
// Vanilla: mov dword ptr [edi + 0x9a3c], eax
  jmp near fps_chant_hook_table // 00467AFA
  nop // 00467AFF

// Reference VA 00471294..0047129B.
// 60fps patch: Battle_State6 wait timer += 1 (was 2)
assert(TOS.exe+71294,66 83 82 0E 91 00 00 02)
TOS.exe+71294:
// Vanilla: add word ptr [edx + 0x910e], 2
  add word ptr [edx + 0x910e], #1 // 00471294

// Reference VA 0047142A..0047142E.
// 60fps patch: fade-in progress += 1 (was 2). Shared by both +92A0h and +92A2h adds.
assert(TOS.exe+7142A,B8 02 00 00 00)
TOS.exe+7142A:
// Vanilla: mov eax, 2
  mov eax, #1 // 0047142A

// Reference VA 00471C11..00471C15.
// 60fps patch: Battle_State9 action scene timer += 1 (was 2)
assert(TOS.exe+71C11,66 83 46 0E 02)
TOS.exe+71C11:
// Vanilla: add word ptr [esi + 0xe], 2
  add word ptr [esi + 0xe], #1 // 00471C11

// Reference VA 00471F07..00471F0B.
// 60fps patch: Battle_State10 spawn timer += 1 (was 2)
assert(TOS.exe+71F07,66 83 47 0E 02)
TOS.exe+71F07:
// Vanilla: add word ptr [edi + 0xe], 2
  add word ptr [edi + 0xe], #1 // 00471F07

// Reference VA 00475056..00475058.
assert(TOS.exe+75056,83 C0 02)
TOS.exe+75056:
// Vanilla: add eax, 2
  add eax, #1 // 00475056

// Reference VA 00475319..00475320.
// PATCHED 60fps: offset 446 -= 2 -> -= 1
assert(TOS.exe+75319,66 83 86 BE 01 00 00 FE)
TOS.exe+75319:
// Vanilla: add word ptr [esi + 0x1be], -2
  db 66,83,86,BE,01,00,00,FF // add word ptr [esi + 0x1be], -#1 // 00475319

// Reference VA 0047622C..00476236.
// Rejected arte movement fix: BL==0 falls through to normal movement despite a recognized attack input; nonzero BL retains original input-flag behavior. No stack/cave changes.
assert(TOS.exe+7622C,80 7C 24 11 00 0F 85 69 05 00 00)
TOS.exe+7622C:
// Vanilla: cmp byte ptr [esp + 0x11], 0; jne 0x4767a0
  test bl, bl // 0047622C
  je short TOS.exe+76237 // 0047622E
  cmp byte ptr [esp + 0x11], #0 // 00476230
  jne short TOS.exe+7623A // 00476235

// Reference VA 0047683B..0047683D.
assert(TOS.exe+7683B,8D 48 01)
TOS.exe+7683B:
// Vanilla: lea ecx, [eax + 1]
  db 8D,48,00 // lea ecx, [eax] // 0047683B

// Reference VA 0047E7BF..0047E7C0.
assert(TOS.exe+7E7BF,7C 09)
TOS.exe+7E7BF:
// Vanilla: jl 0x47e7ca
  jmp short TOS.exe+7E7CA // 0047E7BF

// Reference VA 004812E8..004812F0.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+812E8,66 83 40 FC 40 66 83 E9 40)
TOS.exe+812E8:
// Vanilla: add word ptr [eax - 4], 0x40; sub cx, 0x40
  add word ptr [eax - #4], 0x20 // 004812E8
  sub cx, 0x20 // 004812ED

// Reference VA 00481313..00481316.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+81313,66 83 02 20)
TOS.exe+81313:
// Vanilla: add word ptr [edx], 0x20
  add word ptr [edx], 0x10 // 00481313

// Reference VA 0048136E..00481371.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8136E,66 83 00 DC)
TOS.exe+8136E:
// Vanilla: add word ptr [eax], -0x24
  db 66,83,00,EE // add word ptr [eax], -0x12 // 0048136E

// Reference VA 00481381..00481384.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+81381,66 83 01 08)
TOS.exe+81381:
// Vanilla: add word ptr [ecx], 8
  add word ptr [ecx], #4 // 00481381

// Reference VA 004813BC..004813C4.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+813BC,66 83 40 FC 64 66 83 E9 64)
TOS.exe+813BC:
// Vanilla: add word ptr [eax - 4], 0x64; sub cx, 0x64
  add word ptr [eax - #4], 0x32 // 004813BC
  sub cx, 0x32 // 004813C1

// Reference VA 004813F0..004813F3.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+813F0,66 83 02 20)
TOS.exe+813F0:
// Vanilla: add word ptr [edx], 0x20
  add word ptr [edx], 0x10 // 004813F0

// Reference VA 0048249E..004824A7.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8249E,D9 C0 DE F2 D9 C9 DE CA DE E1)
TOS.exe+8249E:
// Vanilla: fld st(0); fdivrp st(2); fxch st(1); fmulp st(2); fsubrp st(1)
  fstp st(1) // 0048249E
  fstp st(1) // 004824A0
  nop // 004824A2
  nop // 004824A3
  nop // 004824A4
  nop // 004824A5
  nop // 004824A6
  nop // 004824A7

// Reference VA 004824EC..004824F1.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+824EC,D8 83 94 00 00 00)
TOS.exe+824EC:
// Vanilla: fadd dword ptr [ebx + 0x94]
  nop // 004824EC
  nop // 004824ED
  nop // 004824EE
  nop // 004824EF
  nop // 004824F0
  nop // 004824F1

// Reference VA 0048251C..0048251F.
// Battle_TickVictoryScreen: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8251C,83 43 04 02)
TOS.exe+8251C:
// Vanilla: add dword ptr [ebx + 4], 2
  add dword ptr [ebx + #4], #1 // 0048251C

// Reference VA 00483C60..00483C67.
assert(TOS.exe+83C60,66 83 80 9C 00 00 00 A0)
TOS.exe+83C60:
// Vanilla: add word ptr [eax + 0x9c], -0x60
  db 66,83,80,9C,00,00,00,D0 // add word ptr [eax + 0x9c], -0x30 // 00483C60

// Reference VA 00483D6D..00483D71.
assert(TOS.exe+83D6D,BE A0 FF FF FF)
TOS.exe+83D6D:
// Vanilla: mov esi, 0xffffffa0
  mov esi, 0xffffffd0 // 00483D6D

// Reference VA 00484E22..00484E26.
// Battle_TickActor: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+84E22,E8 09 42 FB FF)
TOS.exe+84E22:
// Vanilla: call 0x439030
  nop // 00484E22
  nop // 00484E23
  nop // 00484E24
  nop // 00484E25
  nop // 00484E26

// Reference VA 004853AE..004853B7.
assert(TOS.exe+853AE,8D 48 01 32 C8 80 E1 7F 32 C8)
TOS.exe+853AE:
// Vanilla: lea ecx, [eax + 1]; xor cl, al; and cl, 0x7f; xor cl, al
  mov cl, al // 004853AE
  nop // 004853B0
  nop // 004853B1
  nop // 004853B2
  nop // 004853B3
  nop // 004853B4
  nop // 004853B5
  nop // 004853B6
  nop // 004853B7

// Reference VA 004857F8..00485808.
assert(TOS.exe+857F8,E8 53 52 FB FF 8B CB E8 5C 56 FB FF E8 57 57 FB FF)
TOS.exe+857F8:
// Vanilla: call 0x43aa50; mov ecx, ebx; call 0x43ae60; call 0x43af60
  nop // 004857F8
  nop // 004857F9
  nop // 004857FA
  nop // 004857FB
  nop // 004857FC
  nop // 004857FD
  nop // 004857FE
  nop // 004857FF
  nop // 00485800
  nop // 00485801
  nop // 00485802
  nop // 00485803
  nop // 00485804
  nop // 00485805
  nop // 00485806
  nop // 00485807
  nop // 00485808

// Reference VA 004858B6..004858BD.
// EnemyActor_TickApproach: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+858B6,66 83 83 BE 01 00 00 02)
TOS.exe+858B6:
// Vanilla: add word ptr [ebx + 0x1be], 2
  add word ptr [ebx + 0x1be], #1 // 004858B6

// Reference VA 00485B06..00485B1B.
// EnemyActor_TickApproach: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+85B06,E8 45 4F FB FF 8B CB E8 4E 53 FB FF E8 49 54 FB FF E8 F4 50 FB FF)
TOS.exe+85B06:
// Vanilla: call 0x43aa50; mov ecx, ebx; call 0x43ae60; call 0x43af60; call 0x43ac10
  nop // 00485B06
  nop // 00485B07
  nop // 00485B08
  nop // 00485B09
  nop // 00485B0A
  nop // 00485B0B
  nop // 00485B0C
  nop // 00485B0D
  nop // 00485B0E
  nop // 00485B0F
  nop // 00485B10
  nop // 00485B11
  nop // 00485B12
  nop // 00485B13
  nop // 00485B14
  nop // 00485B15
  nop // 00485B16
  nop // 00485B17
  nop // 00485B18
  nop // 00485B19
  nop // 00485B1A
  nop // 00485B1B

// Reference VA 00485F75..00485F80.
// EnemyActor_TickSpellCast: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+85F75,E8 D6 4A FB FF 8B CE E8 5F 4D FB FF)
TOS.exe+85F75:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 00485F75
  nop // 00485F76
  nop // 00485F77
  nop // 00485F78
  nop // 00485F79
  nop // 00485F7A
  nop // 00485F7B
  nop // 00485F7C
  nop // 00485F7D
  nop // 00485F7E
  nop // 00485F7F
  nop // 00485F80

// Reference VA 00486037..0048603E.
// EnemyActor_TickRetreat: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+86037,66 83 83 BE 01 00 00 02)
TOS.exe+86037:
// Vanilla: add word ptr [ebx + 0x1be], 2
  add word ptr [ebx + 0x1be], #1 // 00486037

// Reference VA 004861B6..0048620B.
// EnemyActor_TickRetreat: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+861B6,E8 95 48 FB FF 8B CB E8 9E 4C FB FF F6 83 91 02 00 00 07 74 3C 8B 43 04 F6 40 5C 02 74 33 0F B7 83 9E 02 00 00 03 C0 03 C0 99 B9 68 01 00 00 F7 F9 A1 DC 2E AD 00 8B 88 40 9A 00 00 D9 04 91 DC 0D 50 29 88 00 D8 83 A0 38 01 00 D9 9B A0 38 01 00 E8 04 4A FB FF)
TOS.exe+861B6:
  nop // 004861B6
  nop // 004861B7
  nop // 004861B8
  nop // 004861B9
  nop // 004861BA
  nop // 004861BB
  nop // 004861BC
  nop // 004861BD
  nop // 004861BE
  nop // 004861BF
  nop // 004861C0
  nop // 004861C1
  nop // 004861C2
  nop // 004861C3
  nop // 004861C4
  nop // 004861C5
  nop // 004861C6
  nop // 004861C7
  nop // 004861C8
  nop // 004861C9
  nop // 004861CA
  nop // 004861CB
  nop // 004861CC
  nop // 004861CD
  nop // 004861CE
  nop // 004861CF
  nop // 004861D0
  nop // 004861D1
  nop // 004861D2
  nop // 004861D3
  nop // 004861D4
  nop // 004861D5
  nop // 004861D6
  nop // 004861D7
  nop // 004861D8
  nop // 004861D9
  nop // 004861DA
  nop // 004861DB
  nop // 004861DC
  nop // 004861DD
  nop // 004861DE
  nop // 004861DF
  nop // 004861E0
  nop // 004861E1
  nop // 004861E2
  nop // 004861E3
  nop // 004861E4
  nop // 004861E5
  nop // 004861E6
  nop // 004861E7
  nop // 004861E8
  nop // 004861E9
  nop // 004861EA
  nop // 004861EB
  nop // 004861EC
  nop // 004861ED
  nop // 004861EE
  nop // 004861EF
  nop // 004861F0
  nop // 004861F1
  nop // 004861F2
  nop // 004861F3
  nop // 004861F4
  nop // 004861F5
  nop // 004861F6
  nop // 004861F7
  nop // 004861F8
  nop // 004861F9
  nop // 004861FA
  nop // 004861FB
  nop // 004861FC
  nop // 004861FD
  nop // 004861FE
  nop // 004861FF
  nop // 00486200
  nop // 00486201
  nop // 00486202
  nop // 00486203
  nop // 00486204
  nop // 00486205
  nop // 00486206
  nop // 00486207
  nop // 00486208
  nop // 00486209
  nop // 0048620A
  nop // 0048620B

// Reference VA 004864CA..004864D1.
// EnemyActor_TickRetreat: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+864CA,66 83 83 BE 01 00 00 02)
TOS.exe+864CA:
// Vanilla: add word ptr [ebx + 0x1be], 2
  add word ptr [ebx + 0x1be], #1 // 004864CA

// Reference VA 004869A2..004869A4.
assert(TOS.exe+869A2,83 C1 FE)
TOS.exe+869A2:
// Vanilla: add ecx, -2
  add ecx, -#1 // 004869A2

// Reference VA 004869E6..004869F1.
assert(TOS.exe+869E6,E8 65 40 FB FF 8B CB E8 EE 42 FB FF)
TOS.exe+869E6:
// Vanilla: call 0x43aa50; mov ecx, ebx; call 0x43ace0
  nop // 004869E6
  nop // 004869E7
  nop // 004869E8
  nop // 004869E9
  nop // 004869EA
  nop // 004869EB
  nop // 004869EC
  nop // 004869ED
  nop // 004869EE
  nop // 004869EF
  nop // 004869F0
  nop // 004869F1

// Reference VA 00486A73..00486A7E.
assert(TOS.exe+86A73,E8 D8 3F FB FF 8B CB E8 61 42 FB FF)
TOS.exe+86A73:
// Vanilla: call 0x43aa50; mov ecx, ebx; call 0x43ace0
  nop // 00486A73
  nop // 00486A74
  nop // 00486A75
  nop // 00486A76
  nop // 00486A77
  nop // 00486A78
  nop // 00486A79
  nop // 00486A7A
  nop // 00486A7B
  nop // 00486A7C
  nop // 00486A7D
  nop // 00486A7E

// Reference VA 00486CA5..00486CFC.
assert(TOS.exe+86CA5,8A 83 EF 17 00 00 84 C0 74 22 FE C8 88 83 EF 17 00 00 75 18 8B 93 50 39 01 00 8B 83 54 39 01 00 89 93 EC 38 01 00 89 83 F0 38 01 00 8A 83 EF 17 00 00 84 C0 74 22 FE C8 88 83 EF 17 00 00 75 18 8B 8B 50 39 01 00 8B 93 54 39 01 00 89 8B EC 38 01 00 89 93 F0 38 01 00)
TOS.exe+86CA5:
  jmp near fps_spell_knockback_timer // 00486CA5
  nop // 00486CAA
  nop // 00486CAB
  nop // 00486CAC
  nop // 00486CAD
  nop // 00486CAE
  nop // 00486CAF
  nop // 00486CB0
  nop // 00486CB1
  nop // 00486CB2
  nop // 00486CB3
  nop // 00486CB4
  nop // 00486CB5
  nop // 00486CB6
  nop // 00486CB7
  nop // 00486CB8
  nop // 00486CB9
  nop // 00486CBA
  nop // 00486CBB
  nop // 00486CBC
  nop // 00486CBD
  nop // 00486CBE
  nop // 00486CBF
  nop // 00486CC0
  nop // 00486CC1
  nop // 00486CC2
  nop // 00486CC3
  nop // 00486CC4
  nop // 00486CC5
  nop // 00486CC6
  nop // 00486CC7
  nop // 00486CC8
  nop // 00486CC9
  nop // 00486CCA
  nop // 00486CCB
  nop // 00486CCC
  nop // 00486CCD
  nop // 00486CCE
  nop // 00486CCF
  nop // 00486CD0
  nop // 00486CD1
  nop // 00486CD2
  nop // 00486CD3
  nop // 00486CD4
  nop // 00486CD5
  nop // 00486CD6
  nop // 00486CD7
  nop // 00486CD8
  nop // 00486CD9
  nop // 00486CDA
  nop // 00486CDB
  nop // 00486CDC
  nop // 00486CDD
  nop // 00486CDE
  nop // 00486CDF
  nop // 00486CE0
  nop // 00486CE1
  nop // 00486CE2
  nop // 00486CE3
  nop // 00486CE4
  nop // 00486CE5
  nop // 00486CE6
  nop // 00486CE7
  nop // 00486CE8
  nop // 00486CE9
  nop // 00486CEA
  nop // 00486CEB
  nop // 00486CEC
  nop // 00486CED
  nop // 00486CEE
  nop // 00486CEF
  nop // 00486CF0
  nop // 00486CF1
  nop // 00486CF2
  nop // 00486CF3
  nop // 00486CF4
  nop // 00486CF5
  nop // 00486CF6
  nop // 00486CF7
  nop // 00486CF8
  nop // 00486CF9
  nop // 00486CFA
  nop // 00486CFB
  nop // 00486CFC

// Reference VA 004870C8..004870CF.
assert(TOS.exe+870C8,66 83 83 BE 01 00 00 FE)
TOS.exe+870C8:
// Vanilla: add word ptr [ebx + 0x1be], -2
  db 66,83,83,BE,01,00,00,FF // add word ptr [ebx + 0x1be], -#1 // 004870C8

// Reference VA 0048726B..0048727B.
assert(TOS.exe+8726B,E8 E0 37 FB FF 8B CE E8 E9 3B FB FF E8 64 3A FB FF)
TOS.exe+8726B:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ae60; call 0x43ace0
  nop // 0048726B
  nop // 0048726C
  nop // 0048726D
  nop // 0048726E
  nop // 0048726F
  nop // 00487270
  nop // 00487271
  nop // 00487272
  nop // 00487273
  nop // 00487274
  nop // 00487275
  nop // 00487276
  nop // 00487277
  nop // 00487278
  nop // 00487279
  nop // 0048727A
  nop // 0048727B

// Reference VA 00487861..00487861.
assert(TOS.exe+87861,48)
TOS.exe+87861:
// Vanilla: dec eax
  nop // 00487861

// Reference VA 00487BC4..00487BCF.
assert(TOS.exe+87BC4,E8 87 2E FB FF 8B CB E8 10 31 FB FF)
TOS.exe+87BC4:
// Vanilla: call 0x43aa50; mov ecx, ebx; call 0x43ace0
  nop // 00487BC4
  nop // 00487BC5
  nop // 00487BC6
  nop // 00487BC7
  nop // 00487BC8
  nop // 00487BC9
  nop // 00487BCA
  nop // 00487BCB
  nop // 00487BCC
  nop // 00487BCD
  nop // 00487BCE
  nop // 00487BCF

// Reference VA 00487C07..00487C0E.
assert(TOS.exe+87C07,66 83 83 BE 01 00 00 02)
TOS.exe+87C07:
// Vanilla: add word ptr [ebx + 0x1be], 2
  add word ptr [ebx + 0x1be], #1 // 00487C07

// Reference VA 00487C6E..00487C75.
// PATCHED 60fps: movement script timer +2 -> +1
assert(TOS.exe+87C6E,66 83 86 F8 12 00 00 02)
TOS.exe+87C6E:
// Vanilla: add word ptr [esi + 0x12f8], 2
  add word ptr [esi + 0x12f8], #1 // 00487C6E

// Reference VA 00487D1D..00487D28.
// Battle_TickArteAttackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+87D1D,E8 2E 2D FB FF 8B CE E8 B7 2F FB FF)
TOS.exe+87D1D:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 00487D1D
  nop // 00487D1E
  nop // 00487D1F
  nop // 00487D20
  nop // 00487D21
  nop // 00487D22
  nop // 00487D23
  nop // 00487D24
  nop // 00487D25
  nop // 00487D26
  nop // 00487D27
  nop // 00487D28

// Reference VA 00487D35..00487D3C.
// Battle_TickArteAttackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+87D35,66 83 86 BE 01 00 00 02)
TOS.exe+87D35:
// Vanilla: add word ptr [esi + 0x1be], 2
  add word ptr [esi + 0x1be], #1 // 00487D35

// Reference VA 00488065..0048806C.
assert(TOS.exe+88065,66 83 86 BE 01 00 00 FE)
TOS.exe+88065:
// Vanilla: add word ptr [esi + 0x1be], -2
  db 66,83,86,BE,01,00,00,FF // add word ptr [esi + 0x1be], -#1 // 00488065

// Reference VA 004880C8..004880D3.
assert(TOS.exe+880C8,E8 83 29 FB FF 8B CE E8 0C 2C FB FF)
TOS.exe+880C8:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 004880C8
  nop // 004880C9
  nop // 004880CA
  nop // 004880CB
  nop // 004880CC
  nop // 004880CD
  nop // 004880CE
  nop // 004880CF
  nop // 004880D0
  nop // 004880D1
  nop // 004880D2
  nop // 004880D3

// Reference VA 00488122..00488129.
assert(TOS.exe+88122,66 83 86 BE 01 00 00 FE)
TOS.exe+88122:
// Vanilla: add word ptr [esi + 0x1be], -2
  db 66,83,86,BE,01,00,00,FF // add word ptr [esi + 0x1be], -#1 // 00488122

// Reference VA 00488576..00488581.
assert(TOS.exe+88576,E8 D5 24 FB FF 8B CE E8 5E 27 FB FF)
TOS.exe+88576:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 00488576
  nop // 00488577
  nop // 00488578
  nop // 00488579
  nop // 0048857A
  nop // 0048857B
  nop // 0048857C
  nop // 0048857D
  nop // 0048857E
  nop // 0048857F
  nop // 00488580
  nop // 00488581

// Reference VA 004886A4..004886AF.
assert(TOS.exe+886A4,E8 A7 23 FB FF 8B CE E8 30 26 FB FF)
TOS.exe+886A4:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 004886A4
  nop // 004886A5
  nop // 004886A6
  nop // 004886A7
  nop // 004886A8
  nop // 004886A9
  nop // 004886AA
  nop // 004886AB
  nop // 004886AC
  nop // 004886AD
  nop // 004886AE
  nop // 004886AF

// Reference VA 0048879C..004887A7.
assert(TOS.exe+8879C,E8 AF 22 FB FF 8B CE E8 38 25 FB FF)
TOS.exe+8879C:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 0048879C
  nop // 0048879D
  nop // 0048879E
  nop // 0048879F
  nop // 004887A0
  nop // 004887A1
  nop // 004887A2
  nop // 004887A3
  nop // 004887A4
  nop // 004887A5
  nop // 004887A6
  nop // 004887A7

// Reference VA 0048884E..00488859.
assert(TOS.exe+8884E,E8 FD 21 FB FF 8B CE E8 86 24 FB FF)
TOS.exe+8884E:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 0048884E
  nop // 0048884F
  nop // 00488850
  nop // 00488851
  nop // 00488852
  nop // 00488853
  nop // 00488854
  nop // 00488855
  nop // 00488856
  nop // 00488857
  nop // 00488858
  nop // 00488859

// Reference VA 004888EF..004888F6.
assert(TOS.exe+888EF,66 83 86 BE 01 00 00 FE)
TOS.exe+888EF:
// Vanilla: add word ptr [esi + 0x1be], -2
  db 66,83,86,BE,01,00,00,FF // add word ptr [esi + 0x1be], -#1 // 004888EF

// Reference VA 004889D7..004889E2.
assert(TOS.exe+889D7,E8 74 20 FB FF 8B CE E8 FD 22 FB FF)
TOS.exe+889D7:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 004889D7
  nop // 004889D8
  nop // 004889D9
  nop // 004889DA
  nop // 004889DB
  nop // 004889DC
  nop // 004889DD
  nop // 004889DE
  nop // 004889DF
  nop // 004889E0
  nop // 004889E1
  nop // 004889E2

// Reference VA 00488C05..00488C5A.
assert(TOS.exe+88C05,E8 46 1E FB FF 8B CB E8 4F 22 FB FF F6 83 91 02 00 00 07 74 3C 8B 53 04 F6 42 5C 02 74 33 0F B7 83 9E 02 00 00 03 C0 03 C0 99 B9 68 01 00 00 F7 F9 A1 DC 2E AD 00 8B 88 40 9A 00 00 D9 04 91 DC 0D 50 29 88 00 D8 83 A0 38 01 00 D9 9B A0 38 01 00 E8 B5 1F FB FF)
TOS.exe+88C05:
  nop // 00488C05
  nop // 00488C06
  nop // 00488C07
  nop // 00488C08
  nop // 00488C09
  nop // 00488C0A
  nop // 00488C0B
  nop // 00488C0C
  nop // 00488C0D
  nop // 00488C0E
  nop // 00488C0F
  nop // 00488C10
  nop // 00488C11
  nop // 00488C12
  nop // 00488C13
  nop // 00488C14
  nop // 00488C15
  nop // 00488C16
  nop // 00488C17
  nop // 00488C18
  nop // 00488C19
  nop // 00488C1A
  nop // 00488C1B
  nop // 00488C1C
  nop // 00488C1D
  nop // 00488C1E
  nop // 00488C1F
  nop // 00488C20
  nop // 00488C21
  nop // 00488C22
  nop // 00488C23
  nop // 00488C24
  nop // 00488C25
  nop // 00488C26
  nop // 00488C27
  nop // 00488C28
  nop // 00488C29
  nop // 00488C2A
  nop // 00488C2B
  nop // 00488C2C
  nop // 00488C2D
  nop // 00488C2E
  nop // 00488C2F
  nop // 00488C30
  nop // 00488C31
  nop // 00488C32
  nop // 00488C33
  nop // 00488C34
  nop // 00488C35
  nop // 00488C36
  nop // 00488C37
  nop // 00488C38
  nop // 00488C39
  nop // 00488C3A
  nop // 00488C3B
  nop // 00488C3C
  nop // 00488C3D
  nop // 00488C3E
  nop // 00488C3F
  nop // 00488C40
  nop // 00488C41
  nop // 00488C42
  nop // 00488C43
  nop // 00488C44
  nop // 00488C45
  nop // 00488C46
  nop // 00488C47
  nop // 00488C48
  nop // 00488C49
  nop // 00488C4A
  nop // 00488C4B
  nop // 00488C4C
  nop // 00488C4D
  nop // 00488C4E
  nop // 00488C4F
  nop // 00488C50
  nop // 00488C51
  nop // 00488C52
  nop // 00488C53
  nop // 00488C54
  nop // 00488C55
  nop // 00488C56
  nop // 00488C57
  nop // 00488C58
  nop // 00488C59
  nop // 00488C5A

// Reference VA 0048921A..0048921C.
// 60fps fix: add eax,-2 → add eax,-1. Timer[+1BEh] decremented by 1 per tick (was 2). Controls spell/action recovery duration for sub_488D70.
assert(TOS.exe+8921A,83 C0 FE)
TOS.exe+8921A:
// Vanilla: add eax, -2
  add eax, -#1 // 0048921A

// Reference VA 0048925C..00489267.
assert(TOS.exe+8925C,E8 EF 17 FB FF 8B CE E8 78 1A FB FF)
TOS.exe+8925C:
// Vanilla: call 0x43aa50; mov ecx, esi; call 0x43ace0
  nop // 0048925C
  nop // 0048925D
  nop // 0048925E
  nop // 0048925F
  nop // 00489260
  nop // 00489261
  nop // 00489262
  nop // 00489263
  nop // 00489264
  nop // 00489265
  nop // 00489266
  nop // 00489267

// Reference VA 0048948B..00489492.
assert(TOS.exe+8948B,66 83 83 BE 01 00 00 FE)
TOS.exe+8948B:
// Vanilla: add word ptr [ebx + 0x1be], -2
  db 66,83,83,BE,01,00,00,FF // add word ptr [ebx + 0x1be], -#1 // 0048948B

// Reference VA 004894CD..004894D8.
assert(TOS.exe+894CD,E8 7E 15 FB FF 8B CB E8 07 18 FB FF)
TOS.exe+894CD:
// Vanilla: call 0x43aa50; mov ecx, ebx; call 0x43ace0
  nop // 004894CD
  nop // 004894CE
  nop // 004894CF
  nop // 004894D0
  nop // 004894D1
  nop // 004894D2
  nop // 004894D3
  nop // 004894D4
  nop // 004894D5
  nop // 004894D6
  nop // 004894D7
  nop // 004894D8

// Reference VA 0048B262..0048B264.
// VFX_TickLifetime: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8B262,83 C0 02)
TOS.exe+8B262:
// Vanilla: add eax, 2
  add eax, #1 // 0048B262

// Reference VA 0048B27B..0048B27D.
// VFX_TickLifetime: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8B27B,83 C0 02)
TOS.exe+8B27B:
// Vanilla: add eax, 2
  add eax, #1 // 0048B27B

// Reference VA 0048B7D0..0048B805.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8B7D0,D9 43 48 D8 43 3C D9 5B 3C D9 43 4C D8 43 40 D9 5B 40 D9 43 50 D8 43 44 D9 5B 44 D9 43 48 D8 43 54 D9 5B 48 D9 43 4C D8 43 58 D9 5B 4C D9 43 50 D8 43 5C D9 5B 50)
TOS.exe+8B7D0:
  nop // 0048B7D0
  nop // 0048B7D1
  nop // 0048B7D2
  nop // 0048B7D3
  nop // 0048B7D4
  nop // 0048B7D5
  nop // 0048B7D6
  nop // 0048B7D7
  nop // 0048B7D8
  nop // 0048B7D9
  nop // 0048B7DA
  nop // 0048B7DB
  nop // 0048B7DC
  nop // 0048B7DD
  nop // 0048B7DE
  nop // 0048B7DF
  nop // 0048B7E0
  nop // 0048B7E1
  nop // 0048B7E2
  nop // 0048B7E3
  nop // 0048B7E4
  nop // 0048B7E5
  nop // 0048B7E6
  nop // 0048B7E7
  nop // 0048B7E8
  nop // 0048B7E9
  nop // 0048B7EA
  nop // 0048B7EB
  nop // 0048B7EC
  nop // 0048B7ED
  nop // 0048B7EE
  nop // 0048B7EF
  nop // 0048B7F0
  nop // 0048B7F1
  nop // 0048B7F2
  nop // 0048B7F3
  nop // 0048B7F4
  nop // 0048B7F5
  nop // 0048B7F6
  nop // 0048B7F7
  nop // 0048B7F8
  nop // 0048B7F9
  nop // 0048B7FA
  nop // 0048B7FB
  nop // 0048B7FC
  nop // 0048B7FD
  nop // 0048B7FE
  nop // 0048B7FF
  nop // 0048B800
  nop // 0048B801
  nop // 0048B802
  nop // 0048B803
  nop // 0048B804
  nop // 0048B805

// Reference VA 0048B836..0048B853.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8B836,D9 43 78 D8 43 54 D9 5B 54 D9 43 58 D8 43 7C D9 5B 58 D9 83 80 00 00 00 D8 43 5C D9 5B 5C)
TOS.exe+8B836:
  nop // 0048B836
  nop // 0048B837
  nop // 0048B838
  nop // 0048B839
  nop // 0048B83A
  nop // 0048B83B
  nop // 0048B83C
  nop // 0048B83D
  nop // 0048B83E
  nop // 0048B83F
  nop // 0048B840
  nop // 0048B841
  nop // 0048B842
  nop // 0048B843
  nop // 0048B844
  nop // 0048B845
  nop // 0048B846
  nop // 0048B847
  nop // 0048B848
  nop // 0048B849
  nop // 0048B84A
  nop // 0048B84B
  nop // 0048B84C
  nop // 0048B84D
  nop // 0048B84E
  nop // 0048B84F
  nop // 0048B850
  nop // 0048B851
  nop // 0048B852
  nop // 0048B853

// Reference VA 0048B8C5..0048B90C.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8B8C5,D9 43 48 D8 83 50 01 00 00 D9 9B 50 01 00 00 D9 43 4C D8 83 54 01 00 00 D9 9B 54 01 00 00 D9 43 50 D8 83 58 01 00 00 D9 9B 58 01 00 00 D9 43 48 D8 43 54 D9 5B 48 D9 43 4C D8 43 58 D9 5B 4C D9 43 50 D8 43 5C D9 5B 50)
TOS.exe+8B8C5:
  nop // 0048B8C5
  nop // 0048B8C6
  nop // 0048B8C7
  nop // 0048B8C8
  nop // 0048B8C9
  nop // 0048B8CA
  nop // 0048B8CB
  nop // 0048B8CC
  nop // 0048B8CD
  nop // 0048B8CE
  nop // 0048B8CF
  nop // 0048B8D0
  nop // 0048B8D1
  nop // 0048B8D2
  nop // 0048B8D3
  nop // 0048B8D4
  nop // 0048B8D5
  nop // 0048B8D6
  nop // 0048B8D7
  nop // 0048B8D8
  nop // 0048B8D9
  nop // 0048B8DA
  nop // 0048B8DB
  nop // 0048B8DC
  nop // 0048B8DD
  nop // 0048B8DE
  nop // 0048B8DF
  nop // 0048B8E0
  nop // 0048B8E1
  nop // 0048B8E2
  nop // 0048B8E3
  nop // 0048B8E4
  nop // 0048B8E5
  nop // 0048B8E6
  nop // 0048B8E7
  nop // 0048B8E8
  nop // 0048B8E9
  nop // 0048B8EA
  nop // 0048B8EB
  nop // 0048B8EC
  nop // 0048B8ED
  nop // 0048B8EE
  nop // 0048B8EF
  nop // 0048B8F0
  nop // 0048B8F1
  nop // 0048B8F2
  nop // 0048B8F3
  nop // 0048B8F4
  nop // 0048B8F5
  nop // 0048B8F6
  nop // 0048B8F7
  nop // 0048B8F8
  nop // 0048B8F9
  nop // 0048B8FA
  nop // 0048B8FB
  nop // 0048B8FC
  nop // 0048B8FD
  nop // 0048B8FE
  nop // 0048B8FF
  nop // 0048B900
  nop // 0048B901
  nop // 0048B902
  nop // 0048B903
  nop // 0048B904
  nop // 0048B905
  nop // 0048B906
  nop // 0048B907
  nop // 0048B908
  nop // 0048B909
  nop // 0048B90A
  nop // 0048B90B
  nop // 0048B90C

// Reference VA 0048BB44..0048BB5E.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BB44,D9 43 60 D8 43 6C D9 5B 60 D9 43 70 D8 43 64 D9 5B 64 D9 43 74 D8 43 68 D9 5B 68)
TOS.exe+8BB44:
  nop // 0048BB44
  nop // 0048BB45
  nop // 0048BB46
  nop // 0048BB47
  nop // 0048BB48
  nop // 0048BB49
  nop // 0048BB4A
  nop // 0048BB4B
  nop // 0048BB4C
  nop // 0048BB4D
  nop // 0048BB4E
  nop // 0048BB4F
  nop // 0048BB50
  nop // 0048BB51
  nop // 0048BB52
  nop // 0048BB53
  nop // 0048BB54
  nop // 0048BB55
  nop // 0048BB56
  nop // 0048BB57
  nop // 0048BB58
  nop // 0048BB59
  nop // 0048BB5A
  nop // 0048BB5B
  nop // 0048BB5C
  nop // 0048BB5D
  nop // 0048BB5E

// Reference VA 0048BBB3..0048BBE8.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BBB3,D9 83 A0 00 00 00 D8 83 AC 00 00 00 D9 9B A0 00 00 00 D9 83 A4 00 00 00 D8 83 B0 00 00 00 D9 9B A4 00 00 00 D9 83 B4 00 00 00 D8 83 A8 00 00 00 D9 9B A8 00 00 00)
TOS.exe+8BBB3:
  nop // 0048BBB3
  nop // 0048BBB4
  nop // 0048BBB5
  nop // 0048BBB6
  nop // 0048BBB7
  nop // 0048BBB8
  nop // 0048BBB9
  nop // 0048BBBA
  nop // 0048BBBB
  nop // 0048BBBC
  nop // 0048BBBD
  nop // 0048BBBE
  nop // 0048BBBF
  nop // 0048BBC0
  nop // 0048BBC1
  nop // 0048BBC2
  nop // 0048BBC3
  nop // 0048BBC4
  nop // 0048BBC5
  nop // 0048BBC6
  nop // 0048BBC7
  nop // 0048BBC8
  nop // 0048BBC9
  nop // 0048BBCA
  nop // 0048BBCB
  nop // 0048BBCC
  nop // 0048BBCD
  nop // 0048BBCE
  nop // 0048BBCF
  nop // 0048BBD0
  nop // 0048BBD1
  nop // 0048BBD2
  nop // 0048BBD3
  nop // 0048BBD4
  nop // 0048BBD5
  nop // 0048BBD6
  nop // 0048BBD7
  nop // 0048BBD8
  nop // 0048BBD9
  nop // 0048BBDA
  nop // 0048BBDB
  nop // 0048BBDC
  nop // 0048BBDD
  nop // 0048BBDE
  nop // 0048BBDF
  nop // 0048BBE0
  nop // 0048BBE1
  nop // 0048BBE2
  nop // 0048BBE3
  nop // 0048BBE4
  nop // 0048BBE5
  nop // 0048BBE6
  nop // 0048BBE7
  nop // 0048BBE8

// Reference VA 0048BC4A..0048BC7F.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BC4A,D9 83 B8 00 00 00 D8 83 E8 00 00 00 D9 9B B8 00 00 00 D9 83 EC 00 00 00 D8 83 BC 00 00 00 D9 9B BC 00 00 00 D9 83 F0 00 00 00 D8 83 C0 00 00 00 D9 9B C0 00 00 00)
TOS.exe+8BC4A:
  nop // 0048BC4A
  nop // 0048BC4B
  nop // 0048BC4C
  nop // 0048BC4D
  nop // 0048BC4E
  nop // 0048BC4F
  nop // 0048BC50
  nop // 0048BC51
  nop // 0048BC52
  nop // 0048BC53
  nop // 0048BC54
  nop // 0048BC55
  nop // 0048BC56
  nop // 0048BC57
  nop // 0048BC58
  nop // 0048BC59
  nop // 0048BC5A
  nop // 0048BC5B
  nop // 0048BC5C
  nop // 0048BC5D
  nop // 0048BC5E
  nop // 0048BC5F
  nop // 0048BC60
  nop // 0048BC61
  nop // 0048BC62
  nop // 0048BC63
  nop // 0048BC64
  nop // 0048BC65
  nop // 0048BC66
  nop // 0048BC67
  nop // 0048BC68
  nop // 0048BC69
  nop // 0048BC6A
  nop // 0048BC6B
  nop // 0048BC6C
  nop // 0048BC6D
  nop // 0048BC6E
  nop // 0048BC6F
  nop // 0048BC70
  nop // 0048BC71
  nop // 0048BC72
  nop // 0048BC73
  nop // 0048BC74
  nop // 0048BC75
  nop // 0048BC76
  nop // 0048BC77
  nop // 0048BC78
  nop // 0048BC79
  nop // 0048BC7A
  nop // 0048BC7B
  nop // 0048BC7C
  nop // 0048BC7D
  nop // 0048BC7E
  nop // 0048BC7F

// Reference VA 0048BCB6..0048BCEB.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BCB6,D9 83 C4 00 00 00 D8 83 F4 00 00 00 D9 9B C4 00 00 00 D9 83 F8 00 00 00 D8 83 C8 00 00 00 D9 9B C8 00 00 00 D9 83 FC 00 00 00 D8 83 CC 00 00 00 D9 9B CC 00 00 00)
TOS.exe+8BCB6:
  nop // 0048BCB6
  nop // 0048BCB7
  nop // 0048BCB8
  nop // 0048BCB9
  nop // 0048BCBA
  nop // 0048BCBB
  nop // 0048BCBC
  nop // 0048BCBD
  nop // 0048BCBE
  nop // 0048BCBF
  nop // 0048BCC0
  nop // 0048BCC1
  nop // 0048BCC2
  nop // 0048BCC3
  nop // 0048BCC4
  nop // 0048BCC5
  nop // 0048BCC6
  nop // 0048BCC7
  nop // 0048BCC8
  nop // 0048BCC9
  nop // 0048BCCA
  nop // 0048BCCB
  nop // 0048BCCC
  nop // 0048BCCD
  nop // 0048BCCE
  nop // 0048BCCF
  nop // 0048BCD0
  nop // 0048BCD1
  nop // 0048BCD2
  nop // 0048BCD3
  nop // 0048BCD4
  nop // 0048BCD5
  nop // 0048BCD6
  nop // 0048BCD7
  nop // 0048BCD8
  nop // 0048BCD9
  nop // 0048BCDA
  nop // 0048BCDB
  nop // 0048BCDC
  nop // 0048BCDD
  nop // 0048BCDE
  nop // 0048BCDF
  nop // 0048BCE0
  nop // 0048BCE1
  nop // 0048BCE2
  nop // 0048BCE3
  nop // 0048BCE4
  nop // 0048BCE5
  nop // 0048BCE6
  nop // 0048BCE7
  nop // 0048BCE8
  nop // 0048BCE9
  nop // 0048BCEA
  nop // 0048BCEB

// Reference VA 0048BD22..0048BD57.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BD22,D9 83 00 01 00 00 D8 83 D0 00 00 00 D9 9B D0 00 00 00 D9 83 04 01 00 00 D8 83 D4 00 00 00 D9 9B D4 00 00 00 D9 83 D8 00 00 00 D8 83 08 01 00 00 D9 9B D8 00 00 00)
TOS.exe+8BD22:
  nop // 0048BD22
  nop // 0048BD23
  nop // 0048BD24
  nop // 0048BD25
  nop // 0048BD26
  nop // 0048BD27
  nop // 0048BD28
  nop // 0048BD29
  nop // 0048BD2A
  nop // 0048BD2B
  nop // 0048BD2C
  nop // 0048BD2D
  nop // 0048BD2E
  nop // 0048BD2F
  nop // 0048BD30
  nop // 0048BD31
  nop // 0048BD32
  nop // 0048BD33
  nop // 0048BD34
  nop // 0048BD35
  nop // 0048BD36
  nop // 0048BD37
  nop // 0048BD38
  nop // 0048BD39
  nop // 0048BD3A
  nop // 0048BD3B
  nop // 0048BD3C
  nop // 0048BD3D
  nop // 0048BD3E
  nop // 0048BD3F
  nop // 0048BD40
  nop // 0048BD41
  nop // 0048BD42
  nop // 0048BD43
  nop // 0048BD44
  nop // 0048BD45
  nop // 0048BD46
  nop // 0048BD47
  nop // 0048BD48
  nop // 0048BD49
  nop // 0048BD4A
  nop // 0048BD4B
  nop // 0048BD4C
  nop // 0048BD4D
  nop // 0048BD4E
  nop // 0048BD4F
  nop // 0048BD50
  nop // 0048BD51
  nop // 0048BD52
  nop // 0048BD53
  nop // 0048BD54
  nop // 0048BD55
  nop // 0048BD56
  nop // 0048BD57

// Reference VA 0048BD8E..0048BDC3.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BD8E,D9 83 DC 00 00 00 D8 83 0C 01 00 00 D9 9B DC 00 00 00 D9 83 E0 00 00 00 D8 83 10 01 00 00 D9 9B E0 00 00 00 D9 83 E4 00 00 00 D8 83 14 01 00 00 D9 9B E4 00 00 00)
TOS.exe+8BD8E:
  nop // 0048BD8E
  nop // 0048BD8F
  nop // 0048BD90
  nop // 0048BD91
  nop // 0048BD92
  nop // 0048BD93
  nop // 0048BD94
  nop // 0048BD95
  nop // 0048BD96
  nop // 0048BD97
  nop // 0048BD98
  nop // 0048BD99
  nop // 0048BD9A
  nop // 0048BD9B
  nop // 0048BD9C
  nop // 0048BD9D
  nop // 0048BD9E
  nop // 0048BD9F
  nop // 0048BDA0
  nop // 0048BDA1
  nop // 0048BDA2
  nop // 0048BDA3
  nop // 0048BDA4
  nop // 0048BDA5
  nop // 0048BDA6
  nop // 0048BDA7
  nop // 0048BDA8
  nop // 0048BDA9
  nop // 0048BDAA
  nop // 0048BDAB
  nop // 0048BDAC
  nop // 0048BDAD
  nop // 0048BDAE
  nop // 0048BDAF
  nop // 0048BDB0
  nop // 0048BDB1
  nop // 0048BDB2
  nop // 0048BDB3
  nop // 0048BDB4
  nop // 0048BDB5
  nop // 0048BDB6
  nop // 0048BDB7
  nop // 0048BDB8
  nop // 0048BDB9
  nop // 0048BDBA
  nop // 0048BDBB
  nop // 0048BDBC
  nop // 0048BDBD
  nop // 0048BDBE
  nop // 0048BDBF
  nop // 0048BDC0
  nop // 0048BDC1
  nop // 0048BDC2
  nop // 0048BDC3

// Reference VA 0048BE5E..0048BE93.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BE5E,D9 83 C4 00 00 00 D8 83 B8 00 00 00 D9 9B B8 00 00 00 D9 83 C8 00 00 00 D8 83 BC 00 00 00 D9 9B BC 00 00 00 D9 83 C0 00 00 00 D8 83 CC 00 00 00 D9 9B C0 00 00 00)
TOS.exe+8BE5E:
  nop // 0048BE5E
  nop // 0048BE5F
  nop // 0048BE60
  nop // 0048BE61
  nop // 0048BE62
  nop // 0048BE63
  nop // 0048BE64
  nop // 0048BE65
  nop // 0048BE66
  nop // 0048BE67
  nop // 0048BE68
  nop // 0048BE69
  nop // 0048BE6A
  nop // 0048BE6B
  nop // 0048BE6C
  nop // 0048BE6D
  nop // 0048BE6E
  nop // 0048BE6F
  nop // 0048BE70
  nop // 0048BE71
  nop // 0048BE72
  nop // 0048BE73
  nop // 0048BE74
  nop // 0048BE75
  nop // 0048BE76
  nop // 0048BE77
  nop // 0048BE78
  nop // 0048BE79
  nop // 0048BE7A
  nop // 0048BE7B
  nop // 0048BE7C
  nop // 0048BE7D
  nop // 0048BE7E
  nop // 0048BE7F
  nop // 0048BE80
  nop // 0048BE81
  nop // 0048BE82
  nop // 0048BE83
  nop // 0048BE84
  nop // 0048BE85
  nop // 0048BE86
  nop // 0048BE87
  nop // 0048BE88
  nop // 0048BE89
  nop // 0048BE8A
  nop // 0048BE8B
  nop // 0048BE8C
  nop // 0048BE8D
  nop // 0048BE8E
  nop // 0048BE8F
  nop // 0048BE90
  nop // 0048BE91
  nop // 0048BE92
  nop // 0048BE93

// Reference VA 0048BEB1..0048BEE6.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BEB1,D9 83 C4 00 00 00 D8 83 D0 00 00 00 D9 9B C4 00 00 00 D9 83 D4 00 00 00 D8 83 C8 00 00 00 D9 9B C8 00 00 00 D9 83 D8 00 00 00 D8 83 CC 00 00 00 D9 9B CC 00 00 00)
TOS.exe+8BEB1:
  nop // 0048BEB1
  nop // 0048BEB2
  nop // 0048BEB3
  nop // 0048BEB4
  nop // 0048BEB5
  nop // 0048BEB6
  nop // 0048BEB7
  nop // 0048BEB8
  nop // 0048BEB9
  nop // 0048BEBA
  nop // 0048BEBB
  nop // 0048BEBC
  nop // 0048BEBD
  nop // 0048BEBE
  nop // 0048BEBF
  nop // 0048BEC0
  nop // 0048BEC1
  nop // 0048BEC2
  nop // 0048BEC3
  nop // 0048BEC4
  nop // 0048BEC5
  nop // 0048BEC6
  nop // 0048BEC7
  nop // 0048BEC8
  nop // 0048BEC9
  nop // 0048BECA
  nop // 0048BECB
  nop // 0048BECC
  nop // 0048BECD
  nop // 0048BECE
  nop // 0048BECF
  nop // 0048BED0
  nop // 0048BED1
  nop // 0048BED2
  nop // 0048BED3
  nop // 0048BED4
  nop // 0048BED5
  nop // 0048BED6
  nop // 0048BED7
  nop // 0048BED8
  nop // 0048BED9
  nop // 0048BEDA
  nop // 0048BEDB
  nop // 0048BEDC
  nop // 0048BEDD
  nop // 0048BEDE
  nop // 0048BEDF
  nop // 0048BEE0
  nop // 0048BEE1
  nop // 0048BEE2
  nop // 0048BEE3
  nop // 0048BEE4
  nop // 0048BEE5
  nop // 0048BEE6

// Reference VA 0048BF6B..0048BFD2.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8BF6B,0F B6 4B 30 66 01 4C C3 20 0F B6 4B 31 66 01 4C C3 22 0F B6 4B 32 66 01 4C C3 24 0F B6 4B 33 66 01 4C C3 26 B9 FF 00 00 00 66 39 4C C3 20 7E 05 66 89 4C C3 20 B9 FF 00 00 00 66 39 4C C3 22 7E 05 66 89 4C C3 22 B9 FF 00 00 00 66 39 4C C3 24 7E 05 66 89 4C C3 24 B9 FF 00 00 00 66 39 4C C3 26 7E 05 66 89 4C C3 26)
TOS.exe+8BF6B:
  nop // 0048BF6B
  nop // 0048BF6C
  nop // 0048BF6D
  nop // 0048BF6E
  nop // 0048BF6F
  nop // 0048BF70
  nop // 0048BF71
  nop // 0048BF72
  nop // 0048BF73
  nop // 0048BF74
  nop // 0048BF75
  nop // 0048BF76
  nop // 0048BF77
  nop // 0048BF78
  nop // 0048BF79
  nop // 0048BF7A
  nop // 0048BF7B
  nop // 0048BF7C
  nop // 0048BF7D
  nop // 0048BF7E
  nop // 0048BF7F
  nop // 0048BF80
  nop // 0048BF81
  nop // 0048BF82
  nop // 0048BF83
  nop // 0048BF84
  nop // 0048BF85
  nop // 0048BF86
  nop // 0048BF87
  nop // 0048BF88
  nop // 0048BF89
  nop // 0048BF8A
  nop // 0048BF8B
  nop // 0048BF8C
  nop // 0048BF8D
  nop // 0048BF8E
  nop // 0048BF8F
  nop // 0048BF90
  nop // 0048BF91
  nop // 0048BF92
  nop // 0048BF93
  nop // 0048BF94
  nop // 0048BF95
  nop // 0048BF96
  nop // 0048BF97
  nop // 0048BF98
  nop // 0048BF99
  nop // 0048BF9A
  nop // 0048BF9B
  nop // 0048BF9C
  nop // 0048BF9D
  nop // 0048BF9E
  nop // 0048BF9F
  nop // 0048BFA0
  nop // 0048BFA1
  nop // 0048BFA2
  nop // 0048BFA3
  nop // 0048BFA4
  nop // 0048BFA5
  nop // 0048BFA6
  nop // 0048BFA7
  nop // 0048BFA8
  nop // 0048BFA9
  nop // 0048BFAA
  nop // 0048BFAB
  nop // 0048BFAC
  nop // 0048BFAD
  nop // 0048BFAE
  nop // 0048BFAF
  nop // 0048BFB0
  nop // 0048BFB1
  nop // 0048BFB2
  nop // 0048BFB3
  nop // 0048BFB4
  nop // 0048BFB5
  nop // 0048BFB6
  nop // 0048BFB7
  nop // 0048BFB8
  nop // 0048BFB9
  nop // 0048BFBA
  nop // 0048BFBB
  nop // 0048BFBC
  nop // 0048BFBD
  nop // 0048BFBE
  nop // 0048BFBF
  nop // 0048BFC0
  nop // 0048BFC1
  nop // 0048BFC2
  nop // 0048BFC3
  nop // 0048BFC4
  nop // 0048BFC5
  nop // 0048BFC6
  nop // 0048BFC7
  nop // 0048BFC8
  nop // 0048BFC9
  nop // 0048BFCA
  nop // 0048BFCB
  nop // 0048BFCC
  nop // 0048BFCD
  nop // 0048BFCE
  nop // 0048BFCF
  nop // 0048BFD0
  nop // 0048BFD1
  nop // 0048BFD2

// Reference VA 0048C055..0048C0B4.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8C055,0F B6 4B 34 66 29 4C C3 20 0F B6 4B 35 66 29 4C C3 22 0F B6 4B 36 66 29 4C C3 24 0F B6 4B 37 66 29 4C C3 26 66 83 7C C3 20 00 7D 07 33 C9 66 89 4C C3 20 66 83 7C C3 22 00 7D 07 33 C9 66 89 4C C3 22 66 83 7C C3 24 00 7D 07 33 C9 66 89 4C C3 24 66 83 7C C3 26 00 7D 07 33 C9 66 89 4C C3 26)
TOS.exe+8C055:
  nop // 0048C055
  nop // 0048C056
  nop // 0048C057
  nop // 0048C058
  nop // 0048C059
  nop // 0048C05A
  nop // 0048C05B
  nop // 0048C05C
  nop // 0048C05D
  nop // 0048C05E
  nop // 0048C05F
  nop // 0048C060
  nop // 0048C061
  nop // 0048C062
  nop // 0048C063
  nop // 0048C064
  nop // 0048C065
  nop // 0048C066
  nop // 0048C067
  nop // 0048C068
  nop // 0048C069
  nop // 0048C06A
  nop // 0048C06B
  nop // 0048C06C
  nop // 0048C06D
  nop // 0048C06E
  nop // 0048C06F
  nop // 0048C070
  nop // 0048C071
  nop // 0048C072
  nop // 0048C073
  nop // 0048C074
  nop // 0048C075
  nop // 0048C076
  nop // 0048C077
  nop // 0048C078
  nop // 0048C079
  nop // 0048C07A
  nop // 0048C07B
  nop // 0048C07C
  nop // 0048C07D
  nop // 0048C07E
  nop // 0048C07F
  nop // 0048C080
  nop // 0048C081
  nop // 0048C082
  nop // 0048C083
  nop // 0048C084
  nop // 0048C085
  nop // 0048C086
  nop // 0048C087
  nop // 0048C088
  nop // 0048C089
  nop // 0048C08A
  nop // 0048C08B
  nop // 0048C08C
  nop // 0048C08D
  nop // 0048C08E
  nop // 0048C08F
  nop // 0048C090
  nop // 0048C091
  nop // 0048C092
  nop // 0048C093
  nop // 0048C094
  nop // 0048C095
  nop // 0048C096
  nop // 0048C097
  nop // 0048C098
  nop // 0048C099
  nop // 0048C09A
  nop // 0048C09B
  nop // 0048C09C
  nop // 0048C09D
  nop // 0048C09E
  nop // 0048C09F
  nop // 0048C0A0
  nop // 0048C0A1
  nop // 0048C0A2
  nop // 0048C0A3
  nop // 0048C0A4
  nop // 0048C0A5
  nop // 0048C0A6
  nop // 0048C0A7
  nop // 0048C0A8
  nop // 0048C0A9
  nop // 0048C0AA
  nop // 0048C0AB
  nop // 0048C0AC
  nop // 0048C0AD
  nop // 0048C0AE
  nop // 0048C0AF
  nop // 0048C0B0
  nop // 0048C0B1
  nop // 0048C0B2
  nop // 0048C0B3
  nop // 0048C0B4

// Reference VA 0048C17E..0048C18D.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8C17E,0F B7 48 04 66 01 4B 08 0F B7 50 06 66 01 53 0A)
TOS.exe+8C17E:
// Vanilla: movzx ecx, word ptr [eax + 4]; add word ptr [ebx + 8], cx; movzx edx, word ptr [eax + 6]; add word ptr [ebx + 0xa], dx
  nop // 0048C17E
  nop // 0048C17F
  nop // 0048C180
  nop // 0048C181
  nop // 0048C182
  nop // 0048C183
  nop // 0048C184
  nop // 0048C185
  nop // 0048C186
  nop // 0048C187
  nop // 0048C188
  nop // 0048C189
  nop // 0048C18A
  nop // 0048C18B
  nop // 0048C18C
  nop // 0048C18D

// Reference VA 0048C2CF..0048C2D6.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8C2CF,66 83 86 8A 02 00 00 02)
TOS.exe+8C2CF:
// Vanilla: add word ptr [esi + 0x28a], 2
  add word ptr [esi + 0x28a], #1 // 0048C2CF

// Reference VA 0048C2E4..0048C2EA.
// VFX_TickPhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8C2E4,80 86 93 02 00 00 02)
TOS.exe+8C2E4:
// Vanilla: add byte ptr [esi + 0x293], 2
  add byte ptr [esi + 0x293], #1 // 0048C2E4

// Reference VA 0048CDA0..0048CDA5.
// Battle_TickProjectile: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8CDA0,DD 05 80 2C 88 00)
TOS.exe+8CDA0:
// Vanilla: fld qword ptr [0x882c80]
  fld qword ptr [fps_double_negative_one] // 0048CDA0

// Reference VA 0048CFC8..0048CFCA.
// Battle_TickProjectile: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8CFC8,83 C7 02)
TOS.exe+8CFC8:
// Vanilla: add edi, 2
  add edi, #1 // 0048CFC8

// Reference VA 0048D0FE..0048D111.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D0FE,D9 00 DE C3 D9 CA D9 18 D8 40 04 D9 58 04 D8 40 08 D9 58 08)
TOS.exe+8D0FE:
// Vanilla: fld dword ptr [eax]; faddp st(3); fxch st(2); fstp dword ptr [eax]; fadd dword ptr [eax + 4]; fstp dword ptr [eax + 4]; fadd dword ptr [eax + 8]; fstp dword ptr [eax + 8]
  fstp st(0) // 0048D0FE
  fstp st(0) // 0048D100
  fstp st(0) // 0048D102
  nop // 0048D104
  nop // 0048D105
  nop // 0048D106
  nop // 0048D107
  nop // 0048D108
  nop // 0048D109
  nop // 0048D10A
  nop // 0048D10B
  nop // 0048D10C
  nop // 0048D10D
  nop // 0048D10E
  nop // 0048D10F
  nop // 0048D110
  nop // 0048D111

// Reference VA 0048D145..0048D175.
// 60fps tick gate: skip position update on odd ticks (halves pos update rate for correct 60fps speed)
// Check projectile tick counter LSB (a1+648 = ebx+260h)
// Odd tick → skip position update, jump to 0x48D176
// Even tick → run original flag test + position update
// Skip target: jump past both position update branches
assert(TOS.exe+8D145,D9 07 D8 00 D9 18 D9 40 04 D8 47 04 D9 58 04 D9 40 08 D8 47 08 D9 58 08 D9 07 D8 43 30 D9 1F D9 43 34 D8 47 04 D9 5F 04 D9 47 08 D8 43 38 D9 5F 08)
TOS.exe+8D145:
  nop // 0048D145
  nop // 0048D146
  nop // 0048D147
  nop // 0048D148
  nop // 0048D149
  nop // 0048D14A
  nop // 0048D14B
  nop // 0048D14C
  nop // 0048D14D
  nop // 0048D14E
  nop // 0048D14F
  nop // 0048D150
  nop // 0048D151
  nop // 0048D152
  nop // 0048D153
  nop // 0048D154
  nop // 0048D155
  nop // 0048D156
  nop // 0048D157
  nop // 0048D158
  nop // 0048D159
  nop // 0048D15A
  nop // 0048D15B
  nop // 0048D15C
  nop // 0048D15D
  nop // 0048D15E
  nop // 0048D15F
  nop // 0048D160
  nop // 0048D161
  nop // 0048D162
  nop // 0048D163
  nop // 0048D164
  nop // 0048D165
  nop // 0048D166
  nop // 0048D167
  nop // 0048D168
  nop // 0048D169
  nop // 0048D16A
  nop // 0048D16B
  nop // 0048D16C
  nop // 0048D16D
  nop // 0048D16E
  nop // 0048D16F
  nop // 0048D170
  nop // 0048D171
  nop // 0048D172
  nop // 0048D173
  nop // 0048D174
  nop // 0048D175

// Reference VA 0048D2D0..0048D2D5.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D2D0,DD 05 B8 29 88 00)
TOS.exe+8D2D0:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 0048D2D0

// Reference VA 0048D79A..0048D79B.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D79A,74 05)
TOS.exe+8D79A:
// Vanilla: je 0x48d7a1
  je short TOS.exe+8D7B2 // 0048D79A

// Reference VA 0048D7CA..0048D7CD.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D7CA,74 05 FE C9)
TOS.exe+8D7CA:
// Vanilla: je 0x48d7d1; dec cl
  nop // 0048D7CA
  nop // 0048D7CB
  nop // 0048D7CC
  nop // 0048D7CD

// Reference VA 0048D7DA..0048D7DB.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D7DA,74 05)
TOS.exe+8D7DA:
// Vanilla: je 0x48d7e1
  je short TOS.exe+8D7F2 // 0048D7DA

// Reference VA 0048D809..0048D80C.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D809,74 04 FE C9)
TOS.exe+8D809:
// Vanilla: je 0x48d80f; dec cl
  nop // 0048D809
  nop // 0048D80A
  nop // 0048D80B
  nop // 0048D80C

// Reference VA 0048D819..0048D81A.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D819,74 05)
TOS.exe+8D819:
// Vanilla: je 0x48d820
  je short TOS.exe+8D831 // 0048D819

// Reference VA 0048D849..0048D84C.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D849,74 05 FE C9)
TOS.exe+8D849:
// Vanilla: je 0x48d850; dec cl
  nop // 0048D849
  nop // 0048D84A
  nop // 0048D84B
  nop // 0048D84C

// Reference VA 0048D85A..0048D85B.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D85A,74 05)
TOS.exe+8D85A:
// Vanilla: je 0x48d861
  je short TOS.exe+8D872 // 0048D85A

// Reference VA 0048D88A..0048D88D.
// Battle_TickProjectilePhysics: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+8D88A,74 05 FE C9)
TOS.exe+8D88A:
// Vanilla: je 0x48d891; dec cl
  nop // 0048D88A
  nop // 0048D88B
  nop // 0048D88C
  nop // 0048D88D

// Reference VA 0049215A..0049215F.
// FieldEffect_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+9215A,DC 05 B8 29 88 00)
TOS.exe+9215A:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 0049215A

// Reference VA 00493A4D..00493A54.
// FieldEffect_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+93A4D,66 83 83 C6 00 00 00 F8)
TOS.exe+93A4D:
// Vanilla: add word ptr [ebx + 0xc6], -8
  db 66,83,83,C6,00,00,00,FC // add word ptr [ebx + 0xc6], -#4 // 00493A4D

// Reference VA 0049CC61..0049CC7B.
// Teleporter_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+9CC61,D9 46 04 D8 46 28 D9 5E 04 D9 46 08 D8 46 2C D9 5E 08 D9 46 0C D8 46 30 D9 5E 0C)
TOS.exe+9CC61:
  jmp near fps_field_effect_motion // 0049CC61
  nop // 0049CC66
  nop // 0049CC67
  nop // 0049CC68
  nop // 0049CC69
  nop // 0049CC6A
  nop // 0049CC6B
  nop // 0049CC6C
  nop // 0049CC6D
  nop // 0049CC6E
  nop // 0049CC6F
  nop // 0049CC70
  nop // 0049CC71
  nop // 0049CC72
  nop // 0049CC73
  nop // 0049CC74
  nop // 0049CC75
  nop // 0049CC76
  nop // 0049CC77
  nop // 0049CC78
  nop // 0049CC79
  nop // 0049CC7A
  nop // 0049CC7B

// Reference VA 0049D8FB..0049D8FC.
assert(TOS.exe+9D8FB,29 13)
TOS.exe+9D8FB:
// Vanilla: sub dword ptr [ebx], edx
  nop // 0049D8FB
  nop // 0049D8FC

// Reference VA 0049F92C..0049F931.
// Ring-change 60 FPS: private half-speed constant; user-tested. Shared constants untouched.
assert(TOS.exe+9F92C,DC 0D 50 29 88 00)
TOS.exe+9F92C:
// Vanilla: fmul qword ptr [0x882950]
  fmul qword ptr [fps_ring_transfer_speed_constants] // 0049F92C

// Reference VA 0049F938..0049F93D.
// Ring-change 60 FPS: private half-speed constant; user-tested. Shared constants untouched.
assert(TOS.exe+9F938,DC 05 08 3B 88 00)
TOS.exe+9F938:
// Vanilla: fadd qword ptr [0x883b08]
  fadd qword ptr [timing_helpers+788] // 0049F938

// Reference VA 0049FBC2..0049FBC4.
// PATCHED: -2 -> -1 — NPC cleanup window check matched old +2 increment, now matches +1
assert(TOS.exe+9FBC2,83 C0 FE)
TOS.exe+9FBC2:
// Vanilla: add eax, -2
  add eax, -#1 // 0049FBC2

// Reference VA 0049FCD1..0049FCD3.
// PATCHED: +2 -> +1 — encounter lifetime timer was advancing 2x too fast at 60fps
assert(TOS.exe+9FCD1,83 C0 02)
TOS.exe+9FCD1:
// Vanilla: add eax, 2
  add eax, #1 // 0049FCD1

// Reference VA 004A0046..004A004F.
// SorcererRing_FireballTick: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+A0046,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A0046:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A0046

// Reference VA 004A0ADF..004A0AE4.
// Halve ring projectile displacement per update (-33.33333206176758 -> -16.66666603088379)
// Ring 60 FPS: Halve ring projectile displacement per update (-33.33333206176758 -> -16.66666603088379); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A0ADF,D9 05 BC 3E 88 00)
TOS.exe+A0ADF:
// Vanilla: fld dword ptr [0x883ebc]
  fld dword ptr [fps_ring_constant_2eff850] // 004A0ADF

// Reference VA 004A0AFA..004A0B03.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A0AFA,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A0AFA:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A0AFA

// Reference VA 004A0B65..004A0B6A.
// Spiral sample spacing fraction: 1/8 -> 1/4 (0.125 -> 0.25)
// Ring 60 FPS: Spiral sample spacing fraction: 1/8 -> 1/4 (0.125 -> 0.25); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A0B65,DD 05 C0 2A 88 00)
TOS.exe+A0B65:
// Vanilla: fld qword ptr [0x882ac0]
  fld qword ptr [TOS.exe+482AA8] // 004A0B65

// Reference VA 004A0D42..004A0D44.
// Spiral samples per update: 8 -> 4
// Ring 60 FPS: Spiral samples per update: 8 -> 4; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A0D42,83 F8 08)
TOS.exe+A0D42:
// Vanilla: cmp eax, 8
  cmp eax, #4 // 004A0D42

// Reference VA 004A101F..004A1023.
// Mode 9: one trail group per half-sized movement step
// Ring 60 FPS: Mode 9: one trail group per half-sized movement step; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A101F,A1 D4 0C C3 01)
TOS.exe+A101F:
// Vanilla: mov eax, dword ptr [0x1c30cd4]
  jmp near TOS.exe+A1338 // 004A101F

// Reference VA 004A176F..004A1774.
// Halve ring projectile displacement per update (-45.0 -> -22.5)
// Ring 60 FPS: Halve ring projectile displacement per update (-45.0 -> -22.5); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A176F,D9 05 B8 3E 88 00)
TOS.exe+A176F:
// Vanilla: fld dword ptr [0x883eb8]
  fld dword ptr [TOS.exe+483684] // 004A176F

// Reference VA 004A178C..004A1795.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A178C,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A178C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A178C

// Reference VA 004A183A..004A1843.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A183A,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A183A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A183A

// Reference VA 004A1A66..004A1A6A.
// Remove redundant midpoint particle group; discard its queued call arguments
// Ring 60 FPS: Remove redundant midpoint particle group; discard its queued call arguments; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A1A66,E8 E5 C7 FF FF)
TOS.exe+A1A66:
// Vanilla: call 0x49e250
  jmp near fps_ring_stub_2eff8e0 // 004A1A66

// Reference VA 004A1CA9..004A1CAB.
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A1CA9,83 E0 01)
TOS.exe+A1CA9:
// Vanilla: and eax, 1
  and eax, #3 // 004A1CA9

// Reference VA 004A1D39..004A1D3B.
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A1D39,83 E0 01)
TOS.exe+A1D39:
// Vanilla: and eax, 1
  and eax, #3 // 004A1D39

// Reference VA 004A1F10..004A1F19.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A1F10,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A1F10:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A1F10

// Reference VA 004A1FE3..004A1FEC.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A1FE3,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A1FE3:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A1FE3

// Reference VA 004A202C..004A2035.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A202C,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A202C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A202C

// Reference VA 004A2215..004A221E.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2215,C7 86 B0 00 00 00 0F 00 00 00)
TOS.exe+A2215:
// Vanilla: mov dword ptr [esi + 0xb0], 0xf
  mov dword ptr [esi + 0xb0], 0x1e // 004A2215

// Reference VA 004A2295..004A229B.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2295,83 BE B0 00 00 00 0F)
TOS.exe+A2295:
// Vanilla: cmp dword ptr [esi + 0xb0], 0xf
  cmp dword ptr [esi + 0xb0], 0x1e // 004A2295

// Reference VA 004A24CE..004A24D7.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A24CE,C7 83 B0 00 00 00 05 00 00 00)
TOS.exe+A24CE:
// Vanilla: mov dword ptr [ebx + 0xb0], 5
  mov dword ptr [ebx + 0xb0], 0xa // 004A24CE

// Reference VA 004A2600..004A2606.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2600,83 BB B0 00 00 00 0F)
TOS.exe+A2600:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0xf
  cmp dword ptr [ebx + 0xb0], 0x1e // 004A2600

// Reference VA 004A2637..004A263C.
// Mode 10 opacity/scale change per update (12.0 -> 6.0)
// Ring 60 FPS: Mode 10 opacity/scale change per update (12.0 -> 6.0); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2637,D8 05 FC F3 72 00)
TOS.exe+A2637:
// Vanilla: fadd dword ptr [0x72f3fc]
  fadd dword ptr [TOS.exe+30F790] // 004A2637

// Reference VA 004A2663..004A2668.
// Mode 10 opacity/scale change per update (0.2666666805744171 -> 0.13333334028720856)
// Ring 60 FPS: Mode 10 opacity/scale change per update (0.2666666805744171 -> 0.13333334028720856); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2663,DD 05 48 3E 88 00)
TOS.exe+A2663:
// Vanilla: fld qword ptr [0x883e48]
  fld qword ptr [TOS.exe+483E40] // 004A2663

// Reference VA 004A26B7..004A26BC.
// Mode 10 opacity/scale change per update (0.13333334028720856 -> 0.06666667014360428)
// Ring 60 FPS: Mode 10 opacity/scale change per update (0.13333334028720856 -> 0.06666667014360428); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A26B7,DC 05 40 3E 88 00)
TOS.exe+A26B7:
// Vanilla: fadd qword ptr [0x883e40]
  fadd qword ptr [TOS.exe+482A18] // 004A26B7

// Reference VA 004A26DE..004A26E3.
// Mode 10 opacity/scale change per update (12.0 -> 6.0)
// Ring 60 FPS: Mode 10 opacity/scale change per update (12.0 -> 6.0); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A26DE,D8 25 FC F3 72 00)
TOS.exe+A26DE:
// Vanilla: fsub dword ptr [0x72f3fc]
  fsub dword ptr [TOS.exe+30F790] // 004A26DE

// Reference VA 004A26FC..004A2701.
// Mode 10 opacity/scale change per update (0.13333334028720856 -> 0.06666667014360428)
// Ring 60 FPS: Mode 10 opacity/scale change per update (0.13333334028720856 -> 0.06666667014360428); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A26FC,DD 05 40 3E 88 00)
TOS.exe+A26FC:
// Vanilla: fld qword ptr [0x883e40]
  fld qword ptr [TOS.exe+482A18] // 004A26FC

// Reference VA 004A2AA2..004A2AA8.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2AA2,83 BB F0 09 00 00 78)
TOS.exe+A2AA2:
// Vanilla: cmp dword ptr [ebx + 0x9f0], 0x78
  jmp near fps_ring_stub_2eff840 // 004A2AA2
  nop // 004A2AA7
  nop // 004A2AA8

// Reference VA 004A2C42..004A2C4B.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2C42,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A2C42:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A2C42

// Reference VA 004A2D35..004A2D37.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2D35,83 FA 1E)
TOS.exe+A2D35:
// Vanilla: cmp edx, 0x1e
  cmp edx, 0x3c // 004A2D35

// Reference VA 004A2D3E..004A2D44.
// Mode 19 opacity rise: 16 -> 8
// Ring 60 FPS: Mode 19 opacity rise: 16 -> 8; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2D3E,83 83 DC 09 00 00 10)
TOS.exe+A2D3E:
// Vanilla: add dword ptr [ebx + 0x9dc], 0x10
  add dword ptr [ebx + 0x9dc], #8 // 004A2D3E

// Reference VA 004A2D60..004A2D65.
// Mode 19 vertical rise per update (1.3333333730697632 -> 0.6666666865348816)
// Ring 60 FPS: Mode 19 vertical rise per update (1.3333333730697632 -> 0.6666666865348816); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2D60,DC 05 30 3E 88 00)
TOS.exe+A2D60:
// Vanilla: fadd qword ptr [0x883e30]
  fadd qword ptr [fps_ring_constant_2eff858] // 004A2D60

// Reference VA 004A2D8F..004A2D91.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2D8F,83 FA 1F)
TOS.exe+A2D8F:
// Vanilla: cmp edx, 0x1f
  cmp edx, 0x3d // 004A2D8F

// Reference VA 004A2DF4..004A2DF6.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2DF4,83 F8 1D)
TOS.exe+A2DF4:
// Vanilla: cmp eax, 0x1d
  cmp eax, 0x3b // 004A2DF4

// Reference VA 004A2E03..004A2E05.
// Mode 19 opacity fall: 8 -> 4
// Ring 60 FPS: Mode 19 opacity fall: 8 -> 4; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2E03,83 E8 08)
TOS.exe+A2E03:
// Vanilla: sub eax, 8
  sub eax, #4 // 004A2E03

// Reference VA 004A2E16..004A2E1B.
// Mode 19 vertical fall per update (1.5254237651824951 -> 0.7627118825912476)
// Ring 60 FPS: Mode 19 vertical fall per update (1.5254237651824951 -> 0.7627118825912476); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2E16,DC 25 28 3E 88 00)
TOS.exe+A2E16:
// Vanilla: fsub qword ptr [0x883e28]
  fsub qword ptr [fps_ring_constant_2eff860] // 004A2E16

// Reference VA 004A2E43..004A2E49.
// Mode 19 oscillation phase: frame * 4 -> frame * 2
// Ring 60 FPS: Mode 19 oscillation phase: frame * 4 -> frame * 2; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2E43,8D 04 95 00 00 00 00)
TOS.exe+A2E43:
// Vanilla: lea eax, [edx*4]
  lea eax, [edx*#2] // 004A2E43

// Reference VA 004A2E79..004A2E7E.
// Mode 19 accumulated bobbing increment at 60 FPS
// Ring 60 FPS: Mode 19 accumulated bobbing increment at 60 FPS; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2E79,D8 83 84 00 00 00)
TOS.exe+A2E79:
// Vanilla: fadd dword ptr [ebx + 0x84]
  jmp near fps_ring_stub_2eff868 // 004A2E79
  nop // 004A2E7E

// Reference VA 004A2EAA..004A2EB0.
// Mode 19 oscillation phase: frame * 4 -> frame * 2
// Ring 60 FPS: Mode 19 oscillation phase: frame * 4 -> frame * 2; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A2EAA,8D 14 8D 00 00 00 00)
TOS.exe+A2EAA:
// Vanilla: lea edx, [ecx*4]
  lea edx, [ecx*#2] // 004A2EAA

// Reference VA 004A307F..004A3088.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A307F,C7 86 B0 00 00 00 0A 00 00 00)
TOS.exe+A307F:
// Vanilla: mov dword ptr [esi + 0xb0], 0xa
  mov dword ptr [esi + 0xb0], 0x14 // 004A307F

// Reference VA 004A3125..004A3126.
// Mode 15 doubled timer: halve height coefficient
// Ring 60 FPS: Mode 15 doubled timer: halve height coefficient; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A3125,03 D2)
TOS.exe+A3125:
// Vanilla: add edx, edx
  nop // 004A3125
  nop // 004A3126

// Reference VA 004A3160..004A3161.
// Mode 15 doubled timer: halve opacity coefficient
// Ring 60 FPS: Mode 15 doubled timer: halve opacity coefficient; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A3160,03 D2)
TOS.exe+A3160:
// Vanilla: add edx, edx
  nop // 004A3160
  nop // 004A3161

// Reference VA 004A3177..004A317B.
// Mode 15: one emission per update, preserving x87 zero and stack balance
// Ring 60 FPS: Mode 15: one emission per update, preserving x87 zero and stack balance; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A3177,E8 D4 B0 FF FF)
TOS.exe+A3177:
// Vanilla: call 0x49e250
  jmp near fps_ring_stub_2eff8f8 // 004A3177

// Reference VA 004A3217..004A3220.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A3217,C7 86 B0 00 00 00 3C 00 00 00)
TOS.exe+A3217:
// Vanilla: mov dword ptr [esi + 0xb0], 0x3c
  mov dword ptr [esi + 0xb0], 0x78 // 004A3217

// Reference VA 004A324F..004A3255.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A324F,83 BE B0 00 00 00 3C)
TOS.exe+A324F:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x3c
  cmp dword ptr [esi + 0xb0], 0x78 // 004A324F

// Reference VA 004A32E1..004A32E6.
// Mode 15 timer-derived shake divisor (10.0 -> 20.0)
// Ring 60 FPS: Mode 15 timer-derived shake divisor (10.0 -> 20.0); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A32E1,DC 35 C0 2D 88 00)
TOS.exe+A32E1:
// Vanilla: fdiv qword ptr [0x882dc0]
  fdiv qword ptr [TOS.exe+4829A8] // 004A32E1

// Reference VA 004A3328..004A332E.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A3328,83 BE B0 00 00 00 14)
TOS.exe+A3328:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x14
  cmp dword ptr [esi + 0xb0], 0x28 // 004A3328

// Reference VA 004A342F..004A3434.
// Halve ring projectile displacement per update (-20.0 -> -10.0)
// Ring 60 FPS: Halve ring projectile displacement per update (-20.0 -> -10.0); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A342F,D9 05 2C 2D 88 00)
TOS.exe+A342F:
// Vanilla: fld dword ptr [0x882d2c]
  fld dword ptr [TOS.exe+483220] // 004A342F

// Reference VA 004A344A..004A3453.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A344A,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A344A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A344A

// Reference VA 004A34D7..004A34DC.
// Spiral sample spacing fraction: 1/8 -> 1/4 (0.125 -> 0.25)
// Ring 60 FPS: Spiral sample spacing fraction: 1/8 -> 1/4 (0.125 -> 0.25); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A34D7,DD 05 C0 2A 88 00)
TOS.exe+A34D7:
// Vanilla: fld qword ptr [0x882ac0]
  fld qword ptr [TOS.exe+482AA8] // 004A34D7

// Reference VA 004A36AF..004A36B1.
// Spiral samples per update: 8 -> 4
// Ring 60 FPS: Spiral samples per update: 8 -> 4; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A36AF,83 F8 08)
TOS.exe+A36AF:
// Vanilla: cmp eax, 8
  cmp eax, #4 // 004A36AF

// Reference VA 004A39E6..004A39EA.
// Mode 14: remove midpoint group and preserve x87 zero
// Ring 60 FPS: Mode 14: remove midpoint group and preserve x87 zero; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A39E6,A1 D4 0C C3 01)
TOS.exe+A39E6:
// Vanilla: mov eax, dword ptr [0x1c30cd4]
  jmp near fps_ring_stub_2eff8f0 // 004A39E6

// Reference VA 004A41D5..004A41DE.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A41D5,C7 86 B0 00 00 00 2C 01 00 00)
TOS.exe+A41D5:
// Vanilla: mov dword ptr [esi + 0xb0], 0x12c
  mov dword ptr [esi + 0xb0], 0x258 // 004A41D5

// Reference VA 004A4246..004A424C.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4246,83 BE B0 00 00 00 07)
TOS.exe+A4246:
// Vanilla: cmp dword ptr [esi + 0xb0], 7
  cmp dword ptr [esi + 0xb0], 0xe // 004A4246

// Reference VA 004A4260..004A4269.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4260,C7 86 B0 00 00 00 07 00 00 00)
TOS.exe+A4260:
// Vanilla: mov dword ptr [esi + 0xb0], 7
  mov dword ptr [esi + 0xb0], 0xe // 004A4260

// Reference VA 004A4270..004A4274.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4270,3D 1D 01 00 00)
TOS.exe+A4270:
// Vanilla: cmp eax, 0x11d
  cmp eax, 0x239 // 004A4270

// Reference VA 004A427D..004A4282.
// Mode 6 entry radius ramp per update (653.3333129882812 -> 326.6666564941406)
// Ring 60 FPS: Mode 6 entry radius ramp per update (653.3333129882812 -> 326.6666564941406); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A427D,DC 25 A0 36 88 00)
TOS.exe+A427D:
// Vanilla: fsub qword ptr [0x8836a0]
  fsub qword ptr [fps_ring_constant_2eff880] // 004A427D

// Reference VA 004A4285..004A4287.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4285,83 F8 0F)
TOS.exe+A4285:
// Vanilla: cmp eax, 0xf
  cmp eax, 0x1d // 004A4285

// Reference VA 004A4290..004A4295.
// Mode 6 exit radius ramp per update (653.3333129882812 -> 326.6666564941406)
// Ring 60 FPS: Mode 6 exit radius ramp per update (653.3333129882812 -> 326.6666564941406); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4290,DC 05 A0 36 88 00)
TOS.exe+A4290:
// Vanilla: fadd qword ptr [0x8836a0]
  fadd qword ptr [fps_ring_constant_2eff880] // 004A4290

// Reference VA 004A42CE..004A42D7.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A42CE,81 BE B0 00 00 00 2C 01 00 00)
TOS.exe+A42CE:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x12c
  cmp dword ptr [esi + 0xb0], 0x258 // 004A42CE

// Reference VA 004A432B..004A4331.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A432B,83 BE B0 00 00 00 07)
TOS.exe+A432B:
// Vanilla: cmp dword ptr [esi + 0xb0], 7
  cmp dword ptr [esi + 0xb0], 0xe // 004A432B

// Reference VA 004A461F..004A4628.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A461F,C7 83 B0 00 00 00 5A 00 00 00)
TOS.exe+A461F:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x5a
  mov dword ptr [ebx + 0xb0], 0xb4 // 004A461F

// Reference VA 004A483E..004A4847.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A483E,C7 83 B0 00 00 00 1E 00 00 00)
TOS.exe+A483E:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x1e
  mov dword ptr [ebx + 0xb0], 0x3c // 004A483E

// Reference VA 004A485B..004A4861.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A485B,83 BB B0 00 00 00 1E)
TOS.exe+A485B:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0x1e
  cmp dword ptr [ebx + 0xb0], 0x3c // 004A485B

// Reference VA 004A4A7C..004A4A82.
// Mode 12: preserve burst-phase threshold and continuous emission rate
// Ring 60 FPS: Mode 12: preserve burst-phase threshold and continuous emission rate; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4A7C,83 BB B0 00 00 00 14)
TOS.exe+A4A7C:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0x14
  jmp near fps_ring_stub_2eff8c0 // 004A4A7C
  nop // 004A4A81
  nop // 004A4A82

// Reference VA 004A4BA8..004A4BAD.
// Mode 12 timer-derived shake amplitude (0.25 -> 0.125)
// Ring 60 FPS: Mode 12 timer-derived shake amplitude (0.25 -> 0.125); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4BA8,DC 0D A8 2A 88 00)
TOS.exe+A4BA8:
// Vanilla: fmul qword ptr [0x882aa8]
  fmul qword ptr [TOS.exe+3A3630] // 004A4BA8

// Reference VA 004A4C4A..004A4C50.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4C4A,83 BB B0 00 00 00 1D)
TOS.exe+A4C4A:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0x1d
  cmp dword ptr [ebx + 0xb0], 0x3a // 004A4C4A

// Reference VA 004A4E4F..004A4E54.
// Retain tested water speed: -30 -> -15
// Ring 60 FPS: Retain tested water speed: -30 -> -15; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4E4F,D9 05 B8 38 88 00)
TOS.exe+A4E4F:
// Vanilla: fld dword ptr [0x8838b8]
  fld dword ptr [TOS.exe+4840A8] // 004A4E4F

// Reference VA 004A4E6A..004A4E73.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A4E6A,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A4E6A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A4E6A

// Reference VA 004A51BF..004A51C3.
// Water: one trail group per half-sized movement step
// Ring 60 FPS: Water: one trail group per half-sized movement step; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A51BF,A1 D4 0C C3 01)
TOS.exe+A51BF:
// Vanilla: mov eax, dword ptr [0x1c30cd4]
  jmp near TOS.exe+A54D4 // 004A51BF

// Reference VA 004A5900..004A5905.
// Halve ring projectile displacement per update (-5.0 -> -2.5)
// Ring 60 FPS: Halve ring projectile displacement per update (-5.0 -> -2.5); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A5900,D9 05 80 35 88 00)
TOS.exe+A5900:
// Vanilla: fld dword ptr [0x883580]
  fld dword ptr [TOS.exe+483288] // 004A5900

// Reference VA 004A591B..004A5924.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A591B,C7 83 B0 00 00 00 1E 00 00 00)
TOS.exe+A591B:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x1e
  mov dword ptr [ebx + 0xb0], 0x3c // 004A591B

// Reference VA 004A59A5..004A59B1.
// Modes 4/16 visual age: one increment per two movement updates
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Modes 4/16 visual age: one increment per two movement updates; see sorcerer-ring-60fps/patch.json
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A59A5,FF 83 F0 09 00 00 F6 05 D8 C3 C3 01 01)
TOS.exe+A59A5:
// Vanilla: inc dword ptr [ebx + 0x9f0]; test byte ptr [0x1c3c3d8], 1
  jmp near fps_ring_stub_2eff888 // 004A59A5
  nop // 004A59AA
  test byte ptr [TOS.exe+183C3D8], #3 // 004A59AB

// Reference VA 004A609F..004A60A4.
// Halve ring projectile displacement per update (-13.333333015441895 -> -6.666666507720947)
// Ring 60 FPS: Halve ring projectile displacement per update (-13.333333015441895 -> -6.666666507720947); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A609F,D9 05 B4 38 88 00)
TOS.exe+A609F:
// Vanilla: fld dword ptr [0x8838b4]
  fld dword ptr [fps_ring_constant_2eff854] // 004A609F

// Reference VA 004A60BA..004A60C3.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A60BA,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A60BA:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A60BA

// Reference VA 004A613A..004A6140.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A613A,83 BB B0 00 00 00 0C)
TOS.exe+A613A:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0xc
  cmp dword ptr [ebx + 0xb0], 0x18 // 004A613A

// Reference VA 004A6209..004A620F.
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A6209,F6 05 D8 C3 C3 01 01)
TOS.exe+A6209:
// Vanilla: test byte ptr [0x1c3c3d8], 1
  test byte ptr [TOS.exe+183C3D8], #3 // 004A6209

// Reference VA 004A6356..004A635C.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A6356,83 BB B0 00 00 00 0C)
TOS.exe+A6356:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0xc
  cmp dword ptr [ebx + 0xb0], 0x18 // 004A6356

// Reference VA 004A6475..004A647B.
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A6475,F6 05 D8 C3 C3 01 01)
TOS.exe+A6475:
// Vanilla: test byte ptr [0x1c3c3d8], 1
  test byte ptr [TOS.exe+183C3D8], #3 // 004A6475

// Reference VA 004A664E..004A6653.
// Mode 8 vertical recoil random divisor (24.0 -> 48.0)
// Ring 60 FPS: Mode 8 vertical recoil random divisor (24.0 -> 48.0); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A664E,DC 35 18 37 88 00)
TOS.exe+A664E:
// Vanilla: fdiv qword ptr [0x883718]
  fdiv qword ptr [TOS.exe+482A30] // 004A664E

// Reference VA 004A665E..004A6663.
// Mode 8 fixed vertical recoil per update (0.800000011920929 -> 0.4000000059604645)
// Ring 60 FPS: Mode 8 fixed vertical recoil per update (0.800000011920929 -> 0.4000000059604645); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A665E,DC 25 28 2B 88 00)
TOS.exe+A665E:
// Vanilla: fsub qword ptr [0x882b28]
  fsub qword ptr [TOS.exe+483660] // 004A665E

// Reference VA 004A6940..004A6945.
// Halve ring projectile displacement per update (-10.0 -> -5.0)
// Ring 60 FPS: Halve ring projectile displacement per update (-10.0 -> -5.0); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A6940,D9 05 20 32 88 00)
TOS.exe+A6940:
// Vanilla: fld dword ptr [0x883220]
  fld dword ptr [TOS.exe+30F7A4] // 004A6940

// Reference VA 004A695B..004A6964.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A695B,C7 83 B0 00 00 00 1E 00 00 00)
TOS.exe+A695B:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x1e
  mov dword ptr [ebx + 0xb0], 0x3c // 004A695B

// Reference VA 004A69E5..004A69F1.
// Modes 4/16 visual age: one increment per two movement updates
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Modes 4/16 visual age: one increment per two movement updates; see sorcerer-ring-60fps/patch.json
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A69E5,FF 83 F0 09 00 00 F6 05 D8 C3 C3 01 01)
TOS.exe+A69E5:
// Vanilla: inc dword ptr [ebx + 0x9f0]; test byte ptr [0x1c3c3d8], 1
  jmp near fps_ring_stub_2eff8a4 // 004A69E5
  nop // 004A69EA
  test byte ptr [TOS.exe+183C3D8], #3 // 004A69EB

// Reference VA 004A6D6A..004A6D70.
// Mode 16 terminal puff: alpha step -16 -> -34 to fade with the trail; lifetime 180 preserved
// Ring 60 FPS: Mode 16 terminal puff: alpha step -16 -> -34 to fade with the trail; lifetime 180 preserved; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A6D6A,C7 46 60 F0 0F F0 FF)
TOS.exe+A6D6A:
// Vanilla: mov dword ptr [esi + 0x60], 0xfff00ff0
  mov dword ptr [esi + 0x60], 0xffde0ff0 // 004A6D6A

// Reference VA 004A6E90..004A6E95.
// Halve ring projectile displacement per update (-26.66666603088379 -> -13.333333015441895)
// Ring 60 FPS: Halve ring projectile displacement per update (-26.66666603088379 -> -13.333333015441895); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A6E90,D9 05 AC 3E 88 00)
TOS.exe+A6E90:
// Vanilla: fld dword ptr [0x883eac]
  fld dword ptr [TOS.exe+4838B4] // 004A6E90

// Reference VA 004A6EAB..004A6EB4.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A6EAB,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A6EAB:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A6EAB

// Reference VA 004A735F..004A7364.
// Halve ring projectile displacement per update (-30.0 -> -15.0)
// Ring 60 FPS: Halve ring projectile displacement per update (-30.0 -> -15.0); see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A735F,D9 05 B8 38 88 00)
TOS.exe+A735F:
// Vanilla: fld dword ptr [0x8838b8]
  fld dword ptr [TOS.exe+4840A8] // 004A735F

// Reference VA 004A737C..004A7385.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A737C,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A737C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A737C

// Reference VA 004A742A..004A7433.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A742A,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A742A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A742A

// Reference VA 004A7656..004A765A.
// Remove redundant midpoint particle group; discard its queued call arguments
// Ring 60 FPS: Remove redundant midpoint particle group; discard its queued call arguments; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7656,E8 F5 6B FF FF)
TOS.exe+A7656:
// Vanilla: call 0x49e250
  jmp near fps_ring_stub_2eff8e8 // 004A7656

// Reference VA 004A7899..004A789B.
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7899,83 E0 01)
TOS.exe+A7899:
// Vanilla: and eax, 1
  and eax, #3 // 004A7899

// Reference VA 004A7929..004A792B.
// Preserve emission cadence: every 2 -> every 4 field updates
// Ring 60 FPS: Preserve emission cadence: every 2 -> every 4 field updates; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7929,83 E0 01)
TOS.exe+A7929:
// Vanilla: and eax, 1
  and eax, #3 // 004A7929

// Reference VA 004A7B00..004A7B09.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7B00,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A7B00:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A7B00

// Reference VA 004A7BD3..004A7BDC.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7BD3,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A7BD3:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A7BD3

// Reference VA 004A7C1C..004A7C25.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7C1C,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A7C1C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A7C1C

// Reference VA 004A7E0B..004A7E14.
// Double ring active-phase duration
// Ring 60 FPS: Double ring active-phase duration; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7E0B,C7 86 B0 00 00 00 0F 00 00 00)
TOS.exe+A7E0B:
// Vanilla: mov dword ptr [esi + 0xb0], 0xf
  mov dword ptr [esi + 0xb0], 0x1e // 004A7E0B

// Reference VA 004A7E75..004A7E7B.
// Match event/phase threshold to doubled timer
// Ring 60 FPS: Match event/phase threshold to doubled timer; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+A7E75,83 BE B0 00 00 00 0F)
TOS.exe+A7E75:
// Vanilla: cmp dword ptr [esi + 0xb0], 0xf
  cmp dword ptr [esi + 0xb0], 0x1e // 004A7E75

// Reference VA 004A8ADB..004A8ADC.
// Battle_DamageNumberDisplay: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+A8ADB,DC E9)
TOS.exe+A8ADB:
// Vanilla: fsub st(1), st(0)
  nop // 004A8ADB
  nop // 004A8ADC

// Reference VA 004B312D..004B312E.
assert(TOS.exe+B312D,75 C3)
TOS.exe+B312D:
// Vanilla: jne 0x4b30f2
  nop // 004B312D
  nop // 004B312E

// Reference VA 004BB245..004BB24A.
assert(TOS.exe+BB245,DC 0D 50 29 88 00)
TOS.exe+BB245:
// Vanilla: fmul qword ptr [0x882950]
  fmul qword ptr [fps_double_one] // 004BB245

// Reference VA 004BC9E4..004BC9E9.
// Overworld_TickActorMovement: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+BC9E4,DC 0D 50 29 88 00)
TOS.exe+BC9E4:
// Vanilla: fmul qword ptr [0x882950]
  fmul qword ptr [fps_double_one] // 004BC9E4

// Reference VA 004C17F2..004C17F7.
assert(TOS.exe+C17F2,8B 7D 08 83 3F 00)
TOS.exe+C17F2:
// Vanilla: mov edi, dword ptr [ebp + 8]; cmp dword ptr [edi], 0
  jmp near fps_ozette_waypoint_input // 004C17F2
  nop // 004C17F7

// Reference VA 004C1B71..004C1B75.
assert(TOS.exe+C1B71,83 C4 04 5F 5E)
TOS.exe+C1B71:
// Vanilla: add esp, 4; pop edi; pop esi
  jmp near fps_ozette_waypoint_output // 004C1B71

// Reference VA 004C3915..004C391B.
// Game_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C3915,83 05 C8 C3 C3 01 02)
TOS.exe+C3915:
// Vanilla: add dword ptr [0x1c3c3c8], 2
  add dword ptr [TOS.exe+183C3C8], #1 // 004C3915

// Reference VA 004C50E9..004C50F1.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C50E9,56 E8 31 CD 0A 00 83 C4 04)
TOS.exe+C50E9:
// Vanilla: push esi; call 0x571e20; add esp, 4
  nop // 004C50E9
  nop // 004C50EA
  nop // 004C50EB
  nop // 004C50EC
  nop // 004C50ED
  nop // 004C50EE
  nop // 004C50EF
  nop // 004C50F0
  nop // 004C50F1

// Reference VA 004C513A..004C5140.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C513A,80 05 2B 3E AD 00 FE)
TOS.exe+C513A:
// Vanilla: add byte ptr [0xad3e2b], 0xfe
  add byte ptr [TOS.exe+6D3E2B], 0xff // 004C513A

// Reference VA 004C5170..004C5171.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C5170,FF D6)
TOS.exe+C5170:
// Vanilla: call esi
  nop // 004C5170
  nop // 004C5171

// Reference VA 004C52F0..004C52F1.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C52F0,FF D6)
TOS.exe+C52F0:
// Vanilla: call esi
  nop // 004C52F0
  nop // 004C52F1

// Reference VA 004C5397..004C5398.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C5397,FF D6)
TOS.exe+C5397:
// Vanilla: call esi
  nop // 004C5397
  nop // 004C5398

// Reference VA 004C5540..004C5548.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C5540,7E 09 49 89 08 3B CB 75 02)
TOS.exe+C5540:
// Vanilla: jle 0x4c554b; dec ecx; mov dword ptr [eax], ecx; cmp ecx, ebx; jne 0x4c554b
  nop // 004C5540
  nop // 004C5541
  nop // 004C5542
  nop // 004C5543
  nop // 004C5544
  nop // 004C5545
  nop // 004C5546
  nop // 004C5547
  nop // 004C5548

// Reference VA 004C555B..004C555D.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C555B,8D 7A 02)
TOS.exe+C555B:
// Vanilla: lea edi, [edx + 2]
  lea edi, [edx + #1] // 004C555B

// Reference VA 004C558B..004C559B.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C558B,8B 86 28 1B 00 00 85 C0 74 07 48 89 86 28 1B 00 00)
TOS.exe+C558B:
// Vanilla: mov eax, dword ptr [esi + 0x1b28]; test eax, eax; je 0x4c559c; dec eax; mov dword ptr [esi + 0x1b28], eax
  nop // 004C558B
  nop // 004C558C
  nop // 004C558D
  nop // 004C558E
  nop // 004C558F
  nop // 004C5590
  nop // 004C5591
  nop // 004C5592
  nop // 004C5593
  nop // 004C5594
  nop // 004C5595
  nop // 004C5596
  nop // 004C5597
  nop // 004C5598
  nop // 004C5599
  nop // 004C559A
  nop // 004C559B

// Reference VA 004C55C1..004C55D1.
// FieldMap_MainUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C55C1,8B 86 30 1B 00 00 85 C0 74 07 48 89 86 30 1B 00 00)
TOS.exe+C55C1:
// Vanilla: mov eax, dword ptr [esi + 0x1b30]; test eax, eax; je 0x4c55d2; dec eax; mov dword ptr [esi + 0x1b30], eax
  nop // 004C55C1
  nop // 004C55C2
  nop // 004C55C3
  nop // 004C55C4
  nop // 004C55C5
  nop // 004C55C6
  nop // 004C55C7
  nop // 004C55C8
  nop // 004C55C9
  nop // 004C55CA
  nop // 004C55CB
  nop // 004C55CC
  nop // 004C55CD
  nop // 004C55CE
  nop // 004C55CF
  nop // 004C55D0
  nop // 004C55D1

// Reference VA 004C584E..004C5856.
// FieldMap_CutsceneUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C584E,56 E8 CC C5 0A 00 83 C4 04)
TOS.exe+C584E:
// Vanilla: push esi; call 0x571e20; add esp, 4
  nop // 004C584E
  nop // 004C584F
  nop // 004C5850
  nop // 004C5851
  nop // 004C5852
  nop // 004C5853
  nop // 004C5854
  nop // 004C5855
  nop // 004C5856

// Reference VA 004C58C1..004C58C2.
// FieldMap_CutsceneUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C58C1,FF D6)
TOS.exe+C58C1:
// Vanilla: call esi
  nop // 004C58C1
  nop // 004C58C2

// Reference VA 004C5A0C..004C5A0D.
// FieldMap_CutsceneUpdate: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C5A0C,FF D6)
TOS.exe+C5A0C:
// Vanilla: call esi
  nop // 004C5A0C
  nop // 004C5A0D

// Reference VA 004C8920..004C8927.
assert(TOS.exe+C8920,33 C0 8D 8A 5C 08 00 00)
TOS.exe+C8920:
// Vanilla: xor eax, eax; lea ecx, [edx + 0x85c]
  jmp near fps_field_animation_slot_reuse_guard // 004C8920
  nop // 004C8925
  nop // 004C8926
  nop // 004C8927

// Reference VA 004C89A8..004C89AD.
// Entity_InterpolateFacing: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C89A8,DD 05 B8 29 88 00)
TOS.exe+C89A8:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 004C89A8

// Reference VA 004C8A18..004C8A19.
// Entity_InterpolateFacing: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C8A18,D8 C9)
TOS.exe+C8A18:
// Vanilla: fmul st(1)
  nop // 004C8A18
  nop // 004C8A19

// Reference VA 004C9C26..004C9C2B.
// NPC_IdleWaypointState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C9C26,D9 44 24 24 D8 D9)
TOS.exe+C9C26:
// Vanilla: fld dword ptr [esp + 0x24]; fcomp st(1)
  jmp near fps_flight_single_arrival_compare // 004C9C26
  nop // 004C9C2B

// Reference VA 004C9D49..004C9D4E.
// NPC_IdleWaypointState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C9D49,8A 0D DD C3 C3 01)
TOS.exe+C9D49:
// Vanilla: mov cl, byte ptr [0x1c3c3dd]
  jmp near fps_ground_single_arrival_compare // 004C9D49
  nop // 004C9D4E

// Reference VA 004C9D70..004C9D75.
// NPC_IdleWaypointState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C9D70,D9 54 24 24 84 C9)
TOS.exe+C9D70:
// Vanilla: fst dword ptr [esp + 0x24]; test cl, cl
  jmp near fps_ground_single_arrival_redirect // 004C9D70
  nop // 004C9D75

// Reference VA 004C9F3A..004C9F3F.
// NPC_IdleWaypointState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C9F3A,8A 0D DD C3 C3 01)
TOS.exe+C9F3A:
// Vanilla: mov cl, byte ptr [0x1c3c3dd]
  jmp near fps_multi_arrival_compare_legacy // 004C9F3A
  nop // 004C9F3F

// Reference VA 004C9F59..004C9F5E.
// NPC_IdleWaypointState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+C9F59,D9 54 24 24 84 C9)
TOS.exe+C9F59:
// Vanilla: fst dword ptr [esp + 0x24]; test cl, cl
  jmp near fps_flight_multi_arrival_store // 004C9F59
  nop // 004C9F5E

// Reference VA 004CA0AB..004CA0B0.
// NPC_IdleWaypointState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CA0AB,8A 0D DD C3 C3 01)
TOS.exe+CA0AB:
// Vanilla: mov cl, byte ptr [0x1c3c3dd]
  jmp near fps_ground_multi_arrival_compare // 004CA0AB
  nop // 004CA0B0

// Reference VA 004CA0CA..004CA0CF.
// NPC_IdleWaypointState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CA0CA,D9 54 24 24 84 C9)
TOS.exe+CA0CA:
// Vanilla: fst dword ptr [esp + 0x24]; test cl, cl
  jmp near fps_ground_multi_arrival_store // 004CA0CA
  nop // 004CA0CF

// Reference VA 004CA40C..004CA411.
// NPC_WalkStateHandler: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CA40C,DC 0D A8 2A 88 00)
TOS.exe+CA40C:
// Vanilla: fmul qword ptr [0x882aa8]
  fmul qword ptr [TOS.exe+482950] // 004CA40C

// Reference VA 004CB310..004CB311.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB310,DC C1)
TOS.exe+CB310:
// Vanilla: fadd st(1), st(0)
  nop // 004CB310
  nop // 004CB311

// Reference VA 004CB322..004CB323.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB322,D8 C1)
TOS.exe+CB322:
// Vanilla: fadd st(1)
  nop // 004CB322
  nop // 004CB323

// Reference VA 004CB338..004CB339.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB338,DC E9)
TOS.exe+CB338:
// Vanilla: fsub st(1), st(0)
  nop // 004CB338
  nop // 004CB339

// Reference VA 004CB34A..004CB34B.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB34A,D8 E1)
TOS.exe+CB34A:
// Vanilla: fsub st(1)
  nop // 004CB34A
  nop // 004CB34B

// Reference VA 004CB35D..004CB35E.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB35D,DC E9)
TOS.exe+CB35D:
// Vanilla: fsub st(1), st(0)
  nop // 004CB35D
  nop // 004CB35E

// Reference VA 004CB36F..004CB370.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB36F,D8 E1)
TOS.exe+CB36F:
// Vanilla: fsub st(1)
  nop // 004CB36F
  nop // 004CB370

// Reference VA 004CB385..004CB386.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB385,DC C1)
TOS.exe+CB385:
// Vanilla: fadd st(1), st(0)
  nop // 004CB385
  nop // 004CB386

// Reference VA 004CB397..004CB398.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB397,D8 C1)
TOS.exe+CB397:
// Vanilla: fadd st(1)
  nop // 004CB397
  nop // 004CB398

// Reference VA 004CB3A8..004CB3AE.
// NPC_PushForwardState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB3A8,83 BE B0 00 00 00 19)
TOS.exe+CB3A8:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x19
  cmp dword ptr [esi + 0xb0], 0x32 // 004CB3A8

// Reference VA 004CB560..004CB561.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB560,DC E9)
TOS.exe+CB560:
// Vanilla: fsub st(1), st(0)
  nop // 004CB560
  nop // 004CB561

// Reference VA 004CB572..004CB573.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB572,D8 E1)
TOS.exe+CB572:
// Vanilla: fsub st(1)
  nop // 004CB572
  nop // 004CB573

// Reference VA 004CB588..004CB589.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB588,DC C1)
TOS.exe+CB588:
// Vanilla: fadd st(1), st(0)
  nop // 004CB588
  nop // 004CB589

// Reference VA 004CB59A..004CB59B.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB59A,D8 C1)
TOS.exe+CB59A:
// Vanilla: fadd st(1)
  nop // 004CB59A
  nop // 004CB59B

// Reference VA 004CB5AD..004CB5AE.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB5AD,DC C1)
TOS.exe+CB5AD:
// Vanilla: fadd st(1), st(0)
  nop // 004CB5AD
  nop // 004CB5AE

// Reference VA 004CB5BF..004CB5C0.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB5BF,D8 C1)
TOS.exe+CB5BF:
// Vanilla: fadd st(1)
  nop // 004CB5BF
  nop // 004CB5C0

// Reference VA 004CB5D5..004CB5D6.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB5D5,DC E9)
TOS.exe+CB5D5:
// Vanilla: fsub st(1), st(0)
  nop // 004CB5D5
  nop // 004CB5D6

// Reference VA 004CB5E7..004CB5E8.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB5E7,D8 E1)
TOS.exe+CB5E7:
// Vanilla: fsub st(1)
  nop // 004CB5E7
  nop // 004CB5E8

// Reference VA 004CB5F8..004CB5FE.
// NPC_PullBackState: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CB5F8,83 BE B0 00 00 00 19)
TOS.exe+CB5F8:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x19
  cmp dword ptr [esi + 0xb0], 0x32 // 004CB5F8

// Reference VA 004CBEBC..004CBEC5.
// Mode 10 held-input refresh: 16 -> 32
// Ring 60 FPS: Mode 10 held-input refresh: 16 -> 32; see sorcerer-ring-60fps/patch.json
assert(TOS.exe+CBEBC,C7 80 B0 00 00 00 10 00 00 00)
TOS.exe+CBEBC:
// Vanilla: mov dword ptr [eax + 0xb0], 0x10
  mov dword ptr [eax + 0xb0], 0x20 // 004CBEBC

// Reference VA 004CC963..004CC96C.
// NPC_HandleMovementInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CC963,C7 86 B0 00 00 00 0F 00 00 00)
TOS.exe+CC963:
// Vanilla: mov dword ptr [esi + 0xb0], 0xf
  mov dword ptr [esi + 0xb0], 0x1e // 004CC963

// Reference VA 004CCF4D..004CCF52.
// NPC_HandleMovementInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CCF4D,D9 9E 38 09 00 00)
TOS.exe+CCF4D:
// Vanilla: fstp dword ptr [esi + 0x938]
  jmp near fps_npc_animation_speed // 004CCF4D
  nop // 004CCF52

// Reference VA 004CCFDE..004CCFE3.
// NPC_HandleMovementInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CCFDE,D8 1D 20 2B 88 00)
TOS.exe+CCFDE:
// Vanilla: fcomp dword ptr [0x882b20]
  fcomp dword ptr [TOS.exe+482A44] // 004CCFDE

// Reference VA 004CCFF4..004CCFF8.
// NPC_HandleMovementInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CCFF4,E8 B7 5D FF FF)
TOS.exe+CCFF4:
// Vanilla: call 0x4c2db0
  nop // 004CCFF4
  nop // 004CCFF5
  nop // 004CCFF6
  nop // 004CCFF7
  nop // 004CCFF8

// Reference VA 004CD02E..004CD032.
// NPC_HandleMovementInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CD02E,E8 7D 5D FF FF)
TOS.exe+CD02E:
// Vanilla: call 0x4c2db0
  nop // 004CD02E
  nop // 004CD02F
  nop // 004CD030
  nop // 004CD031
  nop // 004CD032

// Reference VA 004CDC54..004CDC5B.
// NPC_UpdateTextureAnimation: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CDC54,66 83 86 C8 00 00 00 02)
TOS.exe+CDC54:
// Vanilla: add word ptr [esi + 0xc8], 2
  add word ptr [esi + 0xc8], #1 // 004CDC54

// Reference VA 004CDDBD..004CDDC4.
// NPC_UpdateAltTextureAnim: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CDDBD,66 83 81 CE 00 00 00 02)
TOS.exe+CDDBD:
// Vanilla: add word ptr [ecx + 0xce], 2
  add word ptr [ecx + 0xce], #1 // 004CDDBD

// Reference VA 004CEEAC..004CEEB0.
// NPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CEEAC,E8 7F 90 FF FF)
TOS.exe+CEEAC:
// Vanilla: call 0x4c7f30
  call fps_npc_half_delta_before_collision // 004CEEAC

// Reference VA 004CEEBA..004CEEBE.
// NPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CEEBA,E9 37 03 00 00)
TOS.exe+CEEBA:
// Vanilla: jmp 0x4cf1f6
  jmp near fps_npc_direct_delta_integration // 004CEEBA

// Reference VA 004CEF14..004CEF18.
// Luin/Colette test revision 2: halve NPC delta before collision and terrain via existing player helper. Paired with direct integration at 004CF1F6; do not apply either edit alone.
assert(TOS.exe+CEF14,E8 17 90 FF FF)
TOS.exe+CEF14:
// Vanilla: call 0x4c7f30
  call fps_npc_half_delta_before_collision // 004CEF14

// Reference VA 004CF1F6..004CF210.
// Luin/Colette test revision 2: delta already halved at 004CEF14; use existing direct integrator 02EFF700. Avoid second halving.
assert(TOS.exe+CF1F6,D9 43 28 D8 43 04 D9 5B 04 D9 43 2C D8 43 08 D9 5B 08 D9 43 30 D8 43 0C D9 5B 0C)
TOS.exe+CF1F6:
  jmp near fps_npc_direct_delta_integration // 004CF1F6
  nop // 004CF1FB
  nop // 004CF1FC
  nop // 004CF1FD
  nop // 004CF1FE
  nop // 004CF1FF
  nop // 004CF200
  nop // 004CF201
  nop // 004CF202
  nop // 004CF203
  nop // 004CF204
  nop // 004CF205
  nop // 004CF206
  nop // 004CF207
  nop // 004CF208
  nop // 004CF209
  nop // 004CF20A
  nop // 004CF20B
  db 43,0C,D9,5B,0C // Unreachable original instruction tail after unconditional jump.

// Reference VA 004CF3D5..004CF3DA.
// NPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CF3D5,DC 05 B8 29 88 00)
TOS.exe+CF3D5:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 004CF3D5

// Reference VA 004CF44C..004CF452.
// NPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CF44C,F6 05 D8 C3 C3 01 03)
TOS.exe+CF44C:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004CF44C

// Reference VA 004CF4F6..004CF4FC.
// NPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CF4F6,F6 05 D8 C3 C3 01 0F)
TOS.exe+CF4F6:
// Vanilla: test byte ptr [0x1c3c3d8], 0xf
  test byte ptr [TOS.exe+183C3D8], 0x1f // 004CF4F6

// Reference VA 004CF5A5..004CF5AA.
// NPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CF5A5,DC 05 B8 29 88 00)
TOS.exe+CF5A5:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 004CF5A5

// Reference VA 004CF5BE..004CF5C3.
// NPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+CF5BE,D1 E8 F6 D0 24 10)
TOS.exe+CF5BE:
// Vanilla: shr eax, 1; not al; and al, 0x10
  and al, 0x40 // 004CF5BE
  je short TOS.exe+CF5C4 // 004CF5C0
  mov al, 0x10 // 004CF5C2

// Reference VA 004D0900..004D0905.
// VFX_TickAndRenderAura: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D0900,DC 25 B8 29 88 00)
TOS.exe+D0900:
// Vanilla: fsub qword ptr [0x8829b8]
  fsub qword ptr [fps_double_one] // 004D0900

// Reference VA 004D0C8D..004D0C8E.
// ScreenFade_Update: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D0C8D,DC C0)
TOS.exe+D0C8D:
// Vanilla: fadd st(0), st(0)
  nop // 004D0C8D
  nop // 004D0C8E

// Reference VA 004D0F24..004D0F29.
// NPC_SpawnShadowEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D0F24,DD 05 B8 29 88 00)
TOS.exe+D0F24:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 004D0F24

// Reference VA 004D1BA9..004D1BAF.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D1BA9,83 83 DC 09 00 00 02)
TOS.exe+D1BA9:
// Vanilla: add dword ptr [ebx + 0x9dc], 2
  add dword ptr [ebx + 0x9dc], #1 // 004D1BA9

// Reference VA 004D1E8E..004D1E94.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D1E8E,F6 05 D8 C3 C3 01 03)
TOS.exe+D1E8E:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004D1E8E

// Reference VA 004D20C7..004D20CD.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D20C7,F6 05 D8 C3 C3 01 03)
TOS.exe+D20C7:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004D20C7

// Reference VA 004D2381..004D2387.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2381,66 FF 83 CE 09 00 00)
TOS.exe+D2381:
// Vanilla: inc word ptr [ebx + 0x9ce]
  jmp near fps_emote_case5_counter // 004D2381
  nop // 004D2386
  nop // 004D2387

// Reference VA 004D2683..004D2688.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2683,DC 05 B8 29 88 00)
TOS.exe+D2683:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [timing_helpers+D8] // 004D2683

// Reference VA 004D2786..004D278B.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2786,DC 05 18 2E 88 00)
TOS.exe+D2786:
// Vanilla: fadd qword ptr [0x882e18]
  fadd qword ptr [timing_helpers+D0] // 004D2786

// Reference VA 004D27C0..004D27C5.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D27C0,DC 25 B8 29 88 00)
TOS.exe+D27C0:
// Vanilla: fsub qword ptr [0x8829b8]
  fsub qword ptr [fps_double_one] // 004D27C0

// Reference VA 004D29C7..004D29CC.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D29C7,DD 05 B8 29 88 00)
TOS.exe+D29C7:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [timing_helpers+D8] // 004D29C7

// Reference VA 004D2A0E..004D2A13.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2A0E,DC 25 60 36 88 00)
TOS.exe+D2A0E:
// Vanilla: fsub qword ptr [0x883660]
  fsub qword ptr [timing_helpers+E0] // 004D2A0E

// Reference VA 004D2AE9..004D2AEF.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2AE9,F6 05 D8 C3 C3 01 03)
TOS.exe+D2AE9:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004D2AE9

// Reference VA 004D2B6F..004D2B74.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2B6F,DC 05 08 2C 88 00)
TOS.exe+D2B6F:
// Vanilla: fadd qword ptr [0x882c08]
  fadd qword ptr [fps_emote_constants] // 004D2B6F

// Reference VA 004D2BA8..004D2BAD.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2BA8,DC 05 58 36 88 00)
TOS.exe+D2BA8:
// Vanilla: fadd qword ptr [0x883658]
  fadd qword ptr [timing_helpers+C0] // 004D2BA8

// Reference VA 004D2E1F..004D2E24.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2E1F,DC 05 68 2E 88 00)
TOS.exe+D2E1F:
// Vanilla: fadd qword ptr [0x882e68]
  fadd qword ptr [timing_helpers+C8] // 004D2E1F

// Reference VA 004D2EC7..004D2ECD.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2EC7,48 89 83 B0 00 00 00)
TOS.exe+D2EC7:
// Vanilla: dec eax; mov dword ptr [ebx + 0xb0], eax
  nop // 004D2EC7
  nop // 004D2EC8
  nop // 004D2EC9
  nop // 004D2ECA
  nop // 004D2ECB
  nop // 004D2ECC
  nop // 004D2ECD

// Reference VA 004D2EE3..004D2EED.
// VFX_TickBattleEffect: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D2EE3,48 89 83 B0 00 00 00 85 C0 7F 06)
TOS.exe+D2EE3:
// Vanilla: dec eax; mov dword ptr [ebx + 0xb0], eax; test eax, eax; jg 0x4d2ef4
  jmp near fps_emote_lifetime // 004D2EE3
  nop // 004D2EE8
  nop // 004D2EE9
  nop // 004D2EEA
  nop // 004D2EEB
  nop // 004D2EEC
  nop // 004D2EED

// Reference VA 004D397D..004D3982.
// HostileNPC_State7_Wander: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D397D,DD 05 B8 29 88 00)
TOS.exe+D397D:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 004D397D

// Reference VA 004D3EAA..004D3EAC.
// HostileNPC_State7_Wander: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D3EAA,83 E8 02)
TOS.exe+D3EAA:
// Vanilla: sub eax, 2
  sub eax, #1 // 004D3EAA

// Reference VA 004D3FDD..004D3FE2.
// HostileNPC_State8_Unknown: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D3FDD,DD 05 B8 29 88 00)
TOS.exe+D3FDD:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 004D3FDD

// Reference VA 004D4423..004D4425.
// 60fps fix: timer -= 1 (was -= 2)
assert(TOS.exe+D4423,83 E8 02)
TOS.exe+D4423:
// Vanilla: sub eax, 2
  sub eax, #1 // 004D4423

// Reference VA 004D45DD..004D45E2.
// HostileNPC_State9_Unknown: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D45DD,DD 05 B8 29 88 00)
TOS.exe+D45DD:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 004D45DD

// Reference VA 004D4A23..004D4A25.
// HostileNPC_State9_Unknown: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D4A23,83 E8 02)
TOS.exe+D4A23:
// Vanilla: sub eax, 2
  sub eax, #1 // 004D4A23

// Reference VA 004D56CE..004D56D0.
// 60fps fix: timer -= 1 (was -= 2)
assert(TOS.exe+D56CE,83 EA 02)
TOS.exe+D56CE:
// Vanilla: sub edx, 2
  sub edx, #1 // 004D56CE

// Reference VA 004D58DD..004D58E2.
// HostileNPC_State12_Unknown: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D58DD,DD 05 B8 29 88 00)
TOS.exe+D58DD:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 004D58DD

// Reference VA 004D5DB5..004D5DB7.
// HostileNPC_State12_Unknown: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D5DB5,83 E8 02)
TOS.exe+D5DB5:
// Vanilla: sub eax, 2
  sub eax, #1 // 004D5DB5

// Reference VA 004D6352..004D6352.
// HostileNPC_TickAndRender: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+D6352,48)
TOS.exe+D6352:
// Vanilla: dec eax
  nop // 004D6352

// Reference VA 004D8EF2..004D8EF7.
assert(TOS.exe+D8EF2,DC 05 B8 29 88 00)
TOS.exe+D8EF2:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 004D8EF2

// Reference VA 004DB137..004DB139.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB137,8D 0C 41)
TOS.exe+DB137:
// Vanilla: lea ecx, [ecx + eax*2]
  db 8D,0C,01 // lea ecx, [ecx + eax] // 004DB137

// Reference VA 004DB13C..004DB13E.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB13C,83 E9 02)
TOS.exe+DB13C:
// Vanilla: sub ecx, 2
  sub ecx, #1 // 004DB13C

// Reference VA 004DB151..004DB152.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB151,03 C0)
TOS.exe+DB151:
// Vanilla: add eax, eax
  nop // 004DB151
  nop // 004DB152

// Reference VA 004DB191..004DB194.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB191,66 83 E8 10)
TOS.exe+DB191:
// Vanilla: sub ax, 0x10
  sub ax, #8 // 004DB191

// Reference VA 004DB251..004DB262.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB251,D9 46 0C DE C3 D9 CA D9 5E 0C D8 46 10 D9 5E 10 EB 30)
TOS.exe+DB251:
// Vanilla: fld dword ptr [esi + 0xc]; faddp st(3); fxch st(2); fstp dword ptr [esi + 0xc]; fadd dword ptr [esi + 0x10]; fstp dword ptr [esi + 0x10]; jmp 0x4db293
  fstp st(0) // 004DB251
  fstp st(0) // 004DB253
  fstp st(0) // 004DB255
  jmp short TOS.exe+DB299 // 004DB257
  nop // 004DB259
  nop // 004DB25A
  nop // 004DB25B
  nop // 004DB25C
  nop // 004DB25D
  nop // 004DB25E
  nop // 004DB25F
  nop // 004DB260
  nop // 004DB261
  nop // 004DB262

// Reference VA 004DB27E..004DB298.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB27E,D9 46 0C D8 46 40 D9 5E 0C D9 46 10 D8 46 44 D9 5E 10 D9 46 48 D8 46 14 D9 5E 14)
TOS.exe+DB27E:
  jmp short TOS.exe+DB299 // 004DB27E
  nop // 004DB280
  nop // 004DB281
  nop // 004DB282
  nop // 004DB283
  nop // 004DB284
  nop // 004DB285
  nop // 004DB286
  nop // 004DB287
  nop // 004DB288
  nop // 004DB289
  nop // 004DB28A
  nop // 004DB28B
  nop // 004DB28C
  nop // 004DB28D
  nop // 004DB28E
  nop // 004DB28F
  nop // 004DB290
  nop // 004DB291
  nop // 004DB292
  nop // 004DB293
  nop // 004DB294
  nop // 004DB295
  nop // 004DB296
  nop // 004DB297
  nop // 004DB298

// Reference VA 004DB2BA..004DB2BB.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB2BA,84 C0)
TOS.exe+DB2BA:
// Vanilla: test al, al
  xor al, al // 004DB2BA

// Reference VA 004DB2D3..004DB2D4.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB2D3,84 C9)
TOS.exe+DB2D3:
// Vanilla: test cl, cl
  xor cl, cl // 004DB2D3

// Reference VA 004DB2FC..004DB316.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB2FC,D9 46 18 D8 46 4C D9 5E 18 D9 46 50 D8 46 1C D9 5E 1C D9 46 20 D8 46 54 D9 5E 20)
TOS.exe+DB2FC:
  nop // 004DB2FC
  nop // 004DB2FD
  nop // 004DB2FE
  nop // 004DB2FF
  nop // 004DB300
  nop // 004DB301
  nop // 004DB302
  nop // 004DB303
  nop // 004DB304
  nop // 004DB305
  nop // 004DB306
  nop // 004DB307
  nop // 004DB308
  nop // 004DB309
  nop // 004DB30A
  nop // 004DB30B
  nop // 004DB30C
  nop // 004DB30D
  nop // 004DB30E
  nop // 004DB30F
  nop // 004DB310
  nop // 004DB311
  nop // 004DB312
  nop // 004DB313
  nop // 004DB314
  nop // 004DB315
  nop // 004DB316

// Reference VA 004DB320..004DB328.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB320,D9 45 F4 D8 46 5C D9 5D F4)
TOS.exe+DB320:
// Vanilla: fld dword ptr [ebp - 0xc]; fadd dword ptr [esi + 0x5c]; fstp dword ptr [ebp - 0xc]
  nop // 004DB320
  nop // 004DB321
  nop // 004DB322
  nop // 004DB323
  nop // 004DB324
  nop // 004DB325
  nop // 004DB326
  nop // 004DB327
  nop // 004DB328

// Reference VA 004DB338..004DB340.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB338,D9 45 F4 D8 46 5C D9 5D F4)
TOS.exe+DB338:
// Vanilla: fld dword ptr [ebp - 0xc]; fadd dword ptr [esi + 0x5c]; fstp dword ptr [ebp - 0xc]
  nop // 004DB338
  nop // 004DB339
  nop // 004DB33A
  nop // 004DB33B
  nop // 004DB33C
  nop // 004DB33D
  nop // 004DB33E
  nop // 004DB33F
  nop // 004DB340

// Reference VA 004DB36F..004DB373.
// 60fps patch: VFX particle anim timer += 1 (was 2)
assert(TOS.exe+DB36F,66 83 46 3E 02)
TOS.exe+DB36F:
// Vanilla: add word ptr [esi + 0x3e], 2
  add word ptr [esi + 0x3e], #1 // 004DB36F

// Reference VA 004DB3DB..004DB3DE.
// VFX_UpdateParticles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DB3DB,48 66 89 06)
TOS.exe+DB3DB:
// Vanilla: dec eax; mov word ptr [esi], ax
  nop // 004DB3DB
  nop // 004DB3DC
  nop // 004DB3DD
  nop // 004DB3DE

// Reference VA 004DBA26..004DBA2B.
// NPC_UpdateSpeechBubbles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DBA26,DC 05 F0 2C 88 00)
TOS.exe+DBA26:
// Vanilla: fadd qword ptr [0x882cf0]
  fadd qword ptr [TOS.exe+482DE0] // 004DBA26

// Reference VA 004DBA48..004DBA4A.
// NPC_UpdateSpeechBubbles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DBA48,83 C1 02)
TOS.exe+DBA48:
// Vanilla: add ecx, 2
  add ecx, #1 // 004DBA48

// Reference VA 004DBA5C..004DBA61.
// NPC_UpdateSpeechBubbles: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+DBA5C,DC 25 60 2C 88 00)
TOS.exe+DBA5C:
// Vanilla: fsub qword ptr [0x882c60]
  fsub qword ptr [TOS.exe+482E18] // 004DBA5C

// Reference VA 004F3722..004F3728.
assert(TOS.exe+F3722,80 3D D6 39 B1 00 CC)
TOS.exe+F3722:
// Vanilla: cmp byte ptr [0xb139d6], 0xcc
  cmp byte ptr [TOS.exe+7139D6], 0xdf // 004F3722

// Reference VA 004F373A..004F3747.
assert(TOS.exe+F373A,80 05 D8 39 B1 00 CD 80 05 D6 39 B1 00 33)
TOS.exe+F373A:
// Vanilla: add byte ptr [0xb139d8], 0xcd; add byte ptr [0xb139d6], 0x33
  add byte ptr [TOS.exe+7139D8], 0xe0 // 004F373A
  add byte ptr [TOS.exe+7139D6], 0x20 // 004F3741

// Reference VA 004F3751..004F3757.
assert(TOS.exe+F3751,80 3D D6 39 B1 00 33)
TOS.exe+F3751:
// Vanilla: cmp byte ptr [0xb139d6], 0x33
  cmp byte ptr [TOS.exe+7139D6], 0x20 // 004F3751

// Reference VA 004F376C..004F3772.
assert(TOS.exe+F376C,80 05 D6 39 B1 00 CD)
TOS.exe+F376C:
// Vanilla: add byte ptr [0xb139d6], 0xcd
  add byte ptr [TOS.exe+7139D6], 0xe0 // 004F376C

// Reference VA 004F377C..004F3782.
assert(TOS.exe+F377C,80 3D D6 39 B1 00 CC)
TOS.exe+F377C:
// Vanilla: cmp byte ptr [0xb139d6], 0xcc
  cmp byte ptr [TOS.exe+7139D6], 0xdf // 004F377C

// Reference VA 004F37A3..004F37A9.
assert(TOS.exe+F37A3,80 3D D2 39 B1 00 D7)
TOS.exe+F37A3:
// Vanilla: cmp byte ptr [0xb139d2], 0xd7
  cmp byte ptr [TOS.exe+7139D2], 0xe6 // 004F37A3

// Reference VA 004F37C5..004F37CB.
assert(TOS.exe+F37C5,80 05 D2 39 B1 00 28)
TOS.exe+F37C5:
// Vanilla: add byte ptr [0xb139d2], 0x28
  add byte ptr [TOS.exe+7139D2], 0x19 // 004F37C5

// Reference VA 004F37DE..004F37DF.
assert(TOS.exe+F37DE,3C 28)
TOS.exe+F37DE:
// Vanilla: cmp al, 0x28
  cmp al, 0x19 // 004F37DE

// Reference VA 004F3811..004F3812.
assert(TOS.exe+F3811,04 D8)
TOS.exe+F3811:
// Vanilla: add al, 0xd8
  add al, 0xe7 // 004F3811

// Reference VA 004F4215..004F4217.
assert(TOS.exe+F4215,83 C1 33)
TOS.exe+F4215:
// Vanilla: add ecx, 0x33
  add ecx, 0x20 // 004F4215

// Reference VA 004F4224..004F4225.
assert(TOS.exe+F4224,04 33)
TOS.exe+F4224:
// Vanilla: add al, 0x33
  add al, 0x20 // 004F4224

// Reference VA 004F4636..004F4637.
assert(TOS.exe+F4636,3C 33)
TOS.exe+F4636:
// Vanilla: cmp al, 0x33
  cmp al, 0x20 // 004F4636

// Reference VA 004F463A..004F463B.
assert(TOS.exe+F463A,04 CD)
TOS.exe+F463A:
// Vanilla: add al, 0xcd
  add al, 0xe0 // 004F463A

// Reference VA 004F4729..004F4732.
assert(TOS.exe+F4729,C7 05 D2 39 B1 00 D8 01 00 00)
TOS.exe+F4729:
// Vanilla: mov dword ptr [0xb139d2], 0x1d8
  mov dword ptr [TOS.exe+7139D2], 0x1e7 // 004F4729

// Reference VA 004F77F4..004F77FA.
assert(TOS.exe+F77F4,80 3D C8 0D C3 01 D7)
TOS.exe+F77F4:
// Vanilla: cmp byte ptr [0x1c30dc8], 0xd7
  cmp byte ptr [TOS.exe+1830DC8], 0xe6 // 004F77F4

// Reference VA 004F7810..004F7816.
assert(TOS.exe+F7810,80 05 C8 0D C3 01 28)
TOS.exe+F7810:
// Vanilla: add byte ptr [0x1c30dc8], 0x28
  add byte ptr [TOS.exe+1830DC8], 0x19 // 004F7810

// Reference VA 004F782A..004F782C.
assert(TOS.exe+F782A,80 F9 28)
TOS.exe+F782A:
// Vanilla: cmp cl, 0x28
  cmp cl, 0x19 // 004F782A

// Reference VA 004F785A..004F785C.
assert(TOS.exe+F785A,80 C1 D8)
TOS.exe+F785A:
// Vanilla: add cl, 0xd8
  add cl, 0xe7 // 004F785A

// Reference VA 004F8018..004F8021.
assert(TOS.exe+F8018,C7 05 C8 0D C3 01 D8 01 00 00)
TOS.exe+F8018:
// Vanilla: mov dword ptr [0x1c30dc8], 0x1d8
  mov dword ptr [TOS.exe+1830DC8], 0x1e7 // 004F8018

// Reference VA 004FC3B7..004FC3BD.
assert(TOS.exe+FC3B7,80 3D B0 9F D5 01 D7)
TOS.exe+FC3B7:
// Vanilla: cmp byte ptr [0x1d59fb0], 0xd7
  cmp byte ptr [TOS.exe+1959FB0], 0xe6 // 004FC3B7

// Reference VA 004FC3EB..004FC3F1.
assert(TOS.exe+FC3EB,80 05 B0 9F D5 01 28)
TOS.exe+FC3EB:
// Vanilla: add byte ptr [0x1d59fb0], 0x28
  add byte ptr [TOS.exe+1959FB0], 0x19 // 004FC3EB

// Reference VA 004FC40F..004FC411.
assert(TOS.exe+FC40F,80 F9 28)
TOS.exe+FC40F:
// Vanilla: cmp cl, 0x28
  cmp cl, 0x19 // 004FC40F

// Reference VA 004FC4DF..004FC4E1.
assert(TOS.exe+FC4DF,80 C1 D8)
TOS.exe+FC4DF:
// Vanilla: add cl, 0xd8
  add cl, 0xe7 // 004FC4DF

// Reference VA 004FE6E9..004FE6F1.
assert(TOS.exe+FE6E9,66 C7 05 B0 9F D5 01 D8 01)
TOS.exe+FE6E9:
// Vanilla: mov word ptr [0x1d59fb0], 0x1d8
  mov word ptr [TOS.exe+1959FB0], 0x1e7 // 004FE6E9

// Reference VA 005068F0..005068F6.
assert(TOS.exe+1068F0,80 3D 38 0E C3 01 D7)
TOS.exe+1068F0:
// Vanilla: cmp byte ptr [0x1c30e38], 0xd7
  cmp byte ptr [TOS.exe+1830E38], 0xe6 // 005068F0

// Reference VA 00506916..0050691C.
assert(TOS.exe+106916,80 05 38 0E C3 01 28)
TOS.exe+106916:
// Vanilla: add byte ptr [0x1c30e38], 0x28
  add byte ptr [TOS.exe+1830E38], 0x19 // 00506916

// Reference VA 00506939..0050693A.
assert(TOS.exe+106939,3C 28)
TOS.exe+106939:
// Vanilla: cmp al, 0x28
  cmp al, 0x19 // 00506939

// Reference VA 00506A2F..00506A30.
assert(TOS.exe+106A2F,04 D8)
TOS.exe+106A2F:
// Vanilla: add al, 0xd8
  add al, 0xe7 // 00506A2F

// Reference VA 00507CE7..00507CEF.
// FieldMap_Init: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+107CE7,66 C7 05 38 0E C3 01 D8 01)
TOS.exe+107CE7:
// Vanilla: mov word ptr [0x1c30e38], 0x1d8
  mov word ptr [TOS.exe+1830E38], 0x1e7 // 00507CE7

// Reference VA 0050ABC1..0050ABC7.
assert(TOS.exe+10ABC1,80 3D 2C 17 C3 01 D7)
TOS.exe+10ABC1:
// Vanilla: cmp byte ptr [0x1c3172c], 0xd7
  cmp byte ptr [TOS.exe+183172C], 0xe6 // 0050ABC1

// Reference VA 0050ABE7..0050ABED.
assert(TOS.exe+10ABE7,80 05 2C 17 C3 01 28)
TOS.exe+10ABE7:
// Vanilla: add byte ptr [0x1c3172c], 0x28
  add byte ptr [TOS.exe+183172C], 0x19 // 0050ABE7

// Reference VA 0050AC01..0050AC03.
assert(TOS.exe+10AC01,80 F9 28)
TOS.exe+10AC01:
// Vanilla: cmp cl, 0x28
  cmp cl, 0x19 // 0050AC01

// Reference VA 0050AC57..0050AC59.
assert(TOS.exe+10AC57,80 C1 D8)
TOS.exe+10AC57:
// Vanilla: add cl, 0xd8
  add cl, 0xe7 // 0050AC57

// Reference VA 0050BDC2..0050BDCA.
assert(TOS.exe+10BDC2,66 C7 05 2C 17 C3 01 D8 01)
TOS.exe+10BDC2:
// Vanilla: mov word ptr [0x1c3172c], 0x1d8
  mov word ptr [TOS.exe+183172C], 0x1e7 // 0050BDC2

// Reference VA 0051799B..005179A1.
assert(TOS.exe+11799B,80 3D 90 95 8B 00 D7)
TOS.exe+11799B:
// Vanilla: cmp byte ptr [0x8b9590], 0xd7
  cmp byte ptr [TOS.exe+4B9590], 0xe6 // 0051799B

// Reference VA 005179BB..005179C1.
assert(TOS.exe+1179BB,80 05 90 95 8B 00 28)
TOS.exe+1179BB:
// Vanilla: add byte ptr [0x8b9590], 0x28
  add byte ptr [TOS.exe+4B9590], 0x19 // 005179BB

// Reference VA 005179D5..005179D7.
assert(TOS.exe+1179D5,80 FA 28)
TOS.exe+1179D5:
// Vanilla: cmp dl, 0x28
  cmp dl, 0x19 // 005179D5

// Reference VA 00517A22..00517A24.
assert(TOS.exe+117A22,80 C2 D8)
TOS.exe+117A22:
// Vanilla: add dl, 0xd8
  add dl, 0xe7 // 00517A22

// Reference VA 00518E54..00518E5C.
assert(TOS.exe+118E54,66 C7 05 90 95 8B 00 D8 01)
TOS.exe+118E54:
// Vanilla: mov word ptr [0x8b9590], 0x1d8
  mov word ptr [TOS.exe+4B9590], 0x1e7 // 00518E54

// Reference VA 00518F44..00518F4C.
// Overworld_SubModeDispatch: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+118F44,66 C7 05 90 95 8B 00 D8 01)
TOS.exe+118F44:
// Vanilla: mov word ptr [0x8b9590], 0x1d8
  mov word ptr [TOS.exe+4B9590], 0x1e7 // 00518F44

// Reference VA 00518FAD..00518FB5.
// Overworld_SubModeDispatch: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+118FAD,66 C7 05 90 95 8B 00 D8 01)
TOS.exe+118FAD:
// Vanilla: mov word ptr [0x8b9590], 0x1d8
  mov word ptr [TOS.exe+4B9590], 0x1e7 // 00518FAD

// Reference VA 00519011..00519019.
// Overworld_SubModeDispatch: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+119011,66 C7 05 90 95 8B 00 D8 01)
TOS.exe+119011:
// Vanilla: mov word ptr [0x8b9590], 0x1d8
  mov word ptr [TOS.exe+4B9590], 0x1e7 // 00519011

// Reference VA 005190AC..005190B4.
// Overworld_SubModeDispatch: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1190AC,66 C7 05 90 95 8B 00 D8 01)
TOS.exe+1190AC:
// Vanilla: mov word ptr [0x8b9590], 0x1d8
  mov word ptr [TOS.exe+4B9590], 0x1e7 // 005190AC

// Reference VA 0051B5B4..0051B5BA.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11B5B4,80 3D 6C 17 C3 01 33)
TOS.exe+11B5B4:
// Vanilla: cmp byte ptr [0x1c3176c], 0x33
  cmp byte ptr [TOS.exe+183176C], 0x20 // 0051B5B4

// Reference VA 0051B5CD..0051B5D3.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11B5CD,80 05 6C 17 C3 01 CD)
TOS.exe+11B5CD:
// Vanilla: add byte ptr [0x1c3176c], 0xcd
  add byte ptr [TOS.exe+183176C], 0xe0 // 0051B5CD

// Reference VA 0051B5DA..0051B5E0.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11B5DA,80 3D 6C 17 C3 01 CC)
TOS.exe+11B5DA:
// Vanilla: cmp byte ptr [0x1c3176c], 0xcc
  cmp byte ptr [TOS.exe+183176C], 0xdf // 0051B5DA

// Reference VA 0051B612..0051B614.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11B612,80 F9 28)
TOS.exe+11B612:
// Vanilla: cmp cl, 0x28
  cmp cl, 0x19 // 0051B612

// Reference VA 0051B65E..0051B660.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11B65E,80 C1 D8)
TOS.exe+11B65E:
// Vanilla: add cl, 0xd8
  add cl, 0xe7 // 0051B65E

// Reference VA 0051B66C..0051B672.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11B66C,80 3D 68 17 C3 01 D7)
TOS.exe+11B66C:
// Vanilla: cmp byte ptr [0x1c31768], 0xd7
  cmp byte ptr [TOS.exe+1831768], 0xe6 // 0051B66C

// Reference VA 0051B686..0051B68C.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11B686,80 05 68 17 C3 01 28)
TOS.exe+11B686:
// Vanilla: add byte ptr [0x1c31768], 0x28
  add byte ptr [TOS.exe+1831768], 0x19 // 0051B686

// Reference VA 0051BE64..0051BE6A.
// WorldMap_HandleMenuInput: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11BE64,80 05 6C 17 C3 01 33)
TOS.exe+11BE64:
// Vanilla: add byte ptr [0x1c3176c], 0x33
  add byte ptr [TOS.exe+183176C], 0x20 // 0051BE64

// Reference VA 0051C122..0051C12B.
// WorldMap_PrepareTransition: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11C122,C7 05 68 17 C3 01 D8 01 00 00)
TOS.exe+11C122:
// Vanilla: mov dword ptr [0x1c31768], 0x1d8
  mov dword ptr [TOS.exe+1831768], 0x1e7 // 0051C122

// Reference VA 0051C68A..0051C693.
// WorldMap_Update: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+11C68A,C7 05 68 17 C3 01 D8 03 00 00)
TOS.exe+11C68A:
// Vanilla: mov dword ptr [0x1c31768], 0x3d8
  mov dword ptr [TOS.exe+1831768], 0x3e7 // 0051C68A

// Reference VA 00524BF5..00524BFB.
assert(TOS.exe+124BF5,80 3D C8 3A B1 00 33)
TOS.exe+124BF5:
// Vanilla: cmp byte ptr [0xb13ac8], 0x33
  cmp byte ptr [TOS.exe+713AC8], 0x20 // 00524BF5

// Reference VA 00524D1E..00524D24.
assert(TOS.exe+124D1E,80 05 C8 3A B1 00 CD)
TOS.exe+124D1E:
// Vanilla: add byte ptr [0xb13ac8], 0xcd
  add byte ptr [TOS.exe+713AC8], 0xe0 // 00524D1E

// Reference VA 00524D2E..00524D34.
assert(TOS.exe+124D2E,80 3D C8 3A B1 00 CC)
TOS.exe+124D2E:
// Vanilla: cmp byte ptr [0xb13ac8], 0xcc
  cmp byte ptr [TOS.exe+713AC8], 0xdf // 00524D2E

// Reference VA 00524D53..00524D59.
assert(TOS.exe+124D53,80 3D C4 3A B1 00 D7)
TOS.exe+124D53:
// Vanilla: cmp byte ptr [0xb13ac4], 0xd7
  cmp byte ptr [TOS.exe+713AC4], 0xe6 // 00524D53

// Reference VA 00524D79..00524D7F.
assert(TOS.exe+124D79,80 05 C4 3A B1 00 28)
TOS.exe+124D79:
// Vanilla: add byte ptr [0xb13ac4], 0x28
  add byte ptr [TOS.exe+713AC4], 0x19 // 00524D79

// Reference VA 00524D93..00524D95.
assert(TOS.exe+124D93,80 FA 28)
TOS.exe+124D93:
// Vanilla: cmp dl, 0x28
  cmp dl, 0x19 // 00524D93

// Reference VA 00524DC3..00524DC5.
assert(TOS.exe+124DC3,80 C2 D8)
TOS.exe+124DC3:
// Vanilla: add dl, 0xd8
  add dl, 0xe7 // 00524DC3

// Reference VA 005269E8..005269EE.
assert(TOS.exe+1269E8,80 05 C8 3A B1 00 33)
TOS.exe+1269E8:
// Vanilla: add byte ptr [0xb13ac8], 0x33
  add byte ptr [TOS.exe+713AC8], 0x20 // 005269E8

// Reference VA 00526C55..00526C5D.
assert(TOS.exe+126C55,66 C7 05 C4 3A B1 00 D8 01)
TOS.exe+126C55:
// Vanilla: mov word ptr [0xb13ac4], 0x1d8
  mov word ptr [TOS.exe+713AC4], 0x1e7 // 00526C55

// Reference VA 00527AA1..00527AA7.
assert(TOS.exe+127AA1,80 3D 1A 19 C3 01 33)
TOS.exe+127AA1:
// Vanilla: cmp byte ptr [0x1c3191a], 0x33
  cmp byte ptr [TOS.exe+183191A], 0x20 // 00527AA1

// Reference VA 00527ABA..00527AC0.
assert(TOS.exe+127ABA,80 05 1A 19 C3 01 CD)
TOS.exe+127ABA:
// Vanilla: add byte ptr [0x1c3191a], 0xcd
  add byte ptr [TOS.exe+183191A], 0xe0 // 00527ABA

// Reference VA 00527ACA..00527AD0.
assert(TOS.exe+127ACA,80 3D 1A 19 C3 01 CC)
TOS.exe+127ACA:
// Vanilla: cmp byte ptr [0x1c3191a], 0xcc
  cmp byte ptr [TOS.exe+183191A], 0xdf // 00527ACA

// Reference VA 00527AEF..00527AF5.
assert(TOS.exe+127AEF,80 3D 18 19 C3 01 D7)
TOS.exe+127AEF:
// Vanilla: cmp byte ptr [0x1c31918], 0xd7
  cmp byte ptr [TOS.exe+1831918], 0xe6 // 00527AEF

// Reference VA 00527B17..00527B1D.
assert(TOS.exe+127B17,80 05 18 19 C3 01 28)
TOS.exe+127B17:
// Vanilla: add byte ptr [0x1c31918], 0x28
  add byte ptr [TOS.exe+1831918], 0x19 // 00527B17

// Reference VA 00527B31..00527B33.
assert(TOS.exe+127B31,80 F9 28)
TOS.exe+127B31:
// Vanilla: cmp cl, 0x28
  cmp cl, 0x19 // 00527B31

// Reference VA 00527C27..00527C29.
assert(TOS.exe+127C27,80 C1 D8)
TOS.exe+127C27:
// Vanilla: add cl, 0xd8
  add cl, 0xe7 // 00527C27

// Reference VA 005280D3..005280D9.
assert(TOS.exe+1280D3,80 05 1A 19 C3 01 33)
TOS.exe+1280D3:
// Vanilla: add byte ptr [0x1c3191a], 0x33
  add byte ptr [TOS.exe+183191A], 0x20 // 005280D3

// Reference VA 00528218..00528221.
assert(TOS.exe+128218,C7 05 18 19 C3 01 D8 01 00 00)
TOS.exe+128218:
// Vanilla: mov dword ptr [0x1c31918], 0x1d8
  mov dword ptr [TOS.exe+1831918], 0x1e7 // 00528218

// Reference VA 0052A1CE..0052A1D0.
assert(TOS.exe+12A1CE,80 F9 28)
TOS.exe+12A1CE:
// Vanilla: cmp cl, 0x28
  cmp cl, 0x19 // 0052A1CE

// Reference VA 0052A2D1..0052A2D3.
assert(TOS.exe+12A2D1,80 C1 D8)
TOS.exe+12A2D1:
// Vanilla: add cl, 0xd8
  add cl, 0xe7 // 0052A2D1

// Reference VA 0052A2DF..0052A2E5.
assert(TOS.exe+12A2DF,80 3D E0 01 8F 00 D7)
TOS.exe+12A2DF:
// Vanilla: cmp byte ptr [0x8f01e0], 0xd7
  cmp byte ptr [TOS.exe+4F01E0], 0xe6 // 0052A2DF

// Reference VA 0052A311..0052A317.
assert(TOS.exe+12A311,80 05 E0 01 8F 00 28)
TOS.exe+12A311:
// Vanilla: add byte ptr [0x8f01e0], 0x28
  add byte ptr [TOS.exe+4F01E0], 0x19 // 0052A311

// Reference VA 0052A87E..0052A887.
assert(TOS.exe+12A87E,C7 05 E0 01 8F 00 D8 01 00 00)
TOS.exe+12A87E:
// Vanilla: mov dword ptr [0x8f01e0], 0x1d8
  mov dword ptr [TOS.exe+4F01E0], 0x1e7 // 0052A87E

// Reference VA 0052AA71..0052AA79.
assert(TOS.exe+12AA71,66 C7 05 E0 01 8F 00 D8 03)
TOS.exe+12AA71:
// Vanilla: mov word ptr [0x8f01e0], 0x3d8
  mov word ptr [TOS.exe+4F01E0], 0x3e7 // 0052AA71

// Reference VA 0052D2F7..0052D2FD.
assert(TOS.exe+12D2F7,80 3D B0 3E B1 00 D7)
TOS.exe+12D2F7:
// Vanilla: cmp byte ptr [0xb13eb0], 0xd7
  cmp byte ptr [TOS.exe+713EB0], 0xe6 // 0052D2F7

// Reference VA 0052D313..0052D319.
assert(TOS.exe+12D313,80 05 B0 3E B1 00 28)
TOS.exe+12D313:
// Vanilla: add byte ptr [0xb13eb0], 0x28
  add byte ptr [TOS.exe+713EB0], 0x19 // 0052D313

// Reference VA 0052D32C..0052D32D.
assert(TOS.exe+12D32C,3C 28)
TOS.exe+12D32C:
// Vanilla: cmp al, 0x28
  cmp al, 0x19 // 0052D32C

// Reference VA 0052D35F..0052D360.
assert(TOS.exe+12D35F,04 D8)
TOS.exe+12D35F:
// Vanilla: add al, 0xd8
  add al, 0xe7 // 0052D35F

// Reference VA 0052E34F..0052E358.
assert(TOS.exe+12E34F,C7 05 B0 3E B1 00 D8 01 00 00)
TOS.exe+12E34F:
// Vanilla: mov dword ptr [0xb13eb0], 0x1d8
  mov dword ptr [TOS.exe+713EB0], 0x1e7 // 0052E34F

// Reference VA 00537E51..00537E5A.
assert(TOS.exe+137E51,0F B6 D1 0F B6 88 D4 1A C3 01)
TOS.exe+137E51:
// Vanilla: movzx edx, cl; movzx ecx, byte ptr [eax + 0x1c31ad4]
  db 8B,D1 // mov edx, ecx // 00537E51
  nop // 00537E53
  mov ecx, dword ptr [eax + TOS.exe+1831AD4] // 00537E54
  nop // 00537E5A

// Reference VA 00537E89..00537E93.
assert(TOS.exe+137E89,C7 04 95 50 1A C3 01 0C 00 00 00)
TOS.exe+137E89:
// Vanilla: mov dword ptr [edx*4 + 0x1c31a50], 0xc
  mov dword ptr [edx*#4 + TOS.exe+1831A50], 0x1e // 00537E89

// Reference VA 00537E9F..00537EA5.
assert(TOS.exe+137E9F,89 3C 95 50 1A C3 01)
TOS.exe+137E9F:
// Vanilla: mov dword ptr [edx*4 + 0x1c31a50], edi
  jmp near fps_input_repeat_directions // 00537E9F
  nop // 00537EA4
  nop // 00537EA5

// Reference VA 00537ED5..00537EDF.
assert(TOS.exe+137ED5,C7 04 8D 90 1C C3 01 0C 00 00 00)
TOS.exe+137ED5:
// Vanilla: mov dword ptr [ecx*4 + 0x1c31c90], 0xc
  mov dword ptr [ecx*#4 + TOS.exe+1831C90], 0x1e // 00537ED5

// Reference VA 00537EEB..00537EF1.
assert(TOS.exe+137EEB,89 3C 8D 90 1C C3 01)
TOS.exe+137EEB:
// Vanilla: mov dword ptr [ecx*4 + 0x1c31c90], edi
  jmp near fps_input_repeat_buttons // 00537EEB
  nop // 00537EF0
  nop // 00537EF1

// Reference VA 00539D23..00539D29.
assert(TOS.exe+139D23,80 3D 6C 71 8B 00 D7)
TOS.exe+139D23:
// Vanilla: cmp byte ptr [0x8b716c], 0xd7
  cmp byte ptr [TOS.exe+4B716C], 0xe6 // 00539D23

// Reference VA 00539D40..00539D46.
assert(TOS.exe+139D40,80 05 6C 71 8B 00 28)
TOS.exe+139D40:
// Vanilla: add byte ptr [0x8b716c], 0x28
  add byte ptr [TOS.exe+4B716C], 0x19 // 00539D40

// Reference VA 00539D58..00539D5A.
assert(TOS.exe+139D58,80 F9 28)
TOS.exe+139D58:
// Vanilla: cmp cl, 0x28
  cmp cl, 0x19 // 00539D58

// Reference VA 00539E63..00539E65.
assert(TOS.exe+139E63,80 C1 D8)
TOS.exe+139E63:
// Vanilla: add cl, 0xd8
  add cl, 0xe7 // 00539E63

// Reference VA 0053A3C3..0053A3CC.
assert(TOS.exe+13A3C3,C7 05 6C 71 8B 00 D8 01 00 00)
TOS.exe+13A3C3:
// Vanilla: mov dword ptr [0x8b716c], 0x1d8
  mov dword ptr [TOS.exe+4B716C], 0x1e7 // 0053A3C3

// Reference VA 00554BDB..00554BDE.
// 60fps patch: skit background fade += 2 (was 4)
assert(TOS.exe+154BDB,66 83 C0 04)
TOS.exe+154BDB:
// Vanilla: add ax, 4
  add ax, #2 // 00554BDB

// Reference VA 00554F79..00554F7C.
// 60fps patch: skit foreground render fade += 8 (was 16)
assert(TOS.exe+154F79,66 83 C0 10)
TOS.exe+154F79:
// Vanilla: add ax, 0x10
  add ax, #8 // 00554F79

// Reference VA 00555026..00555029.
assert(TOS.exe+155026,66 83 C0 08)
TOS.exe+155026:
// Vanilla: add ax, 8
  add ax, #4 // 00555026

// Reference VA 00556448..00556462.
// Scene_TickTextureAnimations: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+156448,D9 43 04 D8 43 28 D9 5B 04 D9 43 2C D8 43 08 D9 5B 08 D9 43 30 D8 43 0C D9 5B 0C)
TOS.exe+156448:
  jmp near fps_scene_texture_motion // 00556448
  nop // 0055644D
  nop // 0055644E
  nop // 0055644F
  nop // 00556450
  nop // 00556451
  nop // 00556452
  nop // 00556453
  nop // 00556454
  nop // 00556455
  nop // 00556456
  nop // 00556457
  nop // 00556458
  nop // 00556459
  nop // 0055645A
  nop // 0055645B
  nop // 0055645C
  nop // 0055645D
  nop // 0055645E
  nop // 0055645F
  nop // 00556460
  nop // 00556461
  nop // 00556462

// Reference VA 005564EC..005564F3.
// 60fps patch: scene tex anim channel 1 timer += 1 (was 2)
assert(TOS.exe+1564EC,66 83 83 C8 00 00 00 02)
TOS.exe+1564EC:
// Vanilla: add word ptr [ebx + 0xc8], 2
  add word ptr [ebx + 0xc8], #1 // 005564EC

// Reference VA 005565DD..005565E4.
// 60fps patch: scene tex anim channel 2 timer += 1 (was 2)
assert(TOS.exe+1565DD,66 83 83 CE 00 00 00 02)
TOS.exe+1565DD:
// Vanilla: add word ptr [ebx + 0xce], 2
  add word ptr [ebx + 0xce], #1 // 005565DD

// Reference VA 005566AF..005566B6.
// 60fps patch: scene tex anim channel 3 timer += 1 (was 2)
assert(TOS.exe+1566AF,66 83 83 D2 00 00 00 02)
TOS.exe+1566AF:
// Vanilla: add word ptr [ebx + 0xd2], 2
  add word ptr [ebx + 0xd2], #1 // 005566AF

// Reference VA 0055694B..00556950.
// Scene_TickTextureAnimations: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+15694B,D9 83 EC 09 00 00)
TOS.exe+15694B:
// Vanilla: fld dword ptr [ebx + 0x9ec]
  jmp near fps_scene_texture_animation_rate // 0055694B
  nop // 00556950

// Reference VA 0055A34C..0055A34E.
// Title/logo fade increment 16 -> 8 at twice update rate.
assert(TOS.exe+15A34C,83 C0 10)
TOS.exe+15A34C:
// Vanilla: add eax, 0x10
  add eax, #8 // 0055A34C

// Reference VA 0055C615..0055C61A.
assert(TOS.exe+15C615,D8 25 18 F4 72 00)
TOS.exe+15C615:
// Vanilla: fsub dword ptr [0x72f418]
  fsub dword ptr [TOS.exe+307294] // 0055C615

// Reference VA 0055EA21..0055EA22.
assert(TOS.exe+15EA21,DC C0)
TOS.exe+15EA21:
// Vanilla: fadd st(0), st(0)
  nop // 0055EA21
  nop // 0055EA22

// Reference VA 0055EB66..0055EB67.
assert(TOS.exe+15EB66,DC C0)
TOS.exe+15EB66:
// Vanilla: fadd st(0), st(0)
  nop // 0055EB66
  nop // 0055EB67

// Reference VA 0055ECA6..0055ECA7.
assert(TOS.exe+15ECA6,DC C0)
TOS.exe+15ECA6:
// Vanilla: fadd st(0), st(0)
  nop // 0055ECA6
  nop // 0055ECA7

// Reference VA 0055EDE6..0055EDE7.
assert(TOS.exe+15EDE6,DC C0)
TOS.exe+15EDE6:
// Vanilla: fadd st(0), st(0)
  nop // 0055EDE6
  nop // 0055EDE7

// Reference VA 0055EEFE..0055EF04.
assert(TOS.exe+15EEFE,66 89 87 C6 00 00 00)
TOS.exe+15EEFE:
// Vanilla: mov word ptr [edi + 0xc6], ax
  jmp near fps_field_effect_parameter // 0055EEFE
  nop // 0055EF03
  nop // 0055EF04

// Reference VA 0055EFB0..0055EFB1.
// PATCHED: NOP fadd st,st — was doubling hostile NPC speed (entity+0x938) at 60fps
assert(TOS.exe+15EFB0,DC C0)
TOS.exe+15EFB0:
// Vanilla: fadd st(0), st(0)
  nop // 0055EFB0
  nop // 0055EFB1

// Reference VA 0055F727..0055F72C.
assert(TOS.exe+15F727,DB 44 24 14 DC C0)
TOS.exe+15F727:
// Vanilla: fild dword ptr [esp + 0x14]; fadd st(0), st(0)
  jmp near fps_npc_pursuit_positive_speed // 0055F727
  nop // 0055F72C

// Reference VA 0055F7A9..0055F7AA.
// PATCHED: NOP fadd st,st — was doubling hostile NPC chase speed (entity+0x938) at 60fps
assert(TOS.exe+15F7A9,DC C0)
TOS.exe+15F7A9:
// Vanilla: fadd st(0), st(0)
  nop // 0055F7A9
  nop // 0055F7AA

// Reference VA 0055F7B9..0055F7BE.
assert(TOS.exe+15F7B9,D9 98 38 09 00 00)
TOS.exe+15F7B9:
// Vanilla: fstp dword ptr [eax + 0x938]
  jmp near fps_scenario_cmd17_speed // 0055F7B9
  nop // 0055F7BE

// Reference VA 00560CEF..00560CF0.
// PATCHED: NOP fadd st,st — was doubling hostile NPC chase speed (entity+0x938) at 60fps
assert(TOS.exe+160CEF,DC C0)
TOS.exe+160CEF:
// Vanilla: fadd st(0), st(0)
  nop // 00560CEF
  nop // 00560CF0

// Reference VA 00561CB2..00561CB7.
// HostileNPC_SpawnFromScriptData: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+161CB2,DD 05 B8 29 88 00)
TOS.exe+161CB2:
// Vanilla: fld qword ptr [0x8829b8]
  fld1 // 00561CB2
  nop // 00561CB4
  nop // 00561CB5
  nop // 00561CB6
  nop // 00561CB7

// Reference VA 00561E6C..00561E71.
assert(TOS.exe+161E6C,DD 05 B8 29 88 00)
TOS.exe+161E6C:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 00561E6C

// Reference VA 0056777A..0056777F.
assert(TOS.exe+16777A,DD 05 B8 29 88 00)
TOS.exe+16777A:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 0056777A

// Reference VA 00574285..00574289.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+174285,E8 D6 C1 00 00)
TOS.exe+174285:
// Vanilla: call 0x580460
  call fps_dialogue_style_a // 00574285

// Reference VA 00574379..0057437D.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+174379,E8 72 BE 00 00)
TOS.exe+174379:
// Vanilla: call 0x5801f0
  call fps_dialogue_top_left_hook // 00574379

// Reference VA 00574433..00574437.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+174433,E8 B8 BD 00 00)
TOS.exe+174433:
// Vanilla: call 0x5801f0
  call fps_dialogue_top_right_hook // 00574433

// Reference VA 005744F3..005744F7.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1744F3,E8 F8 BC 00 00)
TOS.exe+1744F3:
// Vanilla: call 0x5801f0
  call fps_dialogue_bottom_left_hook // 005744F3

// Reference VA 005745AD..005745B1.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1745AD,E8 3E BC 00 00)
TOS.exe+1745AD:
// Vanilla: call 0x5801f0
  call fps_dialogue_bottom_right_hook // 005745AD

// Reference VA 00574683..00574687.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+174683,E8 68 BB 00 00)
TOS.exe+174683:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_textured_hook // 00574683

// Reference VA 00574747..0057474B.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+174747,E8 A4 BA 00 00)
TOS.exe+174747:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_textured_hook // 00574747

// Reference VA 0057481C..00574820.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17481C,E8 CF B9 00 00)
TOS.exe+17481C:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_textured_hook // 0057481C

// Reference VA 005748D8..005748DC.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1748D8,E8 13 B9 00 00)
TOS.exe+1748D8:
// Vanilla: call 0x5801f0
  call fps_dialogue_bottom_border // 005748D8

// Reference VA 00574B50..00574B54.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+174B50,E8 9B B6 00 00)
TOS.exe+174B50:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_pointer_fill_hook // 00574B50

// Reference VA 00574D4D..00574D51.
// DialogBox_RenderFrame: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+174D4D,E8 9E B4 00 00)
TOS.exe+174D4D:
// Vanilla: call 0x5801f0
  call fps_dialogue_tail_outline_hook // 00574D4D

// Reference VA 00575521..00575525.
// DialogBox_RenderFrameBorders: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+175521,E8 CA AC 00 00)
TOS.exe+175521:
// Vanilla: call 0x5801f0
  call fps_loc_02EFFAF5 // 00575521

// Reference VA 005755A9..005755AD.
// DialogBox_RenderFrameBorders: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1755A9,E8 42 AC 00 00)
TOS.exe+1755A9:
// Vanilla: call 0x5801f0
  call fps_loc_02EFFAF5 // 005755A9

// Reference VA 005755E8..005755EE.
// DialogBox_RenderContinueArrow: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1755E8,8D 0C C5 00 00 00 00)
TOS.exe+1755E8:
// Vanilla: lea ecx, [eax*8]
  lea ecx, [eax*#4] // 005755E8

// Reference VA 0057671F..00576723.
// DialogBox_RenderContent: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17671F,BA FE FF 00 00)
TOS.exe+17671F:
// Vanilla: mov edx, 0xfffe
  mov edx, 0xffff // 0057671F

// Reference VA 00576799..005767A0.
// DialogBox_RenderContent: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+176799,66 83 86 24 28 00 00 FE)
TOS.exe+176799:
// Vanilla: add word ptr [esi + 0x2824], -2
  db 66,83,86,24,28,00,00,FF // add word ptr [esi + 0x2824], -#1 // 00576799

// Reference VA 0057B7A0..0057B7B7.
assert(TOS.exe+17B7A0,D9 01 D8 06 D9 19 D9 41 04 D8 46 04 D9 59 04 D9 41 08 D8 46 08 D9 59 08)
TOS.exe+17B7A0:
// Vanilla: fld dword ptr [ecx]; fadd dword ptr [esi]; fstp dword ptr [ecx]; fld dword ptr [ecx + 4]; fadd dword ptr [esi + 4]; fstp dword ptr [ecx + 4]; fld dword ptr [ecx + 8]; fadd dword ptr [esi + 8]; fstp dword ptr [ecx + 8]
  jmp near fps_elevator_bone_interpolation // 0057B7A0
  nop // 0057B7A5
  nop // 0057B7A6
  nop // 0057B7A7
  nop // 0057B7A8
  nop // 0057B7A9
  nop // 0057B7AA
  nop // 0057B7AB
  nop // 0057B7AC
  nop // 0057B7AD
  nop // 0057B7AE
  nop // 0057B7AF
  nop // 0057B7B0
  nop // 0057B7B1
  nop // 0057B7B2
  nop // 0057B7B3
  nop // 0057B7B4
  nop // 0057B7B5
  nop // 0057B7B6
  nop // 0057B7B7

// Reference VA 0057B957..0057B95C.
// Actor_TickAnimAndBoneTargets: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17B957,DD 05 B8 29 88 00)
TOS.exe+17B957:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 0057B957

// Reference VA 0057B9C8..0057B9E5.
// Actor_TickAnimAndBoneTargets: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17B9C8,D8 4F 14 D9 47 08 D8 67 10 D9 5C 24 10 D9 44 24 10 D8 C1 D9 5C 24 10 D9 44 24 10 D9 57 08)
TOS.exe+17B9C8:
  jmp near fps_animation_loop_wrap // 0057B9C8
  nop // 0057B9CD
  nop // 0057B9CE
  nop // 0057B9CF
  nop // 0057B9D0
  nop // 0057B9D1
  nop // 0057B9D2
  nop // 0057B9D3
  nop // 0057B9D4
  nop // 0057B9D5
  nop // 0057B9D6
  nop // 0057B9D7
  nop // 0057B9D8
  nop // 0057B9D9
  nop // 0057B9DA
  nop // 0057B9DB
  nop // 0057B9DC
  nop // 0057B9DD
  nop // 0057B9DE
  nop // 0057B9DF
  nop // 0057B9E0
  nop // 0057B9E1
  nop // 0057B9E2
  nop // 0057B9E3
  nop // 0057B9E4
  nop // 0057B9E5

// Reference VA 0057BA4B..0057BA50.
// Actor_TickAnimAndBoneTargets: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17BA4B,DC 05 B8 29 88 00)
TOS.exe+17BA4B:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 0057BA4B

// Reference VA 0057E6A7..0057E6A8.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E6A7,B3 0F)
TOS.exe+17E6A7:
// Vanilla: mov bl, 0xf
  mov bl, 0x1e // 0057E6A7

// Reference VA 0057E6F2..0057E6F4.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E6F2,F6 C2 01)
TOS.exe+17E6F2:
// Vanilla: test dl, 1
  test dl, #3 // 0057E6F2

// Reference VA 0057E746..0057E748.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E746,F6 C2 01)
TOS.exe+17E746:
// Vanilla: test dl, 1
  test dl, #3 // 0057E746

// Reference VA 0057E79A..0057E79C.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E79A,F6 C2 01)
TOS.exe+17E79A:
// Vanilla: test dl, 1
  test dl, #3 // 0057E79A

// Reference VA 0057E7EE..0057E7F0.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E7EE,F6 C2 01)
TOS.exe+17E7EE:
// Vanilla: test dl, 1
  test dl, #3 // 0057E7EE

// Reference VA 0057E83C..0057E83E.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E83C,F6 C2 01)
TOS.exe+17E83C:
// Vanilla: test dl, 1
  test dl, #3 // 0057E83C

// Reference VA 0057E884..0057E886.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E884,F6 C2 01)
TOS.exe+17E884:
// Vanilla: test dl, 1
  test dl, #3 // 0057E884

// Reference VA 0057E8CC..0057E8CE.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E8CC,F6 C2 01)
TOS.exe+17E8CC:
// Vanilla: test dl, 1
  test dl, #3 // 0057E8CC

// Reference VA 0057E914..0057E916.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E914,F6 C2 01)
TOS.exe+17E914:
// Vanilla: test dl, 1
  test dl, #3 // 0057E914

// Reference VA 0057E962..0057E964.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E962,F6 C2 01)
TOS.exe+17E962:
// Vanilla: test dl, 1
  test dl, #3 // 0057E962

// Reference VA 0057E9B6..0057E9B8.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17E9B6,F6 C2 01)
TOS.exe+17E9B6:
// Vanilla: test dl, 1
  test dl, #3 // 0057E9B6

// Reference VA 0057EA0A..0057EA0C.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EA0A,F6 C2 01)
TOS.exe+17EA0A:
// Vanilla: test dl, 1
  test dl, #3 // 0057EA0A

// Reference VA 0057EA5E..0057EA60.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EA5E,F6 C2 01)
TOS.exe+17EA5E:
// Vanilla: test dl, 1
  test dl, #3 // 0057EA5E

// Reference VA 0057EAB2..0057EAB4.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EAB2,F6 C2 01)
TOS.exe+17EAB2:
// Vanilla: test dl, 1
  test dl, #3 // 0057EAB2

// Reference VA 0057EB06..0057EB08.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EB06,F6 C2 01)
TOS.exe+17EB06:
// Vanilla: test dl, 1
  test dl, #3 // 0057EB06

// Reference VA 0057EB5A..0057EB5C.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EB5A,F6 C2 01)
TOS.exe+17EB5A:
// Vanilla: test dl, 1
  test dl, #3 // 0057EB5A

// Reference VA 0057EBAE..0057EBB0.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EBAE,F6 C2 01)
TOS.exe+17EBAE:
// Vanilla: test dl, 1
  test dl, #3 // 0057EBAE

// Reference VA 0057EC02..0057EC04.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EC02,F6 C2 01)
TOS.exe+17EC02:
// Vanilla: test dl, 1
  test dl, #3 // 0057EC02

// Reference VA 0057EC56..0057EC58.
// Input_UpdateDebounceTimers: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+17EC56,F6 C2 01)
TOS.exe+17EC56:
// Vanilla: test dl, 1
  test dl, #3 // 0057EC56

// Reference VA 0058167C..00581681.
// Active-bank chant durations: hook_audio_reset. Executable correction; cache follows loaded BTLSTR bank.
assert(TOS.exe+18167C,89 1D 7C AE B1 00)
TOS.exe+18167C:
// Vanilla: mov dword ptr [0xb1ae7c], ebx
  jmp near fps_chant_hook_audio_reset // 0058167C
  nop // 00581681

// Reference VA 0058296B..00582971.
// Active-bank chant durations: hook_bank. Executable correction; cache follows loaded BTLSTR bank.
assert(TOS.exe+18296B,89 04 B5 08 C0 B1 00)
TOS.exe+18296B:
// Vanilla: mov dword ptr [esi*4 + 0xb1c008], eax
  jmp near fps_chant_hook_bank // 0058296B
  nop // 00582970
  nop // 00582971

// Reference VA 0058B625..0058B647.
// 60 FPS interrupted-blend fix (Trial D): exclude blend-context +4 saved outgoing node when choosing the blend timer. Outgoing timers freeze after handoff; incoming owns crossfade. In-place 35 bytes; rates/flags/script unchanged. See INTERRUPTED_ANIMATION_BLEND_FIX.md.
assert(TOS.exe+18B625,8B 4D 08 33 D2 83 C1 0C B3 80 8B 01 85 C0 74 0A 83 38 00 74 05 84 58 20 75 68 42 83 C1 38 83 FA 04 7C E7)
TOS.exe+18B625:
  mov eax, dword ptr [ebp + #8] // 0058B625
  mov ebx, dword ptr [eax + #4] // 0058B628
  xor edx, edx // 0058B62B
  add eax, 0xc // 0058B62D
  mov ecx, dword ptr [eax] // 0058B630
  jecxz TOS.exe+18B63E // 0058B632
  cmp ecx, ebx // 0058B634
  je short TOS.exe+18B63E // 0058B636
  test byte ptr [ecx + 0x20], 0x80 // 0058B638
  jne short TOS.exe+18B6A7 // 0058B63C
  inc edx // 0058B63E
  add eax, 0x38 // 0058B63F
  cmp edx, #4 // 0058B642
  jl short TOS.exe+18B630 // 0058B645
  nop // 0058B647

// Reference VA 00595232..00595236.
assert(TOS.exe+195232,E8 D9 02 FF FF)
TOS.exe+195232:
// Vanilla: call 0x585510
  call fps_darkness_text_submit2 // 00595232

// Reference VA 00595AA6..00595AAA.
assert(TOS.exe+195AA6,E8 25 19 FF FF)
TOS.exe+195AA6:
// Vanilla: call 0x5873d0
  call fps_orb_text_submit3 // 00595AA6

// Reference VA 005C9449..005C944F.
// D3D9_PrePresent: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1C9449,83 3D C4 90 8A 00 02)
TOS.exe+1C9449:
// Vanilla: cmp dword ptr [0x8a90c4], 2
  cmp dword ptr [TOS.exe+4A90C4], #1 // 005C9449

// Reference VA 005CF400..005CF40C.
// D3D9_PrePresent: retain the v0.0.46 per-frame timing correction.
assert(TOS.exe+1CF400,55 8B EC 8B 45 08 A3 C4 90 8A 00 5D C3)
TOS.exe+1CF400:
// Vanilla: push ebp; mov ebp, esp; mov eax, dword ptr [ebp + 8]; mov dword ptr [0x8a90c4], eax; pop ebp; ret 
  mov eax, #1 // 005CF400
  mov dword ptr [TOS.exe+4A90C4], eax // 005CF405
  ret // 005CF40A
  int3 // 005CF40B
  int3 // 005CF40C

// Reference VA 00883EC0..00883EC3.
// Sorcerer-ring fireball movement-vector component: float -33.0 -> -16.5 at 60 ticks/second.
assert(TOS.exe+483EC0,00 00 04 C2)
TOS.exe+483EC0:
  db 00,00,84,C1

// Reference VA 008CEE4A..008CEE4A.
// Field facial-animation eye-open hold: 120 -> 121 for the frame-counter expiry convention.
assert(TOS.exe+4CEE4A,78)
TOS.exe+4CEE4A:
  db 79

// Reference VA 008CEE5A..008CEE5A.
// Field mouth-animation hold: 8 -> 9 for the frame-counter expiry convention.
assert(TOS.exe+4CEE5A,08)
TOS.exe+4CEE5A:
  db 09

// Reference VA 008CEE5E..008CEE5E.
// Field mouth-animation hold: 8 -> 9 for the frame-counter expiry convention.
assert(TOS.exe+4CEE5E,08)
TOS.exe+4CEE5E:
  db 09

// ======================================================================
// arte_helpers: reference 00702185..007021DF.
arte_helpers:

// Replicate Crimson prologue and skip duplicate frame-counter callbacks, preserving billboard/voice timing.
fps_crimson_duplicate_frame_guard:
  push ebp // 00702185
  db 8B,EC // mov ebp, esp // 00702186
  sub esp, 0x28 // 00702188
  push eax // 0070218B
  push ecx // 0070218C
  mov eax, dword ptr [ebp + #8] // 0070218D
  movzx ecx, word ptr [eax + 0x1be] // 00702190
  cmp cx, word ptr [fps_crimson_last_frame] // 00702197
  je short fps_loc_007021AE // 0070219E
  mov word ptr [fps_crimson_last_frame], cx // 007021A0
  pop ecx // 007021A7
  pop eax // 007021A8
  jmp near TOS.exe+D726 // 007021A9
fps_loc_007021AE:
  pop ecx // 007021AE
  pop eax // 007021AF
  db 8B,E5 // mov esp, ebp // 007021B0
  pop ebp // 007021B2
  ret // 007021B3

// Consume animation transition cooldown and increment actor+12E9 pending compensation; otherwise replay original index load.
fps_arte_animation_cooldown:
  cmp byte ptr [esi + 0x12ff], #0 // 007021B4
  je short fps_loc_007021D4 // 007021BB
  mov byte ptr [esi + 0x12ff], #0 // 007021BD
  inc byte ptr [esi + 0x12e9] // 007021C4
  mov eax, #1 // 007021CA
  pop esi // 007021CF
  db 8B,E5 // mov esp, ebp // 007021D0
  pop ebp // 007021D2
  ret // 007021D3
fps_loc_007021D4:
  movsx eax, byte ptr [esi + 0x12fe] // 007021D4
  jmp near TOS.exe+41070 // 007021DB

// ======================================================================
// arte_constants: reference 007021F0..007021FF.
arte_constants:

// Private 1.0 double used by corrected frame/timer increments.
fps_double_one:
  db 00,00,00,00,00,00,F0,3F // 007021F0: constants / retained padding

// Private -1.0 double used by corrected timer decrements.
fps_double_negative_one:
  db 00,00,00,00,00,00,F0,BF // 007021F8: constants / retained padding

// ======================================================================
// chant_cache: reference 01E37D00..01E37D03.
// Zero on fresh launch. Lazily VirtualAlloc 45396 bytes, retaining native timing if allocation fails; no file-backed preimage.
// Allocation bytes start at zero; no debugger state is copied.
chant_cache:
  db 00

// ======================================================================
// crimson_frame: reference 01E37FF0..01E37FF1.
// Historical docs specify FFFF, but this cell has no file backing; normal fresh PE page initialization is zero. Preserve requested xdelta runtime initialization unless deliberately fixing behavior.
// Allocation bytes start at zero; no debugger state is copied.
crimson_frame:
  db 00

// ======================================================================
// animation_cleanup: reference 01E4A000..01E4A22F.
animation_cleanup:

// Before battle animation allocation, collect only unreachable outgoing nodes; preserve roots, pending links, shared resources and deferred release protocol.
fps_animation_pool_cleanup:
  pushfd // 01E4A000
  pushad // 01E4A001
  push ecx // 01E4A002
  push edi // 01E4A003
  call fps_loc_01E4A072 // 01E4A004
  add esp, #8 // 01E4A009
  popad // 01E4A00C
  popfd // 01E4A00D
  xor eax, eax // 01E4A00E
  lea esi, [edi + 0x1170] // 01E4A010
  jmp near TOS.exe+4083E // 01E4A016
fps_loc_01E4A01B:
  test edx, edx // 01E4A01B
  je short fps_loc_01E4A06C // 01E4A01D
  push ebp // 01E4A01F
  mov ebp, esp // 01E4A020
  push ebx // 01E4A022
  mov ebx, ecx // 01E4A023
  cmp edx, eax // 01E4A025
  je short fps_loc_01E4A049 // 01E4A027
  lea ecx, [eax + 0x34] // 01E4A029
  cmp edx, ecx // 01E4A02C
  je short fps_loc_01E4A04D // 01E4A02E
  lea ecx, [eax + 0x68] // 01E4A030
  cmp edx, ecx // 01E4A033
  je short fps_loc_01E4A054 // 01E4A035
  add eax, 0x9c // 01E4A037
  xor ecx, ecx // 01E4A03C
  cmp edx, eax // 01E4A03E
  jne short fps_loc_01E4A067 // 01E4A040
  mov ecx, #3 // 01E4A042
  jmp short fps_loc_01E4A059 // 01E4A047
fps_loc_01E4A049:
  xor ecx, ecx // 01E4A049
  jmp short fps_loc_01E4A059 // 01E4A04B
fps_loc_01E4A04D:
  mov ecx, #1 // 01E4A04D
  jmp short fps_loc_01E4A059 // 01E4A052
fps_loc_01E4A054:
  mov ecx, #2 // 01E4A054
fps_loc_01E4A059:
  mov eax, #1 // 01E4A059
  shl eax, cl // 01E4A05E
  or dword ptr [ebx], eax // 01E4A060
  mov ecx, #1 // 01E4A062
fps_loc_01E4A067:
  mov eax, ecx // 01E4A067
  pop ebx // 01E4A069
  pop ebp // 01E4A06A
  ret // 01E4A06B
fps_loc_01E4A06C:
  mov eax, #1 // 01E4A06C
  ret // 01E4A071
fps_loc_01E4A072:
  push ebp // 01E4A072
  mov ebp, esp // 01E4A073
  push edi // 01E4A075
  xor edi, edi // 01E4A076
  push esi // 01E4A078
  push ebx // 01E4A079
  sub esp, 0x18 // 01E4A07A
  mov eax, dword ptr [ebp + #8] // 01E4A07D
  mov dword ptr [ebp - 0x10], edi // 01E4A080
  mov ebx, dword ptr [eax + 0x2c4] // 01E4A083
  test ebx, ebx // 01E4A089
  je near fps_loc_01E4A223 // 01E4A08B
  mov edx, dword ptr [ebx + 0x718] // 01E4A091
  test edx, edx // 01E4A097
  je near fps_loc_01E4A221 // 01E4A099
  mov ebx, dword ptr [ebx + 0x740] // 01E4A09F
  test ebx, ebx // 01E4A0A5
  je near fps_loc_01E4A223 // 01E4A0A7
  add eax, 0x1170 // 01E4A0AD
  lea ecx, [ebp - 0x10] // 01E4A0B2
  mov dword ptr [ebp - 0x14], eax // 01E4A0B5
  call fps_loc_01E4A01B // 01E4A0B8
  test eax, eax // 01E4A0BD
  je near fps_loc_01E4A221 // 01E4A0BF
  mov edx, dword ptr [ebx + 0x3264] // 01E4A0C5
  mov eax, dword ptr [ebp - 0x14] // 01E4A0CB
  lea ecx, [ebp - 0x10] // 01E4A0CE
  call fps_loc_01E4A01B // 01E4A0D1
  test eax, eax // 01E4A0D6
  je near fps_loc_01E4A221 // 01E4A0D8
  lea esi, [ebx + 0x326c] // 01E4A0DE
  add ebx, 0x334c // 01E4A0E4
fps_loc_01E4A0EA:
  mov edx, dword ptr [esi] // 01E4A0EA
  mov eax, dword ptr [ebp - 0x14] // 01E4A0EC
  lea ecx, [ebp - 0x10] // 01E4A0EF
  call fps_loc_01E4A01B // 01E4A0F2
  test eax, eax // 01E4A0F7
  je near fps_loc_01E4A221 // 01E4A0F9
  add esi, 0x38 // 01E4A0FF
  cmp ebx, esi // 01E4A102
  jne short fps_loc_01E4A0EA // 01E4A104
  mov ebx, #4 // 01E4A106
fps_loc_01E4A10B:
  mov eax, dword ptr [ebp - 0x10] // 01E4A10B
  xor edi, edi // 01E4A10E
  mov dword ptr [ebp - 0x18], eax // 01E4A110
  mov eax, dword ptr [ebp + #8] // 01E4A113
  lea esi, [eax + 0x11a0] // 01E4A116
fps_loc_01E4A11C:
  mov eax, #1 // 01E4A11C
  mov ecx, edi // 01E4A121
  shl eax, cl // 01E4A123
  test dword ptr [ebp - 0x10], eax // 01E4A125
  je short fps_loc_01E4A155 // 01E4A128
  mov edx, dword ptr [esi - #4] // 01E4A12A
  mov eax, dword ptr [ebp - 0x14] // 01E4A12D
  lea ecx, [ebp - 0x10] // 01E4A130
  call fps_loc_01E4A01B // 01E4A133
  test eax, eax // 01E4A138
  je near fps_loc_01E4A221 // 01E4A13A
  mov edx, dword ptr [esi] // 01E4A140
  mov eax, dword ptr [ebp - 0x14] // 01E4A142
  lea ecx, [ebp - 0x10] // 01E4A145
  call fps_loc_01E4A01B // 01E4A148
  test eax, eax // 01E4A14D
  je near fps_loc_01E4A221 // 01E4A14F
fps_loc_01E4A155:
  inc edi // 01E4A155
  add esi, 0x34 // 01E4A156
  cmp edi, #4 // 01E4A159
  jne short fps_loc_01E4A11C // 01E4A15C
  mov eax, dword ptr [ebp - 0x18] // 01E4A15E
  cmp dword ptr [ebp - 0x10], eax // 01E4A161
  je short fps_loc_01E4A176 // 01E4A164
  dec ebx // 01E4A166
  jne short fps_loc_01E4A10B // 01E4A167
  mov eax, dword ptr [ebp - 0x14] // 01E4A169
  xor esi, esi // 01E4A16C
  mov dword ptr [ebp - 0x20], esi // 01E4A16E
  mov dword ptr [ebp - 0x1c], eax // 01E4A171
  jmp short fps_loc_01E4A183 // 01E4A174
fps_loc_01E4A176:
  mov eax, dword ptr [ebp - 0x14] // 01E4A176
  xor ecx, ecx // 01E4A179
  xor ebx, ebx // 01E4A17B
  mov dword ptr [ebp - 0x20], ecx // 01E4A17D
  mov dword ptr [ebp - 0x1c], eax // 01E4A180
fps_loc_01E4A183:
  mov eax, dword ptr [ebp - 0x1c] // 01E4A183
  mov cl, byte ptr [ebp - 0x20] // 01E4A186
  mov eax, dword ptr [eax] // 01E4A189
  mov dword ptr [ebp - 0x18], eax // 01E4A18B
  mov eax, #1 // 01E4A18E
  shl eax, cl // 01E4A193
  test dword ptr [ebp - 0x10], eax // 01E4A195
  jne short fps_loc_01E4A20E // 01E4A198
  cmp dword ptr [ebp - 0x18], #0 // 01E4A19A
  je short fps_loc_01E4A20E // 01E4A19E
  mov eax, dword ptr [ebp - 0x1c] // 01E4A1A0
  mov eax, dword ptr [eax + 0x1c] // 01E4A1A3
  mov dword ptr [ebp - 0x24], eax // 01E4A1A6
  not eax // 01E4A1A9
  test eax, 0xc0000000 // 01E4A1AB
  jne short fps_loc_01E4A20E // 01E4A1B0
  mov eax, dword ptr [ebp - 0x18] // 01E4A1B2
  cmp eax, dword ptr [ebp + 0xc] // 01E4A1B5
  sete al // 01E4A1B8
  mov ecx, dword ptr [ebp - 0x14] // 01E4A1BB
  movzx eax, al // 01E4A1BE
  mov edi, eax // 01E4A1C1
  xor eax, eax // 01E4A1C3
fps_loc_01E4A1C5:
  cmp dword ptr [ebp - 0x20], eax // 01E4A1C5
  je short fps_loc_01E4A1D7 // 01E4A1C8
  mov edx, dword ptr [ebp - 0x18] // 01E4A1CA
  cmp dword ptr [ecx], edx // 01E4A1CD
  sete dl // 01E4A1CF
  movzx edx, dl // 01E4A1D2
  or edi, edx // 01E4A1D5
fps_loc_01E4A1D7:
  inc eax // 01E4A1D7
  add ecx, 0x34 // 01E4A1D8
  cmp eax, #4 // 01E4A1DB
  jne short fps_loc_01E4A1C5 // 01E4A1DE
  test edi, edi // 01E4A1E0
  jne short fps_loc_01E4A206 // 01E4A1E2
  mov eax, dword ptr [ebp - 0x18] // 01E4A1E4
  mov esi, dword ptr [eax + 0x44] // 01E4A1E7
  mov byte ptr [eax + 0x10], #0 // 01E4A1EA
  test esi, esi // 01E4A1EE
  je short fps_loc_01E4A206 // 01E4A1F0
  cmp byte ptr [eax + 0x48], #0 // 01E4A1F2
  je short fps_loc_01E4A206 // 01E4A1F6
  mov edi, TOS.exe+17B3D0 // 01E4A1F8
  call edi // 01E4A1FD
  mov eax, dword ptr [ebp - 0x18] // 01E4A1FF
  mov byte ptr [eax + 0x48], #0 // 01E4A202
fps_loc_01E4A206:
  mov eax, dword ptr [ebp - 0x1c] // 01E4A206
  xor edx, edx // 01E4A209
  inc ebx // 01E4A20B
  mov dword ptr [eax], edx // 01E4A20C
fps_loc_01E4A20E:
  inc dword ptr [ebp - 0x20] // 01E4A20E
  add dword ptr [ebp - 0x1c], 0x34 // 01E4A211
  cmp dword ptr [ebp - 0x20], #4 // 01E4A215
  jne near fps_loc_01E4A183 // 01E4A219
  jmp short fps_loc_01E4A223 // 01E4A21F
fps_loc_01E4A221:
  xor ebx, ebx // 01E4A221
fps_loc_01E4A223:
  add esp, 0x18 // 01E4A223
  mov eax, ebx // 01E4A226
  pop ebx // 01E4A228
  pop esi // 01E4A229
  pop edi // 01E4A22A
  pop ebp // 01E4A22B
  ret // 01E4A22C

// Unmodified INT3 tail of the permanent 576-byte reservation.
  db CC,CC,CC // 01E4A22D: constants / retained padding

// ======================================================================
// chant_timing: reference 01E4A300..01E4A977.
chant_timing:

// Read active AWB/ADX sample durations, maintain pristine timing-table fallback and cache by voice bank; invalidate on bank/audio reset and table replacement.
fps_chant_le32:
  mov eax, dword ptr [eax] // 01E4A300
  ret // 01E4A302
fps_chant_read_at:
  push ebp // 01E4A303
  mov ebp, esp // 01E4A304
  push edi // 01E4A306
  mov edi, edx // 01E4A307
  push esi // 01E4A309
  mov esi, eax // 01E4A30A
  xor eax, eax // 01E4A30C
  push ebx // 01E4A30E
  mov ebx, ecx // 01E4A30F
  sub esp, #8 // 01E4A311
  mov dword ptr [ebp - 0x14], eax // 01E4A314
  mov dword ptr [ebp - 0x10], eax // 01E4A317
  lea eax, [ebp - 0x10] // 01E4A31A
  push #0 // 01E4A31D
  push eax // 01E4A31F
  push edx // 01E4A320
  push esi // 01E4A321
  call dword ptr [TOS.exe+2A989DD] // 01E4A322
  mov ecx, 0xffffffff // 01E4A328
  cmp dword ptr [ebp - 0x10], #0 // 01E4A32D
  jne short fps_loc_01E4A335 // 01E4A331
  mov ecx, eax // 01E4A333
fps_loc_01E4A335:
  xor eax, eax // 01E4A335
  cmp edi, ecx // 01E4A337
  jne short fps_loc_01E4A35C // 01E4A339
  lea eax, [ebp - 0x14] // 01E4A33B
  push #0 // 01E4A33E
  push eax // 01E4A340
  push dword ptr [ebp + #8] // 01E4A341
  push ebx // 01E4A344
  push esi // 01E4A345
  call dword ptr [TOS.exe+2A989E1] // 01E4A346
  test eax, eax // 01E4A34C
  je short fps_loc_01E4A35C // 01E4A34E
  mov eax, dword ptr [ebp + #8] // 01E4A350
  cmp dword ptr [ebp - 0x14], eax // 01E4A353
  sete al // 01E4A356
  movzx eax, al // 01E4A359
fps_loc_01E4A35C:
  lea esp, [ebp - 0xc] // 01E4A35C
  pop ebx // 01E4A35F
  pop esi // 01E4A360
  pop edi // 01E4A361
  pop ebp // 01E4A362
  ret // 01E4A363
fps_chant_voice_get_state:
  mov eax, dword ptr [fps_chant_voice_state_ptr] // 01E4A364
  test eax, eax // 01E4A369
  jne short fps_loc_01E4A38B // 01E4A36B
  push ebp // 01E4A36D
  mov ebp, esp // 01E4A36E
  push #4 // 01E4A370
  push 0x3000 // 01E4A372
  push 0xb154 // 01E4A377
  push #0 // 01E4A37C
  call dword ptr [TOS.exe+2A98A55] // 01E4A37E
  mov dword ptr [fps_chant_voice_state_ptr], eax // 01E4A384
  leave // 01E4A389
  ret // 01E4A38A
fps_loc_01E4A38B:
  ret // 01E4A38B
fps_chant_voice_ticks:
  push ebp // 01E4A38C
  mov ebp, esp // 01E4A38D
  push ebx // 01E4A38F
  mov ebx, dword ptr [ebp + 0xc] // 01E4A390
  mov eax, dword ptr [ebp + #8] // 01E4A393
  lea edx, [ebx - 0x1f40] // 01E4A396
  cmp edx, 0x5bcc0 // 01E4A39C
  ja short fps_loc_01E4A3D7 // 01E4A3A2
  test eax, eax // 01E4A3A4
  je short fps_loc_01E4A3D7 // 01E4A3A6
  xor edx, edx // 01E4A3A8
  div ebx // 01E4A3AA
  mov ecx, eax // 01E4A3AC
  mov eax, 0x7fee // 01E4A3AE
  cmp ecx, 0x221 // 01E4A3B3
  ja short fps_loc_01E4A3D9 // 01E4A3B9
  imul edx, edx, 0x3c // 01E4A3BB
  imul ecx, ecx, 0x3c // 01E4A3BE
  lea eax, [ebx + edx - #1] // 01E4A3C1
  xor edx, edx // 01E4A3C5
  div ebx // 01E4A3C7
  mov edx, 0x7fee // 01E4A3C9
  add eax, ecx // 01E4A3CE
  cmp eax, edx // 01E4A3D0
  cmova eax, edx // 01E4A3D2
  jmp short fps_loc_01E4A3D9 // 01E4A3D5
fps_loc_01E4A3D7:
  xor eax, eax // 01E4A3D7
fps_loc_01E4A3D9:
  pop ebx // 01E4A3D9
  pop ebp // 01E4A3DA
  ret // 01E4A3DB
fps_chant_voice_build:
  push ebp // 01E4A3DC
  mov ebp, esp // 01E4A3DD
  push edi // 01E4A3DF
  push esi // 01E4A3E0
  push ebx // 01E4A3E1
  sub esp, 0x44 // 01E4A3E2
  mov esi, dword ptr [ebp + #8] // 01E4A3E5
  call fps_chant_voice_get_state // 01E4A3E8
  xor edx, edx // 01E4A3ED
  mov dword ptr [ebp - 0x38], edx // 01E4A3EF
  test eax, eax // 01E4A3F2
  je near fps_loc_01E4A6D6 // 01E4A3F4
  xor edi, edi // 01E4A3FA
  inc dword ptr [eax + 0x2c] // 01E4A3FC
  mov ebx, eax // 01E4A3FF
  mov dword ptr [eax + #4], #1 // 01E4A401
  mov dword ptr [eax + 0x14], esi // 01E4A408
  mov dword ptr [eax + #8], edi // 01E4A40B
  mov dword ptr [eax + 0x1c], edi // 01E4A40E
  mov dword ptr [eax + 0x34], edi // 01E4A411
  mov dword ptr [eax + 0x38], edi // 01E4A414
  mov dword ptr [eax + 0x3c], #1 // 01E4A417
  xor eax, eax // 01E4A41E
fps_loc_01E4A420:
  db C6,84,03,40,41,00,00,00 // mov byte ptr [ebx + eax + 0x4140], #0 // 01E4A420
  inc eax // 01E4A428
  cmp eax, 0x1000 // 01E4A429
  jne short fps_loc_01E4A420 // 01E4A42E
  xor eax, eax // 01E4A430
fps_loc_01E4A432:
  mov dl, byte ptr [eax + esi + 0x1c] // 01E4A432
  db 88,54,03,40 // mov byte ptr [ebx + eax + 0x40], dl // 01E4A436
  test dl, dl // 01E4A43A
  je short fps_loc_01E4A448 // 01E4A43C
  inc eax // 01E4A43E
  cmp eax, 0x100 // 01E4A43F
  jne short fps_loc_01E4A432 // 01E4A444
  jmp short fps_loc_01E4A44C // 01E4A446
fps_loc_01E4A448:
  test eax, eax // 01E4A448
  jne short fps_loc_01E4A458 // 01E4A44A
fps_loc_01E4A44C:
  mov dword ptr [ebx + 0x3c], #2 // 01E4A44C
  jmp near fps_loc_01E4A6D6 // 01E4A453
fps_loc_01E4A458:
  lea eax, [ebx + 0x40] // 01E4A458
  push #0 // 01E4A45B
  push 0x80 // 01E4A45D
  push #3 // 01E4A462
  push #0 // 01E4A464
  push #7 // 01E4A466
  push 0x80000000 // 01E4A468
  push eax // 01E4A46D
  call dword ptr [TOS.exe+2A989ED] // 01E4A46E
  mov dword ptr [ebp - 0x3c], eax // 01E4A474
  dec eax // 01E4A477
  cmp eax, -#3 // 01E4A478
  jbe short fps_loc_01E4A489 // 01E4A47B
  mov dword ptr [ebx + 0x3c], #3 // 01E4A47D
  jmp near fps_loc_01E4A6D6 // 01E4A484
fps_loc_01E4A489:
  lea eax, [ebp - 0x38] // 01E4A489
  push eax // 01E4A48C
  push dword ptr [ebp - 0x3c] // 01E4A48D
  call dword ptr [TOS.exe+2A98A75] // 01E4A490
  mov dword ptr [ebp - 0x4c], eax // 01E4A496
  cmp dword ptr [ebp - 0x38], #0 // 01E4A499
  jne near fps_loc_01E4A6C6 // 01E4A49D
  sub eax, 0x14 // 01E4A4A3
  cmp eax, -0x16 // 01E4A4A6
  ja near fps_loc_01E4A6C6 // 01E4A4A9
  push 0x10 // 01E4A4AF
  mov eax, dword ptr [ebp - 0x3c] // 01E4A4B1
  lea ecx, [ebp - 0x34] // 01E4A4B4
  xor edx, edx // 01E4A4B7
  call fps_chant_read_at // 01E4A4B9
  pop esi // 01E4A4BE
  test eax, eax // 01E4A4BF
  je near fps_loc_01E4A6C6 // 01E4A4C1
  lea eax, [ebp - 0x34] // 01E4A4C7
  call fps_chant_le32 // 01E4A4CA
  cmp eax, 0x32534641 // 01E4A4CF
  jne near fps_loc_01E4A6C6 // 01E4A4D4
  cmp byte ptr [ebp - 0x30], #1 // 01E4A4DA
  jne near fps_loc_01E4A6C6 // 01E4A4DE
  cmp byte ptr [ebp - 0x2f], #4 // 01E4A4E4
  jne near fps_loc_01E4A6C6 // 01E4A4E8
  cmp byte ptr [ebp - 0x2e], #2 // 01E4A4EE
  jne near fps_loc_01E4A6C6 // 01E4A4F2
  cmp byte ptr [ebp - 0x2d], #0 // 01E4A4F8
  jne near fps_loc_01E4A6C6 // 01E4A4FC
  lea eax, [ebp - 0x2c] // 01E4A502
  call fps_chant_le32 // 01E4A505
  mov dword ptr [ebp - 0x40], eax // 01E4A50A
  movzx eax, word ptr [ebp - 0x28] // 01E4A50D
  mov dword ptr [ebp - 0x44], eax // 01E4A511
  mov eax, dword ptr [ebp - 0x40] // 01E4A514
  dec eax // 01E4A517
  cmp eax, 0xfff // 01E4A518
  ja near fps_loc_01E4A6C6 // 01E4A51D
  cmp dword ptr [ebp - 0x44], #0 // 01E4A523
  je near fps_loc_01E4A6C6 // 01E4A527
  mov eax, dword ptr [ebp - 0x44] // 01E4A52D
  dec eax // 01E4A530
  mov dword ptr [ebp - 0x50], eax // 01E4A531
  and eax, dword ptr [ebp - 0x44] // 01E4A534
  mov dword ptr [ebp - 0x48], eax // 01E4A537
  jne near fps_loc_01E4A6C6 // 01E4A53A
  cmp word ptr [ebp - 0x26], #0 // 01E4A540
  jne near fps_loc_01E4A6C6 // 01E4A545
  imul esi, dword ptr [ebp - 0x40], #6 // 01E4A54B
  add esi, 0x14 // 01E4A54F
  cmp dword ptr [ebp - 0x4c], esi // 01E4A552
  jb near fps_loc_01E4A6C6 // 01E4A555
  push esi // 01E4A55B
  mov eax, dword ptr [ebp - 0x3c] // 01E4A55C
  lea ecx, [ebx + 0x5140] // 01E4A55F
  xor edx, edx // 01E4A565
  call fps_chant_read_at // 01E4A567
  pop ecx // 01E4A56C
  test eax, eax // 01E4A56D
  je near fps_loc_01E4A6C6 // 01E4A56F
  mov eax, dword ptr [ebp - 0x40] // 01E4A575
  lea eax, [ebx + eax*#2 + 0x5150] // 01E4A578
  call fps_chant_le32 // 01E4A57F
  cmp eax, esi // 01E4A584
  jb near fps_loc_01E4A6C6 // 01E4A586
  mov ecx, dword ptr [ebp - 0x40] // 01E4A58C
  xor edx, edx // 01E4A58F
  db 8D,34,09 // lea esi, [ecx + ecx] // 01E4A591
  lea ecx, [ebx + esi + 0x5154] // 01E4A594
fps_loc_01E4A59B:
  mov edi, eax // 01E4A59B
  mov eax, ecx // 01E4A59D
  call fps_chant_le32 // 01E4A59F
  cmp eax, edi // 01E4A5A4
  jb near fps_loc_01E4A6C6 // 01E4A5A6
  cmp dword ptr [ebp - 0x4c], eax // 01E4A5AC
  jb near fps_loc_01E4A6C6 // 01E4A5AF
  test edx, edx // 01E4A5B5
  je short fps_loc_01E4A5CF // 01E4A5B7
  mov di, word ptr [ebx + edx*#2 + 0x5150] // 01E4A5B9
  cmp word ptr [ebx + edx*#2 + 0x514e], di // 01E4A5C1
  jae near fps_loc_01E4A6C6 // 01E4A5C9
fps_loc_01E4A5CF:
  inc edx // 01E4A5CF
  add ecx, #4 // 01E4A5D0
  cmp edx, dword ptr [ebp - 0x40] // 01E4A5D3
  jb short fps_loc_01E4A59B // 01E4A5D6
  mov eax, dword ptr [ebp - 0x44] // 01E4A5D8
  lea esi, [ebx + esi + 0x5150] // 01E4A5DB
  neg eax // 01E4A5E2
  mov dword ptr [ebp - 0x44], eax // 01E4A5E4
fps_loc_01E4A5E7:
  mov eax, esi // 01E4A5E7
  call fps_chant_le32 // 01E4A5E9
  inc dword ptr [ebp - 0x48] // 01E4A5EE
  mov edx, eax // 01E4A5F1
  cmp dword ptr [ebp - 0x44], eax // 01E4A5F3
  jb near fps_loc_01E4A6A4 // 01E4A5F6
  mov eax, dword ptr [ebp - 0x48] // 01E4A5FC
  movzx edi, word ptr [ebx + eax*#2 + 0x514e] // 01E4A5FF
  lea eax, [esi + #4] // 01E4A607
  call fps_chant_le32 // 01E4A60A
  add edx, dword ptr [ebp - 0x50] // 01E4A60F
  and edx, dword ptr [ebp - 0x44] // 01E4A612
  cmp edi, 0xfff // 01E4A615
  ja near fps_loc_01E4A6A4 // 01E4A61B
  cmp eax, edx // 01E4A621
  jb short fps_loc_01E4A6A4 // 01E4A623
  sub eax, edx // 01E4A625
  mov dword ptr [ebp - 0x4c], eax // 01E4A627
  cmp eax, 0x27 // 01E4A62A
  jbe short fps_loc_01E4A6A4 // 01E4A62D
  push 0x28 // 01E4A62F
  mov eax, dword ptr [ebp - 0x3c] // 01E4A631
  lea ecx, [ebp - 0x34] // 01E4A634
  call fps_chant_read_at // 01E4A637
  pop edx // 01E4A63C
  test eax, eax // 01E4A63D
  je short fps_loc_01E4A6A4 // 01E4A63F
  cmp byte ptr [ebp - 0x34], 0x80 // 01E4A641
  jne short fps_loc_01E4A6A4 // 01E4A645
  cmp byte ptr [ebp - 0x33], #0 // 01E4A647
  jne short fps_loc_01E4A6A4 // 01E4A64B
  mov al, byte ptr [ebp - 0x30] // 01E4A64D
  lea edx, [eax - #3] // 01E4A650
  cmp dl, #1 // 01E4A653
  jbe short fps_loc_01E4A65C // 01E4A656
  cmp al, 0x10 // 01E4A658
  jne short fps_loc_01E4A6A4 // 01E4A65A
fps_loc_01E4A65C:
  cmp byte ptr [ebp - 0x2d], #0 // 01E4A65C
  je short fps_loc_01E4A6A4 // 01E4A660
  mov ax, word ptr [ebp - 0x32] // 01E4A662
  xchg al, ah // 01E4A666
  movzx eax, ax // 01E4A668
  add eax, #4 // 01E4A66B
  cmp eax, 0x13 // 01E4A66E
  jbe short fps_loc_01E4A6A4 // 01E4A671
  cmp dword ptr [ebp - 0x4c], eax // 01E4A673
  jb short fps_loc_01E4A6A4 // 01E4A676
  mov edx, dword ptr [ebp - 0x2c] // 01E4A678
  mov eax, dword ptr [ebp - 0x28] // 01E4A67B
  bswap edx // 01E4A67E
  bswap eax // 01E4A680
  push edx // 01E4A682
  push eax // 01E4A683
  call fps_chant_voice_ticks // 01E4A684
  pop edx // 01E4A689
  pop ecx // 01E4A68A
  test eax, eax // 01E4A68B
  je short fps_loc_01E4A6A4 // 01E4A68D
  mov word ptr [ebx + edi*#2 + 0x140], ax // 01E4A68F
  mov byte ptr [ebx + edi + 0x4140], #1 // 01E4A697
  inc dword ptr [ebx + 0x34] // 01E4A69F
  jmp short fps_loc_01E4A6A7 // 01E4A6A2
fps_loc_01E4A6A4:
  inc dword ptr [ebx + 0x38] // 01E4A6A4
fps_loc_01E4A6A7:
  mov edi, dword ptr [ebp - 0x40] // 01E4A6A7
  add esi, #4 // 01E4A6AA
  cmp dword ptr [ebp - 0x48], edi // 01E4A6AD
  jb near fps_loc_01E4A5E7 // 01E4A6B0
  mov dword ptr [ebx + #8], #1 // 01E4A6B6
  mov dword ptr [ebx + 0x3c], #5 // 01E4A6BD
  jmp short fps_loc_01E4A6CD // 01E4A6C4
fps_loc_01E4A6C6:
  mov dword ptr [ebx + 0x3c], #4 // 01E4A6C6
fps_loc_01E4A6CD:
  push dword ptr [ebp - 0x3c] // 01E4A6CD
  call dword ptr [TOS.exe+2A98A99] // 01E4A6D0
fps_loc_01E4A6D6:
  lea esp, [ebp - 0xc] // 01E4A6D6
  pop ebx // 01E4A6D9
  pop esi // 01E4A6DA
  pop edi // 01E4A6DB
  pop ebp // 01E4A6DC
  ret // 01E4A6DD
fps_chant_voice_ensure:
  push ebp // 01E4A6DE
  mov ebp, esp // 01E4A6DF
  push edi // 01E4A6E1
  push esi // 01E4A6E2
  push ebx // 01E4A6E3
  sub esp, 0xc // 01E4A6E4
  call fps_chant_voice_get_state // 01E4A6E7
  test eax, eax // 01E4A6EC
  je near fps_loc_01E4A85E // 01E4A6EE
  mov ebx, eax // 01E4A6F4
  cmp dword ptr [eax], #0 // 01E4A6F6
  jne near fps_loc_01E4A85E // 01E4A6F9
  mov esi, dword ptr [TOS.exe+6D2EDC] // 01E4A6FF
  mov ecx, dword ptr [TOS.exe+4ED7EC] // 01E4A705
  test esi, esi // 01E4A70B
  je near fps_loc_01E4A85E // 01E4A70D
  test ecx, ecx // 01E4A713
  je near fps_loc_01E4A85E // 01E4A715
  cmp dword ptr [ecx], 0xd // 01E4A71B
  jbe near fps_loc_01E4A85E // 01E4A71E
  mov edx, dword ptr [ecx + 0x34] // 01E4A724
  mov eax, dword ptr [ecx + 0x38] // 01E4A727
  test edx, edx // 01E4A72A
  je near fps_loc_01E4A85E // 01E4A72C
  cmp edx, eax // 01E4A732
  jae near fps_loc_01E4A85E // 01E4A734
  sub eax, edx // 01E4A73A
  mov edi, eax // 01E4A73C
  and edi, #1 // 01E4A73E
  jne near fps_loc_01E4A85E // 01E4A741
  mov esi, dword ptr [esi + 0x9a3c] // 01E4A747
  add edx, ecx // 01E4A74D
  cmp edx, esi // 01E4A74F
  jne near fps_loc_01E4A85E // 01E4A751
  shr eax, #1 // 01E4A757
  lea edx, [eax - 0x28d] // 01E4A759
  cmp edx, 0xfff // 01E4A75F
  ja near fps_loc_01E4A85E // 01E4A765
  lea ecx, [eax - 0x28c] // 01E4A76B
  mov dword ptr [ebx], #1 // 01E4A771
  mov dword ptr [ebp - 0x14], ecx // 01E4A777
  lea ecx, [esi + 0x518] // 01E4A77A
  mov dword ptr [ebp - 0x10], ecx // 01E4A780
  cmp dword ptr [ebx + 0x18], esi // 01E4A783
  jne short fps_loc_01E4A790 // 01E4A786
  mov ecx, dword ptr [ebp - 0x14] // 01E4A788
  cmp dword ptr [ebx + 0x20], ecx // 01E4A78B
  je short fps_loc_01E4A7BF // 01E4A78E
fps_loc_01E4A790:
  add eax, eax // 01E4A790
  mov ecx, ebx // 01E4A792
  mov edx, dword ptr [ebp - 0x10] // 01E4A794
  add eax, esi // 01E4A797
  sub ecx, esi // 01E4A799
  mov dword ptr [ebp - 0x18], eax // 01E4A79B
fps_loc_01E4A79E:
  mov ax, word ptr [edx] // 01E4A79E
  mov word ptr [ecx + edx + 0x1c28], ax // 01E4A7A1
  add edx, #2 // 01E4A7A9
  cmp edx, dword ptr [ebp - 0x18] // 01E4A7AC
  jne short fps_loc_01E4A79E // 01E4A7AF
  mov eax, dword ptr [ebp - 0x14] // 01E4A7B1
  mov dword ptr [ebx + 0x18], esi // 01E4A7B4
  mov dword ptr [ebx + 0x20], eax // 01E4A7B7
  xor eax, eax // 01E4A7BA
  mov dword ptr [ebx + 0x1c], eax // 01E4A7BC
fps_loc_01E4A7BF:
  mov edx, dword ptr [TOS.exe+71C048] // 01E4A7BF
  test edx, edx // 01E4A7C5
  je near fps_loc_01E4A85A // 01E4A7C7
  cmp byte ptr [TOS.exe+71AE7C], #0 // 01E4A7CD
  je near fps_loc_01E4A85A // 01E4A7D4
  push edx // 01E4A7DA
  mov eax, TOS.exe+26D409 // 01E4A7DB
  mov dword ptr [ebp - 0x18], edx // 01E4A7E0
  call eax // 01E4A7E3
  pop ecx // 01E4A7E5
  cmp eax, #2 // 01E4A7E6
  jne short fps_loc_01E4A85A // 01E4A7E9
  cmp dword ptr [ebx + #4], #0 // 01E4A7EB
  mov edx, dword ptr [ebp - 0x18] // 01E4A7EF
  je short fps_loc_01E4A7F9 // 01E4A7F2
  cmp dword ptr [ebx + 0x14], edx // 01E4A7F4
  je short fps_loc_01E4A800 // 01E4A7F7
fps_loc_01E4A7F9:
  push edx // 01E4A7F9
  call fps_chant_voice_build // 01E4A7FA
  pop edx // 01E4A7FF
fps_loc_01E4A800:
  cmp dword ptr [ebx + 0x1c], esi // 01E4A800
  jne short fps_loc_01E4A815 // 01E4A803
  mov eax, dword ptr [ebx + 0xc] // 01E4A805
  cmp dword ptr [ebx + 0x24], eax // 01E4A808
  jne short fps_loc_01E4A815 // 01E4A80B
  mov eax, dword ptr [ebx + 0x10] // 01E4A80D
  cmp dword ptr [ebx + 0x28], eax // 01E4A810
  je short fps_loc_01E4A85A // 01E4A813
fps_loc_01E4A815:
  mov edx, dword ptr [ebx + #8] // 01E4A815
fps_loc_01E4A818:
  test edx, edx // 01E4A818
  je short fps_loc_01E4A830 // 01E4A81A
  cmp byte ptr [ebx + edi + 0x4140], #0 // 01E4A81C
  je short fps_loc_01E4A830 // 01E4A824
  mov ax, word ptr [ebx + edi*#2 + 0x140] // 01E4A826
  jmp short fps_loc_01E4A838 // 01E4A82E
fps_loc_01E4A830:
  mov ax, word ptr [ebx + edi*#2 + 0x2140] // 01E4A830
fps_loc_01E4A838:
  mov ecx, dword ptr [ebp - 0x10] // 01E4A838
  inc edi // 01E4A83B
  add dword ptr [ebp - 0x10], #2 // 01E4A83C
  mov word ptr [ecx], ax // 01E4A840
  cmp edi, dword ptr [ebp - 0x14] // 01E4A843
  jb short fps_loc_01E4A818 // 01E4A846
  mov eax, dword ptr [ebx + 0xc] // 01E4A848
  inc dword ptr [ebx + 0x30] // 01E4A84B
  mov dword ptr [ebx + 0x1c], esi // 01E4A84E
  mov dword ptr [ebx + 0x24], eax // 01E4A851
  mov eax, dword ptr [ebx + 0x10] // 01E4A854
  mov dword ptr [ebx + 0x28], eax // 01E4A857
fps_loc_01E4A85A:
  xor eax, eax // 01E4A85A
  mov dword ptr [ebx], eax // 01E4A85C
fps_loc_01E4A85E:
  lea esp, [ebp - 0xc] // 01E4A85E
  pop ebx // 01E4A861
  pop esi // 01E4A862
  pop edi // 01E4A863
  pop ebp // 01E4A864
  ret // 01E4A865
fps_chant_voice_bank_changed:
  push ebp // 01E4A866
  mov ebp, esp // 01E4A867
  cmp dword ptr [ebp + #8], 0x10 // 01E4A869
  jne short fps_loc_01E4A883 // 01E4A86D
  call fps_chant_voice_get_state // 01E4A86F
  test eax, eax // 01E4A874
  je short fps_loc_01E4A883 // 01E4A876
  xor edx, edx // 01E4A878
  inc dword ptr [eax + 0xc] // 01E4A87A
  mov dword ptr [eax + #4], edx // 01E4A87D
  mov dword ptr [eax + 0x1c], edx // 01E4A880
fps_loc_01E4A883:
  pop ebp // 01E4A883
  ret // 01E4A884
fps_chant_voice_table_loaded:
  push ebp // 01E4A885
  mov ebp, esp // 01E4A886
  call fps_chant_voice_get_state // 01E4A888
  test eax, eax // 01E4A88D
  je short fps_loc_01E4A89F // 01E4A88F
  inc dword ptr [eax + 0x10] // 01E4A891
  xor edx, edx // 01E4A894
  mov dword ptr [eax + 0x1c], edx // 01E4A896
  pop ebp // 01E4A899
  jmp near fps_chant_voice_ensure // 01E4A89A
fps_loc_01E4A89F:
  pop ebp // 01E4A89F
  ret // 01E4A8A0
fps_chant_hook_bank:
  mov dword ptr [esi*#4 + TOS.exe+71C008], eax // 01E4A8A1
  pushfd // 01E4A8A8
  pushad // 01E4A8A9
  mov ebp, esp // 01E4A8AA
  sub esp, 0x210 // 01E4A8AC
  and esp, 0xfffffff0 // 01E4A8B2
  fxsave [esp] // 01E4A8B5
  push esi // 01E4A8B9
  call fps_chant_voice_bank_changed // 01E4A8BA
  add esp, #4 // 01E4A8BF
  fxrstor [esp] // 01E4A8C2
  mov esp, ebp // 01E4A8C6
  popad // 01E4A8C8
  popfd // 01E4A8C9
  jmp near TOS.exe+182972 // 01E4A8CA
fps_chant_hook_table:
  mov dword ptr [edi + 0x9a3c], eax // 01E4A8CF
  pushfd // 01E4A8D5
  pushad // 01E4A8D6
  mov ebp, esp // 01E4A8D7
  sub esp, 0x210 // 01E4A8D9
  and esp, 0xfffffff0 // 01E4A8DF
  fxsave [esp] // 01E4A8E2
  call fps_chant_voice_table_loaded // 01E4A8E6
  fxrstor [esp] // 01E4A8EB
  mov esp, ebp // 01E4A8EF
  popad // 01E4A8F1
  popfd // 01E4A8F2
  jmp near TOS.exe+67B00 // 01E4A8F3
fps_chant_hook_selected:
  pushfd // 01E4A8F8
  pushad // 01E4A8F9
  mov ebp, esp // 01E4A8FA
  sub esp, 0x210 // 01E4A8FC
  and esp, 0xfffffff0 // 01E4A902
  fxsave [esp] // 01E4A905
  call fps_chant_voice_ensure // 01E4A909
  fxrstor [esp] // 01E4A90E
  mov esp, ebp // 01E4A912
  popad // 01E4A914
  popfd // 01E4A915
  mov esi, dword ptr [ebx + 0x13aa0] // 01E4A916
  jmp near TOS.exe+267D8 // 01E4A91C
fps_chant_hook_shared:
  pushfd // 01E4A921
  pushad // 01E4A922
  mov ebp, esp // 01E4A923
  sub esp, 0x210 // 01E4A925
  and esp, 0xfffffff0 // 01E4A92B
  fxsave [esp] // 01E4A92E
  call fps_chant_voice_ensure // 01E4A932
  fxrstor [esp] // 01E4A937
  mov esp, ebp // 01E4A93B
  popad // 01E4A93D
  popfd // 01E4A93E
  mov ecx, dword ptr [TOS.exe+6D2EDC] // 01E4A93F
  jmp near TOS.exe+632B6 // 01E4A945
fps_chant_hook_audio_reset:
  mov dword ptr [TOS.exe+71AE7C], ebx // 01E4A94A
  pushfd // 01E4A950
  pushad // 01E4A951
  mov ebp, esp // 01E4A952
  sub esp, 0x210 // 01E4A954
  and esp, 0xfffffff0 // 01E4A95A
  fxsave [esp] // 01E4A95D
  push 0x10 // 01E4A961
  call fps_chant_voice_bank_changed // 01E4A963
  add esp, #4 // 01E4A968
  fxrstor [esp] // 01E4A96B
  mov esp, ebp // 01E4A96F
  popad // 01E4A971
  popfd // 01E4A972
  jmp near TOS.exe+181682 // 01E4A973

// ======================================================================
// darkness_orb: reference 02E90100..02E90B67.
darkness_orb:

// Clone the native 3D command then restore the specialized vtable.
fps_orb_text_clone3:
  push ebp // 02E90100
  mov eax, TOS.exe+187660 // 02E90101
  mov ebp, esp // 02E90106
  call eax // 02E90108
  test eax, eax // 02E9010A
  je short fps_loc_02E9011A // 02E9010C
  mov dword ptr [eax], fps_orb_vt3 // 02E9010E
  inc dword ptr [darkness_orb_state+18] // 02E90114
fps_loc_02E9011A:
  pop ebp // 02E9011A
  ret // 02E9011B

// Call native 3D execution and tag the queued indexed draw.
fps_orb_text_execute3:
  push ebp // 02E9011C
  mov eax, TOS.exe+187650 // 02E9011D
  mov ebp, esp // 02E90122
  call eax // 02E90124
  mov edx, dword ptr [TOS.exe+19B9BCC] // 02E90126
  lea ecx, [edx - 0x20] // 02E9012C
  cmp ecx, eax // 02E9012F
  jne short fps_loc_02E90151 // 02E90131
  cmp dword ptr [eax], TOS.exe+1D6EC0 // 02E90133
  jne short fps_loc_02E90151 // 02E90139
  cmp dword ptr [edx - 0x1c], TOS.exe+1CF250 // 02E9013B
  jne short fps_loc_02E90151 // 02E90142
  mov dword ptr [edx - 0x1c], fps_orb_text_draw // 02E90144
  inc dword ptr [darkness_orb_state+1C] // 02E9014B
fps_loc_02E90151:
  pop ebp // 02E90151
  ret // 02E90152
  nop // 02E90153

// Validate straight-line ps_3_0, reserve sampler 1, append D RGB multiply and retain original alpha.
fps_orb_text_orb_transform_constprop_0:
  push ebp // 02E90154
  mov ebp, esp // 02E90155
  push edi // 02E90157
  push esi // 02E90158
  push ebx // 02E90159
  sub esp, 0x70 // 02E9015A
  mov dword ptr [ebp - 0x5c], eax // 02E9015D
  lea eax, [edx - #2] // 02E90160
  mov dword ptr [ebp - 0x60], edx // 02E90163
  mov dword ptr [ebp - 0x4c], ecx // 02E90166
  cmp eax, 0x1fe // 02E90169
  ja near fps_loc_02E903E1 // 02E9016E
  mov eax, dword ptr [ebp - 0x5c] // 02E90174
  cmp dword ptr [eax], 0xffff0300 // 02E90177
  jne near fps_loc_02E903E1 // 02E9017D
  mov eax, dword ptr [ebp - 0x4c] // 02E90183
  xor edx, edx // 02E90186
  xor ecx, ecx // 02E90188
  mov dword ptr [ebp - 0x54], 0xa // 02E9018A
  mov dword ptr [ebp - 0x70], ecx // 02E90191
  mov dword ptr [eax], 0xffff0300 // 02E90194
  mov dword ptr [eax + #4], 0x5000051 // 02E9019A
  mov dword ptr [eax + #8], 0xa00f00df // 02E901A1
  mov dword ptr [eax + 0xc], 0x3f1e4000 // 02E901A8
  mov dword ptr [eax + 0x10], 0x3f104000 // 02E901AF
  mov dword ptr [eax + 0x14], edx // 02E901B6
  mov dword ptr [eax + 0x18], edx // 02E901B9
  mov dword ptr [eax + 0x1c], 0x200001f // 02E901BC
  mov dword ptr [eax + 0x20], 0x90000000 // 02E901C3
  mov dword ptr [eax + 0x24], 0xa00f0801 // 02E901CA
  mov eax, dword ptr [ebp - 0x60] // 02E901D1
  mov dword ptr [ebp - 0x6c], ecx // 02E901D4
  dec eax // 02E901D7
  mov dword ptr [ebp - 0x50], #1 // 02E901D8
  mov dword ptr [ebp - 0x7c], eax // 02E901DF
fps_loc_02E901E2:
  mov eax, dword ptr [ebp - 0x50] // 02E901E2
  mov esi, dword ptr [ebp - 0x50] // 02E901E5
  lea edi, [eax*#4] // 02E901E8
  mov eax, dword ptr [ebp - 0x5c] // 02E901EF
  mov esi, dword ptr [eax + esi*#4] // 02E901F2
  movzx ebx, si // 02E901F5
  cmp ebx, 0xffff // 02E901F8
  jne short fps_loc_02E9025F // 02E901FE
  cmp esi, 0xffff // 02E90200
  jne near fps_loc_02E903E1 // 02E90206
  mov eax, dword ptr [ebp - 0x50] // 02E9020C
  inc eax // 02E9020F
  cmp dword ptr [ebp - 0x60], eax // 02E90210
  jne near fps_loc_02E903E1 // 02E90213
  mov eax, dword ptr [ebp - 0x6c] // 02E90219
  mov edx, dword ptr [ebp - 0x70] // 02E9021C
  xor eax, #1 // 02E9021F
  xor edx, #1 // 02E90222
  or eax, edx // 02E90225
  jne near fps_loc_02E903E1 // 02E90227
  lea edi, [ebp - 0x48] // 02E9022D
  mov esi, fps_orb_data // 02E90230
  lea ebx, [ebp - 0x48] // 02E90235
  mov ecx, 0xf // 02E90238
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02E9023D
  mov esi, dword ptr [ebp - 0x4c] // 02E9023F
  mov edi, dword ptr [ebp - 0x54] // 02E90242
  lea edx, [esi + edi*#4] // 02E90245
fps_loc_02E90248:
  mov ecx, dword ptr [ebx + eax*#4] // 02E90248
  mov dword ptr [edx + eax*#4], ecx // 02E9024B
  inc eax // 02E9024E
  cmp eax, 0xf // 02E9024F
  jne short fps_loc_02E90248 // 02E90252
  mov eax, dword ptr [ebp - 0x54] // 02E90254
  add eax, 0xf // 02E90257
  jmp near fps_loc_02E90500 // 02E9025A
fps_loc_02E9025F:
  cmp ebx, 0xfffe // 02E9025F
  jne short fps_loc_02E902C3 // 02E90265
  mov eax, esi // 02E90267
  mov esi, dword ptr [ebp - 0x60] // 02E90269
  shr eax, 0x10 // 02E9026C
  lea edx, [esi - #1] // 02E9026F
  and eax, 0x7fff // 02E90272
  sub edx, dword ptr [ebp - 0x50] // 02E90277
  cmp edx, eax // 02E9027A
  jb near fps_loc_02E903E1 // 02E9027C
  mov ecx, dword ptr [ebp - 0x54] // 02E90282
  lea ecx, [eax + ecx + #1] // 02E90285
  cmp ecx, 0x218 // 02E90289
  ja near fps_loc_02E903E1 // 02E9028F
  mov esi, dword ptr [ebp - 0x5c] // 02E90295
  mov edx, dword ptr [ebp - 0x54] // 02E90298
  db 8D,1C,3E // lea ebx, [esi + edi] // 02E9029B
  mov edi, dword ptr [ebp - 0x4c] // 02E9029E
  lea esi, [edi + edx*#4] // 02E902A1
  xor edx, edx // 02E902A4
fps_loc_02E902A6:
  mov edi, dword ptr [ebx + edx*#4] // 02E902A6
  mov dword ptr [esi + edx*#4], edi // 02E902A9
  inc edx // 02E902AC
  cmp eax, edx // 02E902AD
  jae short fps_loc_02E902A6 // 02E902AF
  mov edi, dword ptr [ebp - 0x50] // 02E902B1
  mov dword ptr [ebp - 0x54], ecx // 02E902B4
  db 8D,44,07,01 // lea eax, [edi + eax + #1] // 02E902B7
  mov dword ptr [ebp - 0x50], eax // 02E902BB
  jmp near fps_loc_02E904EF // 02E902BE
fps_loc_02E902C3:
  bt esi, 0x1c // 02E902C3
  jb near fps_loc_02E903E1 // 02E902C7
  mov eax, esi // 02E902CD
  shr eax, 0x18 // 02E902CF
  and eax, 0xf // 02E902D2
  mov dword ptr [ebp - 0x58], eax // 02E902D5
  mov edx, dword ptr [ebp - 0x58] // 02E902D8
  mov eax, dword ptr [ebp - 0x7c] // 02E902DB
  sub eax, dword ptr [ebp - 0x50] // 02E902DE
  cmp eax, edx // 02E902E1
  jb near fps_loc_02E903E1 // 02E902E3
  mov eax, dword ptr [ebp - 0x54] // 02E902E9
  inc eax // 02E902EC
  mov dword ptr [ebp - 0x68], eax // 02E902ED
  mov ecx, dword ptr [ebp - 0x68] // 02E902F0
  db 8D,04,0A // lea eax, [edx + ecx] // 02E902F3
  cmp eax, 0x218 // 02E902F6
  ja near fps_loc_02E903E1 // 02E902FB
  cmp ebx, 0x1f // 02E90301
  jne short fps_loc_02E9033C // 02E90304
  cmp edx, #2 // 02E90306
  jne near fps_loc_02E903E1 // 02E90309
  mov eax, dword ptr [ebp - 0x5c] // 02E9030F
  cmp dword ptr [eax + edi + #4], 0x90000000 // 02E90312
  jne near fps_loc_02E90402 // 02E9031A
  mov eax, dword ptr [eax + edi + #8] // 02E90320
  and eax, 0x70001fff // 02E90324
  cmp eax, 0x20000800 // 02E90329
  sete al // 02E9032E
  movzx eax, al // 02E90331
  or dword ptr [ebp - 0x6c], eax // 02E90334
  jmp near fps_loc_02E90407 // 02E90337
fps_loc_02E9033C:
  cmp ebx, 0x51 // 02E9033C
  jne short fps_loc_02E90355 // 02E9033F
  cmp dword ptr [ebp - 0x58], #5 // 02E90341
  jne near fps_loc_02E903E1 // 02E90345
  mov edx, #1 // 02E9034B
  jmp near fps_loc_02E903F9 // 02E90350
fps_loc_02E90355:
  cmp ebx, 0x24 // 02E90355
  ja short fps_loc_02E903AE // 02E90358
  cmp ebx, 0xd // 02E9035A
  ja short fps_loc_02E9038B // 02E9035D
  xor edx, edx // 02E9035F
  test ebx, ebx // 02E90361
  je near fps_loc_02E903F4 // 02E90363
  mov eax, #1 // 02E90369
  mov ecx, ebx // 02E9036E
  shl eax, cl // 02E90370
  test eax, 0x3f2c // 02E90372
  jne short fps_loc_02E903E8 // 02E90377
  and eax, 0xc2 // 02E90379
  cmp eax, #1 // 02E9037E
  sbb edx, edx // 02E90381
  and edx, #2 // 02E90383
  add edx, #2 // 02E90386
  jmp short fps_loc_02E903F4 // 02E90389
fps_loc_02E9038B:
  lea ecx, [ebx - 0xe] // 02E9038B
  mov eax, #1 // 02E9038E
  shl eax, cl // 02E90393
  test eax, 0x600023 // 02E90395
  jne short fps_loc_02E903D5 // 02E9039A
  and eax, 0xc0008 // 02E9039C
  jne short fps_loc_02E903E8 // 02E903A1
  cmp ebx, 0x12 // 02E903A3
  jne near fps_loc_02E90500 // 02E903A6
  jmp short fps_loc_02E903C9 // 02E903AC
fps_loc_02E903AE:
  cmp ebx, 0x41 // 02E903AE
  je short fps_loc_02E903EF // 02E903B1
  cmp ebx, 0x40 // 02E903B3
  jbe short fps_loc_02E903E1 // 02E903B6
  cmp ebx, 0x5a // 02E903B8
  je short fps_loc_02E903C9 // 02E903BB
  ja short fps_loc_02E903D0 // 02E903BD
  cmp ebx, 0x42 // 02E903BF
  je short fps_loc_02E903E8 // 02E903C2
  cmp ebx, 0x58 // 02E903C4
  jne short fps_loc_02E903E1 // 02E903C7
fps_loc_02E903C9:
  mov edx, #4 // 02E903C9
  jmp short fps_loc_02E903F4 // 02E903CE
fps_loc_02E903D0:
  cmp ebx, 0x5c // 02E903D0
  ja short fps_loc_02E903DC // 02E903D3
fps_loc_02E903D5:
  mov edx, #2 // 02E903D5
  jmp short fps_loc_02E903F4 // 02E903DA
fps_loc_02E903DC:
  cmp ebx, 0x5f // 02E903DC
  je short fps_loc_02E903E8 // 02E903DF
fps_loc_02E903E1:
  xor eax, eax // 02E903E1
  jmp near fps_loc_02E90500 // 02E903E3
fps_loc_02E903E8:
  mov edx, #3 // 02E903E8
  jmp short fps_loc_02E903F4 // 02E903ED
fps_loc_02E903EF:
  mov edx, #1 // 02E903EF
fps_loc_02E903F4:
  cmp dword ptr [ebp - 0x58], edx // 02E903F4
  jne short fps_loc_02E903E1 // 02E903F7
fps_loc_02E903F9:
  mov dword ptr [ebp - 0x64], #1 // 02E903F9
  jmp short fps_loc_02E9040E // 02E90400
fps_loc_02E90402:
  mov edx, #2 // 02E90402
fps_loc_02E90407:
  mov dword ptr [ebp - 0x64], #2 // 02E90407
fps_loc_02E9040E:
  mov ecx, dword ptr [ebp - 0x54] // 02E9040E
  mov eax, dword ptr [ebp - 0x4c] // 02E90411
  mov dword ptr [eax + ecx*#4], esi // 02E90414
  and esi, 0xffef // 02E90417
  cmp esi, 0x41 // 02E9041D
  mov esi, #1 // 02E90420
  sete al // 02E90425
  cmp ebx, 0x1f // 02E90428
  sete cl // 02E9042B
  or eax, ecx // 02E9042E
  mov byte ptr [ebp - 0x71], al // 02E90430
  mov eax, dword ptr [ebp - 0x5c] // 02E90433
  add eax, edi // 02E90436
  mov dword ptr [ebp - 0x78], eax // 02E90438
  mov eax, dword ptr [ebp - 0x68] // 02E9043B
  mov dword ptr [ebp - 0x54], eax // 02E9043E
fps_loc_02E90441:
  cmp dword ptr [ebp - 0x58], esi // 02E90441
  jb near fps_loc_02E904E2 // 02E90444
  mov eax, dword ptr [ebp - 0x78] // 02E9044A
  mov ecx, dword ptr [eax + esi*#4] // 02E9044D
  cmp esi, dword ptr [ebp - 0x64] // 02E90450
  jb short fps_loc_02E904CF // 02E90453
  cmp edx, esi // 02E90455
  jb short fps_loc_02E904CF // 02E90457
  test ecx, ecx // 02E90459
  jns short fps_loc_02E903E1 // 02E9045B
  mov eax, ecx // 02E9045D
  and eax, 0x2000 // 02E9045F
  jne near fps_loc_02E903E1 // 02E90464
  mov ebx, ecx // 02E9046A
  mov edi, ecx // 02E9046C
  shr ebx, 0x1c // 02E9046E
  shr edi, #8 // 02E90471
  and edi, 0x18 // 02E90474
  and ebx, #7 // 02E90477
  or ebx, edi // 02E9047A
  mov edi, ecx // 02E9047C
  and edi, 0x7ff // 02E9047E
  setne byte ptr [ebp - 0x68] // 02E90484
  cmp ebx, 0xa // 02E90488
  jne short fps_loc_02E90493 // 02E9048B
  cmp byte ptr [ebp - 0x68], #0 // 02E9048D
  jne short fps_loc_02E90500 // 02E90491
fps_loc_02E90493:
  test ebx, ebx // 02E90493
  jne short fps_loc_02E9049C // 02E90495
  cmp edi, 0x1d // 02E90497
  ja short fps_loc_02E90500 // 02E9049A
fps_loc_02E9049C:
  cmp ebx, #2 // 02E9049C
  jne short fps_loc_02E904A9 // 02E9049F
  cmp edi, 0xdf // 02E904A1
  je short fps_loc_02E90500 // 02E904A7
fps_loc_02E904A9:
  cmp ebx, #8 // 02E904A9
  jne short fps_loc_02E904CF // 02E904AC
  cmp esi, #1 // 02E904AE
  jne short fps_loc_02E90500 // 02E904B1
  cmp byte ptr [ebp - 0x68], #0 // 02E904B3
  jne short fps_loc_02E90500 // 02E904B7
  cmp byte ptr [ebp - 0x71], #0 // 02E904B9
  jne short fps_loc_02E90500 // 02E904BD
  mov dword ptr [ebp - 0x70], #1 // 02E904BF
  and ecx, 0x8fffe000 // 02E904C6
  or ecx, 0x1f // 02E904CC
fps_loc_02E904CF:
  inc dword ptr [ebp - 0x54] // 02E904CF
  mov eax, dword ptr [ebp - 0x4c] // 02E904D2
  inc esi // 02E904D5
  mov edi, dword ptr [ebp - 0x54] // 02E904D6
  mov dword ptr [eax + edi*#4 - #4], ecx // 02E904D9
  jmp near fps_loc_02E90441 // 02E904DD
fps_loc_02E904E2:
  mov eax, dword ptr [ebp - 0x50] // 02E904E2
  mov esi, dword ptr [ebp - 0x58] // 02E904E5
  lea eax, [eax + esi + #1] // 02E904E8
  mov dword ptr [ebp - 0x50], eax // 02E904EC
fps_loc_02E904EF:
  mov edi, dword ptr [ebp - 0x60] // 02E904EF
  cmp dword ptr [ebp - 0x50], edi // 02E904F2
  jb near fps_loc_02E901E2 // 02E904F5
  jmp near fps_loc_02E903E1 // 02E904FB
fps_loc_02E90500:
  add esp, 0x70 // 02E90500
  pop ebx // 02E90503
  pop esi // 02E90504
  pop edi // 02E90505
  pop ebp // 02E90506
  ret // 02E90507

// Cache up to eight device/original-shader pairs; transform supported bytecode; release evicted COM references.
fps_orb_text_variant:
  push ebp // 02E90508
  mov ebp, esp // 02E90509
  push edi // 02E9050B
  mov edi, eax // 02E9050C
  xor eax, eax // 02E9050E
  push esi // 02E90510
  mov esi, edx // 02E90511
  push ebx // 02E90513
  sub esp, 0x1068 // 02E90514
  mov dword ptr [ebp - 0x1074], 0x800 // 02E9051A
fps_loc_02E90524:
  imul ecx, eax, 0xc // 02E90524
  cmp dword ptr [ecx + darkness_orb_state+83C], edi // 02E90527
  jne short fps_loc_02E90542 // 02E9052D
  cmp dword ptr [ecx + darkness_orb_state+840], esi // 02E9052F
  jne short fps_loc_02E90542 // 02E90535
  mov eax, dword ptr [ecx + darkness_orb_state+844] // 02E90537
  jmp near fps_loc_02E906DF // 02E9053D
fps_loc_02E90542:
  inc eax // 02E90542
  cmp eax, #8 // 02E90543
  jne short fps_loc_02E90524 // 02E90546
  inc dword ptr [darkness_orb_state+20] // 02E90548
  mov ebx, dword ptr [darkness_orb_state+89C] // 02E9054E
  lea eax, [ebx + #1] // 02E90554
  and ebx, #7 // 02E90557
  imul edx, ebx, 0xc // 02E9055A
  mov dword ptr [darkness_orb_state+89C], eax // 02E9055D
  lea eax, [edx + fps_orb_data_state] // 02E90562
  cmp dword ptr [edx + darkness_orb_state+844], #0 // 02E90568
  je short fps_loc_02E90582 // 02E9056F
  mov edx, dword ptr [edx + darkness_orb_state+844] // 02E90571
  mov edx, dword ptr [edx] // 02E90577
  push dword ptr [eax + 0x844] // 02E90579
  call dword ptr [edx + #8] // 02E9057F
fps_loc_02E90582:
  imul edx, ebx, 0xc // 02E90582
  lea eax, [edx + fps_orb_data_state] // 02E90585
  cmp dword ptr [edx + darkness_orb_state+840], #0 // 02E9058B
  je short fps_loc_02E905A5 // 02E90592
  mov edx, dword ptr [edx + darkness_orb_state+840] // 02E90594
  mov edx, dword ptr [edx] // 02E9059A
  push dword ptr [eax + 0x840] // 02E9059C
  call dword ptr [edx + #8] // 02E905A2
fps_loc_02E905A5:
  imul edx, ebx, 0xc // 02E905A5
  lea eax, [edx + fps_orb_data_state] // 02E905A8
  cmp dword ptr [edx + darkness_orb_state+83C], #0 // 02E905AE
  je short fps_loc_02E905C8 // 02E905B5
  mov edx, dword ptr [edx + darkness_orb_state+83C] // 02E905B7
  mov edx, dword ptr [edx] // 02E905BD
  push dword ptr [eax + 0x83c] // 02E905BF
  call dword ptr [edx + #8] // 02E905C5
fps_loc_02E905C8:
  imul eax, ebx, 0xc // 02E905C8
  xor edx, edx // 02E905CB
  mov dword ptr [eax + darkness_orb_state+83C], edi // 02E905CD
  mov dword ptr [eax + darkness_orb_state+840], esi // 02E905D3
  mov dword ptr [eax + darkness_orb_state+844], edx // 02E905D9
  mov eax, dword ptr [edi] // 02E905DF
  push edi // 02E905E1
  call dword ptr [eax + #4] // 02E905E2
  mov eax, dword ptr [esi] // 02E905E5
  push esi // 02E905E7
  call dword ptr [eax + #4] // 02E905E8
  mov eax, dword ptr [esi] // 02E905EB
  lea edx, [ebp - 0x1074] // 02E905ED
  push edx // 02E905F3
  push #0 // 02E905F4
  push esi // 02E905F6
  call dword ptr [eax + 0x10] // 02E905F7
  mov dword ptr [darkness_orb_state+24], eax // 02E905FA
  test eax, eax // 02E905FF
  js short fps_loc_02E90646 // 02E90601
  mov eax, dword ptr [ebp - 0x1074] // 02E90603
  cmp eax, 0x800 // 02E90609
  ja short fps_loc_02E90646 // 02E9060E
  test al, #3 // 02E90610
  lea edx, [ebp - 0x1074] // 02E90612
  jne short fps_loc_02E90646 // 02E90618
  mov eax, dword ptr [esi] // 02E9061A
  push edx // 02E9061C
  lea edx, [ebp - 0x106c] // 02E9061D
  push edx // 02E90623
  push esi // 02E90624
  call dword ptr [eax + 0x10] // 02E90625
  mov dword ptr [darkness_orb_state+24], eax // 02E90628
  test eax, eax // 02E9062D
  js short fps_loc_02E90646 // 02E9062F
  mov edx, dword ptr [ebp - 0x1074] // 02E90631
  cmp edx, 0x800 // 02E90637
  ja short fps_loc_02E90646 // 02E9063D
  mov eax, edx // 02E9063F
  and eax, #3 // 02E90641
  je short fps_loc_02E90657 // 02E90644
fps_loc_02E90646:
  mov dword ptr [darkness_orb_state+28], #1 // 02E90646
fps_loc_02E90650:
  xor eax, eax // 02E90650
  jmp near fps_loc_02E906DF // 02E90652
fps_loc_02E90657:
  shr edx, #2 // 02E90657
  mov dword ptr [darkness_orb_state+34], edx // 02E9065A
fps_loc_02E90660:
  cmp edx, eax // 02E90660
  lea esi, [ebp - 0x106c] // 02E90662
  je short fps_loc_02E90677 // 02E90668
  mov ecx, dword ptr [esi + eax*#4] // 02E9066A
  mov dword ptr [eax*#4 + darkness_orb_state+3C], ecx // 02E9066D
  inc eax // 02E90674
  jmp short fps_loc_02E90660 // 02E90675
fps_loc_02E90677:
  lea ecx, [ebp - 0x86c] // 02E90677
  mov eax, esi // 02E9067D
  call fps_orb_text_orb_transform_constprop_0 // 02E9067F
  lea ecx, [ebp - 0x86c] // 02E90684
  test eax, eax // 02E9068A
  jne short fps_loc_02E9069A // 02E9068C
  mov dword ptr [darkness_orb_state+28], #2 // 02E9068E
  jmp short fps_loc_02E90650 // 02E90698
fps_loc_02E9069A:
  mov eax, dword ptr [edi] // 02E9069A
  lea edx, [ebp - 0x1070] // 02E9069C
  xor esi, esi // 02E906A2
  mov dword ptr [ebp - 0x1070], esi // 02E906A4
  push edx // 02E906AA
  push ecx // 02E906AB
  push edi // 02E906AC
  call dword ptr [eax + 0x1a8] // 02E906AD
  mov dword ptr [darkness_orb_state+24], eax // 02E906B3
  test eax, eax // 02E906B8
  jns short fps_loc_02E906C8 // 02E906BA
  mov dword ptr [darkness_orb_state+28], #3 // 02E906BC
  jmp short fps_loc_02E90650 // 02E906C6
fps_loc_02E906C8:
  imul ebx, ebx, 0xc // 02E906C8
  mov eax, dword ptr [ebp - 0x1070] // 02E906CB
  xor edx, edx // 02E906D1
  mov dword ptr [ebx + darkness_orb_state+844], eax // 02E906D3
  mov dword ptr [darkness_orb_state+28], edx // 02E906D9
fps_loc_02E906DF:
  lea esp, [ebp - 0xc] // 02E906DF
  pop ebx // 02E906E2
  pop esi // 02E906E3
  pop edi // 02E906E4
  pop ebp // 02E906E5
  ret // 02E906E6
  nop // 02E906E7

// Resolve current common atlas on sampler 1; save/restore shader, texture and all 13 sampler states around the native draw.
fps_orb_text_draw:
  push ebp // 02E906E8
  xor edx, edx // 02E906E9
  mov ebp, esp // 02E906EB
  push edi // 02E906ED
  push esi // 02E906EE
  xor esi, esi // 02E906EF
  push ebx // 02E906F1
  sub esp, 0x44 // 02E906F2
  mov ebx, dword ptr [TOS.exe+72999C] // 02E906F5
  mov dword ptr [ebp - 0x4c], edx // 02E906FB
  mov dword ptr [ebp - 0x48], edx // 02E906FE
  lea edx, [ebp - 0x4c] // 02E90701
  mov eax, dword ptr [ebx] // 02E90704
  inc dword ptr [darkness_orb_state+C] // 02E90706
  push edx // 02E9070C
  push ebx // 02E9070D
  call dword ptr [eax + 0x1b0] // 02E9070E
  test eax, eax // 02E90714
  js short fps_loc_02E90730 // 02E90716
  mov esi, dword ptr [ebp - 0x4c] // 02E90718
  test esi, esi // 02E9071B
  je short fps_loc_02E90730 // 02E9071D
  mov edx, esi // 02E9071F
  mov eax, ebx // 02E90721
  mov dword ptr [darkness_orb_state+2C], esi // 02E90723
  call fps_orb_text_variant // 02E90729
  mov esi, eax // 02E9072E
fps_loc_02E90730:
  mov ecx, dword ptr [TOS.exe+71C0B8] // 02E90730
  mov eax, dword ptr [TOS.exe+71C0BC] // 02E90736
  cmp ecx, 0x1000 // 02E9073B
  ja short fps_loc_02E90762 // 02E90741
  xor edx, edx // 02E90743
  test eax, eax // 02E90745
  jne short fps_loc_02E9074F // 02E90747
  jmp short fps_loc_02E90762 // 02E90749
fps_loc_02E9074B:
  inc edx // 02E9074B
  add eax, 0x1c // 02E9074C
fps_loc_02E9074F:
  cmp ecx, edx // 02E9074F
  je short fps_loc_02E90762 // 02E90751
  cmp dword ptr [eax], 0xd000000 // 02E90753
  jne short fps_loc_02E9074B // 02E90759
  mov eax, dword ptr [eax + 0x10] // 02E9075B
  test eax, eax // 02E9075E
  jne short fps_loc_02E90766 // 02E90760
fps_loc_02E90762:
  xor edi, edi // 02E90762
  jmp short fps_loc_02E90779 // 02E90764
fps_loc_02E90766:
  cmp dword ptr [eax + #4], #3 // 02E90766
  ja short fps_loc_02E90762 // 02E9076A
  mov ecx, dword ptr [eax] // 02E9076C
  test ecx, ecx // 02E9076E
  je short fps_loc_02E90762 // 02E90770
  mov eax, dword ptr [ecx] // 02E90772
  call dword ptr [eax + #4] // 02E90774
  mov edi, eax // 02E90777
fps_loc_02E90779:
  test esi, esi // 02E90779
  je short fps_loc_02E907BC // 02E9077B
  test edi, edi // 02E9077D
  je short fps_loc_02E907BC // 02E9077F
  mov eax, dword ptr [ebx] // 02E90781
  lea edx, [ebp - 0x48] // 02E90783
  push edx // 02E90786
  push #1 // 02E90787
  push ebx // 02E90789
  call dword ptr [eax + 0x100] // 02E9078A
  test eax, eax // 02E90790
  js short fps_loc_02E907BC // 02E90792
  xor edx, edx // 02E90794
fps_loc_02E90796:
  mov eax, dword ptr [ebx] // 02E90796
  lea ecx, [ebp + edx*#4 - 0x40] // 02E90798
  inc edx // 02E9079C
  push ecx // 02E9079D
  push edx // 02E9079E
  mov dword ptr [ebp - 0x50], edx // 02E9079F
  push #1 // 02E907A2
  push ebx // 02E907A4
  call dword ptr [eax + 0x110] // 02E907A5
  test eax, eax // 02E907AB
  js short fps_loc_02E907BC // 02E907AD
  mov edx, dword ptr [ebp - 0x50] // 02E907AF
  cmp edx, 0xd // 02E907B2
  jne short fps_loc_02E90796 // 02E907B5
  jmp near fps_loc_02E9083D // 02E907B7
fps_loc_02E907BC:
  xor edi, edi // 02E907BC
fps_loc_02E907BE:
  inc dword ptr [darkness_orb_state+14] // 02E907BE
  xor esi, esi // 02E907C4
fps_loc_02E907C6:
  push dword ptr [ebp + 0x1c] // 02E907C6
  mov eax, TOS.exe+1CF250 // 02E907C9
  push dword ptr [ebp + 0x18] // 02E907CE
  push dword ptr [ebp + 0x14] // 02E907D1
  push dword ptr [ebp + 0x10] // 02E907D4
  push dword ptr [ebp + 0xc] // 02E907D7
  push dword ptr [ebp + #8] // 02E907DA
  call eax // 02E907DD
  add esp, 0x18 // 02E907DF
  test esi, esi // 02E907E2
  je short fps_loc_02E907F2 // 02E907E4
  mov eax, dword ptr [ebx] // 02E907E6
  push dword ptr [ebp - 0x4c] // 02E907E8
  push ebx // 02E907EB
  call dword ptr [eax + 0x1ac] // 02E907EC
fps_loc_02E907F2:
  test edi, edi // 02E907F2
  je short fps_loc_02E9081A // 02E907F4
  mov eax, dword ptr [ebx] // 02E907F6
  push dword ptr [ebp - 0x48] // 02E907F8
  push #1 // 02E907FB
  push ebx // 02E907FD
  call dword ptr [eax + 0x104] // 02E907FE
fps_loc_02E90804:
  mov eax, dword ptr [ebx] // 02E90804
  push dword ptr [ebp + edi*#4 - 0x44] // 02E90806
  push edi // 02E9080A
  inc edi // 02E9080B
  push #1 // 02E9080C
  push ebx // 02E9080E
  call dword ptr [eax + 0x114] // 02E9080F
  cmp edi, 0xe // 02E90815
  jne short fps_loc_02E90804 // 02E90818
fps_loc_02E9081A:
  mov eax, dword ptr [ebp - 0x48] // 02E9081A
  test eax, eax // 02E9081D
  je short fps_loc_02E90827 // 02E9081F
  mov edx, dword ptr [eax] // 02E90821
  push eax // 02E90823
  call dword ptr [edx + #8] // 02E90824
fps_loc_02E90827:
  mov eax, dword ptr [ebp - 0x4c] // 02E90827
  test eax, eax // 02E9082A
  je near fps_loc_02E908CA // 02E9082C
  mov edx, dword ptr [eax] // 02E90832
  push eax // 02E90834
  call dword ptr [edx + #8] // 02E90835
  jmp near fps_loc_02E908CA // 02E90838
fps_loc_02E9083D:
  mov eax, dword ptr [edi] // 02E9083D
  mov ecx, edi // 02E9083F
  push #1 // 02E90841
  call dword ptr [eax + 0x1c] // 02E90843
  mov eax, dword ptr [ebx] // 02E90846
  push #1 // 02E90848
  push #6 // 02E9084A
  push #1 // 02E9084C
  push ebx // 02E9084E
  call dword ptr [eax + 0x114] // 02E9084F
  mov eax, dword ptr [ebx] // 02E90855
  push #1 // 02E90857
  push #5 // 02E90859
  push #1 // 02E9085B
  push ebx // 02E9085D
  call dword ptr [eax + 0x114] // 02E9085E
  mov eax, dword ptr [ebx] // 02E90864
  push #0 // 02E90866
  push #7 // 02E90868
  push #1 // 02E9086A
  push ebx // 02E9086C
  call dword ptr [eax + 0x114] // 02E9086D
  xor eax, eax // 02E90873
  lea edx, [ebp - 0x44] // 02E90875
  mov dword ptr [ebp - 0x44], eax // 02E90878
  mov eax, dword ptr [ebx] // 02E9087B
  push edx // 02E9087D
  push #1 // 02E9087E
  push ebx // 02E90880
  call dword ptr [eax + 0x100] // 02E90881
  test eax, eax // 02E90887
  mov eax, dword ptr [ebp - 0x44] // 02E90889
  mov dword ptr [darkness_orb_state+30], eax // 02E9088C
  jns short fps_loc_02E9089D // 02E90891
fps_loc_02E90893:
  mov edi, #1 // 02E90893
  jmp near fps_loc_02E907BE // 02E90898
fps_loc_02E9089D:
  test eax, eax // 02E9089D
  je short fps_loc_02E90893 // 02E9089F
  mov edx, dword ptr [eax] // 02E908A1
  push eax // 02E908A3
  call dword ptr [edx + #8] // 02E908A4
  mov eax, dword ptr [ebx] // 02E908A7
  push esi // 02E908A9
  push ebx // 02E908AA
  call dword ptr [eax + 0x1ac] // 02E908AB
  mov dword ptr [darkness_orb_state+24], eax // 02E908B1
  test eax, eax // 02E908B6
  js short fps_loc_02E90893 // 02E908B8
  inc dword ptr [darkness_orb_state+10] // 02E908BA
  mov edi, #1 // 02E908C0
  jmp near fps_loc_02E907C6 // 02E908C5
fps_loc_02E908CA:
  lea esp, [ebp - 0xc] // 02E908CA
  pop ebx // 02E908CD
  pop esi // 02E908CE
  pop edi // 02E908CF
  pop ebp // 02E908D0
  ret // 02E908D1
  nop // 02E908D2
  nop // 02E908D3

// Select bank-1 category-28 exact release-orb rectangle, neutralize RGB to max channel, and forward other submissions to common selector.
fps_orb_text_submit3:
  inc dword ptr [fps_orb_data_state] // 02E908D4
  cmp dword ptr [TOS.exe+720268], 0xd000001 // 02E908DA
  jne near fps_loc_02E90A76 // 02E908E4
  inc dword ptr [darkness_orb_state+4] // 02E908EA
  mov eax, dword ptr [TOS.exe+72026C] // 02E908F0
  mov dword ptr [darkness_orb_state+38], eax // 02E908F5
  mov eax, dword ptr [TOS.exe+72026C] // 02E908FA
  cmp dword ptr [TOS.exe+720268], 0xd000001 // 02E908FF
  jne near fps_loc_02E90A76 // 02E90909
  shr eax, #4 // 02E9090F
  cmp eax, 0x1c // 02E90912
  jne near fps_loc_02E90A76 // 02E90915
  cmp dword ptr [ecx], TOS.exe+4789B8 // 02E9091B
  jne near fps_loc_02E90A76 // 02E90921
  fld1 // 02E90927
  xor eax, eax // 02E90929
  fchs // 02E9092B
  fld dword ptr [fps_orb_rdata] // 02E9092D
  fld st(1) // 02E90933
  fld st(1) // 02E90935
fps_loc_02E90937:
  fldz // 02E90937
  fld dword ptr [ecx + eax*#8 + 0xa4] // 02E90939
  fcomi st(1) // 02E90940
  jb near fps_loc_02E90A2A // 02E90942
  fld1 // 02E90948
  fcomi st(1) // 02E9094A
  jb near fps_loc_02E90A38 // 02E9094C
  fld dword ptr [ecx + eax*#8 + 0xa8] // 02E90952
  fcomi st(3) // 02E90959
  fstp st(3) // 02E9095B
  jb near fps_loc_02E90A48 // 02E9095D
  fcomip st(2) // 02E90963
  jb near fps_loc_02E90A58 // 02E90965
  fxch st(2) // 02E9096B
  fcomi st(2) // 02E9096D
  fcmovnbe st(2) // 02E9096F
  fxch st(2) // 02E90971
  fcomi st(3) // 02E90973
  fcmovbe st(3) // 02E90975
  fstp st(3) // 02E90977
  fxch st(3) // 02E90979
  fcomi st(3) // 02E9097B
  fcmovnbe st(3) // 02E9097D
  fxch st(3) // 02E9097F
  fcomi st(4) // 02E90981
  fcmovbe st(4) // 02E90983
  fstp st(4) // 02E90985
  inc eax // 02E90987
  cmp eax, #4 // 02E90988
  jne short fps_loc_02E90937 // 02E9098B
  fld dword ptr [darkness_orb+A04] // 02E9098D
  mov al, #0 // 02E90993
  fucomip st(1) // 02E90995
  fstp st(0) // 02E90997
  setnp dl // 02E90999
  cmovne edx, eax // 02E9099C
  test dl, dl // 02E9099F
  je near fps_loc_02E90A66 // 02E909A1
  fld dword ptr [darkness_orb+A08] // 02E909A7
  fucomip st(1) // 02E909AD
  fstp st(0) // 02E909AF
  setnp dl // 02E909B1
  cmovne edx, eax // 02E909B4
  test dl, dl // 02E909B7
  je near fps_loc_02E90A6E // 02E909B9
  fld dword ptr [darkness_orb+A0C] // 02E909BF
  fucomip st(1) // 02E909C5
  fstp st(0) // 02E909C7
  setnp dl // 02E909C9
  cmovne edx, eax // 02E909CC
  test dl, dl // 02E909CF
  je near fps_loc_02E90A74 // 02E909D1
  fld dword ptr [darkness_orb+A10] // 02E909D7
  fucomip st(1) // 02E909DD
  fstp st(0) // 02E909DF
  setnp dl // 02E909E1
  cmove eax, edx // 02E909E4
  test al, al // 02E909E7
  je near fps_loc_02E90A76 // 02E909E9
  inc dword ptr [darkness_orb_state+8] // 02E909EF
  lea edx, [ecx + 0xa4] // 02E909F5
  lea eax, [ecx + 0x64] // 02E909FB
  mov dword ptr [ecx], fps_orb_vt3 // 02E909FE
fps_loc_02E90A04:
  fld dword ptr [eax] // 02E90A04
  fld dword ptr [eax + #4] // 02E90A06
  fcomi st(1) // 02E90A09
  fcmovbe st(1) // 02E90A0B
  fstp st(1) // 02E90A0D
  fld dword ptr [eax + #8] // 02E90A0F
  fcomi st(1) // 02E90A12
  fcmovbe st(1) // 02E90A14
  fstp st(1) // 02E90A16
  add eax, 0x10 // 02E90A18
  fst dword ptr [eax - #8] // 02E90A1B
  fst dword ptr [eax - 0xc] // 02E90A1E
  fstp dword ptr [eax - 0x10] // 02E90A21
  cmp edx, eax // 02E90A24
  jne short fps_loc_02E90A04 // 02E90A26
  jmp short fps_loc_02E90A76 // 02E90A28
fps_loc_02E90A2A:
  fstp st(0) // 02E90A2A
  fstp st(0) // 02E90A2C
  fstp st(0) // 02E90A2E
  fstp st(0) // 02E90A30
  fstp st(0) // 02E90A32
  fstp st(0) // 02E90A34
  jmp short fps_loc_02E90A76 // 02E90A36
fps_loc_02E90A38:
  fstp st(0) // 02E90A38
  fstp st(0) // 02E90A3A
  fstp st(0) // 02E90A3C
  fstp st(0) // 02E90A3E
  fstp st(0) // 02E90A40
  fstp st(0) // 02E90A42
  fstp st(0) // 02E90A44
  jmp short fps_loc_02E90A76 // 02E90A46
fps_loc_02E90A48:
  fstp st(0) // 02E90A48
  fstp st(0) // 02E90A4A
  fstp st(0) // 02E90A4C
  fstp st(0) // 02E90A4E
  fstp st(0) // 02E90A50
  fstp st(0) // 02E90A52
  fstp st(0) // 02E90A54
  jmp short fps_loc_02E90A76 // 02E90A56
fps_loc_02E90A58:
  fstp st(0) // 02E90A58
  fstp st(0) // 02E90A5A
  fstp st(0) // 02E90A5C
  fstp st(0) // 02E90A5E
  fstp st(0) // 02E90A60
  fstp st(0) // 02E90A62
  jmp short fps_loc_02E90A76 // 02E90A64
fps_loc_02E90A66:
  fstp st(0) // 02E90A66
  fstp st(0) // 02E90A68
  fstp st(0) // 02E90A6A
  jmp short fps_loc_02E90A76 // 02E90A6C
fps_loc_02E90A6E:
  fstp st(0) // 02E90A6E
  fstp st(0) // 02E90A70
  jmp short fps_loc_02E90A76 // 02E90A72
fps_loc_02E90A74:
  fstp st(0) // 02E90A74
fps_loc_02E90A76:
  mov eax, fps_darkness_text_submit3 // 02E90A76
  jmp eax // 02E90A7B
  nop // 02E90A7D
  nop // 02E90A7E
  nop // 02E90A7F

// Nine-entry 3D orb vtable; includes native bounds method in slot 8.
fps_orb_vt3:
  dd TOS.exe+186B20 // 02E90A80: vtable callback
  dd TOS.exe+188630 // 02E90A84: vtable callback
  dd TOS.exe+1873D0 // 02E90A88: vtable callback
  dd TOS.exe+1874C0 // 02E90A8C: vtable callback
  dd TOS.exe+187510 // 02E90A90: vtable callback
  dd TOS.exe+187360 // 02E90A94: vtable callback
  dd fps_orb_text_execute3 // 02E90A98: vtable callback
  dd fps_orb_text_clone3 // 02E90A9C: vtable callback
  dd TOS.exe+1872E0 // 02E90AA0: vtable callback
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AA4: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AB4: constants / retained padding

// Corrected nine-entry common Darkness 3D vtable; callbacks reach the common helper allocation.
fps_orb_commonvt3:
  dd TOS.exe+186B20 // 02E90AC0: vtable callback
  dd TOS.exe+188630 // 02E90AC4: vtable callback
  dd TOS.exe+1873D0 // 02E90AC8: vtable callback
  dd TOS.exe+1874C0 // 02E90ACC: vtable callback
  dd TOS.exe+187510 // 02E90AD0: vtable callback
  dd TOS.exe+187360 // 02E90AD4: vtable callback
  dd fps_darkness_text_execute3 // 02E90AD8: vtable callback
  dd fps_darkness_text_clone3 // 02E90ADC: vtable callback
  dd TOS.exe+1872E0 // 02E90AE0: vtable callback
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AE4: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00 // 02E90AF4: constants / retained padding

// Floating-point UV classifier and sample constants; never interpret as code.
fps_orb_rdata:
  db 00,00,00,40,00,00,41,3E,00,00,7F,3E,00,00,C1,3E // 02E90B00: constants / retained padding
  db 00,00,FF,3E // 02E90B10: constants / retained padding

// Compiler identification string retained from reference binary.
fps_orb_rdata_zzz:
  db 47,43,43,3A,20,28,47,4E,55,29,20,31,36,2E,32,2E // 02E90B14: constants / retained padding
  db 30,00,00,00 // 02E90B24: constants / retained padding

// Immutable 15-DWORD ps_3_0 shader tail plus four padding bytes; DWORD shader register tokens are not executable addresses.
fps_orb_data:
  db 01,00,00,02,1E,00,0F,80,DF,00,E4,A0,5F,00,00,03 // 02E90B28: constants / retained padding
  db 1E,00,0F,80,1E,00,E4,80,01,08,E4,A0,05,00,00,03 // 02E90B38: constants / retained padding
  db 1F,00,07,80,1F,00,E4,80,1E,00,E4,80,01,00,00,02 // 02E90B48: constants / retained padding
  db 00,08,0F,80,1F,00,E4,80,FF,FF,00,00,00,00,00,00 // 02E90B58: constants / retained padding

// ======================================================================
// darkness_orb_state: reference 02E92000..02E9289F.
// Zero-initialized cache/diagnostics. Runtime device, shader, texture pointers must start zero and be writable.
// Allocation bytes start at zero; no debugger state is copied.
darkness_orb_state:
  db 00

// ======================================================================
// darkness_shader: reference 02E94020..02E9502B.
darkness_shader:

// Classify still-white E/F/G/H/I atlas rectangles after normal UV remapping.
fps_darkness_text_dark_family:
  fld1 // 02E94020
  mov edx, eax // 02E94022
  xor eax, eax // 02E94024
  fchs // 02E94026
  fld st(0) // 02E94028
  fld dword ptr [fps_darkness_rdata] // 02E9402A
  fld st(0) // 02E94030
  jmp short fps_loc_02E9403A // 02E94032
fps_loc_02E94034:
  fstp st(2) // 02E94034
  fstp st(0) // 02E94036
  fxch st(1) // 02E94038
fps_loc_02E9403A:
  fld dword ptr [darkness_shader+F80] // 02E9403A
  fld dword ptr [edx + eax*#8] // 02E94040
  fmul st(0), st(1) // 02E94043
  fldz // 02E94045
  fxch st(1) // 02E94047
  fcomi st(1) // 02E94049
  jae near fps_loc_02E94144 // 02E9404B
  fstp st(0) // 02E94051
  fstp st(0) // 02E94053
  fstp st(0) // 02E94055
  fstp st(0) // 02E94057
  fstp st(0) // 02E94059
  fstp st(0) // 02E9405B
  fstp st(0) // 02E9405D
  jmp near fps_loc_02E94141 // 02E9405F
fps_loc_02E94064:
  fstp st(0) // 02E94064
  fstp st(0) // 02E94066
  fstp st(0) // 02E94068
  fstp st(0) // 02E9406A
  fstp st(0) // 02E9406C
  fstp st(0) // 02E9406E
  fstp st(0) // 02E94070
  jmp near fps_loc_02E94141 // 02E94072
fps_loc_02E94077:
  fstp st(0) // 02E94077
  fstp st(0) // 02E94079
  fstp st(0) // 02E9407B
  fstp st(0) // 02E9407D
  fstp st(0) // 02E9407F
  fstp st(0) // 02E94081
  fstp st(0) // 02E94083
  jmp near fps_loc_02E94141 // 02E94085
fps_loc_02E9408A:
  fstp st(0) // 02E9408A
  fstp st(0) // 02E9408C
  fstp st(0) // 02E9408E
  fstp st(0) // 02E94090
  fstp st(0) // 02E94092
  fstp st(0) // 02E94094
  jmp near fps_loc_02E94141 // 02E94096
fps_loc_02E9409B:
  fstp st(0) // 02E9409B
  fstp st(0) // 02E9409D
  fstp st(0) // 02E9409F
  fstp st(0) // 02E940A1
  fstp st(0) // 02E940A3
  fstp st(0) // 02E940A5
  jmp near fps_loc_02E94141 // 02E940A7
fps_loc_02E940AC:
  fstp st(0) // 02E940AC
  fstp st(0) // 02E940AE
  fstp st(0) // 02E940B0
  fstp st(0) // 02E940B2
  fstp st(0) // 02E940B4
  fstp st(0) // 02E940B6
  jmp near fps_loc_02E94141 // 02E940B8
fps_loc_02E940BD:
  fstp st(0) // 02E940BD
  fstp st(0) // 02E940BF
  fstp st(0) // 02E940C1
  jmp short fps_loc_02E94141 // 02E940C3
fps_loc_02E940C5:
  fstp st(0) // 02E940C5
  fstp st(0) // 02E940C7
  jmp short fps_loc_02E94141 // 02E940C9
fps_loc_02E940CB:
  fstp st(0) // 02E940CB
  jmp short fps_loc_02E94141 // 02E940CD
fps_loc_02E940CF:
  fstp st(0) // 02E940CF
  fstp st(0) // 02E940D1
  fstp st(0) // 02E940D3
  fstp st(0) // 02E940D5
  fstp st(0) // 02E940D7
  jmp short fps_loc_02E94141 // 02E940D9
fps_loc_02E940DB:
  fstp st(0) // 02E940DB
  fstp st(0) // 02E940DD
  fstp st(0) // 02E940DF
  fstp st(0) // 02E940E1
  fstp st(0) // 02E940E3
  jmp short fps_loc_02E94141 // 02E940E5
fps_loc_02E940E7:
  fstp st(0) // 02E940E7
  fstp st(0) // 02E940E9
  fstp st(0) // 02E940EB
  fstp st(0) // 02E940ED
  fstp st(0) // 02E940EF
  fstp st(0) // 02E940F1
  jmp short fps_loc_02E94141 // 02E940F3
fps_loc_02E940F5:
  fstp st(0) // 02E940F5
  fstp st(0) // 02E940F7
  fstp st(0) // 02E940F9
  fstp st(0) // 02E940FB
  fstp st(0) // 02E940FD
  fstp st(0) // 02E940FF
  jmp short fps_loc_02E94141 // 02E94101
fps_loc_02E94103:
  fstp st(0) // 02E94103
  fstp st(0) // 02E94105
  fstp st(0) // 02E94107
  fstp st(0) // 02E94109
  fstp st(0) // 02E9410B
  fstp st(0) // 02E9410D
  jmp short fps_loc_02E94141 // 02E9410F
fps_loc_02E94111:
  fstp st(0) // 02E94111
  fstp st(0) // 02E94113
  fstp st(0) // 02E94115
  fstp st(0) // 02E94117
  jmp short fps_loc_02E94141 // 02E94119
fps_loc_02E9411B:
  fstp st(0) // 02E9411B
  jmp short fps_loc_02E94141 // 02E9411D
fps_loc_02E9411F:
  fstp st(0) // 02E9411F
  fstp st(0) // 02E94121
  fstp st(0) // 02E94123
  fstp st(0) // 02E94125
  jmp short fps_loc_02E94141 // 02E94127
fps_loc_02E94129:
  fstp st(0) // 02E94129
  fstp st(0) // 02E9412B
  fstp st(0) // 02E9412D
  jmp short fps_loc_02E94141 // 02E9412F
fps_loc_02E94131:
  fstp st(0) // 02E94131
  fstp st(0) // 02E94133
  fstp st(0) // 02E94135
  jmp short fps_loc_02E94141 // 02E94137
fps_loc_02E94139:
  fstp st(0) // 02E94139
  fstp st(0) // 02E9413B
  jmp short fps_loc_02E94141 // 02E9413D
fps_loc_02E9413F:
  fstp st(0) // 02E9413F
fps_loc_02E94141:
  xor eax, eax // 02E94141
  ret // 02E94143
fps_loc_02E94144:
  fxch st(2) // 02E94144
  fcomi st(2) // 02E94146
  jb near fps_loc_02E94064 // 02E94148
  fld dword ptr [edx + eax*#8 + #4] // 02E9414E
  fmul st(0), st(1) // 02E94152
  fcomi st(2) // 02E94154
  fstp st(2) // 02E94156
  jb near fps_loc_02E94077 // 02E94158
  fcomip st(1) // 02E9415E
  jb near fps_loc_02E9408A // 02E94160
  fxch st(2) // 02E94166
  fcomi st(1) // 02E94168
  fcmovnbe st(1) // 02E9416A
  fld st(0) // 02E9416C
  fxch st(2) // 02E9416E
  fcomi st(5) // 02E94170
  fcmovbe st(5) // 02E94172
  fstp st(5) // 02E94174
  fxch st(3) // 02E94176
  fcomi st(2) // 02E94178
  fcmovnbe st(2) // 02E9417A
  fld st(0) // 02E9417C
  fxch st(3) // 02E9417E
  fcomi st(6) // 02E94180
  fcmovbe st(6) // 02E94182
  fstp st(6) // 02E94184
  inc eax // 02E94186
  cmp eax, #4 // 02E94187
  jne near fps_loc_02E94034 // 02E9418A
  fxch st(3) // 02E94190
  fcomi st(4) // 02E94192
  jae near fps_loc_02E9409B // 02E94194
  fxch st(3) // 02E9419A
  fcomi st(5) // 02E9419C
  jae near fps_loc_02E940AC // 02E9419E
  fld dword ptr [darkness_shader+F84] // 02E941A4
  fxch st(1) // 02E941AA
  fcomi st(1) // 02E941AC
  fstp st(1) // 02E941AE
  jb short fps_loc_02E94206 // 02E941B0
  fstp st(0) // 02E941B2
  fstp st(0) // 02E941B4
  fld dword ptr [darkness_shader+F88] // 02E941B6
  fcomip st(1) // 02E941BC
  jb near fps_loc_02E942A3 // 02E941BE
  fstp st(0) // 02E941C4
  fld dword ptr [darkness_shader+F8C] // 02E941C6
  fxch st(3) // 02E941CC
  fcomi st(3) // 02E941CE
  fstp st(3) // 02E941D0
  jb near fps_loc_02E940BD // 02E941D2
  fld dword ptr [darkness_shader+F90] // 02E941D8
  fcomip st(3) // 02E941DE
  fstp st(2) // 02E941E0
  jb near fps_loc_02E940C5 // 02E941E2
  fldz // 02E941E8
  fxch st(2) // 02E941EA
  fcomip st(2) // 02E941EC
  fstp st(1) // 02E941EE
  jb near fps_loc_02E940CB // 02E941F0
  fld dword ptr [darkness_shader+F94] // 02E941F6
  xor eax, eax // 02E941FC
  fcomip st(1) // 02E941FE
  fstp st(0) // 02E94200
  setae al // 02E94202
  ret // 02E94205
fps_loc_02E94206:
  fstp st(2) // 02E94206
  fstp st(2) // 02E94208
  fld dword ptr [darkness_shader+F98] // 02E9420A
  fxch st(1) // 02E94210
  fcomi st(1) // 02E94212
  jb near fps_loc_02E940CF // 02E94214
  fld dword ptr [darkness_shader+F9C] // 02E9421A
  fcomi st(1) // 02E94220
  fstp st(1) // 02E94222
  jb near fps_loc_02E940DB // 02E94224
  fld dword ptr [darkness_shader+FA0] // 02E9422A
  fxch st(5) // 02E94230
  fcomi st(5) // 02E94232
  jb near fps_loc_02E940E7 // 02E94234
  fld dword ptr [darkness_shader+FA4] // 02E9423A
  fcomi st(1) // 02E94240
  fstp st(1) // 02E94242
  jb near fps_loc_02E940F5 // 02E94244
  fld dword ptr [darkness_shader+FA8] // 02E9424A
  fxch st(4) // 02E94250
  fcomi st(4) // 02E94252
  fstp st(4) // 02E94254
  jb near fps_loc_02E94103 // 02E94256
  fxch st(1) // 02E9425C
  fcomip st(4) // 02E9425E
  mov eax, #2 // 02E94260
  jae near fps_loc_02E9430C // 02E94265
  fxch st(2) // 02E9426B
  fcomi st(1) // 02E9426D
  fstp st(1) // 02E9426F
  jb near fps_loc_02E94111 // 02E94271
  fxch st(1) // 02E94277
  fcomip st(2) // 02E94279
  mov eax, #3 // 02E9427B
  jae near fps_loc_02E94318 // 02E94280
  fcomip st(2) // 02E94286
  fstp st(1) // 02E94288
  jb near fps_loc_02E9411B // 02E9428A
  fld dword ptr [darkness_shader+FAC] // 02E94290
  xor eax, eax // 02E94296
  fcomip st(1) // 02E94298
  fstp st(0) // 02E9429A
  setae al // 02E9429C
  shl eax, #2 // 02E9429F
  ret // 02E942A2
fps_loc_02E942A3:
  fld dword ptr [darkness_shader+FA0] // 02E942A3
  fxch st(1) // 02E942A9
  fcomi st(1) // 02E942AB
  fstp st(1) // 02E942AD
  jb near fps_loc_02E9411F // 02E942AF
  fld dword ptr [darkness_shader+FA4] // 02E942B5
  fcomip st(1) // 02E942BB
  fstp st(0) // 02E942BD
  jb near fps_loc_02E94129 // 02E942BF
  fld dword ptr [darkness_shader+FB0] // 02E942C5
  fxch st(3) // 02E942CB
  fcomi st(3) // 02E942CD
  fstp st(3) // 02E942CF
  jb near fps_loc_02E94131 // 02E942D1
  fld dword ptr [darkness_shader+FAC] // 02E942D7
  fcomip st(3) // 02E942DD
  fstp st(2) // 02E942DF
  jb near fps_loc_02E94139 // 02E942E1
  fld dword ptr [darkness_shader+FA8] // 02E942E7
  fxch st(2) // 02E942ED
  fcomip st(2) // 02E942EF
  fstp st(1) // 02E942F1
  jb near fps_loc_02E9413F // 02E942F3
  fld dword ptr [darkness_shader+FB4] // 02E942F9
  fcomip st(1) // 02E942FF
  fstp st(0) // 02E94301
  sbb eax, eax // 02E94303
  not eax // 02E94305
  and eax, #5 // 02E94307
  jmp short fps_loc_02E9431E // 02E9430A
fps_loc_02E9430C:
  fstp st(0) // 02E9430C
  fstp st(0) // 02E9430E
  fstp st(0) // 02E94310
  fstp st(0) // 02E94312
  fstp st(0) // 02E94314
  jmp short fps_loc_02E9431E // 02E94316
fps_loc_02E94318:
  fstp st(0) // 02E94318
  fstp st(0) // 02E9431A
  fstp st(0) // 02E9431C
fps_loc_02E9431E:
  ret // 02E9431E
  nop // 02E9431F

// Clone the native 2D command then restore the specialized vtable.
fps_darkness_text_clone2:
  push ebp // 02E94320
  mov eax, TOS.exe+185710 // 02E94321
  mov ebp, esp // 02E94326
  call eax // 02E94328
  test eax, eax // 02E9432A
  je short fps_loc_02E9433A // 02E9432C
  mov dword ptr [eax], fps_darkness_vt2 // 02E9432E
  inc dword ptr [darkness_shader_state+20] // 02E94334
fps_loc_02E9433A:
  pop ebp // 02E9433A
  ret // 02E9433B

// Clone the native 3D command then restore the specialized vtable.
fps_darkness_text_clone3:
  push ebp // 02E9433C
  mov eax, TOS.exe+187660 // 02E9433D
  mov ebp, esp // 02E94342
  call eax // 02E94344
  test eax, eax // 02E94346
  je short fps_loc_02E94356 // 02E94348
  mov dword ptr [eax], fps_orb_commonvt3 // 02E9434A
  inc dword ptr [darkness_shader_state+20] // 02E94350
fps_loc_02E94356:
  pop ebp // 02E94356
  ret // 02E94357

// Bounded diagnostic counters and up to eight observed texture/UV combinations.
fps_darkness_text_observe:
  inc dword ptr [darkness_shader_state+8A4] // 02E94358
  mov ecx, eax // 02E9435E
  mov eax, dword ptr [TOS.exe+72026C] // 02E94360
  shr eax, #4 // 02E94365
  cmp eax, 0xe // 02E94368
  jne near fps_loc_02E94430 // 02E9436B
  inc dword ptr [darkness_shader_state+8A8] // 02E94371
  mov eax, dword ptr [ecx] // 02E94377
  cmp eax, TOS.exe+4789B8 // 02E94379
  je short fps_loc_02E9438B // 02E9437E
  cmp eax, TOS.exe+474370 // 02E94380
  jne near fps_loc_02E94430 // 02E94385
fps_loc_02E9438B:
  push ebp // 02E9438B
  xor eax, eax // 02E9438C
  mov ebp, esp // 02E9438E
  push edi // 02E94390
  push esi // 02E94391
  mov esi, dword ptr [darkness_shader_state+8AC] // 02E94392
  push ebx // 02E94398
fps_loc_02E94399:
  cmp esi, eax // 02E94399
  je short fps_loc_02E943DD // 02E9439B
  imul ebx, eax, 0x2c // 02E9439D
  mov edi, dword ptr [TOS.exe+720268] // 02E943A0
  cmp dword ptr [ebx + darkness_shader_state+8B4], edi // 02E943A6
  jne short fps_loc_02E943DA // 02E943AC
  fld dword ptr [ebx + darkness_shader_state+8BC] // 02E943AE
  fld dword ptr [ecx + 0xa4] // 02E943B4
  fxch st(1) // 02E943BA
  fucomip st(1) // 02E943BC
  fstp st(0) // 02E943BE
  jp short fps_loc_02E943DA // 02E943C0
  jne short fps_loc_02E943DA // 02E943C2
  fld dword ptr [ebx + darkness_shader_state+8C0] // 02E943C4
  fld dword ptr [ecx + 0xa8] // 02E943CA
  fxch st(1) // 02E943D0
  fucomip st(1) // 02E943D2
  fstp st(0) // 02E943D4
  jp short fps_loc_02E943DA // 02E943D6
  je short fps_loc_02E9442B // 02E943D8
fps_loc_02E943DA:
  inc eax // 02E943DA
  jmp short fps_loc_02E94399 // 02E943DB
fps_loc_02E943DD:
  cmp eax, #8 // 02E943DD
  je short fps_loc_02E9442B // 02E943E0
  imul edx, eax, 0x2c // 02E943E2
  mov ebx, dword ptr [TOS.exe+72026C] // 02E943E5
  imul esi, eax, 0xb // 02E943EB
  mov dword ptr [edx + darkness_shader_state+8B0], ebx // 02E943EE
  mov ebx, dword ptr [TOS.exe+720268] // 02E943F4
  mov dword ptr [edx + darkness_shader_state+8B4], ebx // 02E943FA
  mov ebx, dword ptr [ecx] // 02E94400
  mov dword ptr [edx + darkness_shader_state+8B8], ebx // 02E94402
  xor edx, edx // 02E94408
fps_loc_02E9440A:
  fld dword ptr [ecx + edx*#4 + 0xa4] // 02E9440A
  lea ebx, [edx + esi + 0x22c] // 02E94411
  inc edx // 02E94418
  fstp dword ptr [ebx*#4 + darkness_shader_state+C] // 02E94419
  cmp edx, #8 // 02E94420
  jne short fps_loc_02E9440A // 02E94423
  inc eax // 02E94425
  mov dword ptr [darkness_shader_state+8AC], eax // 02E94426
fps_loc_02E9442B:
  pop ebx // 02E9442B
  pop esi // 02E9442C
  pop edi // 02E9442D
  pop ebp // 02E9442E
  ret // 02E9442F
fps_loc_02E94430:
  ret // 02E94430
  nop // 02E94431
  nop // 02E94432
  nop // 02E94433

// Replace only the expected newly queued indexed draw callback.
fps_darkness_text_tag:
  mov edx, dword ptr [TOS.exe+19B9BCC] // 02E94434
  lea ecx, [edx - 0x20] // 02E9443A
  cmp ecx, eax // 02E9443D
  jne short fps_loc_02E9445F // 02E9443F
  cmp dword ptr [eax], TOS.exe+1D6EC0 // 02E94441
  jne short fps_loc_02E9445F // 02E94447
  cmp dword ptr [edx - 0x1c], TOS.exe+1CF250 // 02E94449
  jne short fps_loc_02E9445F // 02E94450
  mov dword ptr [edx - 0x1c], fps_darkness_text_draw // 02E94452
  inc dword ptr [darkness_shader_state+24] // 02E94459
fps_loc_02E9445F:
  ret // 02E9445F

// Call native 2D execution and tag the queued indexed draw.
fps_darkness_text_execute2:
  push ebp // 02E94460
  mov eax, TOS.exe+185700 // 02E94461
  mov ebp, esp // 02E94466
  call eax // 02E94468
  pop ebp // 02E9446A
  jmp near fps_darkness_text_tag // 02E9446B

// Call native 3D execution and tag the queued indexed draw.
fps_darkness_text_execute3:
  push ebp // 02E94470
  mov eax, TOS.exe+187650 // 02E94471
  mov ebp, esp // 02E94476
  call eax // 02E94478
  pop ebp // 02E9447A
  jmp near fps_darkness_text_tag // 02E9447B

// Cache up to eight device/original-shader pairs; transform supported bytecode; release evicted COM references.
fps_darkness_text_variant:
  push ebp // 02E94480
  mov ebp, esp // 02E94481
  push edi // 02E94483
  mov edi, eax // 02E94484
  xor eax, eax // 02E94486
  push esi // 02E94488
  mov esi, edx // 02E94489
  push ebx // 02E9448B
  sub esp, 0x105c // 02E9448C
  mov dword ptr [ebp - 0x1068], 0x800 // 02E94492
fps_loc_02E9449C:
  imul ecx, eax, 0xc // 02E9449C
  cmp dword ptr [ecx + darkness_shader_state+840], edi // 02E9449F
  jne short fps_loc_02E944BA // 02E944A5
  cmp dword ptr [ecx + darkness_shader_state+844], esi // 02E944A7
  jne short fps_loc_02E944BA // 02E944AD
  mov eax, dword ptr [ecx + darkness_shader_state+848] // 02E944AF
  jmp near fps_loc_02E94657 // 02E944B5
fps_loc_02E944BA:
  inc eax // 02E944BA
  cmp eax, #8 // 02E944BB
  jne short fps_loc_02E9449C // 02E944BE
  inc dword ptr [darkness_shader_state+28] // 02E944C0
  mov ebx, dword ptr [darkness_shader_state+8A0] // 02E944C6
  lea eax, [ebx + #1] // 02E944CC
  and ebx, #7 // 02E944CF
  imul edx, ebx, 0xc // 02E944D2
  mov dword ptr [darkness_shader_state+8A0], eax // 02E944D5
  lea eax, [edx + fps_darkness_data_state] // 02E944DA
  cmp dword ptr [edx + darkness_shader_state+848], #0 // 02E944E0
  je short fps_loc_02E944FA // 02E944E7
  mov edx, dword ptr [edx + darkness_shader_state+848] // 02E944E9
  mov edx, dword ptr [edx] // 02E944EF
  push dword ptr [eax + 0x848] // 02E944F1
  call dword ptr [edx + #8] // 02E944F7
fps_loc_02E944FA:
  imul edx, ebx, 0xc // 02E944FA
  lea eax, [edx + fps_darkness_data_state] // 02E944FD
  cmp dword ptr [edx + darkness_shader_state+844], #0 // 02E94503
  je short fps_loc_02E9451D // 02E9450A
  mov edx, dword ptr [edx + darkness_shader_state+844] // 02E9450C
  mov edx, dword ptr [edx] // 02E94512
  push dword ptr [eax + 0x844] // 02E94514
  call dword ptr [edx + #8] // 02E9451A
fps_loc_02E9451D:
  imul edx, ebx, 0xc // 02E9451D
  lea eax, [edx + fps_darkness_data_state] // 02E94520
  cmp dword ptr [edx + darkness_shader_state+840], #0 // 02E94526
  je short fps_loc_02E94540 // 02E9452D
  mov edx, dword ptr [edx + darkness_shader_state+840] // 02E9452F
  mov edx, dword ptr [edx] // 02E94535
  push dword ptr [eax + 0x840] // 02E94537
  call dword ptr [edx + #8] // 02E9453D
fps_loc_02E94540:
  imul eax, ebx, 0xc // 02E94540
  xor edx, edx // 02E94543
  mov dword ptr [eax + darkness_shader_state+840], edi // 02E94545
  mov dword ptr [eax + darkness_shader_state+844], esi // 02E9454B
  mov dword ptr [eax + darkness_shader_state+848], edx // 02E94551
  mov eax, dword ptr [edi] // 02E94557
  push edi // 02E94559
  call dword ptr [eax + #4] // 02E9455A
  mov eax, dword ptr [esi] // 02E9455D
  push esi // 02E9455F
  call dword ptr [eax + #4] // 02E94560
  mov eax, dword ptr [esi] // 02E94563
  lea edx, [ebp - 0x1068] // 02E94565
  push edx // 02E9456B
  push #0 // 02E9456C
  push esi // 02E9456E
  call dword ptr [eax + 0x10] // 02E9456F
  mov dword ptr [darkness_shader_state+2C], eax // 02E94572
  test eax, eax // 02E94577
  js short fps_loc_02E945BE // 02E94579
  mov eax, dword ptr [ebp - 0x1068] // 02E9457B
  cmp eax, 0x800 // 02E94581
  ja short fps_loc_02E945BE // 02E94586
  test al, #3 // 02E94588
  lea edx, [ebp - 0x1068] // 02E9458A
  jne short fps_loc_02E945BE // 02E94590
  mov eax, dword ptr [esi] // 02E94592
  push edx // 02E94594
  lea edx, [ebp - 0x1060] // 02E94595
  push edx // 02E9459B
  push esi // 02E9459C
  call dword ptr [eax + 0x10] // 02E9459D
  mov dword ptr [darkness_shader_state+2C], eax // 02E945A0
  test eax, eax // 02E945A5
  js short fps_loc_02E945BE // 02E945A7
  mov edx, dword ptr [ebp - 0x1068] // 02E945A9
  cmp edx, 0x800 // 02E945AF
  ja short fps_loc_02E945BE // 02E945B5
  mov eax, edx // 02E945B7
  and eax, #3 // 02E945B9
  je short fps_loc_02E945CF // 02E945BC
fps_loc_02E945BE:
  mov dword ptr [darkness_shader_state+30], #1 // 02E945BE
fps_loc_02E945C8:
  xor eax, eax // 02E945C8
  jmp near fps_loc_02E94657 // 02E945CA
fps_loc_02E945CF:
  shr edx, #2 // 02E945CF
  mov dword ptr [darkness_shader_state+3C], edx // 02E945D2
fps_loc_02E945D8:
  cmp edx, eax // 02E945D8
  lea esi, [ebp - 0x1060] // 02E945DA
  je short fps_loc_02E945EF // 02E945E0
  mov ecx, dword ptr [esi + eax*#4] // 02E945E2
  mov dword ptr [eax*#4 + darkness_shader_state+40], ecx // 02E945E5
  inc eax // 02E945EC
  jmp short fps_loc_02E945D8 // 02E945ED
fps_loc_02E945EF:
  lea ecx, [ebp - 0x860] // 02E945EF
  mov eax, esi // 02E945F5
  call fps_darkness_text_dark_transform_constprop_0 // 02E945F7
  lea ecx, [ebp - 0x860] // 02E945FC
  test eax, eax // 02E94602
  jne short fps_loc_02E94612 // 02E94604
  mov dword ptr [darkness_shader_state+30], #2 // 02E94606
  jmp short fps_loc_02E945C8 // 02E94610
fps_loc_02E94612:
  mov eax, dword ptr [edi] // 02E94612
  lea edx, [ebp - 0x1064] // 02E94614
  xor esi, esi // 02E9461A
  mov dword ptr [ebp - 0x1064], esi // 02E9461C
  push edx // 02E94622
  push ecx // 02E94623
  push edi // 02E94624
  call dword ptr [eax + 0x1a8] // 02E94625
  mov dword ptr [darkness_shader_state+2C], eax // 02E9462B
  test eax, eax // 02E94630
  jns short fps_loc_02E94640 // 02E94632
  mov dword ptr [darkness_shader_state+30], #3 // 02E94634
  jmp short fps_loc_02E945C8 // 02E9463E
fps_loc_02E94640:
  imul ebx, ebx, 0xc // 02E94640
  mov eax, dword ptr [ebp - 0x1064] // 02E94643
  xor edx, edx // 02E94649
  mov dword ptr [ebx + darkness_shader_state+848], eax // 02E9464B
  mov dword ptr [darkness_shader_state+30], edx // 02E94651
fps_loc_02E94657:
  lea esp, [ebp - 0xc] // 02E94657
  pop ebx // 02E9465A
  pop esi // 02E9465B
  pop edi // 02E9465C
  pop ebp // 02E9465D
  ret // 02E9465E
  nop // 02E9465F

// Select specialized 2D vtable only for common-atlas palette-14 still-white Darkness rectangles.
fps_darkness_text_submit2:
  push ebp // 02E94660
  mov eax, ecx // 02E94661
  mov ebp, esp // 02E94663
  push ebx // 02E94665
  mov ebx, ecx // 02E94666
  call fps_darkness_text_observe // 02E94668
  cmp dword ptr [TOS.exe+720268], 0xd000000 // 02E9466D
  jne short fps_loc_02E946AA // 02E94677
  mov eax, dword ptr [TOS.exe+72026C] // 02E94679
  shr eax, #4 // 02E9467E
  cmp eax, 0xe // 02E94681
  jne short fps_loc_02E946AA // 02E94684
  cmp dword ptr [ebx], TOS.exe+474370 // 02E94686
  jne short fps_loc_02E946AA // 02E9468C
  lea eax, [ebx + 0xa4] // 02E9468E
  call fps_darkness_text_dark_family // 02E94694
  test eax, eax // 02E94699
  je short fps_loc_02E946AA // 02E9469B
  inc dword ptr [eax*#4 + darkness_shader_state-4] // 02E9469D
  mov dword ptr [ebx], fps_darkness_vt2 // 02E946A4
fps_loc_02E946AA:
  mov ecx, ebx // 02E946AA
  mov eax, TOS.exe+185510 // 02E946AC
  pop ebx // 02E946B1
  pop ebp // 02E946B2
  jmp eax // 02E946B3
  nop // 02E946B5
  nop // 02E946B6
  nop // 02E946B7

// Select corrected common 3D table for eligible Darkness rectangles.
fps_darkness_text_submit3:
  push ebp // 02E946B8
  mov eax, ecx // 02E946B9
  mov ebp, esp // 02E946BB
  push ebx // 02E946BD
  mov ebx, ecx // 02E946BE
  call fps_darkness_text_observe // 02E946C0
  cmp dword ptr [TOS.exe+720268], 0xd000000 // 02E946C5
  jne short fps_loc_02E94702 // 02E946CF
  mov eax, dword ptr [TOS.exe+72026C] // 02E946D1
  shr eax, #4 // 02E946D6
  cmp eax, 0xe // 02E946D9
  jne short fps_loc_02E94702 // 02E946DC
  cmp dword ptr [ebx], TOS.exe+4789B8 // 02E946DE
  jne short fps_loc_02E94702 // 02E946E4
  lea eax, [ebx + 0xa4] // 02E946E6
  call fps_darkness_text_dark_family // 02E946EC
  test eax, eax // 02E946F1
  je short fps_loc_02E94702 // 02E946F3
  inc dword ptr [eax*#4 + darkness_shader_state-4] // 02E946F5
  mov dword ptr [ebx], fps_orb_commonvt3 // 02E946FC
fps_loc_02E94702:
  mov ecx, ebx // 02E94702
  mov eax, TOS.exe+1873D0 // 02E94704
  pop ebx // 02E94709
  pop ebp // 02E9470A
  jmp eax // 02E9470B
  nop // 02E9470D
  nop // 02E9470E
  nop // 02E9470F

// Linker layout padding; preserve as raw data if byte coverage requires it.
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94710: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94720: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94730: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94740: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94750: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94760: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94770: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94780: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94790: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947A0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947B0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947C0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947D0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947E0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E947F0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94800: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94810: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94820: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94830: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94840: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94850: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94860: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94870: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94880: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94890: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948A0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948B0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948C0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948D0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948E0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E948F0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94900: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94910: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94920: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94930: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94940: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94950: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94960: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94970: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94980: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94990: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949A0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949B0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949C0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949D0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949E0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E949F0: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A00: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A10: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A20: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A30: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A40: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94A50: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90 // 02E94A60: constants / retained padding

// Temporarily select D-sampling shader, draw, and restore original shader.
fps_darkness_text_draw:
  push ebp // 02E94A6A
  xor edx, edx // 02E94A6B
  mov ebp, esp // 02E94A6D
  push esi // 02E94A6F
  push ebx // 02E94A70
  push eax // 02E94A71
  mov ebx, dword ptr [TOS.exe+72999C] // 02E94A72
  mov dword ptr [ebp - 0xc], edx // 02E94A78
  lea edx, [ebp - 0xc] // 02E94A7B
  mov eax, dword ptr [ebx] // 02E94A7E
  inc dword ptr [darkness_shader_state+14] // 02E94A80
  push edx // 02E94A86
  push ebx // 02E94A87
  call dword ptr [eax + 0x1b0] // 02E94A88
  test eax, eax // 02E94A8E
  js short fps_loc_02E94AC7 // 02E94A90
  mov edx, dword ptr [ebp - 0xc] // 02E94A92
  test edx, edx // 02E94A95
  je short fps_loc_02E94AC7 // 02E94A97
  mov eax, ebx // 02E94A99
  mov dword ptr [darkness_shader_state+34], edx // 02E94A9B
  call fps_darkness_text_variant // 02E94AA1
  mov esi, eax // 02E94AA6
  test eax, eax // 02E94AA8
  je short fps_loc_02E94AC7 // 02E94AAA
  mov eax, dword ptr [ebx] // 02E94AAC
  push esi // 02E94AAE
  push ebx // 02E94AAF
  call dword ptr [eax + 0x1ac] // 02E94AB0
  mov dword ptr [darkness_shader_state+2C], eax // 02E94AB6
  test eax, eax // 02E94ABB
  js short fps_loc_02E94AC7 // 02E94ABD
  inc dword ptr [darkness_shader_state+18] // 02E94ABF
  jmp short fps_loc_02E94ACF // 02E94AC5
fps_loc_02E94AC7:
  inc dword ptr [darkness_shader_state+1C] // 02E94AC7
  xor esi, esi // 02E94ACD
fps_loc_02E94ACF:
  push dword ptr [ebp + 0x1c] // 02E94ACF
  mov eax, TOS.exe+1CF250 // 02E94AD2
  push dword ptr [ebp + 0x18] // 02E94AD7
  push dword ptr [ebp + 0x14] // 02E94ADA
  push dword ptr [ebp + 0x10] // 02E94ADD
  push dword ptr [ebp + 0xc] // 02E94AE0
  push dword ptr [ebp + #8] // 02E94AE3
  call eax // 02E94AE6
  add esp, 0x18 // 02E94AE8
  test esi, esi // 02E94AEB
  je short fps_loc_02E94AFB // 02E94AED
  mov eax, dword ptr [ebx] // 02E94AEF
  push dword ptr [ebp - 0xc] // 02E94AF1
  push ebx // 02E94AF4
  call dword ptr [eax + 0x1ac] // 02E94AF5
fps_loc_02E94AFB:
  mov eax, dword ptr [ebp - 0xc] // 02E94AFB
  test eax, eax // 02E94AFE
  je short fps_loc_02E94B08 // 02E94B00
  mov edx, dword ptr [eax] // 02E94B02
  push eax // 02E94B04
  call dword ptr [edx + #8] // 02E94B05
fps_loc_02E94B08:
  lea esp, [ebp - #8] // 02E94B08
  pop ebx // 02E94B0B
  pop esi // 02E94B0C
  pop ebp // 02E94B0D
  ret // 02E94B0E
  nop // 02E94B0F
  nop // 02E94B10
  nop // 02E94B11

// Linker layout padding; preserve as raw data if byte coverage requires it.
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B12: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B22: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B32: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B42: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B52: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B62: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B72: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B82: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94B92: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94BA2: constants / retained padding
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02E94BB2: constants / retained padding

// Historical eight-entry 3D vtable, retained but superseded by orb common_vt3.
fps_darkness_vt3:
  dd TOS.exe+186B20 // 02E94BC0: vtable callback
  dd TOS.exe+188630 // 02E94BC4: vtable callback
  dd TOS.exe+1873D0 // 02E94BC8: vtable callback
  dd TOS.exe+1874C0 // 02E94BCC: vtable callback
  dd TOS.exe+187510 // 02E94BD0: vtable callback
  dd TOS.exe+187360 // 02E94BD4: vtable callback
  dd fps_darkness_text_execute3 // 02E94BD8: vtable callback
  dd fps_darkness_text_clone3 // 02E94BDC: vtable callback

// Eight-entry 2D command vtable; clone/execute slots are patch-local pointers.
fps_darkness_vt2:
  dd TOS.exe+186B20 // 02E94BE0: vtable callback
  dd TOS.exe+188630 // 02E94BE4: vtable callback
  dd TOS.exe+185510 // 02E94BE8: vtable callback
  dd TOS.exe+185600 // 02E94BEC: vtable callback
  dd TOS.exe+19E6E0 // 02E94BF0: vtable callback
  dd TOS.exe+1854B0 // 02E94BF4: vtable callback
  dd fps_darkness_text_execute2 // 02E94BF8: vtable callback
  dd fps_darkness_text_clone2 // 02E94BFC: vtable callback

// Validate straight-line ps_3_0 and append same-atlas D RGB multiply, retaining original alpha.
fps_darkness_text_dark_transform_constprop_0:
  push ebp // 02E94C00
  mov ebp, esp // 02E94C01
  push edi // 02E94C03
  push esi // 02E94C04
  push ebx // 02E94C05
  sub esp, 0x74 // 02E94C06
  mov dword ptr [ebp - 0x5c], eax // 02E94C09
  lea eax, [edx - #2] // 02E94C0C
  mov dword ptr [ebp - 0x60], edx // 02E94C0F
  mov dword ptr [ebp - 0x4c], ecx // 02E94C12
  cmp eax, 0x1fe // 02E94C15
  ja near fps_loc_02E94E78 // 02E94C1A
  mov eax, dword ptr [ebp - 0x5c] // 02E94C20
  cmp dword ptr [eax], 0xffff0300 // 02E94C23
  jne near fps_loc_02E94E78 // 02E94C29
  mov eax, dword ptr [ebp - 0x4c] // 02E94C2F
  xor edx, edx // 02E94C32
  xor ecx, ecx // 02E94C34
  mov dword ptr [ebp - 0x50], #7 // 02E94C36
  mov dword ptr [ebp - 0x70], ecx // 02E94C3D
  mov edi, #1 // 02E94C40
  mov dword ptr [eax], 0xffff0300 // 02E94C45
  mov dword ptr [eax + #4], 0x5000051 // 02E94C4B
  mov dword ptr [eax + #8], 0xa00f00df // 02E94C52
  mov dword ptr [eax + 0xc], 0x3f1e4000 // 02E94C59
  mov dword ptr [eax + 0x10], 0x3f104000 // 02E94C60
  mov dword ptr [eax + 0x14], edx // 02E94C67
  mov dword ptr [eax + 0x18], edx // 02E94C6A
  mov eax, dword ptr [ebp - 0x60] // 02E94C6D
  mov dword ptr [ebp - 0x6c], ecx // 02E94C70
  dec eax // 02E94C73
  mov dword ptr [ebp - 0x80], eax // 02E94C74
fps_loc_02E94C77:
  lea eax, [edi*#4] // 02E94C77
  mov dword ptr [ebp - 0x64], eax // 02E94C7E
  mov eax, dword ptr [ebp - 0x5c] // 02E94C81
  mov esi, dword ptr [eax + edi*#4] // 02E94C84
  movzx ebx, si // 02E94C87
  cmp ebx, 0xffff // 02E94C8A
  jne short fps_loc_02E94CF3 // 02E94C90
  cmp esi, 0xffff // 02E94C92
  jne near fps_loc_02E94E78 // 02E94C98
  lea eax, [edi + #1] // 02E94C9E
  cmp dword ptr [ebp - 0x60], eax // 02E94CA1
  jne near fps_loc_02E94E78 // 02E94CA4
  mov eax, dword ptr [ebp - 0x6c] // 02E94CAA
  mov edx, dword ptr [ebp - 0x70] // 02E94CAD
  xor eax, #1 // 02E94CB0
  xor edx, #1 // 02E94CB3
  or eax, edx // 02E94CB6
  jne near fps_loc_02E94E78 // 02E94CB8
  lea edi, [ebp - 0x48] // 02E94CBE
  mov esi, fps_darkness_data // 02E94CC1
  lea ebx, [ebp - 0x48] // 02E94CC6
  mov ecx, 0xf // 02E94CC9
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02E94CCE
  mov edi, dword ptr [ebp - 0x4c] // 02E94CD0
  mov esi, dword ptr [ebp - 0x50] // 02E94CD3
  lea edx, [edi + esi*#4] // 02E94CD6
fps_loc_02E94CD9:
  mov ecx, dword ptr [ebx + eax*#4] // 02E94CD9
  mov dword ptr [edx + eax*#4], ecx // 02E94CDC
  inc eax // 02E94CDF
  cmp eax, 0xf // 02E94CE0
  jne short fps_loc_02E94CD9 // 02E94CE3
  mov eax, dword ptr [ebp - 0x50] // 02E94CE5
  add eax, 0xf // 02E94CE8
  mov dword ptr [ebp - 0x58], eax // 02E94CEB
  jmp near fps_loc_02E94F91 // 02E94CEE
fps_loc_02E94CF3:
  cmp ebx, 0xfffe // 02E94CF3
  jne short fps_loc_02E94D52 // 02E94CF9
  mov eax, dword ptr [ebp - 0x60] // 02E94CFB
  shr esi, 0x10 // 02E94CFE
  and esi, 0x7fff // 02E94D01
  dec eax // 02E94D07
  sub eax, edi // 02E94D08
  cmp eax, esi // 02E94D0A
  jb near fps_loc_02E94E78 // 02E94D0C
  mov eax, dword ptr [ebp - 0x50] // 02E94D12
  db 8D,44,06,01 // lea eax, [esi + eax + #1] // 02E94D15
  mov dword ptr [ebp - 0x54], eax // 02E94D19
  cmp eax, 0x215 // 02E94D1C
  ja near fps_loc_02E94E78 // 02E94D21
  mov eax, dword ptr [ebp - 0x4c] // 02E94D27
  mov ebx, dword ptr [ebp - 0x50] // 02E94D2A
  mov ecx, dword ptr [ebp - 0x64] // 02E94D2D
  add ecx, dword ptr [ebp - 0x5c] // 02E94D30
  lea ebx, [eax + ebx*#4] // 02E94D33
  xor eax, eax // 02E94D36
fps_loc_02E94D38:
  mov edx, dword ptr [ecx + eax*#4] // 02E94D38
  mov dword ptr [ebx + eax*#4], edx // 02E94D3B
  inc eax // 02E94D3E
  cmp esi, eax // 02E94D3F
  jae short fps_loc_02E94D38 // 02E94D41
  mov eax, dword ptr [ebp - 0x54] // 02E94D43
  lea edi, [edi + esi + #1] // 02E94D46
  mov dword ptr [ebp - 0x50], eax // 02E94D4A
  jmp near fps_loc_02E94F83 // 02E94D4D
fps_loc_02E94D52:
  bt esi, 0x1c // 02E94D52
  jb near fps_loc_02E94E78 // 02E94D56
  mov eax, esi // 02E94D5C
  shr eax, 0x18 // 02E94D5E
  and eax, 0xf // 02E94D61
  mov dword ptr [ebp - 0x54], eax // 02E94D64
  mov eax, dword ptr [ebp - 0x80] // 02E94D67
  mov edx, dword ptr [ebp - 0x54] // 02E94D6A
  sub eax, edi // 02E94D6D
  cmp eax, edx // 02E94D6F
  jb near fps_loc_02E94E78 // 02E94D71
  mov eax, dword ptr [ebp - 0x50] // 02E94D77
  inc eax // 02E94D7A
  mov dword ptr [ebp - 0x74], eax // 02E94D7B
  mov ecx, dword ptr [ebp - 0x74] // 02E94D7E
  db 8D,04,0A // lea eax, [edx + ecx] // 02E94D81
  cmp eax, 0x215 // 02E94D84
  ja near fps_loc_02E94E78 // 02E94D89
  cmp ebx, 0x1f // 02E94D8F
  jne short fps_loc_02E94DD0 // 02E94D92
  cmp edx, #2 // 02E94D94
  jne near fps_loc_02E94E78 // 02E94D97
  mov eax, dword ptr [ebp - 0x5c] // 02E94D9D
  mov edx, dword ptr [ebp - 0x64] // 02E94DA0
  cmp dword ptr [eax + edx + #4], 0x90000000 // 02E94DA3
  jne near fps_loc_02E94E9C // 02E94DAB
  mov eax, dword ptr [eax + edx + #8] // 02E94DB1
  mov dword ptr [ebp - 0x58], eax // 02E94DB5
  and eax, 0x70001fff // 02E94DB8
  cmp eax, 0x20000800 // 02E94DBD
  sete al // 02E94DC2
  movzx eax, al // 02E94DC5
  or dword ptr [ebp - 0x6c], eax // 02E94DC8
  jmp near fps_loc_02E94E9C // 02E94DCB
fps_loc_02E94DD0:
  cmp ebx, 0x51 // 02E94DD0
  jne short fps_loc_02E94DE9 // 02E94DD3
  cmp dword ptr [ebp - 0x54], #5 // 02E94DD5
  jne near fps_loc_02E94E78 // 02E94DD9
  mov edx, #1 // 02E94DDF
  jmp near fps_loc_02E94E93 // 02E94DE4
fps_loc_02E94DE9:
  cmp ebx, 0x24 // 02E94DE9
  ja short fps_loc_02E94E45 // 02E94DEC
  cmp ebx, 0xd // 02E94DEE
  ja short fps_loc_02E94E1F // 02E94DF1
  xor edx, edx // 02E94DF3
  test ebx, ebx // 02E94DF5
  je near fps_loc_02E94E8E // 02E94DF7
  mov eax, #1 // 02E94DFD
  mov ecx, ebx // 02E94E02
  shl eax, cl // 02E94E04
  test eax, 0x3f2c // 02E94E06
  jne short fps_loc_02E94E82 // 02E94E0B
  and eax, 0xc2 // 02E94E0D
  cmp eax, #1 // 02E94E12
  sbb edx, edx // 02E94E15
  and edx, #2 // 02E94E17
  add edx, #2 // 02E94E1A
  jmp short fps_loc_02E94E8E // 02E94E1D
fps_loc_02E94E1F:
  lea ecx, [ebx - 0xe] // 02E94E1F
  mov eax, #1 // 02E94E22
  shl eax, cl // 02E94E27
  test eax, 0x600023 // 02E94E29
  jne short fps_loc_02E94E6C // 02E94E2E
  and eax, 0xc0008 // 02E94E30
  mov dword ptr [ebp - 0x58], eax // 02E94E35
  jne short fps_loc_02E94E82 // 02E94E38
  cmp ebx, 0x12 // 02E94E3A
  jne near fps_loc_02E94F91 // 02E94E3D
  jmp short fps_loc_02E94E60 // 02E94E43
fps_loc_02E94E45:
  cmp ebx, 0x41 // 02E94E45
  je short fps_loc_02E94E89 // 02E94E48
  cmp ebx, 0x40 // 02E94E4A
  jbe short fps_loc_02E94E78 // 02E94E4D
  cmp ebx, 0x5a // 02E94E4F
  je short fps_loc_02E94E60 // 02E94E52
  ja short fps_loc_02E94E67 // 02E94E54
  cmp ebx, 0x42 // 02E94E56
  je short fps_loc_02E94E82 // 02E94E59
  cmp ebx, 0x58 // 02E94E5B
  jne short fps_loc_02E94E78 // 02E94E5E
fps_loc_02E94E60:
  mov edx, #4 // 02E94E60
  jmp short fps_loc_02E94E8E // 02E94E65
fps_loc_02E94E67:
  cmp ebx, 0x5c // 02E94E67
  ja short fps_loc_02E94E73 // 02E94E6A
fps_loc_02E94E6C:
  mov edx, #2 // 02E94E6C
  jmp short fps_loc_02E94E8E // 02E94E71
fps_loc_02E94E73:
  cmp ebx, 0x5f // 02E94E73
  je short fps_loc_02E94E82 // 02E94E76
fps_loc_02E94E78:
  xor eax, eax // 02E94E78
  mov dword ptr [ebp - 0x58], eax // 02E94E7A
  jmp near fps_loc_02E94F91 // 02E94E7D
fps_loc_02E94E82:
  mov edx, #3 // 02E94E82
  jmp short fps_loc_02E94E8E // 02E94E87
fps_loc_02E94E89:
  mov edx, #1 // 02E94E89
fps_loc_02E94E8E:
  cmp dword ptr [ebp - 0x54], edx // 02E94E8E
  jne short fps_loc_02E94E78 // 02E94E91
fps_loc_02E94E93:
  mov dword ptr [ebp - 0x68], #1 // 02E94E93
  jmp short fps_loc_02E94EA8 // 02E94E9A
fps_loc_02E94E9C:
  mov dword ptr [ebp - 0x68], #2 // 02E94E9C
  mov edx, #2 // 02E94EA3
fps_loc_02E94EA8:
  mov ecx, dword ptr [ebp - 0x50] // 02E94EA8
  mov eax, dword ptr [ebp - 0x4c] // 02E94EAB
  mov dword ptr [eax + ecx*#4], esi // 02E94EAE
  and esi, 0xffef // 02E94EB1
  cmp esi, 0x41 // 02E94EB7
  mov esi, #1 // 02E94EBA
  sete al // 02E94EBF
  cmp ebx, 0x1f // 02E94EC2
  sete cl // 02E94EC5
  or eax, ecx // 02E94EC8
  mov byte ptr [ebp - 0x75], al // 02E94ECA
  mov eax, dword ptr [ebp - 0x64] // 02E94ECD
  add eax, dword ptr [ebp - 0x5c] // 02E94ED0
  mov dword ptr [ebp - 0x7c], eax // 02E94ED3
  mov eax, dword ptr [ebp - 0x74] // 02E94ED6
  mov dword ptr [ebp - 0x50], eax // 02E94ED9
fps_loc_02E94EDC:
  cmp dword ptr [ebp - 0x54], esi // 02E94EDC
  jb near fps_loc_02E94F7C // 02E94EDF
  mov eax, dword ptr [ebp - 0x7c] // 02E94EE5
  mov ecx, dword ptr [eax + esi*#4] // 02E94EE8
  cmp esi, dword ptr [ebp - 0x68] // 02E94EEB
  jb short fps_loc_02E94F69 // 02E94EEE
  cmp edx, esi // 02E94EF0
  jb short fps_loc_02E94F69 // 02E94EF2
  test ecx, ecx // 02E94EF4
  jns short fps_loc_02E94E78 // 02E94EF6
  mov eax, ecx // 02E94EF8
  and eax, 0x2000 // 02E94EFA
  mov dword ptr [ebp - 0x58], eax // 02E94EFF
  jne near fps_loc_02E94E78 // 02E94F02
  mov ebx, ecx // 02E94F08
  shr ebx, 0x1c // 02E94F0A
  and ebx, #7 // 02E94F0D
  mov eax, ebx // 02E94F10
  mov ebx, ecx // 02E94F12
  shr ebx, #8 // 02E94F14
  and ebx, 0x18 // 02E94F17
  mov dword ptr [ebp - 0x74], ebx // 02E94F1A
  mov ebx, ecx // 02E94F1D
  and ebx, 0x7ff // 02E94F1F
  or eax, dword ptr [ebp - 0x74] // 02E94F25
  mov dword ptr [ebp - 0x64], ebx // 02E94F28
  mov ebx, eax // 02E94F2B
  jne short fps_loc_02E94F35 // 02E94F2D
  cmp dword ptr [ebp - 0x64], 0x1d // 02E94F2F
  ja short fps_loc_02E94F91 // 02E94F33
fps_loc_02E94F35:
  cmp ebx, #2 // 02E94F35
  jne short fps_loc_02E94F43 // 02E94F38
  cmp dword ptr [ebp - 0x64], 0xdf // 02E94F3A
  je short fps_loc_02E94F91 // 02E94F41
fps_loc_02E94F43:
  cmp ebx, #8 // 02E94F43
  jne short fps_loc_02E94F69 // 02E94F46
  cmp esi, #1 // 02E94F48
  jne short fps_loc_02E94F91 // 02E94F4B
  cmp dword ptr [ebp - 0x64], #0 // 02E94F4D
  jne short fps_loc_02E94F91 // 02E94F51
  cmp byte ptr [ebp - 0x75], #0 // 02E94F53
  jne short fps_loc_02E94F91 // 02E94F57
  mov dword ptr [ebp - 0x70], #1 // 02E94F59
  and ecx, 0x8fffe000 // 02E94F60
  or ecx, 0x1f // 02E94F66
fps_loc_02E94F69:
  inc dword ptr [ebp - 0x50] // 02E94F69
  mov eax, dword ptr [ebp - 0x4c] // 02E94F6C
  inc esi // 02E94F6F
  mov ebx, dword ptr [ebp - 0x50] // 02E94F70
  mov dword ptr [eax + ebx*#4 - #4], ecx // 02E94F73
  jmp near fps_loc_02E94EDC // 02E94F77
fps_loc_02E94F7C:
  mov eax, dword ptr [ebp - 0x54] // 02E94F7C
  db 8D,7C,07,01 // lea edi, [edi + eax + #1] // 02E94F7F
fps_loc_02E94F83:
  cmp edi, dword ptr [ebp - 0x60] // 02E94F83
  jb near fps_loc_02E94C77 // 02E94F86
  jmp near fps_loc_02E94E78 // 02E94F8C
fps_loc_02E94F91:
  mov eax, dword ptr [ebp - 0x58] // 02E94F91
  add esp, 0x74 // 02E94F94
  pop ebx // 02E94F97
  pop esi // 02E94F98
  pop edi // 02E94F99
  pop ebp // 02E94F9A
  ret // 02E94F9B

// Floating-point UV classifier and sample constants; never interpret as code.
fps_darkness_rdata:
  db 00,00,00,45,00,00,80,44,B8,7E,C0,43,48,81,C0,43 // 02E94F9C: constants / retained padding
  db B8,7E,DF,43,48,81,DF,43,1F,05,80,42,B8,FE,BF,43 // 02E94FAC: constants / retained padding
  db 48,01,C0,43,B8,FE,DF,43,48,01,E0,43,71,FD,7F,43 // 02E94FBC: constants / retained padding
  db A4,00,00,44,B8,FE,FF,43,48,01,A0,43 // 02E94FCC: constants / retained padding

// Compiler identification string retained from reference binary.
fps_darkness_rdata_zzz:
  db 47,43,43,3A,20,28,47,4E,55,29,20,31,36,2E,32,2E // 02E94FD8: constants / retained padding
  db 30,00,00,00 // 02E94FE8: constants / retained padding

// Immutable 15-DWORD ps_3_0 shader tail plus four padding bytes; DWORD shader register tokens are not executable addresses.
fps_darkness_data:
  db 01,00,00,02,1E,00,0F,80,DF,00,E4,A0,5F,00,00,03 // 02E94FEC: constants / retained padding
  db 1E,00,0F,80,1E,00,E4,80,00,08,E4,A0,05,00,00,03 // 02E94FFC: constants / retained padding
  db 1F,00,07,80,1F,00,E4,80,1E,00,E4,80,01,00,00,02 // 02E9500C: constants / retained padding
  db 00,08,0F,80,1F,00,E4,80,FF,FF,00,00,00,00,00,00 // 02E9501C: constants / retained padding

// ======================================================================
// darkness_shader_state: reference 02E95300..02E95D1F.
// Zero-initialized cache/diagnostics. Runtime device, shader, texture pointers must start zero and be writable.
// Allocation bytes start at zero; no debugger state is copied.
darkness_shader_state:
  db 00

// ======================================================================
// timing_helpers: reference 02EFF000..02EFFE3F.
timing_helpers:

// Reload direction/stick repeat countdown; current v46 value is 4 following later GC UI timing revision.
fps_input_repeat_directions:
  mov dword ptr [edx*#4 + TOS.exe+1831A50], #4 // 02EFF000
  jmp near TOS.exe+137EA6 // 02EFF00B

// Reload button repeat countdown; current v46 value is 4 following later GC UI timing revision.
fps_input_repeat_buttons:
  mov dword ptr [ecx*#4 + TOS.exe+1831C90], #4 // 02EFF010
  jmp near TOS.exe+137EF2 // 02EFF01B
  db 00 // 02EFF020: constants / retained padding

// Wrap loop using doubled loop start plus frame overflow while preserving x87 stack and float32 truncation.
fps_animation_loop_wrap:
  fstp st(0) // 02EFF021
  fld dword ptr [edi + 0x14] // 02EFF023
  fadd st(0), st(0) // 02EFF026
  fld dword ptr [edi + #8] // 02EFF028
  fsub dword ptr [edi + 0x10] // 02EFF02B
  fadd st(0), st(1) // 02EFF02E
  fstp dword ptr [esp + 0x10] // 02EFF030
  fld dword ptr [esp + 0x10] // 02EFF034
  fst dword ptr [edi + #8] // 02EFF038
  jmp near TOS.exe+17B9E6 // 02EFF03B

// Private float 0.5 for half-sized motion and animation steps.
fps_float_half:
  db 00,00,00,3F,00,00,00,00,00,00,00,00,00,00,00 // 02EFF040: constants / retained padding

// Historical half-step XYZ position integration retained in reference; current common NPC hooks use early collision scaling and direct integration.
fps_legacy_npc_half_integrator:
  fld dword ptr [ebx + 0x28] // 02EFF04F
  fmul dword ptr [fps_float_half] // 02EFF052
  fadd dword ptr [ebx + #4] // 02EFF058
  fstp dword ptr [ebx + #4] // 02EFF05B
  fld dword ptr [ebx + 0x2c] // 02EFF05E
  fmul dword ptr [fps_float_half] // 02EFF061
  fadd dword ptr [ebx + #8] // 02EFF067
  fstp dword ptr [ebx + #8] // 02EFF06A
  fld dword ptr [ebx + 0x30] // 02EFF06D
  fmul dword ptr [fps_float_half] // 02EFF070
  fadd dword ptr [ebx + 0xc] // 02EFF076
  fstp dword ptr [ebx + 0xc] // 02EFF079
  jmp near TOS.exe+CF211 // 02EFF07C
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF081: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF091: constants / retained padding

// Halve animation rate on NPC animation setup and replay displaced store.
fps_npc_animation_speed:
  fmul dword ptr [fps_float_half] // 02EFF0A0
  fstp dword ptr [esi + 0x938] // 02EFF0A6
  jmp near TOS.exe+CCF53 // 02EFF0AC
  db 00,00,00,00,00,00,00 // 02EFF0B1: constants / retained padding

// Six float64 emote constants; v46 values preserve restored single-update visual rates, not obsolete halved values in early docs.
fps_emote_constants:
  db 7B,14,AE,47,E1,7A,B4,3F,29,5C,8F,C2,F5,28,CC,3F // 02EFF0B8: constants / retained padding
  db 00,00,00,00,00,00,18,40,00,00,00,00,00,00,10,40 // 02EFF0C8: constants / retained padding
  db 00,00,00,00,00,00,F0,3F,9A,99,99,99,99,99,D9,3F // 02EFF0D8: constants / retained padding
  db 00,00,00,00,00,00,00,00 // 02EFF0E8: constants / retained padding

// Decrement finite effect lifetime once per update; parity test remains but its branch was removed.
fps_emote_lifetime:
  test byte ptr [TOS.exe+183C3D8], #1 // 02EFF0F0
  nop // 02EFF0F7
  nop // 02EFF0F8
  dec eax // 02EFF0F9
  mov dword ptr [ebx + 0xb0], eax // 02EFF0FA
  test eax, eax // 02EFF100
  jg short fps_loc_02EFF109 // 02EFF102
  jmp near TOS.exe+D2EEE // 02EFF104
fps_loc_02EFF109:
  jmp near TOS.exe+D2EF4 // 02EFF109
  db 00,00 // 02EFF10E: constants / retained padding

// Increment case-5 emote counter unconditionally; old parity branch remains NOPed.
fps_emote_case5_counter:
  test byte ptr [TOS.exe+183C3D8], #1 // 02EFF110
  nop // 02EFF117
  nop // 02EFF118
  inc word ptr [ebx + 0x9ce] // 02EFF119
  jmp near TOS.exe+D2388 // 02EFF120
  db 00,00,00,00,00,00,00,00,00,00,00 // 02EFF125: constants / retained padding

// Apply half XYZ displacement in bone-target interpolation, keeping platform carry timing.
fps_elevator_bone_interpolation:
  fld dword ptr [esi] // 02EFF130
  fmul dword ptr [fps_float_half] // 02EFF132
  fadd dword ptr [ecx] // 02EFF138
  fstp dword ptr [ecx] // 02EFF13A
  fld dword ptr [esi + #4] // 02EFF13C
  fmul dword ptr [fps_float_half] // 02EFF13F
  fadd dword ptr [ecx + #4] // 02EFF145
  fstp dword ptr [ecx + #4] // 02EFF148
  fld dword ptr [esi + #8] // 02EFF14B
  fmul dword ptr [fps_float_half] // 02EFF14E
  fadd dword ptr [ecx + #8] // 02EFF154
  fstp dword ptr [ecx + #8] // 02EFF157
  jmp near TOS.exe+17B7B8 // 02EFF15A
  db 00,00,00,00,00,00,00,00,00,00,00 // 02EFF15F: constants / retained padding

// Double supplied movement speed and replay script-store before returning.
fps_scenario_cmd17_speed:
  db DC,C0 // fadd st(0), st(0) // 02EFF16A
  fstp dword ptr [eax + 0x938] // 02EFF16C
  jmp near TOS.exe+15F7BF // 02EFF172
  db 00 // 02EFF177: constants / retained padding

// Historical doubled terrain velocity compensation; reference retains bytes after original caller was restored.
fps_legacy_terrain_velocity_adjustment:
  fld dword ptr [ebx + 0x28] // 02EFF178
  mov dword ptr [ebx + 0xa8], ecx // 02EFF17B
  fld dword ptr [TOS.exe+71333C] // 02EFF181
  fadd st(0), st(0) // 02EFF187
  faddp st(1) // 02EFF189
  mov edi, TOS.exe+713348 // 02EFF18B
  mov esi, edi // 02EFF190
  fstp dword ptr [ebx + 0x28] // 02EFF192
  fld dword ptr [ebx + 0x2c] // 02EFF195
  fld dword ptr [TOS.exe+713340] // 02EFF198
  fadd st(0), st(0) // 02EFF19E
  faddp st(1) // 02EFF1A0
  fstp dword ptr [ebx + 0x2c] // 02EFF1A2
  jmp near TOS.exe+CD55C // 02EFF1A5
  db 00,00 // 02EFF1AA: constants / retained padding

// Integrate XYZ velocity at a half step for scene texture/effect motion.
fps_scene_texture_motion:
  fld dword ptr [ebx + 0x28] // 02EFF1AC
  fmul dword ptr [fps_float_half] // 02EFF1AF
  fadd dword ptr [ebx + #4] // 02EFF1B5
  fstp dword ptr [ebx + #4] // 02EFF1B8
  fld dword ptr [ebx + 0x2c] // 02EFF1BB
  fmul dword ptr [fps_float_half] // 02EFF1BE
  fadd dword ptr [ebx + #8] // 02EFF1C4
  fstp dword ptr [ebx + #8] // 02EFF1C7
  fld dword ptr [ebx + 0x30] // 02EFF1CA
  fmul dword ptr [fps_float_half] // 02EFF1CD
  fadd dword ptr [ebx + 0xc] // 02EFF1D3
  fstp dword ptr [ebx + 0xc] // 02EFF1D6
  jmp near TOS.exe+156463 // 02EFF1D9

// Halve animation speed increment in scene texture animation.
fps_scene_texture_animation_rate:
  fld dword ptr [ebx + 0x9ec] // 02EFF1DE
  fmul dword ptr [fps_float_half] // 02EFF1E4
  jmp near TOS.exe+156951 // 02EFF1EA
  db 00 // 02EFF1EF: constants / retained padding

// Half XYZ motion for general field-effect wrapper; separate from NPC collision integration.
fps_field_effect_motion:
  fld dword ptr [esi + 0x28] // 02EFF1F0
  fmul dword ptr [fps_float_half] // 02EFF1F3
  fadd dword ptr [esi + #4] // 02EFF1F9
  fstp dword ptr [esi + #4] // 02EFF1FC
  fld dword ptr [esi + 0x2c] // 02EFF1FF
  fmul dword ptr [fps_float_half] // 02EFF202
  fadd dword ptr [esi + #8] // 02EFF208
  fstp dword ptr [esi + #8] // 02EFF20B
  fld dword ptr [esi + 0x30] // 02EFF20E
  fmul dword ptr [fps_float_half] // 02EFF211
  fadd dword ptr [esi + 0xc] // 02EFF217
  fstp dword ptr [esi + 0xc] // 02EFF21A
  jmp near TOS.exe+9CC7C // 02EFF21D
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF222: constants / retained padding

// Decrement delayed knockback once; transfer stored XY velocity only on nonzero-to-zero transition.
fps_spell_knockback_timer:
  mov al, byte ptr [ebx + 0x17ef] // 02EFF230
  test al, al // 02EFF236
  je near TOS.exe+86CFD // 02EFF238
  dec al // 02EFF23E
  mov byte ptr [ebx + 0x17ef], al // 02EFF240
  jne near TOS.exe+86CFD // 02EFF246
  mov edx, dword ptr [ebx + 0x13950] // 02EFF24C
  mov eax, dword ptr [ebx + 0x13954] // 02EFF252
  mov dword ptr [ebx + 0x138ec], edx // 02EFF258
  mov dword ptr [ebx + 0x138f0], eax // 02EFF25E
  jmp near TOS.exe+86CFD // 02EFF264
  db 00 // 02EFF269: constants / retained padding

// float32 15/22.5 and float64 0.05/7.5 target-focus camera rates.
fps_target_camera_constants:
  db 00,00,70,41,00,00,B4,41,9A,99,99,99,99,99,A9,3F // 02EFF26A: constants / retained padding
  db 00,00,00,00,00,00,1E,40,00 // 02EFF27A: constants / retained padding

// Advance hit-table entry; consume pending actor+12E9 and subtract one attack tick only for a real cooldown event.
fps_attack_pending_compensation:
  add dword ptr [edi + 0x110], 0x20 // 02EFF283
  cmp byte ptr [edi + 0x12e9], #0 // 02EFF28A
  je short fps_loc_02EFF2A1 // 02EFF291
  dec byte ptr [edi + 0x12e9] // 02EFF293
  sub word ptr [edi + 0x12fa], #1 // 02EFF299
fps_loc_02EFF2A1:
  jmp near TOS.exe+45238 // 02EFF2A1
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF2A6: constants / retained padding

// Replay arte timer/index initialization and zero actor+12E9 pending compensation.
fps_arte_pending_reset:
  mov dword ptr [edi + 0x12fc], 0x10000 // 02EFF2B6
  mov byte ptr [edi + 0x12e9], #0 // 02EFF2C0
  db 8B,E5 // mov esp, ebp // 02EFF2C7
  pop ebp // 02EFF2C9
  ret // 02EFF2CA
  db 00 // 02EFF2CB: constants / retained padding

// float32 0.5 for waypoint output displacement.
fps_ozette_waypoint_half:
  db 00,00,00,3F,00,00,00,00 // 02EFF2CC: constants / retained padding

// Double waypoint input step then replay original argument/busy check.
fps_ozette_waypoint_input:
  fld dword ptr [ebp + 0x14] // 02EFF2D4
  fadd st(0), st(0) // 02EFF2D7
  fstp dword ptr [ebp + 0x14] // 02EFF2D9
  mov edi, dword ptr [ebp + #8] // 02EFF2DC
  cmp dword ptr [edi], #0 // 02EFF2DF
  jmp near TOS.exe+C17F8 // 02EFF2E2
  db 00,00,00,00,00,00,00,00,00 // 02EFF2E7: constants / retained padding

// Halve resulting XYZ waypoint vector and restore displaced epilogue.
fps_ozette_waypoint_output:
  fld dword ptr [ebx] // 02EFF2F0
  fmul dword ptr [fps_ozette_waypoint_half] // 02EFF2F2
  fstp dword ptr [ebx] // 02EFF2F8
  fld dword ptr [ebx + #4] // 02EFF2FA
  fmul dword ptr [fps_ozette_waypoint_half] // 02EFF2FD
  fstp dword ptr [ebx + #4] // 02EFF303
  fld dword ptr [ebx + #8] // 02EFF306
  fmul dword ptr [fps_ozette_waypoint_half] // 02EFF309
  fstp dword ptr [ebx + #8] // 02EFF30F
  add esp, #4 // 02EFF312
  pop edi // 02EFF315
  pop esi // 02EFF316
  jmp near TOS.exe+C1B76 // 02EFF317
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF31C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF32C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF33C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF34C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF35C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF36C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF37C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF38C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF39C: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3AC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3BC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3CC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3DC: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF3EC: constants / retained padding
  db 00,00,00,00 // 02EFF3FC: constants / retained padding

// Double effect-specific parameter only for movement-duration types 19, 50 and 51; preserve sizes/radii/counts for all other types.
fps_field_effect_parameter:
  movzx edx, word ptr [edi + 0x9f4] // 02EFF400
  cmp edx, 0x13 // 02EFF407
  je short fps_loc_02EFF416 // 02EFF40A
  cmp edx, 0x32 // 02EFF40C
  je short fps_loc_02EFF416 // 02EFF40F
  cmp edx, 0x33 // 02EFF411
  jne short fps_loc_02EFF419 // 02EFF414
fps_loc_02EFF416:
  add ax, ax // 02EFF416
fps_loc_02EFF419:
  mov word ptr [edi + 0xc6], ax // 02EFF419
  jmp near TOS.exe+15EF05 // 02EFF420
  db 00,00,00,00,00,00,00,00,00,00,00 // 02EFF425: constants / retained padding

// Skip reversed/nonpositive bottom-border remnants and preserve original quad/UV limits.
fps_dialogue_bottom_border:
  push ebp // 02EFF430
  mov ebp, esp // 02EFF431
  pushad // 02EFF433
  sub esp, 0x40 // 02EFF434
  cmp dword ptr [edi + 0x2834], #0 // 02EFF437
  je near fps_loc_02EFF581 // 02EFF43E
  movzx eax, byte ptr [edi + 0x2743] // 02EFF444
  and eax, 0x7f // 02EFF44B
  cmp eax, #2 // 02EFF44E
  je short fps_loc_02EFF45C // 02EFF451
  cmp eax, #3 // 02EFF453
  jne near fps_loc_02EFF581 // 02EFF456
fps_loc_02EFF45C:
  movzx eax, word ptr [edi + 0x2740] // 02EFF45C
  and eax, 0x180 // 02EFF463
  cmp eax, 0x80 // 02EFF468
  jne near fps_loc_02EFF581 // 02EFF46D
  mov eax, dword ptr [TOS.exe+6D3F68] // 02EFF473
  test byte ptr [eax + 0x242], 0xc // 02EFF478
  je near fps_loc_02EFF581 // 02EFF47F
  movsx eax, word ptr [edi + 0x283a] // 02EFF485
  sub eax, 0x13 // 02EFF48C
  movsx ecx, word ptr [edi + 0x283e] // 02EFF48F
  cmp eax, ecx // 02EFF496
  jl near fps_loc_02EFF581 // 02EFF498
  mov dword ptr [ebp - 0x30], eax // 02EFF49E
  fild dword ptr [ebp - 0x30] // 02EFF4A1
  fstp dword ptr [ebp - 0x30] // 02EFF4A4
  add eax, 0x26 // 02EFF4A7
  movsx ecx, word ptr [edi + 0x2842] // 02EFF4AA
  cmp eax, ecx // 02EFF4B1
  jg near fps_loc_02EFF581 // 02EFF4B3
  mov dword ptr [ebp - 0x2c], eax // 02EFF4B9
  fild dword ptr [ebp - 0x2c] // 02EFF4BC
  fstp dword ptr [ebp - 0x2c] // 02EFF4BF
  mov esi, TOS.exe+71A580 // 02EFF4C2
  lea edi, [ebp - 0x60] // 02EFF4C7
  mov ecx, 0xc // 02EFF4CA
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02EFF4CF
  fld dword ptr [ebp - 0x30] // 02EFF4D1
  fsub dword ptr [ebp - 0x60] // 02EFF4D4
  fld dword ptr [ebp - 0x58] // 02EFF4D7
  fsub dword ptr [ebp - 0x60] // 02EFF4DA
  fdivp st(1) // 02EFF4DD
  fld dword ptr [ebp - 0x48] // 02EFF4DF
  fsub dword ptr [ebp - 0x50] // 02EFF4E2
  fmulp st(1) // 02EFF4E5
  fadd dword ptr [ebp - 0x50] // 02EFF4E7
  fstp dword ptr [ebp - 0x28] // 02EFF4EA
  fld dword ptr [ebp - 0x2c] // 02EFF4ED
  fsub dword ptr [ebp - 0x60] // 02EFF4F0
  fld dword ptr [ebp - 0x58] // 02EFF4F3
  fsub dword ptr [ebp - 0x60] // 02EFF4F6
  fdivp st(1) // 02EFF4F9
  fld dword ptr [ebp - 0x48] // 02EFF4FB
  fsub dword ptr [ebp - 0x50] // 02EFF4FE
  fmulp st(1) // 02EFF501
  fadd dword ptr [ebp - 0x50] // 02EFF503
  fstp dword ptr [ebp - 0x24] // 02EFF506
  fld dword ptr [ebp - 0x60] // 02EFF509
  fld dword ptr [ebp - 0x30] // 02EFF50C
  fcomip st(1) // 02EFF50F
  fstp st(0) // 02EFF511
  jbe short fps_loc_02EFF535 // 02EFF513
  mov eax, dword ptr [ebp - 0x30] // 02EFF515
  mov dword ptr [TOS.exe+71A588], eax // 02EFF518
  mov eax, dword ptr [ebp - 0x28] // 02EFF51D
  mov dword ptr [TOS.exe+71A598], eax // 02EFF520
  mov esi, dword ptr [ebp - 0x1c] // 02EFF525
  push dword ptr [ebp + #8] // 02EFF528
  mov eax, TOS.exe+1801F0 // 02EFF52B
  call eax // 02EFF530
  add esp, #4 // 02EFF532
fps_loc_02EFF535:
  lea esi, [ebp - 0x60] // 02EFF535
  mov edi, TOS.exe+71A580 // 02EFF538
  mov ecx, 0xc // 02EFF53D
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02EFF542
  fld dword ptr [ebp - 0x58] // 02EFF544
  fld dword ptr [ebp - 0x2c] // 02EFF547
  fcomip st(1) // 02EFF54A
  fstp st(0) // 02EFF54C
  jae short fps_loc_02EFF570 // 02EFF54E
  mov eax, dword ptr [ebp - 0x2c] // 02EFF550
  mov dword ptr [TOS.exe+71A580], eax // 02EFF553
  mov eax, dword ptr [ebp - 0x24] // 02EFF558
  mov dword ptr [TOS.exe+71A590], eax // 02EFF55B
  mov esi, dword ptr [ebp - 0x1c] // 02EFF560
  push dword ptr [ebp + #8] // 02EFF563
  mov eax, TOS.exe+1801F0 // 02EFF566
  call eax // 02EFF56B
  add esp, #4 // 02EFF56D
fps_loc_02EFF570:
  lea esi, [ebp - 0x60] // 02EFF570
  mov edi, TOS.exe+71A580 // 02EFF573
  mov ecx, 0xc // 02EFF578
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02EFF57D
  jmp short fps_loc_02EFF591 // 02EFF57F
fps_loc_02EFF581:
  mov esi, dword ptr [ebp - 0x1c] // 02EFF581
  push dword ptr [ebp + #8] // 02EFF584
  mov eax, TOS.exe+1801F0 // 02EFF587
  call eax // 02EFF58C
  add esp, #4 // 02EFF58E
fps_loc_02EFF591:
  add esp, 0x40 // 02EFF591
  popad // 02EFF594
  pop ebp // 02EFF595
  ret // 02EFF596
  nop // 02EFF597
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02EFF598
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF5A0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF5B0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF5C0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF5D0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF5E0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF5F0: constants / retained padding

// Legacy flight-single clamp doubles remaining distance before comparison.
fps_flight_single_arrival_compare:
  fadd st(0), st(0) // 02EFF600
  fld dword ptr [esp + 0x24] // 02EFF602
  fcomp st(1) // 02EFF606
  jmp near TOS.exe+C9C2C // 02EFF608
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF60D: constants / retained padding
  db 00,00,00 // 02EFF61D: constants / retained padding

// Retained hook replays native substep-byte load; former doubling has been NOPed.
fps_ground_single_arrival_compare:
  nop // 02EFF620
  nop // 02EFF621
  mov cl, byte ptr [TOS.exe+183C3DD] // 02EFF622
  jmp near TOS.exe+C9D4F // 02EFF628
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF62D: constants / retained padding
  db 00,00,00 // 02EFF63D: constants / retained padding

// Current entry directly resumes native compare; remaining historical tail is retained but unreachable from entry.
fps_multi_arrival_compare_legacy:
  mov cl, byte ptr [TOS.exe+183C3DD] // 02EFF640
  jmp near TOS.exe+C9F40 // 02EFF646
  db C4,41,75 // les eax, ptr [ecx + 0x75] // 02EFF64B
  push es // 02EFF64E
  fstp dword ptr [esp + 0x24] // 02EFF64F
  jmp short fps_loc_02EFF657 // 02EFF653
  fstp st(0) // 02EFF655
fps_loc_02EFF657:
  jmp near TOS.exe+C9F6F // 02EFF657
  add byte ptr [eax], al // 02EFF65C
  add byte ptr [eax], al // 02EFF65E

// Retained hook replays native substep-byte load; former doubling has been NOPed.
fps_ground_multi_arrival_compare:
  nop // 02EFF660
  nop // 02EFF661
  mov cl, byte ptr [TOS.exe+183C3DD] // 02EFF662
  jmp near TOS.exe+CA0B1 // 02EFF668
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF66D: constants / retained padding
  db 00,00,00 // 02EFF67D: constants / retained padding

// Halve XYZ movement delta in place before native collision/terrain tests; vector is rebuilt every update.
fps_npc_half_delta_before_collision:
  fld dword ptr [ebx + 0x28] // 02EFF680
  fmul dword ptr [fps_float_half] // 02EFF683
  fstp dword ptr [ebx + 0x28] // 02EFF689
  fld dword ptr [ebx + 0x2c] // 02EFF68C
  fmul dword ptr [fps_float_half] // 02EFF68F
  fstp dword ptr [ebx + 0x2c] // 02EFF695
  fld dword ptr [ebx + 0x30] // 02EFF698
  fmul dword ptr [fps_float_half] // 02EFF69B
  fstp dword ptr [ebx + 0x30] // 02EFF6A1
  jmp near TOS.exe+C7F30 // 02EFF6A4
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF6A9: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF6B9: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF6C9: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF6D9: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF6E9: constants / retained padding
  db 00,00,00,00,00,00,00 // 02EFF6F9: constants / retained padding

// Add already-halved XYZ delta once, with no second halve after collision.
fps_npc_direct_delta_integration:
  fld dword ptr [ebx + 0x28] // 02EFF700
  fadd dword ptr [ebx + #4] // 02EFF703
  fstp dword ptr [ebx + #4] // 02EFF706
  fld dword ptr [ebx + 0x2c] // 02EFF709
  fadd dword ptr [ebx + #8] // 02EFF70C
  fstp dword ptr [ebx + #8] // 02EFF70F
  fld dword ptr [ebx + 0x30] // 02EFF712
  fadd dword ptr [ebx + 0xc] // 02EFF715
  fstp dword ptr [ebx + 0xc] // 02EFF718
  jmp near TOS.exe+CF211 // 02EFF71B

// Redirect to capped NPC/player clamp; old trailing player-only instructions retained.
fps_ground_single_arrival_redirect:
  jmp near fps_npc_capped_arrival_store // 02EFF720
  add dword ptr [ebp + #2], esi // 02EFF725
  db DC,C0 // fadd st(0), st(0) // 02EFF728
  fst dword ptr [esp + 0x24] // 02EFF72A
  test cl, cl // 02EFF72E
  jmp near TOS.exe+C9D76 // 02EFF730
  db 00,00,00,00,00,00,00,00,00,00,00 // 02EFF735: constants / retained padding

// Double remaining-distance store for player actor only; preserve test-cl flags consumed by native continuation.
fps_flight_multi_arrival_store:
  cmp ebx, TOS.exe+1955AF0 // 02EFF740
  jne short fps_loc_02EFF74A // 02EFF746
  db DC,C0 // fadd st(0), st(0) // 02EFF748
fps_loc_02EFF74A:
  fst dword ptr [esp + 0x24] // 02EFF74A
  test cl, cl // 02EFF74E
  jmp near TOS.exe+C9F5F // 02EFF750
  db 00,00,00,00,00,00,00,00,00,00,00 // 02EFF755: constants / retained padding

// Double remaining-distance store for player actor only; preserve test-cl flags consumed by native continuation.
fps_ground_multi_arrival_store:
  cmp ebx, TOS.exe+1955AF0 // 02EFF760
  jne short fps_loc_02EFF76A // 02EFF766
  db DC,C0 // fadd st(0), st(0) // 02EFF768
fps_loc_02EFF76A:
  fst dword ptr [esp + 0x24] // 02EFF76A
  test cl, cl // 02EFF76E
  jmp near TOS.exe+CA0D0 // 02EFF770
  db 00,00,00,00,00,00,00,00,00,00,00 // 02EFF775: constants / retained padding

// Private float64 0.25 and 2.2 halve random ring-transformation transfer-effect speed.
fps_ring_transfer_speed_constants:
  db 00,00,00,00,00,00,D0,3F,9A,99,99,99,99,99,01,40 // 02EFF780: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF790: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF7A0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF7B0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF7C0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF7D0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF7E0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF7F0: constants / retained padding

// Player stores twice remaining distance; regular NPC stores min(scaled speed, twice remaining); other actors preserve native store.
fps_npc_capped_arrival_store:
  cmp ebx, TOS.exe+1955AF0 // 02EFF800
  je short fps_loc_02EFF826 // 02EFF806
  cmp dword ptr [ebx], TOS.exe+CE730 // 02EFF808
  jne short fps_loc_02EFF828 // 02EFF80E
  fadd st(0), st(0) // 02EFF810
  fld dword ptr [esp + 0x24] // 02EFF812
  fmul dword ptr [esp + 0x28] // 02EFF816
  fcomi st(1) // 02EFF81A
  jbe short fps_loc_02EFF822 // 02EFF81C
  fstp st(0) // 02EFF81E
  jmp short fps_loc_02EFF828 // 02EFF820
fps_loc_02EFF822:
  fstp st(1) // 02EFF822
  jmp short fps_loc_02EFF828 // 02EFF824
fps_loc_02EFF826:
  fadd st(0), st(0) // 02EFF826
fps_loc_02EFF828:
  fst dword ptr [esp + 0x24] // 02EFF828
  test cl, cl // 02EFF82C
  jmp near TOS.exe+C9D76 // 02EFF82E
  db 00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF833: constants / retained padding

// Match event/phase threshold to doubled timer
fps_ring_stub_2eff840:
  cmp dword ptr [ebx + 0x9f0], 0xf0 // 02EFF840
  jmp near TOS.exe+A2AA9 // 02EFF84A
  db 00 // 02EFF84F: constants / retained padding

// Ring-local constant -16.66666603088379
fps_ring_constant_2eff850:
  db 55,55,85,C1 // 02EFF850: constants / retained padding

// Ring-local constant -6.666666507720947
fps_ring_constant_2eff854:
  db 55,55,D5,C0 // 02EFF854: constants / retained padding

// Ring-local constant 0.6666666865348816
fps_ring_constant_2eff858:
  db 00,00,00,60,55,55,E5,3F // 02EFF858: constants / retained padding

// Ring-local constant 0.7627118825912476
fps_ring_constant_2eff860:
  db 00,00,00,C0,22,68,E8,3F // 02EFF860: constants / retained padding

// Mode 19 accumulated bobbing increment at 60 FPS
fps_ring_stub_2eff868:
  fmul qword ptr [TOS.exe+482950] // 02EFF868
  fadd dword ptr [ebx + 0x84] // 02EFF86E
  jmp near TOS.exe+A2E7F // 02EFF874
  db 00,00,00,00,00,00,00 // 02EFF879: constants / retained padding

// Ring-local constant 326.6666564941406
fps_ring_constant_2eff880:
  db 00,00,00,A0,AA,6A,74,40 // 02EFF880: constants / retained padding

// Modes 4/16 visual age: one increment per two movement updates
fps_ring_stub_2eff888:
  pushfd // 02EFF888
  test dword ptr [ebx + 0xb0], #1 // 02EFF889
  je short fps_loc_02EFF89B // 02EFF893
  inc dword ptr [ebx + 0x9f0] // 02EFF895
fps_loc_02EFF89B:
  popfd // 02EFF89B
  jmp near TOS.exe+A59AB // 02EFF89C
  db 00,00,00 // 02EFF8A1: constants / retained padding

// Modes 4/16 visual age: one increment per two movement updates
fps_ring_stub_2eff8a4:
  pushfd // 02EFF8A4
  test dword ptr [ebx + 0xb0], #1 // 02EFF8A5
  je short fps_loc_02EFF8B7 // 02EFF8AF
  inc dword ptr [ebx + 0x9f0] // 02EFF8B1
fps_loc_02EFF8B7:
  popfd // 02EFF8B7
  jmp near TOS.exe+A69EB // 02EFF8B8
  db 00,00,00 // 02EFF8BD: constants / retained padding

// Mode 12: preserve burst-phase threshold and continuous emission rate
fps_ring_stub_2eff8c0:
  cmp dword ptr [ebx + 0xb0], 0x27 // 02EFF8C0
  jl near TOS.exe+A4B86 // 02EFF8C7
  test byte ptr [TOS.exe+183C3D8], #1 // 02EFF8CD
  jne near TOS.exe+A4B86 // 02EFF8D4
  jmp near TOS.exe+A4A89 // 02EFF8DA
  db 00 // 02EFF8DF: constants / retained padding

// Remove redundant midpoint particle group; discard its queued call arguments
fps_ring_stub_2eff8e0:
  add esp, 0xc // 02EFF8E0
  jmp near TOS.exe+A1E05 // 02EFF8E3

// Remove redundant midpoint particle group; discard its queued call arguments
fps_ring_stub_2eff8e8:
  add esp, 0xc // 02EFF8E8
  jmp near TOS.exe+A79F5 // 02EFF8EB

// Mode 14: remove midpoint group and preserve x87 zero
fps_ring_stub_2eff8f0:
  fldz // 02EFF8F0
  jmp near TOS.exe+A3D7B // 02EFF8F2
  db 00 // 02EFF8F7: constants / retained padding

// Mode 15: one emission per update, preserving x87 zero and stack balance
fps_ring_stub_2eff8f8:
  add esp, 0xc // 02EFF8F8
  fldz // 02EFF8FB
  jmp near TOS.exe+A31FA // 02EFF8FD
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF902: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF912: constants / retained padding

// Draw channels capped at 128, then RGB excess with native SRCALPHA/ONE; restore blend selector. Stateless final v46 helper.
fps_chant_portrait_additive:
  push ebp // 02EFF920
  mov ebp, esp // 02EFF921
  push edi // 02EFF923
  push esi // 02EFF924
  mov esi, edx // 02EFF925
  push ebx // 02EFF927
  mov ebx, ecx // 02EFF928
  sub esp, 0x3c // 02EFF92A
  cmp byte ptr [ecx + 0x2c], 0x80 // 02EFF92D
  seta al // 02EFF931
  cmp byte ptr [ecx + 0x2d], 0x80 // 02EFF934
  seta dl // 02EFF938
  or al, dl // 02EFF93B
  jne short fps_loc_02EFF955 // 02EFF93D
  cmp byte ptr [ecx + 0x2e], 0x80 // 02EFF93F
  ja short fps_loc_02EFF955 // 02EFF943
  add esp, 0x3c // 02EFF945
  mov edx, esi // 02EFF948
  mov eax, TOS.exe+7BCE0 // 02EFF94A
  pop ebx // 02EFF94F
  pop esi // 02EFF950
  pop edi // 02EFF951
  pop ebp // 02EFF952
  jmp eax // 02EFF953
fps_loc_02EFF955:
  xor eax, eax // 02EFF955
  lea ecx, [ebp - 0x48] // 02EFF957
fps_loc_02EFF95A:
  db 8A,14,03 // mov dl, byte ptr [ebx + eax] // 02EFF95A
  inc eax // 02EFF95D
  mov byte ptr [eax + ecx - #1], dl // 02EFF95E
  cmp eax, 0x3c // 02EFF962
  jne short fps_loc_02EFF95A // 02EFF965
  cmp byte ptr [ebp - 0x1c], 0x80 // 02EFF967
  jbe short fps_loc_02EFF971 // 02EFF96B
  mov byte ptr [ebp - 0x1c], 0x80 // 02EFF96D
fps_loc_02EFF971:
  cmp byte ptr [ebp - 0x1b], 0x80 // 02EFF971
  jbe short fps_loc_02EFF97B // 02EFF975
  mov byte ptr [ebp - 0x1b], 0x80 // 02EFF977
fps_loc_02EFF97B:
  cmp byte ptr [ebp - 0x1a], 0x80 // 02EFF97B
  jbe short fps_loc_02EFF985 // 02EFF97F
  mov byte ptr [ebp - 0x1a], 0x80 // 02EFF981
fps_loc_02EFF985:
  mov edx, esi // 02EFF985
  mov eax, TOS.exe+7BCE0 // 02EFF987
  xor edi, edi // 02EFF98C
  call eax // 02EFF98E
  mov edx, 0x2c // 02EFF990
fps_loc_02EFF995:
  mov al, byte ptr [ebx + edx] // 02EFF995
  lea ecx, [ebp - 0x48] // 02EFF998
  sub al, 0x80 // 02EFF99B
  cmovb eax, edi // 02EFF99D
  mov byte ptr [ebp + edx - 0x48], al // 02EFF9A0
  inc edx // 02EFF9A4
  cmp edx, 0x2f // 02EFF9A5
  jne short fps_loc_02EFF995 // 02EFF9A8
  mov ebx, dword ptr [TOS.exe+1977FC4] // 02EFF9AA
  mov edx, esi // 02EFF9B0
  mov eax, TOS.exe+7BCE0 // 02EFF9B2
  mov dword ptr [TOS.exe+1977FC4], #2 // 02EFF9B7
  call eax // 02EFF9C1
  mov dword ptr [TOS.exe+1977FC4], ebx // 02EFF9C3
  add esp, 0x3c // 02EFF9C9
  pop ebx // 02EFF9CC
  pop esi // 02EFF9CD
  pop edi // 02EFF9CE
  pop ebp // 02EFF9CF
  ret // 02EFF9D0
  nop // 02EFF9D1
  nop // 02EFF9D2
  nop // 02EFF9D3
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF9D4: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF9E4: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00 // 02EFF9F4: constants / retained padding

// Double positive script movement speed except hostile pursuit callback 4D5F00; shared duration path stays native.
fps_npc_pursuit_positive_speed:
  fild dword ptr [esp + 0x14] // 02EFFA00
  cmp dword ptr [esi], TOS.exe+D5F00 // 02EFFA04
  je short fps_loc_02EFFA0E // 02EFFA0A
  db DC,C0 // fadd st(0), st(0) // 02EFFA0C
fps_loc_02EFFA0E:
  jmp near TOS.exe+15F72D // 02EFFA0E
  db 00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFA13: constants / retained padding

// Inset style-A fill by two units and trim vertical bevel ends to preserve full horizontal corners.
fps_dialogue_style_a:
  push eax // 02EFFA20
  mov eax, dword ptr [TOS.exe+6D3F68] // 02EFFA21
  test byte ptr [eax + 0x242], 0xc // 02EFFA26
  pop eax // 02EFFA2D
  je short fps_loc_02EFFA37 // 02EFFA2E
  mov eax, fps_dialogue_name_fill_hook // 02EFFA30
  jmp eax // 02EFFA35
fps_loc_02EFFA37:
  push ebp // 02EFFA37
  mov ebp, esp // 02EFFA38
  pushad // 02EFFA3A
  sub esp, 0x30 // 02EFFA3B
  mov esi, TOS.exe+71A580 // 02EFFA3E
  lea edi, [ebp - 0x50] // 02EFFA43
  mov ecx, 0xc // 02EFFA46
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02EFFA4B
  fld1 // 02EFFA4D
  fadd st(0), st(0) // 02EFFA4F
  fadd dword ptr [TOS.exe+71A580] // 02EFFA51
  fstp dword ptr [TOS.exe+71A580] // 02EFFA57
  fld1 // 02EFFA5D
  fadd st(0), st(0) // 02EFFA5F
  fadd dword ptr [TOS.exe+71A584] // 02EFFA61
  fstp dword ptr [TOS.exe+71A584] // 02EFFA67
  fld1 // 02EFFA6D
  fadd st(0), st(0) // 02EFFA6F
  fadd dword ptr [TOS.exe+71A590] // 02EFFA71
  fstp dword ptr [TOS.exe+71A590] // 02EFFA77
  fld1 // 02EFFA7D
  fadd st(0), st(0) // 02EFFA7F
  fadd dword ptr [TOS.exe+71A594] // 02EFFA81
  fstp dword ptr [TOS.exe+71A594] // 02EFFA87
  fld1 // 02EFFA8D
  fadd st(0), st(0) // 02EFFA8F
  fsubr dword ptr [TOS.exe+71A588] // 02EFFA91
  fstp dword ptr [TOS.exe+71A588] // 02EFFA97
  fld1 // 02EFFA9D
  fadd st(0), st(0) // 02EFFA9F
  fsubr dword ptr [TOS.exe+71A58C] // 02EFFAA1
  fstp dword ptr [TOS.exe+71A58C] // 02EFFAA7
  fld1 // 02EFFAAD
  fadd st(0), st(0) // 02EFFAAF
  fsubr dword ptr [TOS.exe+71A598] // 02EFFAB1
  fstp dword ptr [TOS.exe+71A598] // 02EFFAB7
  fld1 // 02EFFABD
  fadd st(0), st(0) // 02EFFABF
  fsubr dword ptr [TOS.exe+71A59C] // 02EFFAC1
  fstp dword ptr [TOS.exe+71A59C] // 02EFFAC7
  mov edi, dword ptr [ebp - 0x20] // 02EFFACD
  mov esi, dword ptr [ebp - 0x1c] // 02EFFAD0
  push dword ptr [ebp + #8] // 02EFFAD3
  mov eax, fps_dialogue_name_fill_hook // 02EFFAD6
  call eax // 02EFFADB
  add esp, #4 // 02EFFADD
  lea esi, [ebp - 0x50] // 02EFFAE0
  mov edi, TOS.exe+71A580 // 02EFFAE3
  mov ecx, 0xc // 02EFFAE8
  rep movsd dword ptr es:[edi], dword ptr [esi] // 02EFFAED
  add esp, 0x30 // 02EFFAEF
  popad // 02EFFAF2
  pop ebp // 02EFFAF3
  ret // 02EFFAF4
fps_loc_02EFFAF5:
  push ebp // 02EFFAF5
  mov ebp, esp // 02EFFAF6
  pushad // 02EFFAF8
  sub esp, #8 // 02EFFAF9
  mov eax, dword ptr [TOS.exe+71A584] // 02EFFAFC
  mov dword ptr [ebp - 0x28], eax // 02EFFB01
  mov eax, dword ptr [TOS.exe+71A58C] // 02EFFB04
  mov dword ptr [ebp - 0x24], eax // 02EFFB09
  fld1 // 02EFFB0C
  fadd st(0), st(0) // 02EFFB0E
  fadd st(0), st(0) // 02EFFB10
  fadd dword ptr [TOS.exe+71A584] // 02EFFB12
  fstp dword ptr [TOS.exe+71A584] // 02EFFB18
  fld1 // 02EFFB1E
  fadd st(0), st(0) // 02EFFB20
  fadd st(0), st(0) // 02EFFB22
  fsubr dword ptr [TOS.exe+71A58C] // 02EFFB24
  fstp dword ptr [TOS.exe+71A58C] // 02EFFB2A
  push dword ptr [ebp + #8] // 02EFFB30
  mov eax, TOS.exe+1801F0 // 02EFFB33
  call eax // 02EFFB38
  add esp, #4 // 02EFFB3A
  mov eax, dword ptr [ebp - 0x28] // 02EFFB3D
  mov dword ptr [TOS.exe+71A584], eax // 02EFFB40
  mov eax, dword ptr [ebp - 0x24] // 02EFFB45
  mov dword ptr [TOS.exe+71A58C], eax // 02EFFB48
  add esp, #8 // 02EFFB4D
  popad // 02EFFB50
  pop ebp // 02EFFB51
  ret // 02EFFB52
  db 00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFB53: constants / retained padding

// Defer style-C corners adjacent to a valid speech tail; flush after tail outline exactly once.
fps_dialogue_top_left_hook:
  push #4 // 02EFFB60
  jmp short fps_dialogue_entry // 02EFFB62
fps_dialogue_top_right_hook:
  push #5 // 02EFFB64
  jmp short fps_dialogue_entry // 02EFFB66
fps_dialogue_bottom_left_hook:
  push #6 // 02EFFB68
  jmp short fps_dialogue_entry // 02EFFB6A
fps_dialogue_bottom_right_hook:
  push #7 // 02EFFB6C
  jmp short fps_dialogue_entry // 02EFFB6E
fps_dialogue_tail_outline_hook:
  push #3 // 02EFFB70
fps_dialogue_entry:
  push ebp // 02EFFB72
  mov ebp, esp // 02EFFB73
  pushad // 02EFFB75
  sub esp, 0x220 // 02EFFB76
  and esp, 0xfffffff0 // 02EFFB7C
  fxsave [esp] // 02EFFB7F
  fninit // 02EFFB83
  mov ebx, esp // 02EFFB85
  push dword ptr [ebp + #4] // 02EFFB87
  push dword ptr [ebp + 0xc] // 02EFFB8A
  push esi // 02EFFB8D
  push edi // 02EFFB8E
  call fps_dialogue_tail_order_quad // 02EFFB8F
  add esp, 0x10 // 02EFFB94
  fxrstor [ebx] // 02EFFB97
  lea esp, [ebp - 0x20] // 02EFFB9A
  popad // 02EFFB9D
  pop ebp // 02EFFB9E
  add esp, #4 // 02EFFB9F
  ret // 02EFFBA2
fps_dialogue_previous_quad:
  push ebp // 02EFFBA3
  mov ebp, esp // 02EFFBA4
  push ebx // 02EFFBA6
  push esi // 02EFFBA7
  push edi // 02EFFBA8
  mov edi, dword ptr [ebp + #8] // 02EFFBA9
  mov esi, dword ptr [ebp + 0xc] // 02EFFBAC
  push dword ptr [ebp + 0x10] // 02EFFBAF
  mov eax, fps_dialogue_name_textured_hook // 02EFFBB2
  cmp dword ptr [ebp + 0x14], #3 // 02EFFBB7
  jne short fps_loc_02EFFBC2 // 02EFFBBB
  mov eax, fps_dialogue_name_pointer_outline_hook // 02EFFBBD
fps_loc_02EFFBC2:
  call eax // 02EFFBC2
  add esp, #4 // 02EFFBC4
  pop edi // 02EFFBC7
  pop esi // 02EFFBC8
  pop ebx // 02EFFBC9
  pop ebp // 02EFFBCA
  ret // 02EFFBCB
  db 66,90 // nop // 02EFFBCC
  db 66,90 // nop // 02EFFBCE
  db 66,90 // nop // 02EFFBD0
  db 66,90 // nop // 02EFFBD2
  db 66,90 // nop // 02EFFBD4
  db 66,90 // nop // 02EFFBD6
  db 66,90 // nop // 02EFFBD8
  db 66,90 // nop // 02EFFBDA
  db 66,90 // nop // 02EFFBDC
  db 66,90 // nop // 02EFFBDE
fps_dialogue_tail_order_quad:
  sub esp, 0x5c // 02EFFBE0
  mov eax, dword ptr [esp + 0x64] // 02EFFBE3
  fld dword ptr [esp + 0x68] // 02EFFBE7
  mov dword ptr [esp + 0x4c], ebx // 02EFFBEB
  mov dword ptr [esp + 0x50], esi // 02EFFBEF
  mov edx, dword ptr [esp + 0x60] // 02EFFBF3
  mov dword ptr [esp + #8], eax // 02EFFBF7
  mov eax, dword ptr [esp + 0x6c] // 02EFFBFB
  mov dword ptr [esp + 0x54], edi // 02EFFBFF
  cmp eax, #3 // 02EFFC03
  je near fps_loc_02EFFCD0 // 02EFFC06
  mov ecx, dword ptr [TOS.exe+6D3F68] // 02EFFC0C
  mov dword ptr [esp + 0x58], ebp // 02EFFC12
  movzx ebx, byte ptr [ecx + 0x242] // 02EFFC16
  movzx ebp, word ptr [edx + 0x283a] // 02EFFC1D
  movzx esi, word ptr [edx + 0x2842] // 02EFFC24
  movzx edi, word ptr [edx + 0x283e] // 02EFFC2B
  and ebx, 0xc // 02EFFC32
  mov word ptr [esp + 0xe], si // 02EFFC35
  mov word ptr [esp + 0xc], di // 02EFFC3A
  mov edi, dword ptr [edx + 0x2834] // 02EFFC3F
  movzx ecx, byte ptr [edx + 0x2743] // 02EFFC45
  movzx esi, word ptr [edx + 0x2740] // 02EFFC4C
  cmp bl, #8 // 02EFFC53
  jne short fps_loc_02EFFC9F // 02EFFC56
  test edi, edi // 02EFFC58
  je short fps_loc_02EFFC9F // 02EFFC5A
  and ecx, 0x7f // 02EFFC5C
  sub ecx, #2 // 02EFFC5F
  cmp ecx, #1 // 02EFFC62
  ja short fps_loc_02EFFC9F // 02EFFC65
  movsx ebx, bp // 02EFFC67
  movsx ecx, word ptr [esp + 0xc] // 02EFFC6A
  lea edi, [ebx - 0x12] // 02EFFC6F
  cmp ecx, edi // 02EFFC72
  jge short fps_loc_02EFFC9F // 02EFFC74
  movsx ecx, word ptr [esp + 0xe] // 02EFFC76
  add ebx, 0x12 // 02EFFC7B
  cmp ecx, ebx // 02EFFC7E
  jle short fps_loc_02EFFC9F // 02EFFC80
  mov ecx, esi // 02EFFC82
  and cx, 0x180 // 02EFFC84
  cmp cx, 0x100 // 02EFFC89
  je near fps_loc_02EFFDC8 // 02EFFC8E
  cmp cx, 0x80 // 02EFFC94
  je near fps_loc_02EFFD67 // 02EFFC99
fps_loc_02EFFC9F:
  mov eax, dword ptr [esp + #8] // 02EFFC9F
  mov ebp, dword ptr [esp + 0x58] // 02EFFCA3
  mov dword ptr [esp + 0x6c], #0 // 02EFFCA7
  mov ebx, dword ptr [esp + 0x4c] // 02EFFCAF
  mov esi, dword ptr [esp + 0x50] // 02EFFCB3
  mov dword ptr [esp + 0x60], edx // 02EFFCB7
  mov edi, dword ptr [esp + 0x54] // 02EFFCBB
  mov dword ptr [esp + 0x64], eax // 02EFFCBF
  fstp dword ptr [esp + 0x68] // 02EFFCC3
  add esp, 0x5c // 02EFFCC7
  jmp near fps_dialogue_previous_quad // 02EFFCCA
  nop // 02EFFCCF
fps_loc_02EFFCD0:
  push #3 // 02EFFCD0
  sub esp, #4 // 02EFFCD2
  fstp dword ptr [esp] // 02EFFCD5
  push dword ptr [esp + 0x10] // 02EFFCD8
  push edx // 02EFFCDC
  mov dword ptr [esp + 0x18], edx // 02EFFCDD
  call fps_dialogue_previous_quad // 02EFFCE1
  add esp, 0x10 // 02EFFCE6
  mov edx, dword ptr [esp + #8] // 02EFFCE9
  mov eax, TOS.exe+71A580 // 02EFFCED
  lea ebx, [esp - 0xb1a570] // 02EFFCF2
  db 8D,B4,26,00,00,00,00 // lea esi, [esi] // 02EFFCF9
fps_loc_02EFFD00:
  mov ecx, dword ptr [eax] // 02EFFD00
  db 89,0C,03 // mov dword ptr [ebx + eax], ecx // 02EFFD02
  add eax, #4 // 02EFFD05
  cmp eax, TOS.exe+71A5B0 // 02EFFD08
  jne short fps_loc_02EFFD00 // 02EFFD0D
  xor esi, esi // 02EFFD0F
  mov edi, edx // 02EFFD11
fps_loc_02EFFD13:
  mov eax, dword ptr [esi + dialogue_corners+38] // 02EFFD13
  test eax, eax // 02EFFD19
  je short fps_loc_02EFFD29 // 02EFFD1B
  cmp dword ptr [esi + fps_dialogue_pending], edi // 02EFFD1D
  je near fps_loc_02EFFDD6 // 02EFFD23
fps_loc_02EFFD29:
  cmp esi, 0x40 // 02EFFD29
  jne short fps_loc_02EFFD60 // 02EFFD2C
  mov eax, TOS.exe+71A580 // 02EFFD2E
  db 2E,8D,74,26,00 // lea esi, cs:[esi] // 02EFFD33
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02EFFD38
fps_loc_02EFFD40:
  db 8B,14,03 // mov edx, dword ptr [ebx + eax] // 02EFFD40
  add eax, #4 // 02EFFD43
  mov dword ptr [eax - #4], edx // 02EFFD46
  cmp eax, TOS.exe+71A5B0 // 02EFFD49
  jne short fps_loc_02EFFD40 // 02EFFD4E
  mov ebx, dword ptr [esp + 0x4c] // 02EFFD50
  mov esi, dword ptr [esp + 0x50] // 02EFFD54
  mov edi, dword ptr [esp + 0x54] // 02EFFD58
  add esp, 0x5c // 02EFFD5C
  ret // 02EFFD5F
fps_loc_02EFFD60:
  mov esi, 0x40 // 02EFFD60
  jmp short fps_loc_02EFFD13 // 02EFFD65
fps_loc_02EFFD67:
  lea ecx, [eax - #6] // 02EFFD67
  cmp ecx, #1 // 02EFFD6A
  ja near fps_loc_02EFFC9F // 02EFFD6D
fps_loc_02EFFD73:
  mov edi, dword ptr [esp + #8] // 02EFFD73
  and eax, #1 // 02EFFD77
  shl eax, #6 // 02EFFD7A
  mov dword ptr [eax + dialogue_corners+4], edi // 02EFFD7D
  mov dword ptr [eax + dialogue_corners+38], #1 // 02EFFD83
  mov dword ptr [eax + fps_dialogue_pending], edx // 02EFFD8D
  mov edx, TOS.exe+71A580 // 02EFFD93
  fstp dword ptr [eax + dialogue_corners+3C] // 02EFFD98
  db 66,90 // nop // 02EFFD9E
fps_loc_02EFFDA0:
  mov ecx, dword ptr [edx] // 02EFFDA0
  mov dword ptr [eax + edx + dialogue_corners+8-0xB1A580], ecx // 02EFFDA2
  add edx, #4 // 02EFFDA9
  cmp edx, TOS.exe+71A5B0 // 02EFFDAC
  jne short fps_loc_02EFFDA0 // 02EFFDB2
  mov ebp, dword ptr [esp + 0x58] // 02EFFDB4
  mov ebx, dword ptr [esp + 0x4c] // 02EFFDB8
  mov esi, dword ptr [esp + 0x50] // 02EFFDBC
  mov edi, dword ptr [esp + 0x54] // 02EFFDC0
  add esp, 0x5c // 02EFFDC4
  ret // 02EFFDC7
fps_loc_02EFFDC8:
  lea ecx, [eax - #4] // 02EFFDC8
  cmp ecx, #1 // 02EFFDCB
  ja near fps_loc_02EFFC9F // 02EFFDCE
  jmp short fps_loc_02EFFD73 // 02EFFDD4
fps_loc_02EFFDD6:
  mov dword ptr [esi + dialogue_corners+38], #0 // 02EFFDD6
  mov eax, TOS.exe+71A580 // 02EFFDE0
  jmp short fps_loc_02EFFE00 // 02EFFDE5
  nop // 02EFFDE7
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02EFFDE8
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02EFFDF0
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02EFFDF8
fps_loc_02EFFE00:
  db 8B,8C,06
  dd dialogue_corners+8-0xB1A580 // mov ecx, dword ptr [esi + eax + dialogue_corners+8-0xB1A580] // 02EFFE00
  add eax, #4 // 02EFFE07
  mov dword ptr [eax - #4], ecx // 02EFFE0A
  cmp eax, TOS.exe+71A5B0 // 02EFFE0D
  jne short fps_loc_02EFFE00 // 02EFFE12
  push #0 // 02EFFE14
  push dword ptr [esi + dialogue_corners+3C] // 02EFFE16
  push dword ptr [esi + dialogue_corners+4] // 02EFFE1C
  push edi // 02EFFE22
  call fps_dialogue_previous_quad // 02EFFE23
  add esp, 0x10 // 02EFFE28
  jmp near fps_loc_02EFFD29 // 02EFFE2B

// Alignment before the mutable pending-corner records.
  db 66,90,66,90,66,90,66,90,66,90,66,90,66,90,66,90 // 02EFFE30: constants / retained padding

// ======================================================================
// dialogue_corners: reference 02EFFE40..02EFFEBF.
// Two zero-initialized 64-byte pending corner records, containing transient dialogue pointers and quads.
// Allocation bytes start at zero; no debugger state is copied.
dialogue_corners:
  db 00

// ======================================================================
// dialogue_helpers: reference 02EFFEC0..02F00FFF.
dialogue_helpers:
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFEC0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFED0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFEE0: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFEF0: constants / retained padding

// Find type-6 animation node and skip callback while it is blending; preserve native outer attack-state updates and flags.
fps_arte_callback_blend_guard:
  mov eax, dword ptr [esi + 0x18] // 02EFFF00
  xor ebx, ebx // 02EFFF03
  cmp eax, ebx // 02EFFF05
  je short fps_loc_02EFFF35 // 02EFFF07
  push eax // 02EFFF09
  push ecx // 02EFFF0A
  mov eax, dword ptr [esi + 0x2c4] // 02EFFF0B
  mov eax, dword ptr [eax + 0x718] // 02EFFF11
  mov ecx, eax // 02EFFF17
fps_loc_02EFFF19:
  test eax, eax // 02EFFF19
  je short fps_loc_02EFFF29 // 02EFFF1B
  cmp word ptr [eax + #6], #6 // 02EFFF1D
  je short fps_loc_02EFFF2B // 02EFFF22
  mov eax, dword ptr [eax + 0x2c] // 02EFFF24
  jmp short fps_loc_02EFFF19 // 02EFFF27
fps_loc_02EFFF29:
  mov eax, ecx // 02EFFF29
fps_loc_02EFFF2B:
  test byte ptr [eax + 0x20], 0x80 // 02EFFF2B
  pop ecx // 02EFFF2F
  pop eax // 02EFFF30
  jne short fps_loc_02EFFF3A // 02EFFF31
  cmp eax, ebx // 02EFFF33
fps_loc_02EFFF35:
  jmp near TOS.exe+27F2F // 02EFFF35
fps_loc_02EFFF3A:
  jmp near TOS.exe+27F37 // 02EFFF3A
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFF3F: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFF4F: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFF5F: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFF6F: constants / retained padding
  db 00 // 02EFFF7F: constants / retained padding

// Reject busy descriptors and descriptors referenced by active/pending nodes; preserve native exhausted-pool fallback.
fps_field_animation_slot_reuse_guard:
  push ebx // 02EFFF80
  push esi // 02EFFF81
  push edi // 02EFFF82
  xor eax, eax // 02EFFF83
  lea ecx, [edx + 0x85c] // 02EFFF85
fps_loc_02EFFF8B:
  cmp byte ptr [ecx], #0 // 02EFFF8B
  jne short fps_loc_02EFFFB1 // 02EFFF8E
  lea ebx, [ecx - 0x10] // 02EFFF90
  mov esi, dword ptr [edx + 0x808] // 02EFFF93
fps_loc_02EFFF99:
  test esi, esi // 02EFFF99
  je short fps_loc_02EFFFC2 // 02EFFF9B
  cmp dword ptr [esi], ebx // 02EFFF9D
  je short fps_loc_02EFFFB1 // 02EFFF9F
  mov edi, dword ptr [esi + 0x30] // 02EFFFA1
  test edi, edi // 02EFFFA4
  je short fps_loc_02EFFFAC // 02EFFFA6
  cmp dword ptr [edi], ebx // 02EFFFA8
  je short fps_loc_02EFFFB1 // 02EFFFAA
fps_loc_02EFFFAC:
  mov esi, dword ptr [esi + 0x2c] // 02EFFFAC
  jmp short fps_loc_02EFFF99 // 02EFFFAF
fps_loc_02EFFFB1:
  inc eax // 02EFFFB1
  add ecx, 0x4c // 02EFFFB2
  cmp eax, #3 // 02EFFFB5
  jne short fps_loc_02EFFF8B // 02EFFFB8
  pop edi // 02EFFFBA
  pop esi // 02EFFFBB
  pop ebx // 02EFFFBC
  jmp near TOS.exe+C8936 // 02EFFFBD
fps_loc_02EFFFC2:
  pop edi // 02EFFFC2
  pop esi // 02EFFFC3
  pop ebx // 02EFFFC4
  ret // 02EFFFC5
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFFC6: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFFD6: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02EFFFE6: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00 // 02EFFFF6: constants / retained padding

// Clip shared fill/textured quads around the name tab and pointer; preserve shared quad and FPU/SSE state.
fps_dialogue_name_textured_hook:
  push #0 // 02F00000
  jmp short fps_dialogue_name_entry // 02F00002
fps_dialogue_name_pointer_fill_hook:
  push #2 // 02F00004
  jmp short fps_dialogue_name_entry // 02F00006
fps_dialogue_name_pointer_outline_hook:
  push #3 // 02F00008
  jmp short fps_dialogue_name_entry // 02F0000A
fps_dialogue_name_fill_hook:
  push #1 // 02F0000C
fps_dialogue_name_entry:
  push ebp // 02F0000E
  mov ebp, esp // 02F0000F
  pushad // 02F00011
  sub esp, 0x220 // 02F00012
  and esp, 0xfffffff0 // 02F00018
  fxsave [esp] // 02F0001B
  fninit // 02F0001F
  mov ebx, esp // 02F00021
  push dword ptr [ebp + #4] // 02F00023
  push dword ptr [ebp + 0xc] // 02F00026
  push esi // 02F00029
  push edi // 02F0002A
  call fps_dialogue_name_quad // 02F0002B
  add esp, 0x10 // 02F00030
  fxrstor [ebx] // 02F00033
  lea esp, [ebp - 0x20] // 02F00036
  popad // 02F00039
  pop ebp // 02F0003A
  add esp, #4 // 02F0003B
  ret // 02F0003E
fps_dialogue_original_quad:
  push ebp // 02F0003F
  mov ebp, esp // 02F00040
  push ebx // 02F00042
  push esi // 02F00043
  push edi // 02F00044
  mov esi, dword ptr [ebp + #8] // 02F00045
  push dword ptr [ebp + 0xc] // 02F00048
  mov eax, TOS.exe+1801F0 // 02F0004B
  cmp dword ptr [ebp + 0x10], #0 // 02F00050
  je short fps_loc_02F0005B // 02F00054
  mov eax, TOS.exe+180460 // 02F00056
fps_loc_02F0005B:
  call eax // 02F0005B
  add esp, #4 // 02F0005D
  pop edi // 02F00060
  pop esi // 02F00061
  pop ebx // 02F00062
  pop ebp // 02F00063
  ret // 02F00064
fps_dialogue_native_quad:
  push ebp // 02F00065
  mov ebp, esp // 02F00066
  push ebx // 02F00068
  push esi // 02F00069
  push edi // 02F0006A
  mov edi, dword ptr [ebp + #8] // 02F0006B
  mov eax, TOS.exe+191EE0 // 02F0006E
  mov ecx, 0xce1 // 02F00073
  cmp dword ptr [ebp + 0x10], #0 // 02F00078
  je short fps_loc_02F00088 // 02F0007C
  mov eax, TOS.exe+192220 // 02F0007E
  mov ecx, 0x3ce1 // 02F00083
fps_loc_02F00088:
  push ecx // 02F00088
  push dword ptr [ebp + 0xc] // 02F00089
  call eax // 02F0008C
  add esp, #8 // 02F0008E
  pop edi // 02F00091
  pop esi // 02F00092
  pop ebx // 02F00093
  pop ebp // 02F00094
  ret // 02F00095
  db 66,90 // nop // 02F00096
  db 66,90 // nop // 02F00098
  db 66,90 // nop // 02F0009A
  db 66,90 // nop // 02F0009C
  db 66,90 // nop // 02F0009E
  db 66,90 // nop // 02F000A0
  db 66,90 // nop // 02F000A2
  db 66,90 // nop // 02F000A4
  db 66,90 // nop // 02F000A6
  db 66,90 // nop // 02F000A8
  db 66,90 // nop // 02F000AA
  db 66,90 // nop // 02F000AC
  db 66,90 // nop // 02F000AE
  db 66,90 // nop // 02F000B0
  db 66,90 // nop // 02F000B2
  db 66,90 // nop // 02F000B4
  db 66,90 // nop // 02F000B6
  db 66,90 // nop // 02F000B8
  db 66,90 // nop // 02F000BA
  db 66,90 // nop // 02F000BC
  db 66,90 // nop // 02F000BE
fps_dialogue_clip:
  push ebp // 02F000C0
  mov ebp, ecx // 02F000C1
  push edi // 02F000C3
  push esi // 02F000C4
  push ebx // 02F000C5
  mov ebx, eax // 02F000C6
  mov eax, edx // 02F000C8
  db 8D,54,52,FD // lea edx, [edx + edx*#2 - #3] // 02F000CA
  shl edx, #4 // 02F000CE
  add edx, ebx // 02F000D1
  sub esp, 0xac // 02F000D3
  movups xmm1, xmmword ptr [edx] // 02F000D9
  movups xmm3, xmmword ptr [edx + 0x10] // 02F000DC
  fld dword ptr [esp + 0xc0] // 02F000E0
  fld dword ptr [esp + 0xc4] // 02F000E7
  fld dword ptr [esp + 0xc8] // 02F000EE
  movss dword ptr [esp + #8], xmm1 // 02F000F5
  mov esi, dword ptr [esp + 0xd0] // 02F000FB
  movups xmm4, xmmword ptr [edx + 0x20] // 02F00102
  fsub st(0), st(2) // 02F00106
  fld dword ptr [esp + 0xcc] // 02F00108
  fsub st(0), st(2) // 02F0010F
  fld dword ptr [edx + #4] // 02F00111
  fsub st(0), st(3) // 02F00114
  fmul st(0), st(2) // 02F00116
  fld dword ptr [esp + #8] // 02F00118
  fsub st(0), st(5) // 02F0011C
  fmul st(0), st(2) // 02F0011E
  fsubp st(1) // 02F00120
  fldz // 02F00122
  test esi, esi // 02F00124
  je near fps_loc_02F00285 // 02F00126
  fxch st(1) // 02F0012C
  fcomi st(1) // 02F0012E
  fstp st(1) // 02F00130
  setae cl // 02F00132
fps_loc_02F00135:
  db 8D,04,40 // lea eax, [eax + eax*#2] // 02F00135
  movzx ecx, cl // 02F00138
  mov edx, ebx // 02F0013B
  shl eax, #4 // 02F0013D
  add eax, ebx // 02F00140
  mov dword ptr [esp + 0xc], eax // 02F00142
  xor eax, eax // 02F00146
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00148
fps_loc_02F00150:
  fld dword ptr [edx + #4] // 02F00150
  movaps xmm5, xmm1 // 02F00153
  movups xmm1, xmmword ptr [edx] // 02F00156
  mov ebx, dword ptr [esp + 0xd0] // 02F00159
  movaps xmm2, xmm3 // 02F00160
  movaps xmm0, xmm4 // 02F00163
  movups xmm3, xmmword ptr [edx + 0x10] // 02F00166
  movss dword ptr [esp + #8], xmm1 // 02F0016A
  movups xmm4, xmmword ptr [edx + 0x20] // 02F00170
  fsub st(0), st(4) // 02F00174
  fmul st(0), st(3) // 02F00176
  fld dword ptr [esp + #8] // 02F00178
  fsub st(0), st(6) // 02F0017C
  fmul st(0), st(3) // 02F0017E
  fsubp st(1) // 02F00180
  fldz // 02F00182
  test ebx, ebx // 02F00184
  je near fps_loc_02F00260 // 02F00186
  fxch st(1) // 02F0018C
  fcomi st(1) // 02F0018E
  fstp st(1) // 02F00190
  setae bl // 02F00192
fps_loc_02F00195:
  movzx esi, bl // 02F00195
  cmp esi, ecx // 02F00198
  je near fps_loc_02F00228 // 02F0019A
  fld st(1) // 02F001A0
  db 8D,0C,40 // lea ecx, [eax + eax*#2] // 02F001A2
  movaps xmmword ptr [esp + 0x20], xmm2 // 02F001A5
  lea edi, [eax + #1] // 02F001AA
  fsub st(0), st(1) // 02F001AD
  shl ecx, #4 // 02F001AF
  movaps xmmword ptr [esp + 0x10], xmm5 // 02F001B2
  xor eax, eax // 02F001B7
  add ecx, ebp // 02F001B9
  movaps xmmword ptr [esp + 0x30], xmm0 // 02F001BB
  movaps xmmword ptr [esp + 0x40], xmm1 // 02F001C0
  fdivp st(2) // 02F001C5
  fxch st(1) // 02F001C7
  movaps xmmword ptr [esp + 0x50], xmm3 // 02F001C9
  movaps xmmword ptr [esp + 0x60], xmm4 // 02F001CE
  fstp dword ptr [esp + #8] // 02F001D3
  movss xmm2, dword ptr [esp + #8] // 02F001D7
  shufps xmm2, xmm2, #0 // 02F001DD
fps_loc_02F001E1:
  movaps xmm5, xmmword ptr [esp + eax + 0x10] // 02F001E1
  movaps xmm0, xmmword ptr [esp + eax + 0x40] // 02F001E6
  subps xmm0, xmm5 // 02F001EB
  mulps xmm0, xmm2 // 02F001EE
  addps xmm0, xmm5 // 02F001F1
  movaps xmmword ptr [esp + eax + 0x70], xmm0 // 02F001F4
  add eax, 0x10 // 02F001F9
  cmp eax, 0x30 // 02F001FC
  jne short fps_loc_02F001E1 // 02F001FF
  movaps xmm0, xmmword ptr [esp + 0x70] // 02F00201
  mov eax, edi // 02F00206
  movups xmmword ptr [ecx], xmm0 // 02F00208
  movaps xmm0, xmmword ptr [esp + 0x80] // 02F0020B
  movups xmmword ptr [ecx + 0x10], xmm0 // 02F00213
  movaps xmm0, xmmword ptr [esp + 0x90] // 02F00217
  movups xmmword ptr [ecx + 0x20], xmm0 // 02F0021F
  jmp short fps_loc_02F0022A // 02F00223
  db 8D,76,00 // lea esi, [esi] // 02F00225
fps_loc_02F00228:
  fstp st(1) // 02F00228
fps_loc_02F0022A:
  test bl, bl // 02F0022A
  je short fps_loc_02F00246 // 02F0022C
  db 8D,0C,40 // lea ecx, [eax + eax*#2] // 02F0022E
  add eax, #1 // 02F00231
  shl ecx, #4 // 02F00234
  movups xmmword ptr [ebp + ecx], xmm1 // 02F00237
  movups xmmword ptr [ebp + ecx + 0x10], xmm3 // 02F0023C
  movups xmmword ptr [ebp + ecx + 0x20], xmm4 // 02F00241
fps_loc_02F00246:
  add edx, 0x30 // 02F00246
  cmp dword ptr [esp + 0xc], edx // 02F00249
  je short fps_loc_02F00270 // 02F0024D
  mov ecx, esi // 02F0024F
  jmp near fps_loc_02F00150 // 02F00251
  db 66,90 // nop // 02F00256
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00258
fps_loc_02F00260:
  fcomip st(1) // 02F00260
  setae bl // 02F00262
  jmp near fps_loc_02F00195 // 02F00265
  db 8D,B6,00,00,00,00 // lea esi, [esi] // 02F0026A
fps_loc_02F00270:
  fstp st(0) // 02F00270
  fstp st(0) // 02F00272
  fstp st(0) // 02F00274
  fstp st(0) // 02F00276
  fstp st(0) // 02F00278
  add esp, 0xac // 02F0027A
  pop ebx // 02F00280
  pop esi // 02F00281
  pop edi // 02F00282
  pop ebp // 02F00283
  ret // 02F00284
fps_loc_02F00285:
  fcomip st(1) // 02F00285
  setae cl // 02F00287
  jmp near fps_loc_02F00135 // 02F0028A
  nop // 02F0028F
fps_dialogue_dialog_covers_pointer:
  sub esp, 0x1c // 02F00290
  mov dword ptr [esp + 0x10], esi // 02F00293
  mov dword ptr [esp + 0x14], edi // 02F00297
  movzx edi, word ptr [eax + 0x283a] // 02F0029B
  movsx esi, word ptr [eax + 0x283e] // 02F002A2
  movzx ecx, word ptr [eax + 0x2740] // 02F002A9
  mov dword ptr [esp + 0xc], ebx // 02F002B0
  movsx edx, word ptr [eax + 0x2748] // 02F002B4
  mov eax, dword ptr [TOS.exe+6D3F68] // 02F002BB
  movzx eax, byte ptr [eax + 0x242] // 02F002C0
  shr al, #2 // 02F002C7
  mov ebx, eax // 02F002CA
  and eax, #3 // 02F002CC
  sub eax, #1 // 02F002CF
  and ebx, #3 // 02F002D2
  cmp eax, #1 // 02F002D5
  ja short fps_loc_02F00340 // 02F002D8
  test edx, edx // 02F002DA
  jle short fps_loc_02F00340 // 02F002DC
  and cx, 0x180 // 02F002DE
  cmp cx, 0x100 // 02F002E3
  jne short fps_loc_02F00340 // 02F002E8
  add edx, #8 // 02F002EA
  lea eax, [esi - #9] // 02F002ED
  mov dword ptr [esp + 0x18], ebp // 02F002F0
  mov ebp, ebx // 02F002F4
  mov dword ptr [esp], edx // 02F002F6
  fild dword ptr [esp] // 02F002F9
  movsx ebx, di // 02F002FC
  mov dword ptr [esp], eax // 02F002FF
  fmul qword ptr [fps_dialogue_name_double] // 02F00302
  mov eax, ebp // 02F00308
  fild dword ptr [esp] // 02F0030A
  faddp st(1) // 02F0030D
  fstp qword ptr [esp] // 02F0030F
  cvttsd2si edx, qword ptr [esp] // 02F00312
  cmp al, #2 // 02F00317
  je short fps_loc_02F00358 // 02F00319
  lea eax, [ebx - #3] // 02F0031B
  cmp esi, eax // 02F0031E
  jge short fps_loc_02F00338 // 02F00320
  add ebx, 0xd // 02F00322
  xor eax, eax // 02F00325
  mov ebp, dword ptr [esp + 0x18] // 02F00327
  cmp edx, ebx // 02F0032B
  setg al // 02F0032D
  jmp short fps_loc_02F00342 // 02F00330
  db 8D,B6,00,00,00,00 // lea esi, [esi] // 02F00332
fps_loc_02F00338:
  mov ebp, dword ptr [esp + 0x18] // 02F00338
  db 8D,74,26,00 // lea esi, [esi] // 02F0033C
fps_loc_02F00340:
  xor eax, eax // 02F00340
fps_loc_02F00342:
  mov ebx, dword ptr [esp + 0xc] // 02F00342
  mov esi, dword ptr [esp + 0x10] // 02F00346
  mov edi, dword ptr [esp + 0x14] // 02F0034A
  add esp, 0x1c // 02F0034E
  ret // 02F00351
  db 8D,B6,00,00,00,00 // lea esi, [esi] // 02F00352
fps_loc_02F00358:
  sub esi, #7 // 02F00358
  cmp ebx, esi // 02F0035B
  jl short fps_loc_02F00338 // 02F0035D
  add ebx, #1 // 02F0035F
  xor eax, eax // 02F00362
  mov ebp, dword ptr [esp + 0x18] // 02F00364
  cmp edx, ebx // 02F00368
  setg al // 02F0036A
  jmp short fps_loc_02F00342 // 02F0036D
  nop // 02F0036F
fps_dialogue_masked_quad:
  sub esp, 0xa2c // 02F00370
  movss xmm1, dword ptr [esp + 0xa30] // 02F00376
  mov dword ptr [esp + 0xa1c], ebx // 02F0037F
  mov dword ptr [esp + 0xa28], ebp // 02F00386
  mov ebp, ecx // 02F0038D
  movsx ecx, word ptr [eax + 0x2748] // 02F0038F
  mov ebx, dword ptr [TOS.exe+6D3F68] // 02F00396
  movzx ebx, byte ptr [ebx + 0x242] // 02F0039C
  test ecx, ecx // 02F003A3
  jle near fps_loc_02F005B8 // 02F003A5
  shr bl, #2 // 02F003AB
  mov dword ptr [esp + 0xa20], esi // 02F003AE
  mov esi, ebx // 02F003B5
  and ebx, #3 // 02F003B7
  sub ebx, #1 // 02F003BA
  and esi, #3 // 02F003BD
  cmp ebx, #1 // 02F003C0
  ja near fps_loc_02F005E8 // 02F003C3
  fild word ptr [eax + 0x283e] // 02F003C9
  mov dword ptr [esp + 0xa24], edi // 02F003CF
  movzx edi, word ptr [eax + 0x2840] // 02F003D6
  movsx ebx, word ptr [eax + 0x2844] // 02F003DD
  mov word ptr [esp], di // 02F003E4
  movsx edi, word ptr [eax + 0x2840] // 02F003E8
  sub ebx, edi // 02F003EF
  cmp ebx, 0x38 // 02F003F1
  jle near fps_loc_02F005F8 // 02F003F4
  fild word ptr [esp] // 02F003FA
fps_loc_02F003FD:
  fld dword ptr [fps_dialogue_name_floats] // 02F003FD
  add ecx, #8 // 02F00403
  movsx eax, word ptr [eax + 0x283e] // 02F00406
  mov dword ptr [esp], ecx // 02F0040D
  fsubr st(0), st(2) // 02F00410
  fxch st(1) // 02F00412
  fsub dword ptr [dialogue_helpers+FFC] // 02F00414
  fild dword ptr [esp] // 02F0041A
  fmul qword ptr [fps_dialogue_name_double] // 02F0041D
  fxch st(3) // 02F00423
  fsub dword ptr [dialogue_helpers+1000] // 02F00425
  fadd st(0), st(3) // 02F0042B
  fstp qword ptr [esp] // 02F0042D
  cvttsd2si ecx, qword ptr [esp] // 02F00430
  mov dword ptr [esp], ecx // 02F00435
  fild dword ptr [esp] // 02F00438
  mov ecx, esi // 02F0043B
  fld dword ptr [dialogue_helpers+1004] // 02F0043D
  fld st(2) // 02F00443
  fadd st(0), st(1) // 02F00445
  fld dword ptr [dialogue_helpers+1008] // 02F00447
  fadd st(0), st(3) // 02F0044D
  fxch st(2) // 02F0044F
  fadd st(0), st(5) // 02F00451
  cmp cl, #2 // 02F00453
  je near fps_loc_02F00988 // 02F00456
  fld dword ptr [dialogue_helpers+1010] // 02F0045C
  mov ecx, #6 // 02F00462
  fadd st(0), st(6) // 02F00467
  fstp dword ptr [esp + 0x20] // 02F00469
  fxch st(1) // 02F0046D
  fst dword ptr [esp + 0x24] // 02F0046F
  fld dword ptr [dialogue_helpers+1014] // 02F00473
  fadd st(0), st(4) // 02F00479
  fstp dword ptr [esp + 0x28] // 02F0047B
  fstp dword ptr [esp + 0x2c] // 02F0047F
  fxch st(1) // 02F00483
  fstp dword ptr [esp + 0x30] // 02F00485
  fld dword ptr [dialogue_helpers+1018] // 02F00489
  fadd st(0), st(3) // 02F0048F
  fstp dword ptr [esp + 0x34] // 02F00491
  fxch st(1) // 02F00495
  fadd dword ptr [dialogue_helpers+1020] // 02F00497
  fstp dword ptr [esp + 0x38] // 02F0049D
  fld dword ptr [dialogue_helpers+101C] // 02F004A1
  fadd st(0), st(2) // 02F004A7
  fstp dword ptr [esp] // 02F004A9
  fld dword ptr [dialogue_helpers+1024] // 02F004AC
  movss xmm0, dword ptr [esp] // 02F004B2
  movss dword ptr [esp + 0x3c], xmm0 // 02F004B7
  fadd st(0), st(3) // 02F004BD
  movss dword ptr [esp + 0x44], xmm0 // 02F004BF
  fstp dword ptr [esp + 0x40] // 02F004C5
  fstp dword ptr [esp + 0x48] // 02F004C9
  fld dword ptr [dialogue_helpers+1000] // 02F004CD
  fadd st(0), st(1) // 02F004D3
  fstp dword ptr [esp + 0x4c] // 02F004D5
fps_loc_02F004D9:
  fld dword ptr [TOS.exe+71A588] // 02F004D9
  fxch st(2) // 02F004DF
  fcomip st(2) // 02F004E1
  fstp st(1) // 02F004E3
  jae near fps_loc_02F00590 // 02F004E5
  sub eax, #9 // 02F004EB
  fld dword ptr [TOS.exe+71A580] // 02F004EE
  mov dword ptr [esp], eax // 02F004F4
  fild dword ptr [esp] // 02F004F7
  faddp st(3) // 02F004FA
  fxch st(2) // 02F004FC
  fstp qword ptr [esp] // 02F004FE
  cvttsd2si eax, qword ptr [esp] // 02F00501
  mov dword ptr [esp], eax // 02F00506
  fild dword ptr [esp] // 02F00509
  fadd dword ptr [dialogue_helpers+1028] // 02F0050C
  fxch st(2) // 02F00512
  fcomip st(2) // 02F00514
  fstp st(1) // 02F00516
  jae near fps_loc_02F005A0 // 02F00518
  fld dword ptr [TOS.exe+71A58C] // 02F0051E
  fxch st(1) // 02F00524
  fcomi st(1) // 02F00526
  fstp st(1) // 02F00528
  jae short fps_loc_02F005A8 // 02F0052A
  fld dword ptr [TOS.exe+71A584] // 02F0052C
  fxch st(1) // 02F00532
  fadd dword ptr [dialogue_helpers+FFC] // 02F00534
  fxch st(1) // 02F0053A
  fcomip st(1) // 02F0053C
  fstp st(0) // 02F0053E
  jae short fps_loc_02F005AA // 02F00540
  cmp edx, -0xf // 02F00542
  je near fps_loc_02F00620 // 02F00545
  cmp edx, 0x20000001 // 02F0054B
  je near fps_loc_02F00620 // 02F00551
  mov esi, dword ptr [TOS.exe+71C0B8] // 02F00557
  mov eax, dword ptr [TOS.exe+71C0BC] // 02F0055D
  test esi, esi // 02F00562
  je short fps_loc_02F005AA // 02F00564
  xor ebx, ebx // 02F00566
  jmp short fps_loc_02F0057A // 02F00568
  db 8D,B6,00,00,00,00 // lea esi, [esi] // 02F0056A
fps_loc_02F00570:
  add ebx, #1 // 02F00570
  add eax, 0x1c // 02F00573
  cmp esi, ebx // 02F00576
  je short fps_loc_02F005AA // 02F00578
fps_loc_02F0057A:
  cmp dword ptr [eax], edx // 02F0057A
  jne short fps_loc_02F00570 // 02F0057C
  mov eax, dword ptr [eax + 0x10] // 02F0057E
  mov dword ptr [esp], eax // 02F00581
  test eax, eax // 02F00584
  jne near fps_loc_02F00627 // 02F00586
  jmp short fps_loc_02F005AA // 02F0058C
  db 66,90 // nop // 02F0058E
fps_loc_02F00590:
  fstp st(0) // 02F00590
  fstp st(0) // 02F00592
  jmp short fps_loc_02F005AA // 02F00594
  db 66,90 // nop // 02F00596
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00598
fps_loc_02F005A0:
  fstp st(0) // 02F005A0
  jmp short fps_loc_02F005AA // 02F005A2
  db 8D,74,26,00 // lea esi, [esi] // 02F005A4
fps_loc_02F005A8:
  fstp st(0) // 02F005A8
fps_loc_02F005AA:
  mov esi, dword ptr [esp + 0xa20] // 02F005AA
  mov edi, dword ptr [esp + 0xa24] // 02F005B1
fps_loc_02F005B8:
  sub esp, #4 // 02F005B8
  push ebp // 02F005BB
  sub esp, #4 // 02F005BC
  movss dword ptr [esp], xmm1 // 02F005BF
  push edx // 02F005C4
  call fps_dialogue_original_quad // 02F005C5
  add esp, 0x10 // 02F005CA
fps_loc_02F005CD:
  mov ebx, dword ptr [esp + 0xa1c] // 02F005CD
  mov ebp, dword ptr [esp + 0xa28] // 02F005D4
  add esp, 0xa2c // 02F005DB
  ret // 02F005E1
  db 8D,B6,00,00,00,00 // lea esi, [esi] // 02F005E2
fps_loc_02F005E8:
  mov esi, dword ptr [esp + 0xa20] // 02F005E8
  jmp short fps_loc_02F005B8 // 02F005EF
  db 8D,B4,26,00,00,00,00 // lea esi, [esi] // 02F005F1
fps_loc_02F005F8:
  mov edi, ebx // 02F005F8
  shr edi, 0x1f // 02F005FA
  add ebx, edi // 02F005FD
  movsx edi, word ptr [eax + 0x2840] // 02F005FF
  sar ebx, #1 // 02F00606
  lea ebx, [ebx + edi - 0x1c] // 02F00608
  mov dword ptr [esp], ebx // 02F0060C
  fild dword ptr [esp] // 02F0060F
  jmp near fps_loc_02F003FD // 02F00612
  nop // 02F00617
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00618
fps_loc_02F00620:
  mov dword ptr [esp], TOS.exe+51853C // 02F00620
fps_loc_02F00627:
  movss xmm3, dword ptr [dialogue_helpers+102C] // 02F00627
  lea eax, [esp + 0x110] // 02F0062F
  mov ebx, 0xffffffff // 02F00636
  shufps xmm3, xmm3, #0 // 02F0063B
fps_loc_02F0063F:
  xor edx, edx // 02F0063F
  cmp ebx, #1 // 02F00641
  setbe dl // 02F00644
  fld dword ptr [edx*#8 + TOS.exe+71A580] // 02F00647
  mov edx, ebx // 02F0064E
  add ebx, #1 // 02F00650
  cmp ebx, #1 // 02F00653
  jbe near fps_loc_02F00968 // 02F00656
  fld dword ptr [TOS.exe+71A58C] // 02F0065C
  cmp edx, #1 // 02F00662
  je near fps_loc_02F009DC // 02F00665
  fld dword ptr [TOS.exe+71A590] // 02F0066B
  mov esi, TOS.exe+71A59C // 02F00671
fps_loc_02F00676:
  fld dword ptr [esi] // 02F00676
  fxch st(3) // 02F00678
  mov edx, dword ptr [edx*#4 + TOS.exe+71A5A4] // 02F0067A
  add eax, 0x30 // 02F00681
  mov esi, dword ptr [TOS.exe+71A5A0] // 02F00684
  movss dword ptr [eax - 0x28], xmm1 // 02F0068A
  movzx edi, dl // 02F0068F
  movd xmm0, edi // 02F00692
  movzx edi, dh // 02F00696
  shr edx, 0x10 // 02F00699
  fstp dword ptr [eax - 0x30] // 02F0069C
  fxch st(1) // 02F0069F
  movzx edx, dl // 02F006A1
  shr esi, 0x18 // 02F006A4
  movd xmm5, edi // 02F006A7
  fstp dword ptr [eax - 0x2c] // 02F006AB
  movd xmm2, edx // 02F006AE
  movd xmm4, esi // 02F006B2
  punpckldq xmm0, xmm5 // 02F006B6
  punpckldq xmm2, xmm4 // 02F006BA
  fldz // 02F006BE
  punpcklqdq xmm0, xmm2 // 02F006C0
  fst dword ptr [eax - 0x24] // 02F006C4
  fxch st(1) // 02F006C7
  cvtdq2ps xmm0, xmm0 // 02F006C9
  divps xmm0, xmm3 // 02F006CC
  fstp dword ptr [eax - 0x10] // 02F006CF
  fxch st(1) // 02F006D2
  fstp dword ptr [eax - 0xc] // 02F006D4
  fst dword ptr [eax - #8] // 02F006D7
  fstp dword ptr [eax - #4] // 02F006DA
  movaps xmmword ptr [eax - 0x20], xmm0 // 02F006DD
  cmp ebx, #3 // 02F006E1
  jne near fps_loc_02F0063F // 02F006E4
  mov dword ptr [esp + #8], #0 // 02F006EA
  mov esi, #4 // 02F006F2
  mov dword ptr [esp + 0xc], ecx // 02F006F7
  mov dword ptr [esp + 0x1c], ebp // 02F006FB
  nop // 02F006FF
fps_loc_02F00700:
  mov eax, dword ptr [esp + #8] // 02F00700
  mov dword ptr [esp + 0x10], eax // 02F00704
  mov edi, eax // 02F00708
  add eax, #1 // 02F0070A
  cdq // 02F0070D
  mov dword ptr [esp + #8], eax // 02F0070E
  idiv dword ptr [esp + 0xc] // 02F00712
  sub esp, 0xc // 02F00716
  mov dword ptr [esp + 0x20], edx // 02F00719
  push #0 // 02F0071D
  push dword ptr [esp + edx*#8 + 0x34] // 02F0071F
  push dword ptr [esp + edx*#8 + 0x34] // 02F00723
  mov edx, esi // 02F00727
  push dword ptr [esp + edi*#8 + 0x3c] // 02F00729
  push dword ptr [esp + edi*#8 + 0x3c] // 02F0072D
  lea ecx, [esp + 0x730] // 02F00731
  lea eax, [esp + 0x130] // 02F00738
  call fps_dialogue_clip // 02F0073F
  add esp, 0x20 // 02F00744
  cmp eax, #2 // 02F00747
  jle near fps_loc_02F0087F // 02F0074A
  lea ebp, [esp + 0x740] // 02F00750
  mov dword ptr [esp + 0x18], esi // 02F00757
  lea ebx, [eax - #1] // 02F0075B
  mov edi, #1 // 02F0075E
  mov esi, ebp // 02F00763
  mov ebp, dword ptr [esp + 0x1c] // 02F00765
  db 8D,B4,26,00,00,00,00 // lea esi, [esi] // 02F00769
fps_loc_02F00770:
  fld dword ptr [esp + 0x710] // 02F00770
  fld dword ptr [esp + 0x714] // 02F00777
  fld dword ptr [esi] // 02F0077E
  fsub st(0), st(2) // 02F00780
  fld dword ptr [esi + 0x34] // 02F00782
  fsub st(0), st(2) // 02F00785
  fmulp st(1) // 02F00787
  fxch st(1) // 02F00789
  fsubr dword ptr [esi + #4] // 02F0078B
  fxch st(2) // 02F0078E
  fsubr dword ptr [esi + 0x30] // 02F00790
  fmulp st(2) // 02F00793
  fsubrp st(1) // 02F00795
  fld dword ptr [dialogue_helpers+1030] // 02F00797
  fcomip st(1) // 02F0079D
  jbe short fps_loc_02F007B8 // 02F0079F
  fld dword ptr [dialogue_helpers+1034] // 02F007A1
  fxch st(1) // 02F007A7
  fcomip st(1) // 02F007A9
  fstp st(0) // 02F007AB
  ja near fps_loc_02F0086D // 02F007AD
  jmp short fps_loc_02F007BA // 02F007B3
  db 8D,76,00 // lea esi, [esi] // 02F007B5
fps_loc_02F007B8:
  fstp st(0) // 02F007B8
fps_loc_02F007BA:
  movdqa xmm0, xmmword ptr [esp + 0x710] // 02F007BA
  sub esp, #4 // 02F007C3
  movaps xmmword ptr [esp + 0x54], xmm0 // 02F007C6
  movdqa xmm0, xmmword ptr [esp + 0x724] // 02F007CB
  movaps xmmword ptr [esp + 0x64], xmm0 // 02F007D4
  movdqa xmm0, xmmword ptr [esp + 0x734] // 02F007D9
  movaps xmmword ptr [esp + 0x74], xmm0 // 02F007E2
  movdqu xmm0, xmmword ptr [esi] // 02F007E7
  movaps xmmword ptr [esp + 0x84], xmm0 // 02F007EB
  movdqu xmm0, xmmword ptr [esi + 0x10] // 02F007F3
  movaps xmmword ptr [esp + 0x94], xmm0 // 02F007F8
  movdqu xmm0, xmmword ptr [esi + 0x20] // 02F00800
  movaps xmmword ptr [esp + 0xa4], xmm0 // 02F00805
  movdqu xmm0, xmmword ptr [esi + 0x30] // 02F0080D
  movaps xmmword ptr [esp + 0xb4], xmm0 // 02F00812
  movdqu xmm0, xmmword ptr [esi + 0x40] // 02F0081A
  movaps xmmword ptr [esp + 0xc4], xmm0 // 02F0081F
  movdqu xmm0, xmmword ptr [esi + 0x50] // 02F00827
  movaps xmmword ptr [esp + 0xd4], xmm0 // 02F0082C
  movdqu xmm0, xmmword ptr [esi + 0x30] // 02F00834
  movaps xmmword ptr [esp + 0xe4], xmm0 // 02F00839
  movdqu xmm0, xmmword ptr [esi + 0x40] // 02F00841
  movaps xmmword ptr [esp + 0xf4], xmm0 // 02F00846
  movdqu xmm0, xmmword ptr [esi + 0x50] // 02F0084E
  movaps xmmword ptr [esp + 0x104], xmm0 // 02F00853
  push ebp // 02F0085B
  push dword ptr [esp + #8] // 02F0085C
  lea eax, [esp + 0x5c] // 02F00860
  push eax // 02F00864
  call fps_dialogue_native_quad // 02F00865
  add esp, 0x10 // 02F0086A
fps_loc_02F0086D:
  add edi, #1 // 02F0086D
  add esi, 0x30 // 02F00870
  cmp edi, ebx // 02F00873
  jne near fps_loc_02F00770 // 02F00875
  mov esi, dword ptr [esp + 0x18] // 02F0087B
fps_loc_02F0087F:
  sub esp, 0xc // 02F0087F
  mov edx, esi // 02F00882
  push #1 // 02F00884
  mov eax, dword ptr [esp + 0x24] // 02F00886
  push dword ptr [esp + eax*#8 + 0x34] // 02F0088A
  push dword ptr [esp + eax*#8 + 0x34] // 02F0088E
  mov eax, dword ptr [esp + 0x28] // 02F00892
  push dword ptr [esp + eax*#8 + 0x3c] // 02F00896
  push dword ptr [esp + eax*#8 + 0x3c] // 02F0089A
  lea ecx, [esp + 0x430] // 02F0089E
  lea eax, [esp + 0x130] // 02F008A5
  call fps_dialogue_clip // 02F008AC
  add esp, 0x20 // 02F008B1
  mov esi, eax // 02F008B4
  test eax, eax // 02F008B6
  jle near fps_loc_02F00950 // 02F008B8
  db 8D,14,40 // lea edx, [eax + eax*#2] // 02F008BE
  xor eax, eax // 02F008C1
  shl edx, #4 // 02F008C3
  jmp short fps_loc_02F00900 // 02F008C6
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F008C8
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F008D0
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F008D8
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F008E0
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F008E8
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F008F0
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F008F8
fps_loc_02F00900:
  movdqu xmm0, xmmword ptr [esp + eax + 0x410] // 02F00900
  movaps xmmword ptr [esp + eax + 0x110], xmm0 // 02F00909
  movdqu xmm0, xmmword ptr [esp + eax + 0x420] // 02F00911
  movaps xmmword ptr [esp + eax + 0x120], xmm0 // 02F0091A
  movdqu xmm0, xmmword ptr [esp + eax + 0x430] // 02F00922
  movaps xmmword ptr [esp + eax + 0x130], xmm0 // 02F0092B
  add eax, 0x30 // 02F00933
  cmp edx, eax // 02F00936
  jne short fps_loc_02F00900 // 02F00938
  mov edi, dword ptr [esp + 0xc] // 02F0093A
  cmp dword ptr [esp + #8], edi // 02F0093E
  jge short fps_loc_02F00950 // 02F00942
  cmp esi, #2 // 02F00944
  jg near fps_loc_02F00700 // 02F00947
  db 8D,76,00 // lea esi, [esi] // 02F0094D
fps_loc_02F00950:
  mov esi, dword ptr [esp + 0xa20] // 02F00950
  mov edi, dword ptr [esp + 0xa24] // 02F00957
  jmp near fps_loc_02F005CD // 02F0095E
  db 2E,8D,74,26,00 // lea esi, cs:[esi] // 02F00963
fps_loc_02F00968:
  fld dword ptr [TOS.exe+71A584] // 02F00968
  cmp edx, #1 // 02F0096E
  jbe short fps_loc_02F009CC // 02F00971
  fld dword ptr [TOS.exe+71A590] // 02F00973
  mov esi, TOS.exe+71A594 // 02F00979
  jmp near fps_loc_02F00676 // 02F0097E
  db 2E,8D,74,26,00 // lea esi, cs:[esi] // 02F00983
fps_loc_02F00988:
  fstp st(3) // 02F00988
  fxch st(1) // 02F0098A
  fxch st(2) // 02F0098C
  fst dword ptr [esp + 0x20] // 02F0098E
  fxch st(1) // 02F00992
  mov ecx, #4 // 02F00994
  fst dword ptr [esp + 0x24] // 02F00999
  fxch st(2) // 02F0099D
  fst dword ptr [esp + 0x28] // 02F0099F
  fxch st(2) // 02F009A3
  fstp dword ptr [esp + 0x2c] // 02F009A5
  fld dword ptr [dialogue_helpers+100C] // 02F009A9
  fadd st(0), st(3) // 02F009AF
  fxch st(2) // 02F009B1
  fstp dword ptr [esp + 0x30] // 02F009B3
  fxch st(1) // 02F009B7
  fst dword ptr [esp + 0x34] // 02F009B9
  fxch st(1) // 02F009BD
  fstp dword ptr [esp + 0x38] // 02F009BF
  fstp dword ptr [esp + 0x3c] // 02F009C3
  jmp near fps_loc_02F004D9 // 02F009C7
fps_loc_02F009CC:
  fld dword ptr [TOS.exe+71A598] // 02F009CC
  mov esi, TOS.exe+71A594 // 02F009D2
  jmp near fps_loc_02F00676 // 02F009D7
fps_loc_02F009DC:
  fld dword ptr [TOS.exe+71A598] // 02F009DC
  mov esi, TOS.exe+71A59C // 02F009E2
  jmp near fps_loc_02F00676 // 02F009E7
  db 8D,74,26,00 // lea esi, [esi] // 02F009EC
fps_dialogue_name_quad:
  sub esp, 0x6c // 02F009F0
  mov ecx, dword ptr [esp + 0x7c] // 02F009F3
  fld dword ptr [esp + 0x78] // 02F009F7
  mov dword ptr [esp + 0x5c], ebx // 02F009FB
  mov dword ptr [esp + 0x60], esi // 02F009FF
  mov ebx, dword ptr [esp + 0x70] // 02F00A03
  mov esi, dword ptr [esp + 0x74] // 02F00A07
  cmp ecx, #1 // 02F00A0B
  ja near fps_loc_02F00CB8 // 02F00A0E
  mov dword ptr [esp + 0x64], edi // 02F00A14
  mov dword ptr [esp + 0x68], ebp // 02F00A18
  movzx ebp, byte ptr [ebx + 0x2743] // 02F00A1C
  mov eax, dword ptr [TOS.exe+6D3F68] // 02F00A23
  movzx eax, byte ptr [eax + 0x242] // 02F00A28
  movsx edx, word ptr [ebx + 0x2840] // 02F00A2F
  mov byte ptr [esp + #8], al // 02F00A36
  movsx eax, word ptr [ebx + 0x2844] // 02F00A3A
  sub eax, edx // 02F00A41
  mov edi, eax // 02F00A43
  shr edi, 0x1f // 02F00A45
  add edi, eax // 02F00A48
  sar edi, #1 // 02F00A4A
  cmp eax, 0x38 // 02F00A4C
  db 8D,7C,3A,E4 // lea edi, [edx + edi - 0x1c] // 02F00A4F
  cmovle edx, edi // 02F00A53
  movzx edi, word ptr [ebx + 0x283a] // 02F00A56
  test byte ptr [esp + #8], 0xc // 02F00A5D
  je near fps_loc_02F00C94 // 02F00A62
  test cl, #1 // 02F00A68
  jne near fps_loc_02F00C94 // 02F00A6B
  mov eax, ebx // 02F00A71
  mov dword ptr [esp + 0xc], ecx // 02F00A73
  fstp dword ptr [esp + #8] // 02F00A77
  mov dword ptr [esp + 0x10], edx // 02F00A7B
  call fps_dialogue_dialog_covers_pointer // 02F00A7F
  mov ecx, dword ptr [esp + 0xc] // 02F00A84
  fld dword ptr [esp + #8] // 02F00A88
  test eax, eax // 02F00A8C
  jne near fps_loc_02F00C94 // 02F00A8E
  mov eax, dword ptr [ebx + 0x2834] // 02F00A94
  test eax, eax // 02F00A9A
  je near fps_loc_02F00C94 // 02F00A9C
  mov eax, ebp // 02F00AA2
  and eax, 0x7f // 02F00AA4
  sub eax, #2 // 02F00AA7
  cmp eax, #1 // 02F00AAA
  ja near fps_loc_02F00C94 // 02F00AAD
  movzx eax, word ptr [ebx + 0x2740] // 02F00AB3
  and ax, 0x180 // 02F00ABA
  cmp ax, 0x100 // 02F00ABE
  jne near fps_loc_02F00C94 // 02F00AC2
  movsx eax, di // 02F00AC8
  sub eax, 0x13 // 02F00ACB
  mov dword ptr [esp + #8], eax // 02F00ACE
  fild dword ptr [esp + #8] // 02F00AD2
  fild word ptr [ebx + 0x283e] // 02F00AD6
  fcomip st(1) // 02F00ADC
  ja near fps_loc_02F00C48 // 02F00ADE
  fld dword ptr [dialogue_helpers+103C] // 02F00AE4
  fadd st(0), st(1) // 02F00AEA
  fild word ptr [ebx + 0x2842] // 02F00AEC
  fxch st(1) // 02F00AF2
  fcomi st(1) // 02F00AF4
  fstp st(1) // 02F00AF6
  ja near fps_loc_02F00C4C // 02F00AF8
  mov edx, dword ptr [esp + 0x10] // 02F00AFE
  fld dword ptr [TOS.exe+71A584] // 02F00B02
  lea eax, [edx - 0x13] // 02F00B08
  mov dword ptr [esp + #8], eax // 02F00B0B
  fild dword ptr [esp + #8] // 02F00B0F
  fxch st(1) // 02F00B13
  fucomip st(1) // 02F00B15
  fstp st(0) // 02F00B17
  jp near fps_loc_02F00C52 // 02F00B19
  jne near fps_loc_02F00C60 // 02F00B1F
  fld dword ptr [TOS.exe+71A58C] // 02F00B25
  mov dword ptr [esp + #8], edx // 02F00B2B
  fild dword ptr [esp + #8] // 02F00B2F
  fxch st(1) // 02F00B33
  fucomip st(1) // 02F00B35
  fstp st(0) // 02F00B37
  jp near fps_loc_02F00C66 // 02F00B39
  jne near fps_loc_02F00C70 // 02F00B3F
  fld dword ptr [TOS.exe+71A580] // 02F00B45
  movsx eax, word ptr [ebx + 0x283e] // 02F00B4B
  add eax, #9 // 02F00B52
  mov dword ptr [esp + #8], eax // 02F00B55
  fild dword ptr [esp + #8] // 02F00B59
  fxch st(1) // 02F00B5D
  fucomip st(1) // 02F00B5F
  fstp st(0) // 02F00B61
  jp near fps_loc_02F00C76 // 02F00B63
  jne near fps_loc_02F00C80 // 02F00B69
  fld dword ptr [TOS.exe+71A588] // 02F00B6F
  movsx eax, word ptr [ebx + 0x2842] // 02F00B75
  sub eax, #9 // 02F00B7C
  mov dword ptr [esp + #8], eax // 02F00B7F
  fild dword ptr [esp + #8] // 02F00B83
  fxch st(1) // 02F00B87
  fucomip st(1) // 02F00B89
  fstp st(0) // 02F00B8B
  jp near fps_loc_02F00C86 // 02F00B8D
  mov eax, TOS.exe+71A580 // 02F00B93
  lea edi, [esp - 0xb1a560] // 02F00B98
  jne near fps_loc_02F00C90 // 02F00B9F
  db 8D,76,00 // lea esi, [esi] // 02F00BA5
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00BA8
fps_loc_02F00BB0:
  mov edx, dword ptr [eax] // 02F00BB0
  db 89,14,07 // mov dword ptr [edi + eax], edx // 02F00BB2
  add eax, #4 // 02F00BB5
  cmp eax, TOS.exe+71A5B0 // 02F00BB8
  jne short fps_loc_02F00BB0 // 02F00BBD
  fld dword ptr [TOS.exe+71A580] // 02F00BBF
  fld dword ptr [TOS.exe+71A588] // 02F00BC5
  fld dword ptr [TOS.exe+71A590] // 02F00BCB
  fld dword ptr [TOS.exe+71A598] // 02F00BD1
  fxch st(5) // 02F00BD7
  fcomi st(3) // 02F00BD9
  ja near fps_loc_02F00E37 // 02F00BDB
  fstp st(0) // 02F00BE1
fps_loc_02F00BE3:
  mov eax, TOS.exe+71A580 // 02F00BE3
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00BE8
fps_loc_02F00BF0:
  db 8B,14,07 // mov edx, dword ptr [edi + eax] // 02F00BF0
  add eax, #4 // 02F00BF3
  mov dword ptr [eax - #4], edx // 02F00BF6
  cmp eax, TOS.exe+71A5B0 // 02F00BF9
  jne short fps_loc_02F00BF0 // 02F00BFE
  fxch st(1) // 02F00C00
  fcomi st(3) // 02F00C02
  ja near fps_loc_02F00DFE // 02F00C04
  fstp st(0) // 02F00C0A
  fstp st(0) // 02F00C0C
  fstp st(0) // 02F00C0E
  fstp st(0) // 02F00C10
  fstp st(0) // 02F00C12
  fstp st(0) // 02F00C14
fps_loc_02F00C16:
  mov eax, TOS.exe+71A580 // 02F00C16
  db 2E,8D,74,26,00 // lea esi, cs:[esi] // 02F00C1B
fps_loc_02F00C20:
  db 8B,14,07 // mov edx, dword ptr [edi + eax] // 02F00C20
  add eax, #4 // 02F00C23
  mov dword ptr [eax - #4], edx // 02F00C26
  cmp eax, TOS.exe+71A5B0 // 02F00C29
  jne short fps_loc_02F00C20 // 02F00C2E
  mov edi, dword ptr [esp + 0x64] // 02F00C30
  mov ebp, dword ptr [esp + 0x68] // 02F00C34
fps_loc_02F00C38:
  mov ebx, dword ptr [esp + 0x5c] // 02F00C38
  mov esi, dword ptr [esp + 0x60] // 02F00C3C
  add esp, 0x6c // 02F00C40
  ret // 02F00C43
  db 8D,74,26,00 // lea esi, [esi] // 02F00C44
fps_loc_02F00C48:
  fstp st(0) // 02F00C48
  jmp short fps_loc_02F00C94 // 02F00C4A
fps_loc_02F00C4C:
  fstp st(0) // 02F00C4C
  fstp st(0) // 02F00C4E
  jmp short fps_loc_02F00C94 // 02F00C50
fps_loc_02F00C52:
  fstp st(0) // 02F00C52
  fstp st(0) // 02F00C54
  jmp short fps_loc_02F00C94 // 02F00C56
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00C58
fps_loc_02F00C60:
  fstp st(0) // 02F00C60
  fstp st(0) // 02F00C62
  jmp short fps_loc_02F00C94 // 02F00C64
fps_loc_02F00C66:
  fstp st(0) // 02F00C66
  fstp st(0) // 02F00C68
  jmp short fps_loc_02F00C94 // 02F00C6A
  db 8D,74,26,00 // lea esi, [esi] // 02F00C6C
fps_loc_02F00C70:
  fstp st(0) // 02F00C70
  fstp st(0) // 02F00C72
  jmp short fps_loc_02F00C94 // 02F00C74
fps_loc_02F00C76:
  fstp st(0) // 02F00C76
  fstp st(0) // 02F00C78
  jmp short fps_loc_02F00C94 // 02F00C7A
  db 8D,74,26,00 // lea esi, [esi] // 02F00C7C
fps_loc_02F00C80:
  fstp st(0) // 02F00C80
  fstp st(0) // 02F00C82
  jmp short fps_loc_02F00C94 // 02F00C84
fps_loc_02F00C86:
  fstp st(0) // 02F00C86
  fstp st(0) // 02F00C88
  jmp short fps_loc_02F00C94 // 02F00C8A
  db 8D,74,26,00 // lea esi, [esi] // 02F00C8C
fps_loc_02F00C90:
  fstp st(0) // 02F00C90
  fstp st(0) // 02F00C92
fps_loc_02F00C94:
  mov edi, dword ptr [esp + 0x64] // 02F00C94
  mov ebp, dword ptr [esp + 0x68] // 02F00C98
  mov edx, esi // 02F00C9C
  mov eax, ebx // 02F00C9E
  mov esi, dword ptr [esp + 0x60] // 02F00CA0
  mov ebx, dword ptr [esp + 0x5c] // 02F00CA4
  fstp dword ptr [esp + 0x70] // 02F00CA8
  add esp, 0x6c // 02F00CAC
  jmp near fps_dialogue_masked_quad // 02F00CAF
  db 8D,74,26,00 // lea esi, [esi] // 02F00CB4
fps_loc_02F00CB8:
  mov eax, ebx // 02F00CB8
  mov dword ptr [esp + 0xc], ecx // 02F00CBA
  fstp dword ptr [esp + #8] // 02F00CBE
  call fps_dialogue_dialog_covers_pointer // 02F00CC2
  test eax, eax // 02F00CC7
  jne near fps_loc_02F00C38 // 02F00CC9
  cmp dword ptr [esp + 0xc], #3 // 02F00CCF
  mov dword ptr [esp + 0x64], edi // 02F00CD4
  mov eax, TOS.exe+71A580 // 02F00CD8
  lea edi, [esp - 0xb1a560] // 02F00CDD
  fld dword ptr [esp + #8] // 02F00CE4
  je near fps_loc_02F00DE0 // 02F00CE8
  db 66,90 // nop // 02F00CEE
fps_loc_02F00CF0:
  mov edx, dword ptr [eax] // 02F00CF0
  db 89,14,07 // mov dword ptr [edi + eax], edx // 02F00CF2
  add eax, #4 // 02F00CF5
  cmp eax, TOS.exe+71A5B0 // 02F00CF8
  jne short fps_loc_02F00CF0 // 02F00CFD
  fld dword ptr [TOS.exe+71A584] // 02F00CFF
  fld dword ptr [TOS.exe+71A58C] // 02F00D05
  fld dword ptr [TOS.exe+71A594] // 02F00D0B
  fld dword ptr [TOS.exe+71A59C] // 02F00D11
  movzx eax, word ptr [ebx + 0x2740] // 02F00D17
  and ax, 0x180 // 02F00D1E
  cmp ax, 0x100 // 02F00D22
  je near fps_loc_02F00DB0 // 02F00D26
  cmp ax, 0x80 // 02F00D2C
  jne short fps_loc_02F00D60 // 02F00D30
  fld dword ptr [dialogue_helpers+1004] // 02F00D32
  fadd dword ptr [TOS.exe+71A584] // 02F00D38
  fstp dword ptr [TOS.exe+71A584] // 02F00D3E
  fsubrp st(1) // 02F00D44
  fadd st(0), st(0) // 02F00D46
  fxch st(1) // 02F00D48
  fsubrp st(2) // 02F00D4A
  fdivrp st(1) // 02F00D4C
  fadd dword ptr [TOS.exe+71A594] // 02F00D4E
  fstp dword ptr [TOS.exe+71A594] // 02F00D54
  jmp short fps_loc_02F00D68 // 02F00D5A
  db 8D,74,26,00 // lea esi, [esi] // 02F00D5C
fps_loc_02F00D60:
  fstp st(0) // 02F00D60
  fstp st(0) // 02F00D62
  fstp st(0) // 02F00D64
  fstp st(0) // 02F00D66
fps_loc_02F00D68:
  sub esp, 0x10 // 02F00D68
  mov eax, ebx // 02F00D6B
  xor ecx, ecx // 02F00D6D
  mov edx, esi // 02F00D6F
  fstp dword ptr [esp] // 02F00D71
  call fps_dialogue_masked_quad // 02F00D74
  add esp, 0x10 // 02F00D79
  mov eax, TOS.exe+71A580 // 02F00D7C
  db 8D,B4,26,00,00,00,00 // lea esi, [esi] // 02F00D81
  db 2E,8D,B4,26,00,00,00,00 // lea esi, cs:[esi] // 02F00D88
fps_loc_02F00D90:
  db 8B,14,07 // mov edx, dword ptr [edi + eax] // 02F00D90
  add eax, #4 // 02F00D93
  mov dword ptr [eax - #4], edx // 02F00D96
  cmp eax, TOS.exe+71A5B0 // 02F00D99
  jne short fps_loc_02F00D90 // 02F00D9E
  mov edi, dword ptr [esp + 0x64] // 02F00DA0
  mov ebx, dword ptr [esp + 0x5c] // 02F00DA4
  mov esi, dword ptr [esp + 0x60] // 02F00DA8
  add esp, 0x6c // 02F00DAC
  ret // 02F00DAF
fps_loc_02F00DB0:
  fld dword ptr [dialogue_helpers+1038] // 02F00DB0
  fld dword ptr [TOS.exe+71A58C] // 02F00DB6
  fsub st(0), st(1) // 02F00DBC
  fstp dword ptr [TOS.exe+71A58C] // 02F00DBE
  fxch st(2) // 02F00DC4
  fsubp st(1) // 02F00DC6
  fmulp st(1) // 02F00DC8
  fxch st(2) // 02F00DCA
  fsubp st(1) // 02F00DCC
  fdivp st(1) // 02F00DCE
  fsubr dword ptr [TOS.exe+71A59C] // 02F00DD0
  fstp dword ptr [TOS.exe+71A59C] // 02F00DD6
  jmp short fps_loc_02F00D68 // 02F00DDC
  db 66,90 // nop // 02F00DDE
fps_loc_02F00DE0:
  mov edi, dword ptr [esp + 0x64] // 02F00DE0
  mov edx, esi // 02F00DE4
  mov eax, ebx // 02F00DE6
  mov esi, dword ptr [esp + 0x60] // 02F00DE8
  mov ebx, dword ptr [esp + 0x5c] // 02F00DEC
  fstp dword ptr [esp + 0x70] // 02F00DF0
  xor ecx, ecx // 02F00DF4
  add esp, 0x6c // 02F00DF6
  jmp near fps_dialogue_masked_quad // 02F00DF9
fps_loc_02F00DFE:
  fxch st(3) // 02F00DFE
  fst dword ptr [TOS.exe+71A580] // 02F00E00
  fxch st(4) // 02F00E06
  sub esp, 0x10 // 02F00E08
  xor ecx, ecx // 02F00E0B
  mov edx, esi // 02F00E0D
  fsub st(0), st(1) // 02F00E0F
  fxch st(4) // 02F00E11
  mov eax, ebx // 02F00E13
  fsub st(0), st(2) // 02F00E15
  fmulp st(4) // 02F00E17
  fxch st(2) // 02F00E19
  fsubrp st(1) // 02F00E1B
  fdivp st(2) // 02F00E1D
  faddp st(1) // 02F00E1F
  fstp dword ptr [TOS.exe+71A590] // 02F00E21
  fstp dword ptr [esp] // 02F00E27
  call fps_dialogue_masked_quad // 02F00E2A
  add esp, 0x10 // 02F00E2F
  jmp near fps_loc_02F00C16 // 02F00E32
fps_loc_02F00E37:
  fxch st(4) // 02F00E37
  fstp dword ptr [esp + 0x1c] // 02F00E39
  fxch st(3) // 02F00E3D
  sub esp, 0x10 // 02F00E3F
  xor ecx, ecx // 02F00E42
  mov edx, esi // 02F00E44
  fst dword ptr [TOS.exe+71A588] // 02F00E46
  mov eax, ebx // 02F00E4C
  fsub st(0), st(2) // 02F00E4E
  fld st(4) // 02F00E50
  fstp dword ptr [esp + 0x28] // 02F00E52
  fxch st(4) // 02F00E56
  fsub st(0), st(3) // 02F00E58
  fmulp st(4) // 02F00E5A
  fld st(0) // 02F00E5C
  fstp dword ptr [esp + 0x24] // 02F00E5E
  fsub st(0), st(1) // 02F00E62
  fxch st(1) // 02F00E64
  fstp dword ptr [esp + 0x20] // 02F00E66
  fdivp st(2) // 02F00E6A
  fadd st(1), st(0) // 02F00E6C
  fstp dword ptr [esp + 0x1c] // 02F00E6E
  fstp dword ptr [TOS.exe+71A598] // 02F00E72
  fst dword ptr [esp] // 02F00E78
  fstp dword ptr [esp + 0x18] // 02F00E7B
  call fps_dialogue_masked_quad // 02F00E7F
  add esp, 0x10 // 02F00E84
  fld dword ptr [esp + 0x1c] // 02F00E87
  fld dword ptr [esp + 0x18] // 02F00E8B
  fld dword ptr [esp + 0x14] // 02F00E8F
  fld dword ptr [esp + 0x10] // 02F00E93
  fld dword ptr [esp + 0xc] // 02F00E97
  fld dword ptr [esp + #8] // 02F00E9B
  fxch st(5) // 02F00E9F
  fxch st(3) // 02F00EA1
  fxch st(1) // 02F00EA3
  jmp near fps_loc_02F00BE3 // 02F00EA5

// Alignment before private floating-point constants.
  db 66,90,66,90,66,90 // 02F00EAA: constants / retained padding

// Private float64 geometry constant.
fps_dialogue_name_double:
  db 01,00,00,40,33,33,F3,3F // 02F00EB0: constants / retained padding

// Private float32 mask coordinates and geometry constants.
fps_dialogue_name_floats:
  db 00,00,E0,41,00,00,04,42,00,00,10,41,00,00,00,40 // 02F00EB8: constants / retained padding
  db 00,00,88,41,00,00,F8,41,00,00,C0,40,00,00,A0,40 // 02F00EC8: constants / retained padding
  db 00,00,C8,41,00,00,F0,41,00,00,70,41,00,00,50,41 // 02F00ED8: constants / retained padding
  db 00,00,98,41,00,00,7F,43,0A,D7,23,3C,0A,D7,23,BC // 02F00EE8: constants / retained padding
  db 00,00,40,40,00,00,18,42,00,00,00,00,00,00,00,00 // 02F00EF8: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F08: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F18: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F28: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F38: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F48: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F58: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F68: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F78: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F88: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00F98: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00FA8: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00FB8: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00FC8: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00FD8: constants / retained padding
  db 00,00,00,00,00,00,00,00,00,00,00,00,00,00,00,00 // 02F00FE8: constants / retained padding
  db 00,00,00,00,00,00,00,00 // 02F00FF8: constants / retained padding

[DISABLE]
// Restoration evidence only; the loader applies settings on the next launch.
TOS.exe+11A3:
  db 66,83,86,14,01,00,00,02
TOS.exe+1807:
  db 8D,47,02
TOS.exe+1D7C:
  db 83,06,02
TOS.exe+1E47:
  db 83,07,02
TOS.exe+2A06:
  db 8D,47,02
TOS.exe+30AE:
  db 8D,47,02
TOS.exe+3AF6:
  db 66,83,86,14,01,00,00,02
TOS.exe+3C8E:
  db C7,44,24,10,00,00,03,03,C7,44,24,14,00,05,03,03
TOS.exe+4E2B:
  db 66,83,86,14,01,00,00,02
TOS.exe+570D:
  db 66,83,86,14,01,00,00,02
TOS.exe+5A50:
  db 48
TOS.exe+666A:
  db 66,83,86,14,01,00,00,02
TOS.exe+D720:
  db 55,8B,EC,83,EC,28
TOS.exe+2669A:
  db 66,83,83,F8,12,00,00,02
TOS.exe+267D2:
  db 8B,B3,A0,3A,01,00
TOS.exe+27267:
  db 0F,B7,83,BE,01,00,00,66,85,C0,74,08,48,66,89,83,BE,01,00,00
TOS.exe+274C9:
  db 66,83,83,FA,12,00,00,02
TOS.exe+278E5:
  db 66,83,86,BE,01,00,00,02
TOS.exe+27F28:
  db 8B,46,18,33,DB,3B,C3
TOS.exe+27F58:
  db 66,83,86,BE,01,00,00,02
TOS.exe+280E6:
  db 83,C0,02
TOS.exe+29B8F:
  db 66,83,84,73,34,E7,00,00,FE
TOS.exe+29CA3:
  db 04,02
TOS.exe+2B3B6:
  db 83,C0,02
TOS.exe+2B401:
  db E8,4A,F6,00,00,8B,CE,E8,D3,F8,00,00
TOS.exe+2B9CF:
  db D9,05,B4,35,7A,00
TOS.exe+2BBEA:
  db D9,05,54,04,73,00
TOS.exe+2BC01:
  db D9,05,50,32,88,00
TOS.exe+2BD2B:
  db DC,0D,50,2B,88,00,DC,05,88,2B,88,00
TOS.exe+2BF41:
  db 83,F8,02
TOS.exe+2DF94:
  db DC,25,B8,29,88,00
TOS.exe+3723E:
  db DC,C0
TOS.exe+37FA8:
  db DC,25,B8,29,88,00
TOS.exe+385EF:
  db 66,83,86,EA,39,01,00,02
TOS.exe+3A60A:
  db DC,C0
TOS.exe+3A87C:
  db DC,C0
TOS.exe+3AA39:
  db E8,12,00,00,00,8B,CE,E8,9B,02,00,00
TOS.exe+3AC6D:
  db DC,05,B8,29,88,00
TOS.exe+3CDAA:
  db 83,F8,02
TOS.exe+3CEA2:
  db BF,02,00,00,00
TOS.exe+3E219:
  db DD,05,B8,29,88,00
TOS.exe+40836:
  db 33,C0,8D,B7,70,11,00,00
TOS.exe+41009:
  db 02,97,FF,12,00,00
TOS.exe+41050:
  db C7,87,FC,12,00,00,00,00,01,00,8B,E5,5D,C3
TOS.exe+41069:
  db 0F,BE,86,FE,12,00,00
TOS.exe+412D1:
  db B8,11,00,00,00,5F,5E,8B,E5,5D,C3,66,83,86,FC,12,00,00,02,5F,B8,01,00,00,00
TOS.exe+41716:
  db 48,66,89,83,BE,01,00,00
TOS.exe+41A6C:
  db 66,83,86,BE,01,00,00,FE
TOS.exe+44D85:
  db 66,83,87,FA,12,00,00,02
TOS.exe+45231:
  db 83,87,10,01,00,00,20
TOS.exe+467EE:
  db 66,83,86,F8,12,00,00,02
TOS.exe+487EA:
  db 66,83,86,54,8C,00,00,A0
TOS.exe+4880B:
  db 66,83,86,54,8C,00,00,60
TOS.exe+4885D:
  db 80,87,FE,85,00,00,02
TOS.exe+49A22:
  db E8,B9,22,03,00
TOS.exe+4BCF0:
  db 66,83,86,52,8C,00,00,D0
TOS.exe+4BD05:
  db 66,83,86,52,8C,00,00,30
TOS.exe+4BD48:
  db 7D,08
TOS.exe+4C1F0:
  db 7D,04
TOS.exe+4D533:
  db FE,CA
TOS.exe+4D54B:
  db FE,C2
TOS.exe+4D5A8:
  db 74,09
TOS.exe+4E163:
  db 80,44,08,0A,02
TOS.exe+503FC:
  db BB,02,00,00,00
TOS.exe+50426:
  db 74,35
TOS.exe+50491:
  db 74,33
TOS.exe+504F2:
  db 74,33
TOS.exe+50553:
  db 74,33
TOS.exe+505BD:
  db 74,34
TOS.exe+5089F:
  db 74,08
TOS.exe+51156:
  db 66,83,81,10,8D,00,00,02
TOS.exe+51180:
  db 66,83,81,12,8D,00,00,E7
TOS.exe+51190:
  db 66,83,81,10,8D,00,00,02
TOS.exe+51236:
  db 66,83,81,10,8D,00,00,02
TOS.exe+5127B:
  db 66,83,81,12,8D,00,00,E0
TOS.exe+5135B:
  db 66,83,81,10,8D,00,00,02
TOS.exe+51383:
  db 66,83,81,10,8D,00,00,02
TOS.exe+5139E:
  db 66,83,81,12,8D,00,00,E0
TOS.exe+5142A:
  db 66,83,81,12,8D,00,00,E0
TOS.exe+51508:
  db 83,C0,02
TOS.exe+51510:
  db 66,83,81,10,8D,00,00,02
TOS.exe+5152B:
  db 66,83,81,0A,8D,00,00,FC
TOS.exe+5154E:
  db 66,83,81,10,8D,00,00,02
TOS.exe+51567:
  db 66,83,81,12,8D,00,00,F0
TOS.exe+5158C:
  db 66,83,81,10,8D,00,00,02
TOS.exe+575EB:
  db 66,83,47,36,02
TOS.exe+57632:
  db 66,83,46,10,02
TOS.exe+5B355:
  db 66,C7,87,12,94,00,00,00,20
TOS.exe+5B6C1:
  db 81,BE,D4,90,00,00,82,00,00,00
TOS.exe+5B6DA:
  db 01,96,D4,90,00,00
TOS.exe+5CF10:
  db 83,80,D8,90,00,00,02
TOS.exe+5D4FA:
  db 83,80,D8,90,00,00,02
TOS.exe+5D7FC:
  db 83,86,D8,90,00,00,02
TOS.exe+5D847:
  db B9,02,00,00,00
TOS.exe+5DC01:
  db 83,80,D8,90,00,00,02
TOS.exe+5DC9B:
  db 83,80,D8,90,00,00,02
TOS.exe+5DCF6:
  db 83,F9,3C
TOS.exe+5DD13:
  db 66,C7,80,12,94,00,00,01,08
TOS.exe+5DD1E:
  db 66,C7,80,12,94,00,00,01,10
TOS.exe+5DD30:
  db 83,F9,3C
TOS.exe+5DD90:
  db 83,07,02
TOS.exe+5DD9A:
  db 83,80,D8,90,00,00,02
TOS.exe+5DE64:
  db 83,86,D8,90,00,00,02
TOS.exe+5E0B8:
  db 83,86,D8,90,00,00,02
TOS.exe+5E2CA:
  db 83,83,D8,90,00,00,02
TOS.exe+5E6BF:
  db 66,83,83,D4,93,00,00,02
TOS.exe+5E6CE:
  db 83,86,D8,90,00,00,02
TOS.exe+5E75C:
  db 83,80,D8,90,00,00,02
TOS.exe+5EB6C:
  db C7,80,D4,90,00,00,2D,00,00,00
TOS.exe+5EC6E:
  db 01,9F,DC,90,00,00
TOS.exe+5ECF1:
  db 01,9F,E0,90,00,00
TOS.exe+5ED00:
  db 01,9F,E4,90,00,00
TOS.exe+5ED35:
  db 83,C0,FE
TOS.exe+5ED93:
  db 0F,B7,86,BA,90,00,00,66,85,C0,74,08,48,66,89,86,BA,90,00,00
TOS.exe+5EDB9:
  db 8A,86,E8,90,00,00,84,C0,74,08,FE,C8,88,86,E8,90,00,00
TOS.exe+5EDDD:
  db 8A,86,CD,93,00,00,84,C0,74,08,FE,C8,88,86,CD,93,00,00
TOS.exe+5F288:
  db 75,40
TOS.exe+60C2E:
  db D1,FF
TOS.exe+60D32:
  db 8D,0C,3F
TOS.exe+60D42:
  db 66,39,96,54,93,00,00
TOS.exe+60D54:
  db 66,83,86,56,93,00,00,20
TOS.exe+60D81:
  db 8B,EC
TOS.exe+60D95:
  db BA,00,04,00,00,66,3B,CA,7C,0D,8B,CA,66,89,88,54,93,00,00,B0,01,5D,C3,83,C1,FC,66,89,88,54,93,00,00,66,85,C9,79,1C,33,D2,66,83,80,56,93,00,00,F0,66,89,90,54,93,00,00,79,09,33,C9,66,89,88,56,93,00,00,32,C0
TOS.exe+61278:
  db FE,C1,88,88,28,9A,00,00
TOS.exe+6128F:
  db 49,66,89,88,24,9A,00,00
TOS.exe+612AF:
  db FE,C9,88,88,28,9A,00,00
TOS.exe+61525:
  db D8,80,0C,FF,FF,FF
TOS.exe+61543:
  db D8,80,10,FF,FF,FF
TOS.exe+61561:
  db D8,80,18,FF,FF,FF
TOS.exe+61591:
  db D9,80,58,FF,FF,FF,D8,80,60,FF,FF,FF,D9,98,58,FF,FF,FF,D9,80,64,FF,FF,FF,D8,80,5C,FF,FF,FF,D9,98,5C,FF,FF,FF
TOS.exe+615CD:
  db D8,80,6C,FF,FF,FF
TOS.exe+615F9:
  db 83,C0,02
TOS.exe+6165F:
  db BE,82,00,00,00
TOS.exe+6166D:
  db 83,F9,43
TOS.exe+6167D:
  db BE,0B,02,00,00
TOS.exe+632B0:
  db 8B,0D,DC,2E,AD,00
TOS.exe+67AFA:
  db 89,87,3C,9A,00,00
TOS.exe+71294:
  db 66,83,82,0E,91,00,00,02
TOS.exe+7142A:
  db B8,02,00,00,00
TOS.exe+71C11:
  db 66,83,46,0E,02
TOS.exe+71F07:
  db 66,83,47,0E,02
TOS.exe+75056:
  db 83,C0,02
TOS.exe+75319:
  db 66,83,86,BE,01,00,00,FE
TOS.exe+7622C:
  db 80,7C,24,11,00,0F,85,69,05,00,00
TOS.exe+7683B:
  db 8D,48,01
TOS.exe+7E7BF:
  db 7C,09
TOS.exe+812E8:
  db 66,83,40,FC,40,66,83,E9,40
TOS.exe+81313:
  db 66,83,02,20
TOS.exe+8136E:
  db 66,83,00,DC
TOS.exe+81381:
  db 66,83,01,08
TOS.exe+813BC:
  db 66,83,40,FC,64,66,83,E9,64
TOS.exe+813F0:
  db 66,83,02,20
TOS.exe+8249E:
  db D9,C0,DE,F2,D9,C9,DE,CA,DE,E1
TOS.exe+824EC:
  db D8,83,94,00,00,00
TOS.exe+8251C:
  db 83,43,04,02
TOS.exe+83C60:
  db 66,83,80,9C,00,00,00,A0
TOS.exe+83D6D:
  db BE,A0,FF,FF,FF
TOS.exe+84E22:
  db E8,09,42,FB,FF
TOS.exe+853AE:
  db 8D,48,01,32,C8,80,E1,7F,32,C8
TOS.exe+857F8:
  db E8,53,52,FB,FF,8B,CB,E8,5C,56,FB,FF,E8,57,57,FB,FF
TOS.exe+858B6:
  db 66,83,83,BE,01,00,00,02
TOS.exe+85B06:
  db E8,45,4F,FB,FF,8B,CB,E8,4E,53,FB,FF,E8,49,54,FB,FF,E8,F4,50,FB,FF
TOS.exe+85F75:
  db E8,D6,4A,FB,FF,8B,CE,E8,5F,4D,FB,FF
TOS.exe+86037:
  db 66,83,83,BE,01,00,00,02
TOS.exe+861B6:
  db E8,95,48,FB,FF,8B,CB,E8,9E,4C,FB,FF,F6,83,91,02,00,00,07,74,3C,8B,43,04,F6,40,5C,02,74,33,0F,B7,83,9E,02,00,00,03,C0,03,C0,99,B9,68,01,00,00,F7,F9,A1,DC,2E,AD,00,8B,88,40,9A,00,00,D9,04,91,DC,0D,50,29,88,00,D8,83,A0,38,01,00,D9,9B,A0,38,01,00,E8,04,4A,FB,FF
TOS.exe+864CA:
  db 66,83,83,BE,01,00,00,02
TOS.exe+869A2:
  db 83,C1,FE
TOS.exe+869E6:
  db E8,65,40,FB,FF,8B,CB,E8,EE,42,FB,FF
TOS.exe+86A73:
  db E8,D8,3F,FB,FF,8B,CB,E8,61,42,FB,FF
TOS.exe+86CA5:
  db 8A,83,EF,17,00,00,84,C0,74,22,FE,C8,88,83,EF,17,00,00,75,18,8B,93,50,39,01,00,8B,83,54,39,01,00,89,93,EC,38,01,00,89,83,F0,38,01,00,8A,83,EF,17,00,00,84,C0,74,22,FE,C8,88,83,EF,17,00,00,75,18,8B,8B,50,39,01,00,8B,93,54,39,01,00,89,8B,EC,38,01,00,89,93,F0,38,01,00
TOS.exe+870C8:
  db 66,83,83,BE,01,00,00,FE
TOS.exe+8726B:
  db E8,E0,37,FB,FF,8B,CE,E8,E9,3B,FB,FF,E8,64,3A,FB,FF
TOS.exe+87861:
  db 48
TOS.exe+87BC4:
  db E8,87,2E,FB,FF,8B,CB,E8,10,31,FB,FF
TOS.exe+87C07:
  db 66,83,83,BE,01,00,00,02
TOS.exe+87C6E:
  db 66,83,86,F8,12,00,00,02
TOS.exe+87D1D:
  db E8,2E,2D,FB,FF,8B,CE,E8,B7,2F,FB,FF
TOS.exe+87D35:
  db 66,83,86,BE,01,00,00,02
TOS.exe+88065:
  db 66,83,86,BE,01,00,00,FE
TOS.exe+880C8:
  db E8,83,29,FB,FF,8B,CE,E8,0C,2C,FB,FF
TOS.exe+88122:
  db 66,83,86,BE,01,00,00,FE
TOS.exe+88576:
  db E8,D5,24,FB,FF,8B,CE,E8,5E,27,FB,FF
TOS.exe+886A4:
  db E8,A7,23,FB,FF,8B,CE,E8,30,26,FB,FF
TOS.exe+8879C:
  db E8,AF,22,FB,FF,8B,CE,E8,38,25,FB,FF
TOS.exe+8884E:
  db E8,FD,21,FB,FF,8B,CE,E8,86,24,FB,FF
TOS.exe+888EF:
  db 66,83,86,BE,01,00,00,FE
TOS.exe+889D7:
  db E8,74,20,FB,FF,8B,CE,E8,FD,22,FB,FF
TOS.exe+88C05:
  db E8,46,1E,FB,FF,8B,CB,E8,4F,22,FB,FF,F6,83,91,02,00,00,07,74,3C,8B,53,04,F6,42,5C,02,74,33,0F,B7,83,9E,02,00,00,03,C0,03,C0,99,B9,68,01,00,00,F7,F9,A1,DC,2E,AD,00,8B,88,40,9A,00,00,D9,04,91,DC,0D,50,29,88,00,D8,83,A0,38,01,00,D9,9B,A0,38,01,00,E8,B5,1F,FB,FF
TOS.exe+8921A:
  db 83,C0,FE
TOS.exe+8925C:
  db E8,EF,17,FB,FF,8B,CE,E8,78,1A,FB,FF
TOS.exe+8948B:
  db 66,83,83,BE,01,00,00,FE
TOS.exe+894CD:
  db E8,7E,15,FB,FF,8B,CB,E8,07,18,FB,FF
TOS.exe+8B262:
  db 83,C0,02
TOS.exe+8B27B:
  db 83,C0,02
TOS.exe+8B7D0:
  db D9,43,48,D8,43,3C,D9,5B,3C,D9,43,4C,D8,43,40,D9,5B,40,D9,43,50,D8,43,44,D9,5B,44,D9,43,48,D8,43,54,D9,5B,48,D9,43,4C,D8,43,58,D9,5B,4C,D9,43,50,D8,43,5C,D9,5B,50
TOS.exe+8B836:
  db D9,43,78,D8,43,54,D9,5B,54,D9,43,58,D8,43,7C,D9,5B,58,D9,83,80,00,00,00,D8,43,5C,D9,5B,5C
TOS.exe+8B8C5:
  db D9,43,48,D8,83,50,01,00,00,D9,9B,50,01,00,00,D9,43,4C,D8,83,54,01,00,00,D9,9B,54,01,00,00,D9,43,50,D8,83,58,01,00,00,D9,9B,58,01,00,00,D9,43,48,D8,43,54,D9,5B,48,D9,43,4C,D8,43,58,D9,5B,4C,D9,43,50,D8,43,5C,D9,5B,50
TOS.exe+8BB44:
  db D9,43,60,D8,43,6C,D9,5B,60,D9,43,70,D8,43,64,D9,5B,64,D9,43,74,D8,43,68,D9,5B,68
TOS.exe+8BBB3:
  db D9,83,A0,00,00,00,D8,83,AC,00,00,00,D9,9B,A0,00,00,00,D9,83,A4,00,00,00,D8,83,B0,00,00,00,D9,9B,A4,00,00,00,D9,83,B4,00,00,00,D8,83,A8,00,00,00,D9,9B,A8,00,00,00
TOS.exe+8BC4A:
  db D9,83,B8,00,00,00,D8,83,E8,00,00,00,D9,9B,B8,00,00,00,D9,83,EC,00,00,00,D8,83,BC,00,00,00,D9,9B,BC,00,00,00,D9,83,F0,00,00,00,D8,83,C0,00,00,00,D9,9B,C0,00,00,00
TOS.exe+8BCB6:
  db D9,83,C4,00,00,00,D8,83,F4,00,00,00,D9,9B,C4,00,00,00,D9,83,F8,00,00,00,D8,83,C8,00,00,00,D9,9B,C8,00,00,00,D9,83,FC,00,00,00,D8,83,CC,00,00,00,D9,9B,CC,00,00,00
TOS.exe+8BD22:
  db D9,83,00,01,00,00,D8,83,D0,00,00,00,D9,9B,D0,00,00,00,D9,83,04,01,00,00,D8,83,D4,00,00,00,D9,9B,D4,00,00,00,D9,83,D8,00,00,00,D8,83,08,01,00,00,D9,9B,D8,00,00,00
TOS.exe+8BD8E:
  db D9,83,DC,00,00,00,D8,83,0C,01,00,00,D9,9B,DC,00,00,00,D9,83,E0,00,00,00,D8,83,10,01,00,00,D9,9B,E0,00,00,00,D9,83,E4,00,00,00,D8,83,14,01,00,00,D9,9B,E4,00,00,00
TOS.exe+8BE5E:
  db D9,83,C4,00,00,00,D8,83,B8,00,00,00,D9,9B,B8,00,00,00,D9,83,C8,00,00,00,D8,83,BC,00,00,00,D9,9B,BC,00,00,00,D9,83,C0,00,00,00,D8,83,CC,00,00,00,D9,9B,C0,00,00,00
TOS.exe+8BEB1:
  db D9,83,C4,00,00,00,D8,83,D0,00,00,00,D9,9B,C4,00,00,00,D9,83,D4,00,00,00,D8,83,C8,00,00,00,D9,9B,C8,00,00,00,D9,83,D8,00,00,00,D8,83,CC,00,00,00,D9,9B,CC,00,00,00
TOS.exe+8BF6B:
  db 0F,B6,4B,30,66,01,4C,C3,20,0F,B6,4B,31,66,01,4C,C3,22,0F,B6,4B,32,66,01,4C,C3,24,0F,B6,4B,33,66,01,4C,C3,26,B9,FF,00,00,00,66,39,4C,C3,20,7E,05,66,89,4C,C3,20,B9,FF,00,00,00,66,39,4C,C3,22,7E,05,66,89,4C,C3,22,B9,FF,00,00,00,66,39,4C,C3,24,7E,05,66,89,4C,C3,24,B9,FF,00,00,00,66,39,4C,C3,26,7E,05,66,89,4C,C3,26
TOS.exe+8C055:
  db 0F,B6,4B,34,66,29,4C,C3,20,0F,B6,4B,35,66,29,4C,C3,22,0F,B6,4B,36,66,29,4C,C3,24,0F,B6,4B,37,66,29,4C,C3,26,66,83,7C,C3,20,00,7D,07,33,C9,66,89,4C,C3,20,66,83,7C,C3,22,00,7D,07,33,C9,66,89,4C,C3,22,66,83,7C,C3,24,00,7D,07,33,C9,66,89,4C,C3,24,66,83,7C,C3,26,00,7D,07,33,C9,66,89,4C,C3,26
TOS.exe+8C17E:
  db 0F,B7,48,04,66,01,4B,08,0F,B7,50,06,66,01,53,0A
TOS.exe+8C2CF:
  db 66,83,86,8A,02,00,00,02
TOS.exe+8C2E4:
  db 80,86,93,02,00,00,02
TOS.exe+8CDA0:
  db DD,05,80,2C,88,00
TOS.exe+8CFC8:
  db 83,C7,02
TOS.exe+8D0FE:
  db D9,00,DE,C3,D9,CA,D9,18,D8,40,04,D9,58,04,D8,40,08,D9,58,08
TOS.exe+8D145:
  db D9,07,D8,00,D9,18,D9,40,04,D8,47,04,D9,58,04,D9,40,08,D8,47,08,D9,58,08,D9,07,D8,43,30,D9,1F,D9,43,34,D8,47,04,D9,5F,04,D9,47,08,D8,43,38,D9,5F,08
TOS.exe+8D2D0:
  db DD,05,B8,29,88,00
TOS.exe+8D79A:
  db 74,05
TOS.exe+8D7CA:
  db 74,05,FE,C9
TOS.exe+8D7DA:
  db 74,05
TOS.exe+8D809:
  db 74,04,FE,C9
TOS.exe+8D819:
  db 74,05
TOS.exe+8D849:
  db 74,05,FE,C9
TOS.exe+8D85A:
  db 74,05
TOS.exe+8D88A:
  db 74,05,FE,C9
TOS.exe+9215A:
  db DC,05,B8,29,88,00
TOS.exe+93A4D:
  db 66,83,83,C6,00,00,00,F8
TOS.exe+9CC61:
  db D9,46,04,D8,46,28,D9,5E,04,D9,46,08,D8,46,2C,D9,5E,08,D9,46,0C,D8,46,30,D9,5E,0C
TOS.exe+9D8FB:
  db 29,13
TOS.exe+9F92C:
  db DC,0D,50,29,88,00
TOS.exe+9F938:
  db DC,05,08,3B,88,00
TOS.exe+9FBC2:
  db 83,C0,FE
TOS.exe+9FCD1:
  db 83,C0,02
TOS.exe+A0046:
  db C7,83,B0,00,00,00,0A,00,00,00
TOS.exe+A0ADF:
  db D9,05,BC,3E,88,00
TOS.exe+A0AFA:
  db C7,83,B0,00,00,00,0F,00,00,00
TOS.exe+A0B65:
  db DD,05,C0,2A,88,00
TOS.exe+A0D42:
  db 83,F8,08
TOS.exe+A101F:
  db A1,D4,0C,C3,01
TOS.exe+A176F:
  db D9,05,B8,3E,88,00
TOS.exe+A178C:
  db C7,83,B0,00,00,00,0A,00,00,00
TOS.exe+A183A:
  db C7,83,B0,00,00,00,96,00,00,00
TOS.exe+A1A66:
  db E8,E5,C7,FF,FF
TOS.exe+A1CA9:
  db 83,E0,01
TOS.exe+A1D39:
  db 83,E0,01
TOS.exe+A1F10:
  db C7,83,B0,00,00,00,96,00,00,00
TOS.exe+A1FE3:
  db C7,83,B0,00,00,00,96,00,00,00
TOS.exe+A202C:
  db C7,83,B0,00,00,00,96,00,00,00
TOS.exe+A2215:
  db C7,86,B0,00,00,00,0F,00,00,00
TOS.exe+A2295:
  db 83,BE,B0,00,00,00,0F
TOS.exe+A24CE:
  db C7,83,B0,00,00,00,05,00,00,00
TOS.exe+A2600:
  db 83,BB,B0,00,00,00,0F
TOS.exe+A2637:
  db D8,05,FC,F3,72,00
TOS.exe+A2663:
  db DD,05,48,3E,88,00
TOS.exe+A26B7:
  db DC,05,40,3E,88,00
TOS.exe+A26DE:
  db D8,25,FC,F3,72,00
TOS.exe+A26FC:
  db DD,05,40,3E,88,00
TOS.exe+A2AA2:
  db 83,BB,F0,09,00,00,78
TOS.exe+A2C42:
  db C7,83,B0,00,00,00,3C,00,00,00
TOS.exe+A2D35:
  db 83,FA,1E
TOS.exe+A2D3E:
  db 83,83,DC,09,00,00,10
TOS.exe+A2D60:
  db DC,05,30,3E,88,00
TOS.exe+A2D8F:
  db 83,FA,1F
TOS.exe+A2DF4:
  db 83,F8,1D
TOS.exe+A2E03:
  db 83,E8,08
TOS.exe+A2E16:
  db DC,25,28,3E,88,00
TOS.exe+A2E43:
  db 8D,04,95,00,00,00,00
TOS.exe+A2E79:
  db D8,83,84,00,00,00
TOS.exe+A2EAA:
  db 8D,14,8D,00,00,00,00
TOS.exe+A307F:
  db C7,86,B0,00,00,00,0A,00,00,00
TOS.exe+A3125:
  db 03,D2
TOS.exe+A3160:
  db 03,D2
TOS.exe+A3177:
  db E8,D4,B0,FF,FF
TOS.exe+A3217:
  db C7,86,B0,00,00,00,3C,00,00,00
TOS.exe+A324F:
  db 83,BE,B0,00,00,00,3C
TOS.exe+A32E1:
  db DC,35,C0,2D,88,00
TOS.exe+A3328:
  db 83,BE,B0,00,00,00,14
TOS.exe+A342F:
  db D9,05,2C,2D,88,00
TOS.exe+A344A:
  db C7,83,B0,00,00,00,0F,00,00,00
TOS.exe+A34D7:
  db DD,05,C0,2A,88,00
TOS.exe+A36AF:
  db 83,F8,08
TOS.exe+A39E6:
  db A1,D4,0C,C3,01
TOS.exe+A41D5:
  db C7,86,B0,00,00,00,2C,01,00,00
TOS.exe+A4246:
  db 83,BE,B0,00,00,00,07
TOS.exe+A4260:
  db C7,86,B0,00,00,00,07,00,00,00
TOS.exe+A4270:
  db 3D,1D,01,00,00
TOS.exe+A427D:
  db DC,25,A0,36,88,00
TOS.exe+A4285:
  db 83,F8,0F
TOS.exe+A4290:
  db DC,05,A0,36,88,00
TOS.exe+A42CE:
  db 81,BE,B0,00,00,00,2C,01,00,00
TOS.exe+A432B:
  db 83,BE,B0,00,00,00,07
TOS.exe+A461F:
  db C7,83,B0,00,00,00,5A,00,00,00
TOS.exe+A483E:
  db C7,83,B0,00,00,00,1E,00,00,00
TOS.exe+A485B:
  db 83,BB,B0,00,00,00,1E
TOS.exe+A4A7C:
  db 83,BB,B0,00,00,00,14
TOS.exe+A4BA8:
  db DC,0D,A8,2A,88,00
TOS.exe+A4C4A:
  db 83,BB,B0,00,00,00,1D
TOS.exe+A4E4F:
  db D9,05,B8,38,88,00
TOS.exe+A4E6A:
  db C7,83,B0,00,00,00,0A,00,00,00
TOS.exe+A51BF:
  db A1,D4,0C,C3,01
TOS.exe+A5900:
  db D9,05,80,35,88,00
TOS.exe+A591B:
  db C7,83,B0,00,00,00,1E,00,00,00
TOS.exe+A59A5:
  db FF,83,F0,09,00,00,F6,05,D8,C3,C3,01,01
TOS.exe+A609F:
  db D9,05,B4,38,88,00
TOS.exe+A60BA:
  db C7,83,B0,00,00,00,0F,00,00,00
TOS.exe+A613A:
  db 83,BB,B0,00,00,00,0C
TOS.exe+A6209:
  db F6,05,D8,C3,C3,01,01
TOS.exe+A6356:
  db 83,BB,B0,00,00,00,0C
TOS.exe+A6475:
  db F6,05,D8,C3,C3,01,01
TOS.exe+A664E:
  db DC,35,18,37,88,00
TOS.exe+A665E:
  db DC,25,28,2B,88,00
TOS.exe+A6940:
  db D9,05,20,32,88,00
TOS.exe+A695B:
  db C7,83,B0,00,00,00,1E,00,00,00
TOS.exe+A69E5:
  db FF,83,F0,09,00,00,F6,05,D8,C3,C3,01,01
TOS.exe+A6D6A:
  db C7,46,60,F0,0F,F0,FF
TOS.exe+A6E90:
  db D9,05,AC,3E,88,00
TOS.exe+A6EAB:
  db C7,83,B0,00,00,00,0F,00,00,00
TOS.exe+A735F:
  db D9,05,B8,38,88,00
TOS.exe+A737C:
  db C7,83,B0,00,00,00,0A,00,00,00
TOS.exe+A742A:
  db C7,83,B0,00,00,00,3C,00,00,00
TOS.exe+A7656:
  db E8,F5,6B,FF,FF
TOS.exe+A7899:
  db 83,E0,01
TOS.exe+A7929:
  db 83,E0,01
TOS.exe+A7B00:
  db C7,83,B0,00,00,00,3C,00,00,00
TOS.exe+A7BD3:
  db C7,83,B0,00,00,00,3C,00,00,00
TOS.exe+A7C1C:
  db C7,83,B0,00,00,00,3C,00,00,00
TOS.exe+A7E0B:
  db C7,86,B0,00,00,00,0F,00,00,00
TOS.exe+A7E75:
  db 83,BE,B0,00,00,00,0F
TOS.exe+A8ADB:
  db DC,E9
TOS.exe+B312D:
  db 75,C3
TOS.exe+BB245:
  db DC,0D,50,29,88,00
TOS.exe+BC9E4:
  db DC,0D,50,29,88,00
TOS.exe+C17F2:
  db 8B,7D,08,83,3F,00
TOS.exe+C1B71:
  db 83,C4,04,5F,5E
TOS.exe+C3915:
  db 83,05,C8,C3,C3,01,02
TOS.exe+C50E9:
  db 56,E8,31,CD,0A,00,83,C4,04
TOS.exe+C513A:
  db 80,05,2B,3E,AD,00,FE
TOS.exe+C5170:
  db FF,D6
TOS.exe+C52F0:
  db FF,D6
TOS.exe+C5397:
  db FF,D6
TOS.exe+C5540:
  db 7E,09,49,89,08,3B,CB,75,02
TOS.exe+C555B:
  db 8D,7A,02
TOS.exe+C558B:
  db 8B,86,28,1B,00,00,85,C0,74,07,48,89,86,28,1B,00,00
TOS.exe+C55C1:
  db 8B,86,30,1B,00,00,85,C0,74,07,48,89,86,30,1B,00,00
TOS.exe+C584E:
  db 56,E8,CC,C5,0A,00,83,C4,04
TOS.exe+C58C1:
  db FF,D6
TOS.exe+C5A0C:
  db FF,D6
TOS.exe+C8920:
  db 33,C0,8D,8A,5C,08,00,00
TOS.exe+C89A8:
  db DD,05,B8,29,88,00
TOS.exe+C8A18:
  db D8,C9
TOS.exe+C9C26:
  db D9,44,24,24,D8,D9
TOS.exe+C9D49:
  db 8A,0D,DD,C3,C3,01
TOS.exe+C9D70:
  db D9,54,24,24,84,C9
TOS.exe+C9F3A:
  db 8A,0D,DD,C3,C3,01
TOS.exe+C9F59:
  db D9,54,24,24,84,C9
TOS.exe+CA0AB:
  db 8A,0D,DD,C3,C3,01
TOS.exe+CA0CA:
  db D9,54,24,24,84,C9
TOS.exe+CA40C:
  db DC,0D,A8,2A,88,00
TOS.exe+CB310:
  db DC,C1
TOS.exe+CB322:
  db D8,C1
TOS.exe+CB338:
  db DC,E9
TOS.exe+CB34A:
  db D8,E1
TOS.exe+CB35D:
  db DC,E9
TOS.exe+CB36F:
  db D8,E1
TOS.exe+CB385:
  db DC,C1
TOS.exe+CB397:
  db D8,C1
TOS.exe+CB3A8:
  db 83,BE,B0,00,00,00,19
TOS.exe+CB560:
  db DC,E9
TOS.exe+CB572:
  db D8,E1
TOS.exe+CB588:
  db DC,C1
TOS.exe+CB59A:
  db D8,C1
TOS.exe+CB5AD:
  db DC,C1
TOS.exe+CB5BF:
  db D8,C1
TOS.exe+CB5D5:
  db DC,E9
TOS.exe+CB5E7:
  db D8,E1
TOS.exe+CB5F8:
  db 83,BE,B0,00,00,00,19
TOS.exe+CBEBC:
  db C7,80,B0,00,00,00,10,00,00,00
TOS.exe+CC963:
  db C7,86,B0,00,00,00,0F,00,00,00
TOS.exe+CCF4D:
  db D9,9E,38,09,00,00
TOS.exe+CCFDE:
  db D8,1D,20,2B,88,00
TOS.exe+CCFF4:
  db E8,B7,5D,FF,FF
TOS.exe+CD02E:
  db E8,7D,5D,FF,FF
TOS.exe+CDC54:
  db 66,83,86,C8,00,00,00,02
TOS.exe+CDDBD:
  db 66,83,81,CE,00,00,00,02
TOS.exe+CEEAC:
  db E8,7F,90,FF,FF
TOS.exe+CEEBA:
  db E9,37,03,00,00
TOS.exe+CEF14:
  db E8,17,90,FF,FF
TOS.exe+CF1F6:
  db D9,43,28,D8,43,04,D9,5B,04,D9,43,2C,D8,43,08,D9,5B,08,D9,43,30,D8,43,0C,D9,5B,0C
TOS.exe+CF3D5:
  db DC,05,B8,29,88,00
TOS.exe+CF44C:
  db F6,05,D8,C3,C3,01,03
TOS.exe+CF4F6:
  db F6,05,D8,C3,C3,01,0F
TOS.exe+CF5A5:
  db DC,05,B8,29,88,00
TOS.exe+CF5BE:
  db D1,E8,F6,D0,24,10
TOS.exe+D0900:
  db DC,25,B8,29,88,00
TOS.exe+D0C8D:
  db DC,C0
TOS.exe+D0F24:
  db DD,05,B8,29,88,00
TOS.exe+D1BA9:
  db 83,83,DC,09,00,00,02
TOS.exe+D1E8E:
  db F6,05,D8,C3,C3,01,03
TOS.exe+D20C7:
  db F6,05,D8,C3,C3,01,03
TOS.exe+D2381:
  db 66,FF,83,CE,09,00,00
TOS.exe+D2683:
  db DC,05,B8,29,88,00
TOS.exe+D2786:
  db DC,05,18,2E,88,00
TOS.exe+D27C0:
  db DC,25,B8,29,88,00
TOS.exe+D29C7:
  db DD,05,B8,29,88,00
TOS.exe+D2A0E:
  db DC,25,60,36,88,00
TOS.exe+D2AE9:
  db F6,05,D8,C3,C3,01,03
TOS.exe+D2B6F:
  db DC,05,08,2C,88,00
TOS.exe+D2BA8:
  db DC,05,58,36,88,00
TOS.exe+D2E1F:
  db DC,05,68,2E,88,00
TOS.exe+D2EC7:
  db 48,89,83,B0,00,00,00
TOS.exe+D2EE3:
  db 48,89,83,B0,00,00,00,85,C0,7F,06
TOS.exe+D397D:
  db DD,05,B8,29,88,00
TOS.exe+D3EAA:
  db 83,E8,02
TOS.exe+D3FDD:
  db DD,05,B8,29,88,00
TOS.exe+D4423:
  db 83,E8,02
TOS.exe+D45DD:
  db DD,05,B8,29,88,00
TOS.exe+D4A23:
  db 83,E8,02
TOS.exe+D56CE:
  db 83,EA,02
TOS.exe+D58DD:
  db DD,05,B8,29,88,00
TOS.exe+D5DB5:
  db 83,E8,02
TOS.exe+D6352:
  db 48
TOS.exe+D8EF2:
  db DC,05,B8,29,88,00
TOS.exe+DB137:
  db 8D,0C,41
TOS.exe+DB13C:
  db 83,E9,02
TOS.exe+DB151:
  db 03,C0
TOS.exe+DB191:
  db 66,83,E8,10
TOS.exe+DB251:
  db D9,46,0C,DE,C3,D9,CA,D9,5E,0C,D8,46,10,D9,5E,10,EB,30
TOS.exe+DB27E:
  db D9,46,0C,D8,46,40,D9,5E,0C,D9,46,10,D8,46,44,D9,5E,10,D9,46,48,D8,46,14,D9,5E,14
TOS.exe+DB2BA:
  db 84,C0
TOS.exe+DB2D3:
  db 84,C9
TOS.exe+DB2FC:
  db D9,46,18,D8,46,4C,D9,5E,18,D9,46,50,D8,46,1C,D9,5E,1C,D9,46,20,D8,46,54,D9,5E,20
TOS.exe+DB320:
  db D9,45,F4,D8,46,5C,D9,5D,F4
TOS.exe+DB338:
  db D9,45,F4,D8,46,5C,D9,5D,F4
TOS.exe+DB36F:
  db 66,83,46,3E,02
TOS.exe+DB3DB:
  db 48,66,89,06
TOS.exe+DBA26:
  db DC,05,F0,2C,88,00
TOS.exe+DBA48:
  db 83,C1,02
TOS.exe+DBA5C:
  db DC,25,60,2C,88,00
TOS.exe+F3722:
  db 80,3D,D6,39,B1,00,CC
TOS.exe+F373A:
  db 80,05,D8,39,B1,00,CD,80,05,D6,39,B1,00,33
TOS.exe+F3751:
  db 80,3D,D6,39,B1,00,33
TOS.exe+F376C:
  db 80,05,D6,39,B1,00,CD
TOS.exe+F377C:
  db 80,3D,D6,39,B1,00,CC
TOS.exe+F37A3:
  db 80,3D,D2,39,B1,00,D7
TOS.exe+F37C5:
  db 80,05,D2,39,B1,00,28
TOS.exe+F37DE:
  db 3C,28
TOS.exe+F3811:
  db 04,D8
TOS.exe+F4215:
  db 83,C1,33
TOS.exe+F4224:
  db 04,33
TOS.exe+F4636:
  db 3C,33
TOS.exe+F463A:
  db 04,CD
TOS.exe+F4729:
  db C7,05,D2,39,B1,00,D8,01,00,00
TOS.exe+F77F4:
  db 80,3D,C8,0D,C3,01,D7
TOS.exe+F7810:
  db 80,05,C8,0D,C3,01,28
TOS.exe+F782A:
  db 80,F9,28
TOS.exe+F785A:
  db 80,C1,D8
TOS.exe+F8018:
  db C7,05,C8,0D,C3,01,D8,01,00,00
TOS.exe+FC3B7:
  db 80,3D,B0,9F,D5,01,D7
TOS.exe+FC3EB:
  db 80,05,B0,9F,D5,01,28
TOS.exe+FC40F:
  db 80,F9,28
TOS.exe+FC4DF:
  db 80,C1,D8
TOS.exe+FE6E9:
  db 66,C7,05,B0,9F,D5,01,D8,01
TOS.exe+1068F0:
  db 80,3D,38,0E,C3,01,D7
TOS.exe+106916:
  db 80,05,38,0E,C3,01,28
TOS.exe+106939:
  db 3C,28
TOS.exe+106A2F:
  db 04,D8
TOS.exe+107CE7:
  db 66,C7,05,38,0E,C3,01,D8,01
TOS.exe+10ABC1:
  db 80,3D,2C,17,C3,01,D7
TOS.exe+10ABE7:
  db 80,05,2C,17,C3,01,28
TOS.exe+10AC01:
  db 80,F9,28
TOS.exe+10AC57:
  db 80,C1,D8
TOS.exe+10BDC2:
  db 66,C7,05,2C,17,C3,01,D8,01
TOS.exe+11799B:
  db 80,3D,90,95,8B,00,D7
TOS.exe+1179BB:
  db 80,05,90,95,8B,00,28
TOS.exe+1179D5:
  db 80,FA,28
TOS.exe+117A22:
  db 80,C2,D8
TOS.exe+118E54:
  db 66,C7,05,90,95,8B,00,D8,01
TOS.exe+118F44:
  db 66,C7,05,90,95,8B,00,D8,01
TOS.exe+118FAD:
  db 66,C7,05,90,95,8B,00,D8,01
TOS.exe+119011:
  db 66,C7,05,90,95,8B,00,D8,01
TOS.exe+1190AC:
  db 66,C7,05,90,95,8B,00,D8,01
TOS.exe+11B5B4:
  db 80,3D,6C,17,C3,01,33
TOS.exe+11B5CD:
  db 80,05,6C,17,C3,01,CD
TOS.exe+11B5DA:
  db 80,3D,6C,17,C3,01,CC
TOS.exe+11B612:
  db 80,F9,28
TOS.exe+11B65E:
  db 80,C1,D8
TOS.exe+11B66C:
  db 80,3D,68,17,C3,01,D7
TOS.exe+11B686:
  db 80,05,68,17,C3,01,28
TOS.exe+11BE64:
  db 80,05,6C,17,C3,01,33
TOS.exe+11C122:
  db C7,05,68,17,C3,01,D8,01,00,00
TOS.exe+11C68A:
  db C7,05,68,17,C3,01,D8,03,00,00
TOS.exe+124BF5:
  db 80,3D,C8,3A,B1,00,33
TOS.exe+124D1E:
  db 80,05,C8,3A,B1,00,CD
TOS.exe+124D2E:
  db 80,3D,C8,3A,B1,00,CC
TOS.exe+124D53:
  db 80,3D,C4,3A,B1,00,D7
TOS.exe+124D79:
  db 80,05,C4,3A,B1,00,28
TOS.exe+124D93:
  db 80,FA,28
TOS.exe+124DC3:
  db 80,C2,D8
TOS.exe+1269E8:
  db 80,05,C8,3A,B1,00,33
TOS.exe+126C55:
  db 66,C7,05,C4,3A,B1,00,D8,01
TOS.exe+127AA1:
  db 80,3D,1A,19,C3,01,33
TOS.exe+127ABA:
  db 80,05,1A,19,C3,01,CD
TOS.exe+127ACA:
  db 80,3D,1A,19,C3,01,CC
TOS.exe+127AEF:
  db 80,3D,18,19,C3,01,D7
TOS.exe+127B17:
  db 80,05,18,19,C3,01,28
TOS.exe+127B31:
  db 80,F9,28
TOS.exe+127C27:
  db 80,C1,D8
TOS.exe+1280D3:
  db 80,05,1A,19,C3,01,33
TOS.exe+128218:
  db C7,05,18,19,C3,01,D8,01,00,00
TOS.exe+12A1CE:
  db 80,F9,28
TOS.exe+12A2D1:
  db 80,C1,D8
TOS.exe+12A2DF:
  db 80,3D,E0,01,8F,00,D7
TOS.exe+12A311:
  db 80,05,E0,01,8F,00,28
TOS.exe+12A87E:
  db C7,05,E0,01,8F,00,D8,01,00,00
TOS.exe+12AA71:
  db 66,C7,05,E0,01,8F,00,D8,03
TOS.exe+12D2F7:
  db 80,3D,B0,3E,B1,00,D7
TOS.exe+12D313:
  db 80,05,B0,3E,B1,00,28
TOS.exe+12D32C:
  db 3C,28
TOS.exe+12D35F:
  db 04,D8
TOS.exe+12E34F:
  db C7,05,B0,3E,B1,00,D8,01,00,00
TOS.exe+137E51:
  db 0F,B6,D1,0F,B6,88,D4,1A,C3,01
TOS.exe+137E89:
  db C7,04,95,50,1A,C3,01,0C,00,00,00
TOS.exe+137E9F:
  db 89,3C,95,50,1A,C3,01
TOS.exe+137ED5:
  db C7,04,8D,90,1C,C3,01,0C,00,00,00
TOS.exe+137EEB:
  db 89,3C,8D,90,1C,C3,01
TOS.exe+139D23:
  db 80,3D,6C,71,8B,00,D7
TOS.exe+139D40:
  db 80,05,6C,71,8B,00,28
TOS.exe+139D58:
  db 80,F9,28
TOS.exe+139E63:
  db 80,C1,D8
TOS.exe+13A3C3:
  db C7,05,6C,71,8B,00,D8,01,00,00
TOS.exe+154BDB:
  db 66,83,C0,04
TOS.exe+154F79:
  db 66,83,C0,10
TOS.exe+155026:
  db 66,83,C0,08
TOS.exe+156448:
  db D9,43,04,D8,43,28,D9,5B,04,D9,43,2C,D8,43,08,D9,5B,08,D9,43,30,D8,43,0C,D9,5B,0C
TOS.exe+1564EC:
  db 66,83,83,C8,00,00,00,02
TOS.exe+1565DD:
  db 66,83,83,CE,00,00,00,02
TOS.exe+1566AF:
  db 66,83,83,D2,00,00,00,02
TOS.exe+15694B:
  db D9,83,EC,09,00,00
TOS.exe+15A34C:
  db 83,C0,10
TOS.exe+15C615:
  db D8,25,18,F4,72,00
TOS.exe+15EA21:
  db DC,C0
TOS.exe+15EB66:
  db DC,C0
TOS.exe+15ECA6:
  db DC,C0
TOS.exe+15EDE6:
  db DC,C0
TOS.exe+15EEFE:
  db 66,89,87,C6,00,00,00
TOS.exe+15EFB0:
  db DC,C0
TOS.exe+15F727:
  db DB,44,24,14,DC,C0
TOS.exe+15F7A9:
  db DC,C0
TOS.exe+15F7B9:
  db D9,98,38,09,00,00
TOS.exe+160CEF:
  db DC,C0
TOS.exe+161CB2:
  db DD,05,B8,29,88,00
TOS.exe+161E6C:
  db DD,05,B8,29,88,00
TOS.exe+16777A:
  db DD,05,B8,29,88,00
TOS.exe+174285:
  db E8,D6,C1,00,00
TOS.exe+174379:
  db E8,72,BE,00,00
TOS.exe+174433:
  db E8,B8,BD,00,00
TOS.exe+1744F3:
  db E8,F8,BC,00,00
TOS.exe+1745AD:
  db E8,3E,BC,00,00
TOS.exe+174683:
  db E8,68,BB,00,00
TOS.exe+174747:
  db E8,A4,BA,00,00
TOS.exe+17481C:
  db E8,CF,B9,00,00
TOS.exe+1748D8:
  db E8,13,B9,00,00
TOS.exe+174B50:
  db E8,9B,B6,00,00
TOS.exe+174D4D:
  db E8,9E,B4,00,00
TOS.exe+175521:
  db E8,CA,AC,00,00
TOS.exe+1755A9:
  db E8,42,AC,00,00
TOS.exe+1755E8:
  db 8D,0C,C5,00,00,00,00
TOS.exe+17671F:
  db BA,FE,FF,00,00
TOS.exe+176799:
  db 66,83,86,24,28,00,00,FE
TOS.exe+17B7A0:
  db D9,01,D8,06,D9,19,D9,41,04,D8,46,04,D9,59,04,D9,41,08,D8,46,08,D9,59,08
TOS.exe+17B957:
  db DD,05,B8,29,88,00
TOS.exe+17B9C8:
  db D8,4F,14,D9,47,08,D8,67,10,D9,5C,24,10,D9,44,24,10,D8,C1,D9,5C,24,10,D9,44,24,10,D9,57,08
TOS.exe+17BA4B:
  db DC,05,B8,29,88,00
TOS.exe+17E6A7:
  db B3,0F
TOS.exe+17E6F2:
  db F6,C2,01
TOS.exe+17E746:
  db F6,C2,01
TOS.exe+17E79A:
  db F6,C2,01
TOS.exe+17E7EE:
  db F6,C2,01
TOS.exe+17E83C:
  db F6,C2,01
TOS.exe+17E884:
  db F6,C2,01
TOS.exe+17E8CC:
  db F6,C2,01
TOS.exe+17E914:
  db F6,C2,01
TOS.exe+17E962:
  db F6,C2,01
TOS.exe+17E9B6:
  db F6,C2,01
TOS.exe+17EA0A:
  db F6,C2,01
TOS.exe+17EA5E:
  db F6,C2,01
TOS.exe+17EAB2:
  db F6,C2,01
TOS.exe+17EB06:
  db F6,C2,01
TOS.exe+17EB5A:
  db F6,C2,01
TOS.exe+17EBAE:
  db F6,C2,01
TOS.exe+17EC02:
  db F6,C2,01
TOS.exe+17EC56:
  db F6,C2,01
TOS.exe+18167C:
  db 89,1D,7C,AE,B1,00
TOS.exe+18296B:
  db 89,04,B5,08,C0,B1,00
TOS.exe+18B625:
  db 8B,4D,08,33,D2,83,C1,0C,B3,80,8B,01,85,C0,74,0A,83,38,00,74,05,84,58,20,75,68,42,83,C1,38,83,FA,04,7C,E7
TOS.exe+195232:
  db E8,D9,02,FF,FF
TOS.exe+195AA6:
  db E8,25,19,FF,FF
TOS.exe+1C9449:
  db 83,3D,C4,90,8A,00,02
TOS.exe+1CF400:
  db 55,8B,EC,8B,45,08,A3,C4,90,8A,00,5D,C3
TOS.exe+483EC0:
  db 00,00,04,C2
TOS.exe+4CEE4A:
  db 78
TOS.exe+4CEE5A:
  db 08
TOS.exe+4CEE5E:
  db 08
dealloc(arte_helpers)
dealloc(arte_constants)
dealloc(chant_cache)
dealloc(crimson_frame)
dealloc(animation_cleanup)
dealloc(chant_timing)
dealloc(darkness_orb)
dealloc(darkness_orb_state)
dealloc(darkness_shader)
dealloc(darkness_shader_state)
dealloc(timing_helpers)
dealloc(dialogue_corners)
dealloc(dialogue_helpers)
