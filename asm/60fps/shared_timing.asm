// Frame pacing, global counters, shared constants, general input and engine animation.
// Tales of Symphonia 60FPS v0.0.46; controlled by [60FPS] Enabled=1.
// Fresh launch required. Reference VAs identify source bytes, not runtime allocations.
// Bare ASM numbers are hexadecimal; # introduces decimal.
// Sections:
//   Shared constants
//   Frame timing
//   Input timing
//   Animation timing

[ENABLE]

// ======================================================================
// Shared constants
// Shared immutable 1.0, -1.0 and 0.5 timing constants.
// ======================================================================

alloc(fps_shared_constants_data,1000)

label(fps_double_negative_one)
label(fps_double_one)
label(fps_float_half)
registersymbol(fps_double_negative_one)
registersymbol(fps_double_one)
registersymbol(fps_float_half)

// ----------------------------------------------------------------------
// Reference payload 007021F0..007021FF; retained code/data/padding.
fps_shared_constants_data+0:
// Private 1.0 double used by corrected frame/timer increments.
fps_double_one:
  db 00,00,00,00,00,00,F0,3F // 007021F0: constants / retained padding

// Private -1.0 double used by corrected timer decrements.
fps_double_negative_one:
  db 00,00,00,00,00,00,F0,BF // 007021F8: constants / retained padding

// ----------------------------------------------------------------------
// Reference payload 02EFF040..02EFF04E; retained code/data/padding.
fps_shared_constants_data+10:
// Private float 0.5 for half-sized motion and animation steps.
fps_float_half:
  db 00,00,00,3F,00,00,00,00,00,00,00,00,00,00,00 // 02EFF040: constants / retained padding

// ======================================================================
// Frame timing
// Main update counter, frame-rate setter and presentation timing.
// ======================================================================

// Reference VA 004C3915..004C391B.
// Advance the global game tick by one instead of two per 60 FPS update.
assert(TOS.exe+C3915,83 05 C8 C3 C3 01 02)
TOS.exe+C3915:
// Vanilla: add dword ptr [0x1c3c3c8], 2
  add dword ptr [TOS.exe+183C3C8], #1 // 004C3915

// Reference VA 005C9449..005C944F.
// Allow the present wait path to use divisor 1, matching the forced 60 FPS frame-rate setter.
assert(TOS.exe+1C9449,83 3D C4 90 8A 00 02)
TOS.exe+1C9449:
// Vanilla: cmp dword ptr [0x8a90c4], 2
  cmp dword ptr [TOS.exe+4A90C4], #1 // 005C9449

// Reference VA 005CF400..005CF40C.
// Force presentation divisor 1 regardless of the requested value; preserve the return value and calling
// convention.
assert(TOS.exe+1CF400,55 8B EC 8B 45 08 A3 C4 90 8A 00 5D C3)
TOS.exe+1CF400:
// Vanilla: push ebp; mov ebp, esp; mov eax, dword ptr [ebp + 8]; mov dword ptr [0x8a90c4], eax; pop ebp; ret
  mov eax, #1 // 005CF400
  mov dword ptr [TOS.exe+4A90C4], eax // 005CF405
  ret // 005CF40A
  int3 // 005CF40B
  int3 // 005CF40C

// ======================================================================
// Input timing
// Menu repeat, directional input and button debounce timing.
// ======================================================================

alloc(fps_input_timing_code,1000)

label(fps_input_repeat_buttons)
label(fps_input_repeat_directions)

// Guard the native callbacks and continuations used by this script.
assert(TOS.exe+137EA6,09 88 D8 1A C3)
assert(TOS.exe+137EF2,09 90 18 1D C3)

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

// Reference VA 0057E6A7..0057E6A8.
assert(TOS.exe+17E6A7,B3 0F)
TOS.exe+17E6A7:
// Vanilla: mov bl, 0xf
  mov bl, 0x1e // 0057E6A7

