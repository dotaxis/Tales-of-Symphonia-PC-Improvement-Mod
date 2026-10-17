// Field particles, emotes, damage numbers, other effects and all Sorcerer's Ring fixes.
// Tales of Symphonia 60FPS v0.0.46; controlled by [60FPS] Enabled=1.
// Fresh launch required. Reference VAs identify source bytes, not runtime allocations.
// Bare ASM numbers are hexadecimal; # introduces decimal.
// Sections:
//   Field effects
//   Field particles
//   Field emotes
//   Sorcerer ring

[ENABLE]

// ======================================================================
// Field effects
// Field effect spawning/motion, selective duration scaling and field damage-number fades.
// Only effect types 19, 50 and 51 double the selected duration parameter; sizes, radii and counts for
// other types stay native.
// Type 31 spawn speed and radius decay are paired. Field damage-number constants are separate from emote
// constants.
// ======================================================================

alloc(fps_field_effects_code,1000)

label(fps_field_effect_motion)
label(fps_field_effect_parameter)
label(fps_loc_02EFF416)
label(fps_loc_02EFF419)

// Guard the native callbacks and continuations used by this script.
assert(TOS.exe+9CC7C,8B 46 04 8B 4E)
assert(TOS.exe+CF5C4,88 44 24 19 E8)
assert(TOS.exe+15EF05,8B 8E 44 08 00)

// Reference VA 0049215A..0049215F.
// Apply one rather than two units in this FieldEffect_TickAndRender branch; broader effect-specific
// behavior remains undocumented.
assert(TOS.exe+9215A,DC 05 B8 29 88 00)
TOS.exe+9215A:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 0049215A

// Reference VA 00493A4D..00493A54.
// Type 31 blessing light: radius decreases by 4 instead of 8, matching the already-halved spawn speed so
// descent reaches its intended endpoint. Keep paired with 0x55EFB0.
assert(TOS.exe+93A4D,66 83 83 C6 00 00 00 F8)
TOS.exe+93A4D:
// Vanilla: add word ptr [ebx + 0xc6], -8
  db 66,83,83,C6,00,00,00,FC // add word ptr [ebx + 0xc6], -#4 // 00493A4D

// Reference VA 0049CC61..0049CC7B.
// Halve XYZ motion in the general field-effect wrapper. The historical Teleporter_TickAndRender name is
// narrower than its actual users.
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
// Type 38 inward spiral: remove the second radius subtraction so travel matches the existing lifetime
// budget.
assert(TOS.exe+9D8FB,29 13)
TOS.exe+9D8FB:
// Vanilla: sub dword ptr [ebx], edx
  nop // 0049D8FB
  nop // 0049D8FC

// Reference VA 004CF44C..004CF452.
// Preserve this actor-particle emission cadence by changing the global-frame gate from every 4 to every
// 8 updates. Exact visual particle identity remains unconfirmed.
assert(TOS.exe+CF44C,F6 05 D8 C3 C3 01 03)
TOS.exe+CF44C:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004CF44C

// Reference VA 004CF4F6..004CF4FC.
// Preserve this actor-particle emission cadence by changing the global-frame gate from every 16 to every
// 32 updates. Exact visual particle identity remains unconfirmed.
assert(TOS.exe+CF4F6,F6 05 D8 C3 C3 01 0F)
TOS.exe+CF4F6:
// Vanilla: test byte ptr [0x1c3c3d8], 0xf
  test byte ptr [TOS.exe+183C3D8], 0x1f // 004CF4F6

// Reference VA 004CF5A5..004CF5AA.
// Change the particle velocity contribution from 2 to 1 before storing particle+0x48 in the actor effect
// path. Exact visual effect remains unconfirmed.
assert(TOS.exe+CF5A5,DC 05 B8 29 88 00)
TOS.exe+CF5A5:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 004CF5A5

// Reference VA 004CF5BE..004CF5C3.
// Derive the effect selector from global-frame bit 0x40, yielding 0 or 0x10 for the following sub_4D0FA0
// path; retain the reference cadence and phase. Exact visual identity remains unconfirmed.
assert(TOS.exe+CF5BE,D1 E8 F6 D0 24 10)
TOS.exe+CF5BE:
// Vanilla: shr eax, 1; not al; and al, 0x10
  and al, 0x40 // 004CF5BE
  je short TOS.exe+CF5C4 // 004CF5C0
  mov al, 0x10 // 004CF5C2

// Reference VA 004D0900..004D0905.
// Subtract one instead of two in the aura effect update. Exact effect-specific counter semantics remain
// undocumented.
assert(TOS.exe+D0900,DC 25 B8 29 88 00)
TOS.exe+D0900:
// Vanilla: fsub qword ptr [0x8829b8]
  fsub qword ptr [fps_double_one] // 004D0900

// Reference VA 004D0F24..004D0F29.
// Load one instead of two in NPC shadow-effect initialization.
assert(TOS.exe+D0F24,DD 05 B8 29 88 00)
TOS.exe+D0F24:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 004D0F24

// Reference VA 004D8EF2..004D8EF7.
// Use a +1 particle-velocity contribution instead of +2 in save-point callback 0x4D8770. Exact visual
// mechanism remains undocumented.
assert(TOS.exe+D8EF2,DC 05 B8 29 88 00)
TOS.exe+D8EF2:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 004D8EF2

// Reference VA 004DBA26..004DBA2B.
// Field damage-number fade-in: +16 alpha per update instead of +32. Use the native constant rather than
// the unrelated emote table.
assert(TOS.exe+DBA26,DC 05 F0 2C 88 00)
TOS.exe+DBA26:
// Vanilla: fadd qword ptr [0x882cf0]
  fadd qword ptr [TOS.exe+482DE0] // 004DBA26

// Reference VA 004DBA48..004DBA4A.
// Field damage-number hold phase: advance the counter once rather than twice per update.
assert(TOS.exe+DBA48,83 C1 02)
TOS.exe+DBA48:
// Vanilla: add ecx, 2
  add ecx, #1 // 004DBA48

// Reference VA 004DBA5C..004DBA61.
// Field damage-number fade-out: subtract 4 alpha per update instead of 8. Native position coefficients
// remain unchanged.
assert(TOS.exe+DBA5C,DC 25 60 2C 88 00)
TOS.exe+DBA5C:
// Vanilla: fsub qword ptr [0x882c60]
  fsub qword ptr [TOS.exe+482E18] // 004DBA5C

// Reference VA 0055EA21..0055EA22.
// Remove the duplicate floating-point parameter contribution in this scenario effect-spawn path.
assert(TOS.exe+15EA21,DC C0)
TOS.exe+15EA21:
// Vanilla: fadd st(0), st(0)
  nop // 0055EA21
  nop // 0055EA22

// Reference VA 0055EB66..0055EB67.
// Remove the duplicate floating-point parameter contribution in this scenario effect-spawn path.
assert(TOS.exe+15EB66,DC C0)
TOS.exe+15EB66:
// Vanilla: fadd st(0), st(0)
  nop // 0055EB66
  nop // 0055EB67

// Reference VA 0055ECA6..0055ECA7.
// Remove the duplicate floating-point parameter contribution in this scenario effect-spawn path.
assert(TOS.exe+15ECA6,DC C0)
TOS.exe+15ECA6:
// Vanilla: fadd st(0), st(0)
  nop // 0055ECA6
  nop // 0055ECA7

// Reference VA 0055EDE6..0055EDE7.
// Remove the duplicate floating-point parameter contribution in this scenario effect-spawn path.
assert(TOS.exe+15EDE6,DC C0)
TOS.exe+15EDE6:
// Vanilla: fadd st(0), st(0)
  nop // 0055EDE6
  nop // 0055EDE7

// Reference VA 0055EEFE..0055EF04.
// Double effect parameter +0xC6 only for movement-duration types 19, 50 and 51; preserve radius, size
// and count meanings for all other types.
assert(TOS.exe+15EEFE,66 89 87 C6 00 00 00)
TOS.exe+15EEFE:
// Vanilla: mov word ptr [edi + 0xc6], ax
  jmp near fps_field_effect_parameter // 0055EEFE
  nop // 0055EF03
  nop // 0055EF04

// Reference VA 0055EFB0..0055EFB1.
// Remove effect-spawn speed doubling. For type 31 this changes -4 to -2 and is paired with the radius-
// step correction at 0x493A4D; this is not hostile-NPC spawning.
assert(TOS.exe+15EFB0,DC C0)
TOS.exe+15EFB0:
// Vanilla: fadd st(0), st(0)
  nop // 0055EFB0
  nop // 0055EFB1

// ----------------------------------------------------------------------
// Reference payload 02EFF1F0..02EFF22F; retained code/data/padding.
fps_field_effects_code+0:
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

// ----------------------------------------------------------------------
// Reference payload 02EFF400..02EFF42F; retained code/data/padding.
fps_field_effects_code+40:
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

// ======================================================================
// Field particles
// Field particle integration, gravity, alpha, rotation, scale and lifetime.
// ======================================================================

// Guard the native callbacks and continuations used by this script.
assert(TOS.exe+DB299,8A 4E 64 8A C1)

// Reference VA 004DB137..004DB139.
// Use one alpha-rate contribution instead of twice the rate. This particle-array updater is distinct
// from field emotes.
assert(TOS.exe+DB137,8D 0C 41)
TOS.exe+DB137:
// Vanilla: lea ecx, [ecx + eax*2]
  db 8D,0C,01 // lea ecx, [ecx + eax] // 004DB137

// Reference VA 004DB13C..004DB13E.
// Subtract one instead of two from this particle alpha accumulator. This particle-array updater is
// distinct from field emotes.
assert(TOS.exe+DB13C,83 E9 02)
TOS.exe+DB13C:
// Vanilla: sub ecx, 2
  sub ecx, #1 // 004DB13C

// Reference VA 004DB151..004DB152.
// Remove the extra doubling of particle alpha rate. This particle-array updater is distinct from field
// emotes.
assert(TOS.exe+DB151,03 C0)
TOS.exe+DB151:
// Vanilla: add eax, eax
  nop // 004DB151
  nop // 004DB152

// Reference VA 004DB191..004DB194.
// Reduce particle alpha decay from 16 to 8 per update. This particle-array updater is distinct from
// field emotes.
assert(TOS.exe+DB191,66 83 E8 10)
TOS.exe+DB191:
// Vanilla: sub ax, 0x10
  sub ax, #8 // 004DB191

// Reference VA 004DB251..004DB262.
// Remove the second directional XYZ integration while explicitly popping its queued x87 values; keep
// stack balance. This particle-array updater is distinct from field emotes.
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
// Skip the second simple XYZ integration and retain the dead-code NOP cleanup. This particle-array
// updater is distinct from field emotes.
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
// Force the second downward gravity contribution to be skipped. This particle-array updater is distinct
// from field emotes.
assert(TOS.exe+DB2BA,84 C0)
TOS.exe+DB2BA:
// Vanilla: test al, al
  xor al, al // 004DB2BA

// Reference VA 004DB2D3..004DB2D4.
// Force the second upward gravity contribution to be skipped. This particle-array updater is distinct
// from field emotes.
assert(TOS.exe+DB2D3,84 C9)
TOS.exe+DB2D3:
// Vanilla: test cl, cl
  xor cl, cl // 004DB2D3

// Reference VA 004DB2FC..004DB316.
// Remove the second XYZ rotation-velocity integration. This particle-array updater is distinct from
// field emotes.
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
// Remove the second X-scale rate contribution. This particle-array updater is distinct from field
// emotes.
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
// Remove the second Y-scale rate contribution. This particle-array updater is distinct from field
// emotes.
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
// Advance the particle animation timer by one instead of two. This particle-array updater is distinct
// from field emotes.
assert(TOS.exe+DB36F,66 83 46 3E 02)
TOS.exe+DB36F:
// Vanilla: add word ptr [esi + 0x3e], 2
  add word ptr [esi + 0x3e], #1 // 004DB36F

// Reference VA 004DB3DB..004DB3DE.
// Remove the second particle-lifetime decrement. This particle-array updater is distinct from field
// emotes.
assert(TOS.exe+DB3DB,48 66 89 06)
TOS.exe+DB3DB:
// Vanilla: dec eax; mov word ptr [esi], ax
  nop // 004DB3DB
  nop // 004DB3DC
  nop // 004DB3DD
  nop // 004DB3DE