// Reference VA 0057E6F2..0057E6F4.
assert(TOS.exe+17E6F2,F6 C2 01)
TOS.exe+17E6F2:
// Vanilla: test dl, 1
  test dl, #3 // 0057E6F2

// Reference VA 0057E746..0057E748.
assert(TOS.exe+17E746,F6 C2 01)
TOS.exe+17E746:
// Vanilla: test dl, 1
  test dl, #3 // 0057E746

// Reference VA 0057E79A..0057E79C.
assert(TOS.exe+17E79A,F6 C2 01)
TOS.exe+17E79A:
// Vanilla: test dl, 1
  test dl, #3 // 0057E79A

// Reference VA 0057E7EE..0057E7F0.
assert(TOS.exe+17E7EE,F6 C2 01)
TOS.exe+17E7EE:
// Vanilla: test dl, 1
  test dl, #3 // 0057E7EE

// Reference VA 0057E83C..0057E83E.
assert(TOS.exe+17E83C,F6 C2 01)
TOS.exe+17E83C:
// Vanilla: test dl, 1
  test dl, #3 // 0057E83C

// Reference VA 0057E884..0057E886.
assert(TOS.exe+17E884,F6 C2 01)
TOS.exe+17E884:
// Vanilla: test dl, 1
  test dl, #3 // 0057E884

// Reference VA 0057E8CC..0057E8CE.
assert(TOS.exe+17E8CC,F6 C2 01)
TOS.exe+17E8CC:
// Vanilla: test dl, 1
  test dl, #3 // 0057E8CC

// Reference VA 0057E914..0057E916.
assert(TOS.exe+17E914,F6 C2 01)
TOS.exe+17E914:
// Vanilla: test dl, 1
  test dl, #3 // 0057E914

// Reference VA 0057E962..0057E964.
assert(TOS.exe+17E962,F6 C2 01)
TOS.exe+17E962:
// Vanilla: test dl, 1
  test dl, #3 // 0057E962

// Reference VA 0057E9B6..0057E9B8.
assert(TOS.exe+17E9B6,F6 C2 01)
TOS.exe+17E9B6:
// Vanilla: test dl, 1
  test dl, #3 // 0057E9B6

// Reference VA 0057EA0A..0057EA0C.
assert(TOS.exe+17EA0A,F6 C2 01)
TOS.exe+17EA0A:
// Vanilla: test dl, 1
  test dl, #3 // 0057EA0A

// Reference VA 0057EA5E..0057EA60.
assert(TOS.exe+17EA5E,F6 C2 01)
TOS.exe+17EA5E:
// Vanilla: test dl, 1
  test dl, #3 // 0057EA5E

// Reference VA 0057EAB2..0057EAB4.
assert(TOS.exe+17EAB2,F6 C2 01)
TOS.exe+17EAB2:
// Vanilla: test dl, 1
  test dl, #3 // 0057EAB2

// Reference VA 0057EB06..0057EB08.
assert(TOS.exe+17EB06,F6 C2 01)
TOS.exe+17EB06:
// Vanilla: test dl, 1
  test dl, #3 // 0057EB06

// Reference VA 0057EB5A..0057EB5C.
assert(TOS.exe+17EB5A,F6 C2 01)
TOS.exe+17EB5A:
// Vanilla: test dl, 1
  test dl, #3 // 0057EB5A

// Reference VA 0057EBAE..0057EBB0.
assert(TOS.exe+17EBAE,F6 C2 01)
TOS.exe+17EBAE:
// Vanilla: test dl, 1
  test dl, #3 // 0057EBAE

// Reference VA 0057EC02..0057EC04.
assert(TOS.exe+17EC02,F6 C2 01)
TOS.exe+17EC02:
// Vanilla: test dl, 1
  test dl, #3 // 0057EC02

// Reference VA 0057EC56..0057EC58.
assert(TOS.exe+17EC56,F6 C2 01)
TOS.exe+17EC56:
// Vanilla: test dl, 1
  test dl, #3 // 0057EC56