// ======================================================================
// Field emotes
// Cutscene emote animation, motion, lifetime and per-case constants.
// Case 1 is the scribbly-line emote. Its 07 mask at 004D1E94 advances once per eight frames; preserve
// the v0.0.46 value despite the saved IDB currently containing 03.
// Do not blanket-halve every emote: several rate constants were intentionally restored after earlier
// experiments.
// ======================================================================

alloc(fps_field_emotes_code,1000)

label(fps_emote_case5_counter)
label(fps_emote_constants)
label(fps_emote_lifetime)
label(fps_loc_02EFF109)

// Guard the native callbacks and continuations used by this script.
assert(TOS.exe+D2388,66 83 BB CE 09)
assert(TOS.exe+D2EEE,C7 03 00 00 00)
assert(TOS.exe+D2EF4,8B 4C 24 7C 5F)

// Reference VA 004D1BA9..004D1BAF.
// Advance the emote age/phase counter once instead of twice per update.
assert(TOS.exe+D1BA9,83 83 DC 09 00 00 02)
TOS.exe+D1BA9:
// Vanilla: add dword ptr [ebx + 0x9dc], 2
  add dword ptr [ebx + 0x9dc], #1 // 004D1BA9

// Reference VA 004D1E8E..004D1E94.
// Case 1 scribbly line: advance every eight global frames instead of four. Keep v46 mask 07 despite
// current IDB drift to 03.
assert(TOS.exe+D1E8E,F6 05 D8 C3 C3 01 03)
TOS.exe+D1E8E:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004D1E8E

// Reference VA 004D20C7..004D20CD.
// Case 3 anger vein: advance its two-frame pulse every eight global frames instead of four.
assert(TOS.exe+D20C7,F6 05 D8 C3 C3 01 03)
TOS.exe+D20C7:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004D20C7

// Reference VA 004D2381..004D2387.
// Case 5 counter helper increments every update; its historical parity branch remains NOPed.
assert(TOS.exe+D2381,66 FF 83 CE 09 00 00)
TOS.exe+D2381:
// Vanilla: inc word ptr [ebx + 0x9ce]
  jmp near fps_emote_case5_counter // 004D2381
  nop // 004D2386
  nop // 004D2387

// Reference VA 004D2683..004D2688.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D2683,DC 05 B8 29 88 00)
TOS.exe+D2683:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_emote_constants+20] // 004D2683

// Reference VA 004D2786..004D278B.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D2786,DC 05 18 2E 88 00)
TOS.exe+D2786:
// Vanilla: fadd qword ptr [0x882e18]
  fadd qword ptr [fps_emote_constants+18] // 004D2786

// Reference VA 004D27C0..004D27C5.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D27C0,DC 25 B8 29 88 00)
TOS.exe+D27C0:
// Vanilla: fsub qword ptr [0x8829b8]
  fsub qword ptr [fps_double_one] // 004D27C0

// Reference VA 004D29C7..004D29CC.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D29C7,DD 05 B8 29 88 00)
TOS.exe+D29C7:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_emote_constants+20] // 004D29C7

// Reference VA 004D2A0E..004D2A13.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D2A0E,DC 25 60 36 88 00)
TOS.exe+D2A0E:
// Vanilla: fsub qword ptr [0x883660]
  fsub qword ptr [fps_emote_constants+28] // 004D2A0E

// Reference VA 004D2AE9..004D2AEF.
// Case 0xC ZZZ/tired emote: advance every eight global frames instead of four.
assert(TOS.exe+D2AE9,F6 05 D8 C3 C3 01 03)
TOS.exe+D2AE9:
// Vanilla: test byte ptr [0x1c3c3d8], 3
  test byte ptr [TOS.exe+183C3D8], #7 // 004D2AE9

// Reference VA 004D2B6F..004D2B74.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D2B6F,DC 05 08 2C 88 00)
TOS.exe+D2B6F:
// Vanilla: fadd qword ptr [0x882c08]
  fadd qword ptr [fps_emote_constants] // 004D2B6F

// Reference VA 004D2BA8..004D2BAD.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D2BA8,DC 05 58 36 88 00)
TOS.exe+D2BA8:
// Vanilla: fadd qword ptr [0x883658]
  fadd qword ptr [fps_emote_constants+8] // 004D2BA8

// Reference VA 004D2E1F..004D2E24.
// Use the accepted private emote-rate constant. Current values preserve later restored per-update
// behavior; do not blanket-halve them using superseded notes.
assert(TOS.exe+D2E1F,DC 05 68 2E 88 00)
TOS.exe+D2E1F:
// Vanilla: fadd qword ptr [0x882e68]
  fadd qword ptr [fps_emote_constants+10] // 004D2E1F

// Reference VA 004D2EC7..004D2ECD.
// Remove the first of two lifetime-decrement blocks; the remaining helper handles one finite countdown
// step.
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
// Use the finite-lifetime helper for one countdown step. Its dead path must reach the preserved kill
// instruction at 0x4D2EEE.
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

// ----------------------------------------------------------------------
// Reference payload 02EFF0B8..02EFF12F; retained code/data/padding.
fps_field_emotes_code+8:
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

// ======================================================================
// Sorcerer ring
// Ring modes, transformation effects, emission and enemy stun timing.
// Several historical IDB names incorrectly call these battle effects. Keep each ring mode's movement,
// duration, phase thresholds and emissions together.
// ======================================================================

alloc(fps_sorcerer_ring_code,1000)

label(fps_loc_02EFF89B)
label(fps_loc_02EFF8B7)
label(fps_ring_constant_2eff850)
label(fps_ring_constant_2eff854)
label(fps_ring_constant_2eff858)
label(fps_ring_constant_2eff860)
label(fps_ring_constant_2eff880)
label(fps_ring_stub_2eff840)
label(fps_ring_stub_2eff868)
label(fps_ring_stub_2eff888)
label(fps_ring_stub_2eff8a4)
label(fps_ring_stub_2eff8c0)
label(fps_ring_stub_2eff8e0)
label(fps_ring_stub_2eff8e8)
label(fps_ring_stub_2eff8f0)
label(fps_ring_stub_2eff8f8)
label(fps_ring_transfer_speed_constants)

// Guard the native callbacks and continuations used by this script.
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

// Reference VA 0049F92C..0049F931.
// Ring transformation: use private half-speed coefficients 0.25 and 2.2 for transfer-effect motion,
// without editing shared native constants.
assert(TOS.exe+9F92C,DC 0D 50 29 88 00)
TOS.exe+9F92C:
// Vanilla: fmul qword ptr [0x882950]
  fmul qword ptr [fps_ring_transfer_speed_constants] // 0049F92C

// Reference VA 0049F938..0049F93D.
// Ring transformation: use private half-speed coefficients 0.25 and 2.2 for transfer-effect motion,
// without editing shared native constants.
assert(TOS.exe+9F938,DC 05 08 3B 88 00)
TOS.exe+9F938:
// Vanilla: fadd qword ptr [0x883b08]
  fadd qword ptr [fps_ring_transfer_speed_constants+8] // 0049F938

// Reference VA 0049FBC2..0049FBC4.
// Ring-transformation cleanup crossing test: change previous-step offset -2 to -1 to match the parent
// counter's one-step increment.
assert(TOS.exe+9FBC2,83 C0 FE)
TOS.exe+9FBC2:
// Vanilla: add eax, -2
  add eax, -#1 // 0049FBC2

// Reference VA 0049FCD1..0049FCD3.
// Advance the ring-transformation parent phase counter by one instead of two. Historical NPC encounter-
// lifetime labeling is inaccurate.
assert(TOS.exe+9FCD1,83 C0 02)
TOS.exe+9FCD1:
// Vanilla: add eax, 2
  add eax, #1 // 0049FCD1

// Reference VA 004A0046..004A004F.
// Default fireball active duration: 10 -> 20 updates. This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A0046,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A0046:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A0046

// Reference VA 004A0ADF..004A0AE4.
// Halve ring projectile displacement per update (-33.33333206176758 -> -16.66666603088379) This belongs
// to Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A0ADF,D9 05 BC 3E 88 00)
TOS.exe+A0ADF:
// Vanilla: fld dword ptr [0x883ebc]
  fld dword ptr [fps_ring_constant_2eff850] // 004A0ADF

// Reference VA 004A0AFA..004A0B03.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A0AFA,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A0AFA:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A0AFA

// Reference VA 004A0B65..004A0B6A.
// Spiral sample spacing fraction: 1/8 -> 1/4 (0.125 -> 0.25) This belongs to Sorcerer's Ring, regardless
// of historical IDA function naming.
assert(TOS.exe+A0B65,DD 05 C0 2A 88 00)
TOS.exe+A0B65:
// Vanilla: fld qword ptr [0x882ac0]
  fld qword ptr [TOS.exe+482AA8] // 004A0B65

// Reference VA 004A0D42..004A0D44.
// Spiral samples per update: 8 -> 4 This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A0D42,83 F8 08)
TOS.exe+A0D42:
// Vanilla: cmp eax, 8
  cmp eax, #4 // 004A0D42

// Reference VA 004A101F..004A1023.
// Mode 9: one trail group per half-sized movement step This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A101F,A1 D4 0C C3 01)
TOS.exe+A101F:
// Vanilla: mov eax, dword ptr [0x1c30cd4]
  jmp near TOS.exe+A1338 // 004A101F

// Reference VA 004A176F..004A1774.
// Halve ring projectile displacement per update (-45.0 -> -22.5) This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A176F,D9 05 B8 3E 88 00)
TOS.exe+A176F:
// Vanilla: fld dword ptr [0x883eb8]
  fld dword ptr [TOS.exe+483684] // 004A176F

// Reference VA 004A178C..004A1795.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A178C,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A178C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A178C

// Reference VA 004A183A..004A1843.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A183A,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A183A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A183A

// Reference VA 004A1A66..004A1A6A.
// Remove redundant midpoint particle group; discard its queued call arguments This belongs to Sorcerer's
// Ring, regardless of historical IDA function naming.
assert(TOS.exe+A1A66,E8 E5 C7 FF FF)
TOS.exe+A1A66:
// Vanilla: call 0x49e250
  jmp near fps_ring_stub_2eff8e0 // 004A1A66

// Reference VA 004A1CA9..004A1CAB.
// Preserve emission cadence: every 2 -> every 4 field updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A1CA9,83 E0 01)
TOS.exe+A1CA9:
// Vanilla: and eax, 1
  and eax, #3 // 004A1CA9

// Reference VA 004A1D39..004A1D3B.
// Preserve emission cadence: every 2 -> every 4 field updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A1D39,83 E0 01)
TOS.exe+A1D39:
// Vanilla: and eax, 1
  and eax, #3 // 004A1D39

// Reference VA 004A1F10..004A1F19.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A1F10,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A1F10:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A1F10

// Reference VA 004A1FE3..004A1FEC.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A1FE3,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A1FE3:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A1FE3

// Reference VA 004A202C..004A2035.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A202C,C7 83 B0 00 00 00 96 00 00 00)
TOS.exe+A202C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x96
  mov dword ptr [ebx + 0xb0], 0x12c // 004A202C

// Reference VA 004A2215..004A221E.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A2215,C7 86 B0 00 00 00 0F 00 00 00)
TOS.exe+A2215:
// Vanilla: mov dword ptr [esi + 0xb0], 0xf
  mov dword ptr [esi + 0xb0], 0x1e // 004A2215

// Reference VA 004A2295..004A229B.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A2295,83 BE B0 00 00 00 0F)
TOS.exe+A2295:
// Vanilla: cmp dword ptr [esi + 0xb0], 0xf
  cmp dword ptr [esi + 0xb0], 0x1e // 004A2295

// Reference VA 004A24CE..004A24D7.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A24CE,C7 83 B0 00 00 00 05 00 00 00)
TOS.exe+A24CE:
// Vanilla: mov dword ptr [ebx + 0xb0], 5
  mov dword ptr [ebx + 0xb0], 0xa // 004A24CE

// Reference VA 004A2600..004A2606.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A2600,83 BB B0 00 00 00 0F)
TOS.exe+A2600:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0xf
  cmp dword ptr [ebx + 0xb0], 0x1e // 004A2600

// Reference VA 004A2637..004A263C.
// Mode 10 opacity/scale change per update (12.0 -> 6.0) This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A2637,D8 05 FC F3 72 00)
TOS.exe+A2637:
// Vanilla: fadd dword ptr [0x72f3fc]
  fadd dword ptr [TOS.exe+30F790] // 004A2637