// ----------------------------------------------------------------------
// Reference payload 02EFF000..02EFF020; retained code/data/padding.
fps_input_timing_code+0:
// Reload direction/stick repeat countdown; current v46 value is 4 following later GC UI timing revision.
fps_input_repeat_directions:
  mov dword ptr [edx*#4 + TOS.exe+1831A50], #4 // 02EFF000
  jmp near TOS.exe+137EA6 // 02EFF00B

// Reload button repeat countdown; current v46 value is 4 following later GC UI timing revision.
fps_input_repeat_buttons:
  mov dword ptr [ecx*#4 + TOS.exe+1831C90], #4 // 02EFF010
  jmp near TOS.exe+137EF2 // 02EFF01B
  db 00 // 02EFF020: constants / retained padding

// ======================================================================
// Animation timing
// Shared animation looping, interrupted blends and bone/platform interpolation.
// ======================================================================

alloc(fps_animation_timing_code,1000)

label(fps_animation_loop_wrap)
label(fps_elevator_bone_interpolation)

// Guard the native callbacks and continuations used by this script.
assert(TOS.exe+17B7B8,D9 EE D8 16 DF)
assert(TOS.exe+17B9E6,D9 47 10 DE D9)
assert(TOS.exe+18B6A7,85 D2 78 9D 8B)

// Reference VA 0057B7A0..0057B7B7.
// Apply half XYZ displacement during bone-target interpolation, preserving elevator/platform carry
// timing.
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
// Use the private 1.0 constant for animation playback advancement.
assert(TOS.exe+17B957,DD 05 B8 29 88 00)
TOS.exe+17B957:
// Vanilla: fld qword ptr [0x8829b8]
  fld qword ptr [fps_double_one] // 0057B957

// Reference VA 0057B9C8..0057B9E5.
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
// Add the private 1.0 constant when advancing this animation/blend clock.
assert(TOS.exe+17BA4B,DC 05 B8 29 88 00)
TOS.exe+17BA4B:
// Vanilla: fadd qword ptr [0x8829b8]
  fadd qword ptr [fps_double_one] // 0057BA4B

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

// ----------------------------------------------------------------------
// Reference payload 02EFF021..02EFF03F; retained code/data/padding.
fps_animation_timing_code+1:
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

// ----------------------------------------------------------------------
// Reference payload 02EFF130..02EFF169; retained code/data/padding.
fps_animation_timing_code+20:
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

[DISABLE]
// Restoration evidence only; settings take effect on a fresh launch.

// Shared constants
unregistersymbol(fps_double_negative_one)
unregistersymbol(fps_double_one)
unregistersymbol(fps_float_half)
dealloc(fps_shared_constants_data)

// Frame timing
TOS.exe+C3915:
  db 83,05,C8,C3,C3,01,02
TOS.exe+1C9449:
  db 83,3D,C4,90,8A,00,02
TOS.exe+1CF400:
  db 55,8B,EC,8B,45,08,A3,C4,90,8A,00,5D,C3

// Input timing
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
dealloc(fps_input_timing_code)

// Animation timing
TOS.exe+17B7A0:
  db D9,01,D8,06,D9,19,D9,41,04,D8,46,04,D9,59,04,D9,41,08,D8,46,08,D9,59,08
TOS.exe+17B957:
  db DD,05,B8,29,88,00
TOS.exe+17B9C8:
  db D8,4F,14,D9,47,08,D8,67,10,D9,5C,24,10,D9,44,24,10,D8,C1,D9,5C,24,10,D9,44,24,10,D9,57,08
TOS.exe+17BA4B:
  db DC,05,B8,29,88,00
TOS.exe+18B625:
  db 8B,4D,08,33,D2,83,C1,0C,B3,80,8B,01,85,C0,74,0A,83,38,00,74,05,84,58,20,75,68,42,83,C1,38,83,FA,04,7C,E7
dealloc(fps_animation_timing_code)