// Reference VA 004A2663..004A2668.
// Mode 10 opacity/scale change per update (0.2666666805744171 -> 0.13333334028720856) This belongs to
// Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A2663,DD 05 48 3E 88 00)
TOS.exe+A2663:
// Vanilla: fld qword ptr [0x883e48]
  fld qword ptr [TOS.exe+483E40] // 004A2663

// Reference VA 004A26B7..004A26BC.
// Mode 10 opacity/scale change per update (0.13333334028720856 -> 0.06666667014360428) This belongs to
// Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A26B7,DC 05 40 3E 88 00)
TOS.exe+A26B7:
// Vanilla: fadd qword ptr [0x883e40]
  fadd qword ptr [TOS.exe+482A18] // 004A26B7

// Reference VA 004A26DE..004A26E3.
// Mode 10 opacity/scale change per update (12.0 -> 6.0) This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A26DE,D8 25 FC F3 72 00)
TOS.exe+A26DE:
// Vanilla: fsub dword ptr [0x72f3fc]
  fsub dword ptr [TOS.exe+30F790] // 004A26DE

// Reference VA 004A26FC..004A2701.
// Mode 10 opacity/scale change per update (0.13333334028720856 -> 0.06666667014360428) This belongs to
// Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A26FC,DD 05 40 3E 88 00)
TOS.exe+A26FC:
// Vanilla: fld qword ptr [0x883e40]
  fld qword ptr [TOS.exe+482A18] // 004A26FC

// Reference VA 004A2AA2..004A2AA8.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A2AA2,83 BB F0 09 00 00 78)
TOS.exe+A2AA2:
// Vanilla: cmp dword ptr [ebx + 0x9f0], 0x78
  jmp near fps_ring_stub_2eff840 // 004A2AA2
  nop // 004A2AA7
  nop // 004A2AA8

// Reference VA 004A2C42..004A2C4B.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A2C42,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A2C42:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A2C42

// Reference VA 004A2D35..004A2D37.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A2D35,83 FA 1E)
TOS.exe+A2D35:
// Vanilla: cmp edx, 0x1e
  cmp edx, 0x3c // 004A2D35

// Reference VA 004A2D3E..004A2D44.
// Mode 19 opacity rise: 16 -> 8 This belongs to Sorcerer's Ring, regardless of historical IDA function
// naming.
assert(TOS.exe+A2D3E,83 83 DC 09 00 00 10)
TOS.exe+A2D3E:
// Vanilla: add dword ptr [ebx + 0x9dc], 0x10
  add dword ptr [ebx + 0x9dc], #8 // 004A2D3E

// Reference VA 004A2D60..004A2D65.
// Mode 19 vertical rise per update (1.3333333730697632 -> 0.6666666865348816) This belongs to Sorcerer's
// Ring, regardless of historical IDA function naming.
assert(TOS.exe+A2D60,DC 05 30 3E 88 00)
TOS.exe+A2D60:
// Vanilla: fadd qword ptr [0x883e30]
  fadd qword ptr [fps_ring_constant_2eff858] // 004A2D60

// Reference VA 004A2D8F..004A2D91.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A2D8F,83 FA 1F)
TOS.exe+A2D8F:
// Vanilla: cmp edx, 0x1f
  cmp edx, 0x3d // 004A2D8F

// Reference VA 004A2DF4..004A2DF6.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A2DF4,83 F8 1D)
TOS.exe+A2DF4:
// Vanilla: cmp eax, 0x1d
  cmp eax, 0x3b // 004A2DF4

// Reference VA 004A2E03..004A2E05.
// Mode 19 opacity fall: 8 -> 4 This belongs to Sorcerer's Ring, regardless of historical IDA function
// naming.
assert(TOS.exe+A2E03,83 E8 08)
TOS.exe+A2E03:
// Vanilla: sub eax, 8
  sub eax, #4 // 004A2E03

// Reference VA 004A2E16..004A2E1B.
// Mode 19 vertical fall per update (1.5254237651824951 -> 0.7627118825912476) This belongs to Sorcerer's
// Ring, regardless of historical IDA function naming.
assert(TOS.exe+A2E16,DC 25 28 3E 88 00)
TOS.exe+A2E16:
// Vanilla: fsub qword ptr [0x883e28]
  fsub qword ptr [fps_ring_constant_2eff860] // 004A2E16

// Reference VA 004A2E43..004A2E49.
// Mode 19 oscillation phase: frame * 4 -> frame * 2 This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A2E43,8D 04 95 00 00 00 00)
TOS.exe+A2E43:
// Vanilla: lea eax, [edx*4]
  lea eax, [edx*#2] // 004A2E43

// Reference VA 004A2E79..004A2E7E.
// Mode 19 accumulated bobbing increment at 60 FPS This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A2E79,D8 83 84 00 00 00)
TOS.exe+A2E79:
// Vanilla: fadd dword ptr [ebx + 0x84]
  jmp near fps_ring_stub_2eff868 // 004A2E79
  nop // 004A2E7E

// Reference VA 004A2EAA..004A2EB0.
// Mode 19 oscillation phase: frame * 4 -> frame * 2 This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A2EAA,8D 14 8D 00 00 00 00)
TOS.exe+A2EAA:
// Vanilla: lea edx, [ecx*4]
  lea edx, [ecx*#2] // 004A2EAA

// Reference VA 004A307F..004A3088.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A307F,C7 86 B0 00 00 00 0A 00 00 00)
TOS.exe+A307F:
// Vanilla: mov dword ptr [esi + 0xb0], 0xa
  mov dword ptr [esi + 0xb0], 0x14 // 004A307F

// Reference VA 004A3125..004A3126.
// Mode 15 doubled timer: halve height coefficient This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A3125,03 D2)
TOS.exe+A3125:
// Vanilla: add edx, edx
  nop // 004A3125
  nop // 004A3126

// Reference VA 004A3160..004A3161.
// Mode 15 doubled timer: halve opacity coefficient This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A3160,03 D2)
TOS.exe+A3160:
// Vanilla: add edx, edx
  nop // 004A3160
  nop // 004A3161

// Reference VA 004A3177..004A317B.
// Mode 15: one emission per update, preserving x87 zero and stack balance This belongs to Sorcerer's
// Ring, regardless of historical IDA function naming.
assert(TOS.exe+A3177,E8 D4 B0 FF FF)
TOS.exe+A3177:
// Vanilla: call 0x49e250
  jmp near fps_ring_stub_2eff8f8 // 004A3177

// Reference VA 004A3217..004A3220.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A3217,C7 86 B0 00 00 00 3C 00 00 00)
TOS.exe+A3217:
// Vanilla: mov dword ptr [esi + 0xb0], 0x3c
  mov dword ptr [esi + 0xb0], 0x78 // 004A3217

// Reference VA 004A324F..004A3255.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A324F,83 BE B0 00 00 00 3C)
TOS.exe+A324F:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x3c
  cmp dword ptr [esi + 0xb0], 0x78 // 004A324F

// Reference VA 004A32E1..004A32E6.
// Mode 15 timer-derived shake divisor (10.0 -> 20.0) This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A32E1,DC 35 C0 2D 88 00)
TOS.exe+A32E1:
// Vanilla: fdiv qword ptr [0x882dc0]
  fdiv qword ptr [TOS.exe+4829A8] // 004A32E1

// Reference VA 004A3328..004A332E.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A3328,83 BE B0 00 00 00 14)
TOS.exe+A3328:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x14
  cmp dword ptr [esi + 0xb0], 0x28 // 004A3328

// Reference VA 004A342F..004A3434.
// Halve ring projectile displacement per update (-20.0 -> -10.0) This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A342F,D9 05 2C 2D 88 00)
TOS.exe+A342F:
// Vanilla: fld dword ptr [0x882d2c]
  fld dword ptr [TOS.exe+483220] // 004A342F

// Reference VA 004A344A..004A3453.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A344A,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A344A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A344A

// Reference VA 004A34D7..004A34DC.
// Spiral sample spacing fraction: 1/8 -> 1/4 (0.125 -> 0.25) This belongs to Sorcerer's Ring, regardless
// of historical IDA function naming.
assert(TOS.exe+A34D7,DD 05 C0 2A 88 00)
TOS.exe+A34D7:
// Vanilla: fld qword ptr [0x882ac0]
  fld qword ptr [TOS.exe+482AA8] // 004A34D7

// Reference VA 004A36AF..004A36B1.
// Spiral samples per update: 8 -> 4 This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A36AF,83 F8 08)
TOS.exe+A36AF:
// Vanilla: cmp eax, 8
  cmp eax, #4 // 004A36AF

// Reference VA 004A39E6..004A39EA.
// Mode 14: remove midpoint group and preserve x87 zero This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A39E6,A1 D4 0C C3 01)
TOS.exe+A39E6:
// Vanilla: mov eax, dword ptr [0x1c30cd4]
  jmp near fps_ring_stub_2eff8f0 // 004A39E6

// Reference VA 004A41D5..004A41DE.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A41D5,C7 86 B0 00 00 00 2C 01 00 00)
TOS.exe+A41D5:
// Vanilla: mov dword ptr [esi + 0xb0], 0x12c
  mov dword ptr [esi + 0xb0], 0x258 // 004A41D5

// Reference VA 004A4246..004A424C.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A4246,83 BE B0 00 00 00 07)
TOS.exe+A4246:
// Vanilla: cmp dword ptr [esi + 0xb0], 7
  cmp dword ptr [esi + 0xb0], 0xe // 004A4246

// Reference VA 004A4260..004A4269.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A4260,C7 86 B0 00 00 00 07 00 00 00)
TOS.exe+A4260:
// Vanilla: mov dword ptr [esi + 0xb0], 7
  mov dword ptr [esi + 0xb0], 0xe // 004A4260

// Reference VA 004A4270..004A4274.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A4270,3D 1D 01 00 00)
TOS.exe+A4270:
// Vanilla: cmp eax, 0x11d
  cmp eax, 0x239 // 004A4270

// Reference VA 004A427D..004A4282.
// Mode 6 entry radius ramp per update (653.3333129882812 -> 326.6666564941406) This belongs to
// Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A427D,DC 25 A0 36 88 00)
TOS.exe+A427D:
// Vanilla: fsub qword ptr [0x8836a0]
  fsub qword ptr [fps_ring_constant_2eff880] // 004A427D

// Reference VA 004A4285..004A4287.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A4285,83 F8 0F)
TOS.exe+A4285:
// Vanilla: cmp eax, 0xf
  cmp eax, 0x1d // 004A4285

// Reference VA 004A4290..004A4295.
// Mode 6 exit radius ramp per update (653.3333129882812 -> 326.6666564941406) This belongs to Sorcerer's
// Ring, regardless of historical IDA function naming.
assert(TOS.exe+A4290,DC 05 A0 36 88 00)
TOS.exe+A4290:
// Vanilla: fadd qword ptr [0x8836a0]
  fadd qword ptr [fps_ring_constant_2eff880] // 004A4290

// Reference VA 004A42CE..004A42D7.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A42CE,81 BE B0 00 00 00 2C 01 00 00)
TOS.exe+A42CE:
// Vanilla: cmp dword ptr [esi + 0xb0], 0x12c
  cmp dword ptr [esi + 0xb0], 0x258 // 004A42CE

// Reference VA 004A432B..004A4331.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A432B,83 BE B0 00 00 00 07)
TOS.exe+A432B:
// Vanilla: cmp dword ptr [esi + 0xb0], 7
  cmp dword ptr [esi + 0xb0], 0xe // 004A432B

// Reference VA 004A461F..004A4628.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A461F,C7 83 B0 00 00 00 5A 00 00 00)
TOS.exe+A461F:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x5a
  mov dword ptr [ebx + 0xb0], 0xb4 // 004A461F

// Reference VA 004A483E..004A4847.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A483E,C7 83 B0 00 00 00 1E 00 00 00)
TOS.exe+A483E:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x1e
  mov dword ptr [ebx + 0xb0], 0x3c // 004A483E

// Reference VA 004A485B..004A4861.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A485B,83 BB B0 00 00 00 1E)
TOS.exe+A485B:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0x1e
  cmp dword ptr [ebx + 0xb0], 0x3c // 004A485B

// Reference VA 004A4A7C..004A4A82.
// Mode 12: preserve burst-phase threshold and continuous emission rate This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A4A7C,83 BB B0 00 00 00 14)
TOS.exe+A4A7C:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0x14
  jmp near fps_ring_stub_2eff8c0 // 004A4A7C
  nop // 004A4A81
  nop // 004A4A82

// Reference VA 004A4BA8..004A4BAD.
// Mode 12 timer-derived shake amplitude (0.25 -> 0.125) This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A4BA8,DC 0D A8 2A 88 00)
TOS.exe+A4BA8:
// Vanilla: fmul qword ptr [0x882aa8]
  fmul qword ptr [TOS.exe+3A3630] // 004A4BA8

// Reference VA 004A4C4A..004A4C50.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A4C4A,83 BB B0 00 00 00 1D)
TOS.exe+A4C4A:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0x1d
  cmp dword ptr [ebx + 0xb0], 0x3a // 004A4C4A

// Reference VA 004A4E4F..004A4E54.
// Retain tested water speed: -30 -> -15 This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A4E4F,D9 05 B8 38 88 00)
TOS.exe+A4E4F:
// Vanilla: fld dword ptr [0x8838b8]
  fld dword ptr [TOS.exe+4840A8] // 004A4E4F

// Reference VA 004A4E6A..004A4E73.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A4E6A,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A4E6A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A4E6A

// Reference VA 004A51BF..004A51C3.
// Water: one trail group per half-sized movement step This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A51BF,A1 D4 0C C3 01)
TOS.exe+A51BF:
// Vanilla: mov eax, dword ptr [0x1c30cd4]
  jmp near TOS.exe+A54D4 // 004A51BF

// Reference VA 004A5900..004A5905.
// Halve ring projectile displacement per update (-5.0 -> -2.5) This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A5900,D9 05 80 35 88 00)
TOS.exe+A5900:
// Vanilla: fld dword ptr [0x883580]
  fld dword ptr [TOS.exe+483288] // 004A5900

// Reference VA 004A591B..004A5924.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A591B,C7 83 B0 00 00 00 1E 00 00 00)
TOS.exe+A591B:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x1e
  mov dword ptr [ebx + 0xb0], 0x3c // 004A591B

// Reference VA 004A59A5..004A59B1.
// Modes 4/16 visual age: one increment per two movement updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A59A5,FF 83 F0 09 00 00 F6 05 D8 C3 C3 01 01)
TOS.exe+A59A5:
// Vanilla: inc dword ptr [ebx + 0x9f0]; test byte ptr [0x1c3c3d8], 1
  jmp near fps_ring_stub_2eff888 // 004A59A5
  nop // 004A59AA
  test byte ptr [TOS.exe+183C3D8], #3 // 004A59AB

// Reference VA 004A609F..004A60A4.
// Halve ring projectile displacement per update (-13.333333015441895 -> -6.666666507720947) This belongs
// to Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A609F,D9 05 B4 38 88 00)
TOS.exe+A609F:
// Vanilla: fld dword ptr [0x8838b4]
  fld dword ptr [fps_ring_constant_2eff854] // 004A609F

// Reference VA 004A60BA..004A60C3.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A60BA,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A60BA:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A60BA

// Reference VA 004A613A..004A6140.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A613A,83 BB B0 00 00 00 0C)
TOS.exe+A613A:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0xc
  cmp dword ptr [ebx + 0xb0], 0x18 // 004A613A

// Reference VA 004A6209..004A620F.
// Preserve emission cadence: every 2 -> every 4 field updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A6209,F6 05 D8 C3 C3 01 01)
TOS.exe+A6209:
// Vanilla: test byte ptr [0x1c3c3d8], 1
  test byte ptr [TOS.exe+183C3D8], #3 // 004A6209

// Reference VA 004A6356..004A635C.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A6356,83 BB B0 00 00 00 0C)
TOS.exe+A6356:
// Vanilla: cmp dword ptr [ebx + 0xb0], 0xc
  cmp dword ptr [ebx + 0xb0], 0x18 // 004A6356

// Reference VA 004A6475..004A647B.
// Preserve emission cadence: every 2 -> every 4 field updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A6475,F6 05 D8 C3 C3 01 01)
TOS.exe+A6475:
// Vanilla: test byte ptr [0x1c3c3d8], 1
  test byte ptr [TOS.exe+183C3D8], #3 // 004A6475

// Reference VA 004A664E..004A6653.
// Mode 8 vertical recoil random divisor (24.0 -> 48.0) This belongs to Sorcerer's Ring, regardless of
// historical IDA function naming.
assert(TOS.exe+A664E,DC 35 18 37 88 00)
TOS.exe+A664E:
// Vanilla: fdiv qword ptr [0x883718]
  fdiv qword ptr [TOS.exe+482A30] // 004A664E

// Reference VA 004A665E..004A6663.
// Mode 8 fixed vertical recoil per update (0.800000011920929 -> 0.4000000059604645) This belongs to
// Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A665E,DC 25 28 2B 88 00)
TOS.exe+A665E:
// Vanilla: fsub qword ptr [0x882b28]
  fsub qword ptr [TOS.exe+483660] // 004A665E

// Reference VA 004A6940..004A6945.
// Halve ring projectile displacement per update (-10.0 -> -5.0) This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A6940,D9 05 20 32 88 00)
TOS.exe+A6940:
// Vanilla: fld dword ptr [0x883220]
  fld dword ptr [TOS.exe+30F7A4] // 004A6940

// Reference VA 004A695B..004A6964.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A695B,C7 83 B0 00 00 00 1E 00 00 00)
TOS.exe+A695B:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x1e
  mov dword ptr [ebx + 0xb0], 0x3c // 004A695B

// Reference VA 004A69E5..004A69F1.
// Modes 4/16 visual age: one increment per two movement updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A69E5,FF 83 F0 09 00 00 F6 05 D8 C3 C3 01 01)
TOS.exe+A69E5:
// Vanilla: inc dword ptr [ebx + 0x9f0]; test byte ptr [0x1c3c3d8], 1
  jmp near fps_ring_stub_2eff8a4 // 004A69E5
  nop // 004A69EA
  test byte ptr [TOS.exe+183C3D8], #3 // 004A69EB

// Reference VA 004A6D6A..004A6D70.
// Mode 16 terminal puff: alpha step -16 -> -34 to fade with the trail; lifetime 180 preserved This
// belongs to Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A6D6A,C7 46 60 F0 0F F0 FF)
TOS.exe+A6D6A:
// Vanilla: mov dword ptr [esi + 0x60], 0xfff00ff0
  mov dword ptr [esi + 0x60], 0xffde0ff0 // 004A6D6A

// Reference VA 004A6E90..004A6E95.
// Halve ring projectile displacement per update (-26.66666603088379 -> -13.333333015441895) This belongs
// to Sorcerer's Ring, regardless of historical IDA function naming.
assert(TOS.exe+A6E90,D9 05 AC 3E 88 00)
TOS.exe+A6E90:
// Vanilla: fld dword ptr [0x883eac]
  fld dword ptr [TOS.exe+4838B4] // 004A6E90

// Reference VA 004A6EAB..004A6EB4.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A6EAB,C7 83 B0 00 00 00 0F 00 00 00)
TOS.exe+A6EAB:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xf
  mov dword ptr [ebx + 0xb0], 0x1e // 004A6EAB

// Reference VA 004A735F..004A7364.
// Halve ring projectile displacement per update (-30.0 -> -15.0) This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A735F,D9 05 B8 38 88 00)
TOS.exe+A735F:
// Vanilla: fld dword ptr [0x8838b8]
  fld dword ptr [TOS.exe+4840A8] // 004A735F

// Reference VA 004A737C..004A7385.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A737C,C7 83 B0 00 00 00 0A 00 00 00)
TOS.exe+A737C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0xa
  mov dword ptr [ebx + 0xb0], 0x14 // 004A737C

// Reference VA 004A742A..004A7433.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A742A,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A742A:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A742A

// Reference VA 004A7656..004A765A.
// Remove redundant midpoint particle group; discard its queued call arguments This belongs to Sorcerer's
// Ring, regardless of historical IDA function naming.
assert(TOS.exe+A7656,E8 F5 6B FF FF)
TOS.exe+A7656:
// Vanilla: call 0x49e250
  jmp near fps_ring_stub_2eff8e8 // 004A7656

// Reference VA 004A7899..004A789B.
// Preserve emission cadence: every 2 -> every 4 field updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A7899,83 E0 01)
TOS.exe+A7899:
// Vanilla: and eax, 1
  and eax, #3 // 004A7899

// Reference VA 004A7929..004A792B.
// Preserve emission cadence: every 2 -> every 4 field updates This belongs to Sorcerer's Ring,
// regardless of historical IDA function naming.
assert(TOS.exe+A7929,83 E0 01)
TOS.exe+A7929:
// Vanilla: and eax, 1
  and eax, #3 // 004A7929

// Reference VA 004A7B00..004A7B09.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A7B00,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A7B00:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A7B00

// Reference VA 004A7BD3..004A7BDC.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A7BD3,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A7BD3:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A7BD3

// Reference VA 004A7C1C..004A7C25.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A7C1C,C7 83 B0 00 00 00 3C 00 00 00)
TOS.exe+A7C1C:
// Vanilla: mov dword ptr [ebx + 0xb0], 0x3c
  mov dword ptr [ebx + 0xb0], 0x78 // 004A7C1C

// Reference VA 004A7E0B..004A7E14.
// Double ring active-phase duration This belongs to Sorcerer's Ring, regardless of historical IDA
// function naming.
assert(TOS.exe+A7E0B,C7 86 B0 00 00 00 0F 00 00 00)
TOS.exe+A7E0B:
// Vanilla: mov dword ptr [esi + 0xb0], 0xf
  mov dword ptr [esi + 0xb0], 0x1e // 004A7E0B

// Reference VA 004A7E75..004A7E7B.
// Match event/phase threshold to doubled timer This belongs to Sorcerer's Ring, regardless of historical
// IDA function naming.
assert(TOS.exe+A7E75,83 BE B0 00 00 00 0F)
TOS.exe+A7E75:
// Vanilla: cmp dword ptr [esi + 0xb0], 0xf
  cmp dword ptr [esi + 0xb0], 0x1e // 004A7E75

// Reference VA 004CBEBC..004CBEC5.
// Mode 10 held-input refresh: retain activation for 32 updates instead of 16, matching its doubled ring
// timing.
assert(TOS.exe+CBEBC,C7 80 B0 00 00 00 10 00 00 00)
TOS.exe+CBEBC:
// Vanilla: mov dword ptr [eax + 0xb0], 0x10
  mov dword ptr [eax + 0xb0], 0x20 // 004CBEBC

// Reference VA 004D6352..004D6352.
// Ring stun on hostile field NPCs: remove the second countdown decrement of word[esi+0x18] so stun
// duration survives the doubled update frequency.
assert(TOS.exe+D6352,48)
TOS.exe+D6352:
// Vanilla: dec eax
  nop // 004D6352

// Reference VA 00883EC0..00883EC3.
// Default fire-ring projectile displacement constant: halve -33 to -16.5 for each 60 FPS update.
assert(TOS.exe+483EC0,00 00 04 C2)
TOS.exe+483EC0:
  db 00,00,84,C1

// ----------------------------------------------------------------------
// Reference payload 02EFF780..02EFF7FF; retained code/data/padding.
fps_sorcerer_ring_code+0:
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

// ----------------------------------------------------------------------
// Reference payload 02EFF840..02EFF91F; retained code/data/padding.
fps_sorcerer_ring_code+80:
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

[DISABLE]
// Restoration evidence only; settings take effect on a fresh launch.

// Field effects
TOS.exe+9215A:
  db DC,05,B8,29,88,00
TOS.exe+93A4D:
  db 66,83,83,C6,00,00,00,F8
TOS.exe+9CC61:
  db D9,46,04,D8,46,28,D9,5E,04,D9,46,08,D8,46,2C,D9,5E,08,D9,46,0C,D8,46,30,D9,5E,0C
TOS.exe+9D8FB:
  db 29,13
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
TOS.exe+D0F24:
  db DD,05,B8,29,88,00
TOS.exe+D8EF2:
  db DC,05,B8,29,88,00
TOS.exe+DBA26:
  db DC,05,F0,2C,88,00
TOS.exe+DBA48:
  db 83,C1,02
TOS.exe+DBA5C:
  db DC,25,60,2C,88,00
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
dealloc(fps_field_effects_code)

// Field particles
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

// Field emotes
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
dealloc(fps_field_emotes_code)

// Sorcerer ring
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
TOS.exe+CBEBC:
  db C7,80,B0,00,00,00,10,00,00,00
TOS.exe+D6352:
  db 48
TOS.exe+483EC0:
  db 00,00,04,C2
dealloc(fps_sorcerer_ring_code)
