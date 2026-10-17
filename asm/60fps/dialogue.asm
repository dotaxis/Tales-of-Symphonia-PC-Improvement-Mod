// Dialogue timing, continue arrows, borders, speech tails, corners and name masking.
// Tales of Symphonia 60FPS v0.0.46; controlled by [60FPS] Enabled=1.
// Fresh launch required. Reference VAs identify source bytes, not runtime allocations.
// Bare ASM numbers are hexadecimal; # introduces decimal.
// Sections:
//   Dialogue timing
//   Dialogue rendering

[ENABLE]

// ======================================================================
// Dialogue timing
// Dialogue content countdowns and continue-arrow timing.
// ======================================================================

// Reference VA 005755E8..005755EE.
assert(TOS.exe+1755E8,8D 0C C5 00 00 00 00)
TOS.exe+1755E8:
// Vanilla: lea ecx, [eax*8]
  lea ecx, [eax*#4] // 005755E8

// Reference VA 0057671F..00576723.
assert(TOS.exe+17671F,BA FE FF 00 00)
TOS.exe+17671F:
// Vanilla: mov edx, 0xfffe
  mov edx, 0xffff // 0057671F

// Reference VA 00576799..005767A0.
assert(TOS.exe+176799,66 83 86 24 28 00 00 FE)
TOS.exe+176799:
// Vanilla: add word ptr [esi + 0x2824], -2
  db 66,83,86,24,28,00,00,FF // add word ptr [esi + 0x2824], -#1 // 00576799

// ======================================================================
// Dialogue rendering
// Dialogue borders, corners, speech-tail ordering and name masking.
// Borders, tails and name masking share transient quad state. Keep both pending-corner records writable
// and zero-initialized.
// The two pending-corner pointer differences depend on the supported fixed image base (00400000); do not
// replace their native subtraction constants.
// ======================================================================

alloc(fps_dialogue_rendering_code,2000)
alloc(dialogue_corners,80)

define(fps_dialogue_pending,dialogue_corners)
label(fps_dialogue_bottom_border)
label(fps_dialogue_bottom_left_hook)
label(fps_dialogue_bottom_right_hook)
label(fps_dialogue_clip)
label(fps_dialogue_dialog_covers_pointer)
label(fps_dialogue_entry)
label(fps_dialogue_masked_quad)
label(fps_dialogue_name_double)
label(fps_dialogue_name_entry)
label(fps_dialogue_name_fill_hook)
label(fps_dialogue_name_floats)
label(fps_dialogue_name_pointer_fill_hook)
label(fps_dialogue_name_pointer_outline_hook)
label(fps_dialogue_name_quad)
label(fps_dialogue_name_textured_hook)
label(fps_dialogue_native_quad)
label(fps_dialogue_original_quad)
label(fps_dialogue_previous_quad)
label(fps_dialogue_style_a)
label(fps_dialogue_tail_order_quad)
label(fps_dialogue_tail_outline_hook)
label(fps_dialogue_top_left_hook)
label(fps_dialogue_top_right_hook)
label(fps_loc_02EFF45C)
label(fps_loc_02EFF535)
label(fps_loc_02EFF570)
label(fps_loc_02EFF581)
label(fps_loc_02EFF591)
label(fps_loc_02EFFA37)
label(fps_loc_02EFFAF5)
label(fps_loc_02EFFBC2)
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
label(fps_loc_02F0005B)
label(fps_loc_02F00088)
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
label(fps_loc_02F00338)
label(fps_loc_02F00340)
label(fps_loc_02F00342)
label(fps_loc_02F00358)
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

// Reference VA 00574285..00574289.
assert(TOS.exe+174285,E8 D6 C1 00 00)
TOS.exe+174285:
// Vanilla: call 0x580460
  call fps_dialogue_style_a // 00574285

// Reference VA 00574379..0057437D.
assert(TOS.exe+174379,E8 72 BE 00 00)
TOS.exe+174379:
// Vanilla: call 0x5801f0
  call fps_dialogue_top_left_hook // 00574379

// Reference VA 00574433..00574437.
assert(TOS.exe+174433,E8 B8 BD 00 00)
TOS.exe+174433:
// Vanilla: call 0x5801f0
  call fps_dialogue_top_right_hook // 00574433

// Reference VA 005744F3..005744F7.
assert(TOS.exe+1744F3,E8 F8 BC 00 00)
TOS.exe+1744F3:
// Vanilla: call 0x5801f0
  call fps_dialogue_bottom_left_hook // 005744F3

// Reference VA 005745AD..005745B1.
assert(TOS.exe+1745AD,E8 3E BC 00 00)
TOS.exe+1745AD:
// Vanilla: call 0x5801f0
  call fps_dialogue_bottom_right_hook // 005745AD

// Reference VA 00574683..00574687.
assert(TOS.exe+174683,E8 68 BB 00 00)
TOS.exe+174683:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_textured_hook // 00574683

// Reference VA 00574747..0057474B.
assert(TOS.exe+174747,E8 A4 BA 00 00)
TOS.exe+174747:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_textured_hook // 00574747

// Reference VA 0057481C..00574820.
assert(TOS.exe+17481C,E8 CF B9 00 00)
TOS.exe+17481C:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_textured_hook // 0057481C

// Reference VA 005748D8..005748DC.
assert(TOS.exe+1748D8,E8 13 B9 00 00)
TOS.exe+1748D8:
// Vanilla: call 0x5801f0
  call fps_dialogue_bottom_border // 005748D8

// Reference VA 00574B50..00574B54.
assert(TOS.exe+174B50,E8 9B B6 00 00)
TOS.exe+174B50:
// Vanilla: call 0x5801f0
  call fps_dialogue_name_pointer_fill_hook // 00574B50

// Reference VA 00574D4D..00574D51.
assert(TOS.exe+174D4D,E8 9E B4 00 00)
TOS.exe+174D4D:
// Vanilla: call 0x5801f0
  call fps_dialogue_tail_outline_hook // 00574D4D

// Reference VA 00575521..00575525.
assert(TOS.exe+175521,E8 CA AC 00 00)
TOS.exe+175521:
// Vanilla: call 0x5801f0
  call fps_loc_02EFFAF5 // 00575521

// Reference VA 005755A9..005755AD.
assert(TOS.exe+1755A9,E8 42 AC 00 00)
TOS.exe+1755A9:
// Vanilla: call 0x5801f0
  call fps_loc_02EFFAF5 // 005755A9

// ----------------------------------------------------------------------
// Reference payload 02EFF430..02EFF5FF; retained code/data/padding.
fps_dialogue_rendering_code+0:
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

// ----------------------------------------------------------------------
// Reference payload 02EFFA20..02EFFE3F; retained code/data/padding.
fps_dialogue_rendering_code+1D0:
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

// ----------------------------------------------------------------------
// Reference payload 02F00000..02F00FFF; retained code/data/padding.
fps_dialogue_rendering_code+5F0:
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
  fsub dword ptr [fps_dialogue_name_floats+4] // 02F00414
  fild dword ptr [esp] // 02F0041A
  fmul qword ptr [fps_dialogue_name_double] // 02F0041D
  fxch st(3) // 02F00423
  fsub dword ptr [fps_dialogue_name_floats+8] // 02F00425
  fadd st(0), st(3) // 02F0042B
  fstp qword ptr [esp] // 02F0042D
  cvttsd2si ecx, qword ptr [esp] // 02F00430
  mov dword ptr [esp], ecx // 02F00435
  fild dword ptr [esp] // 02F00438
  mov ecx, esi // 02F0043B
  fld dword ptr [fps_dialogue_name_floats+C] // 02F0043D
  fld st(2) // 02F00443
  fadd st(0), st(1) // 02F00445
  fld dword ptr [fps_dialogue_name_floats+10] // 02F00447
  fadd st(0), st(3) // 02F0044D
  fxch st(2) // 02F0044F
  fadd st(0), st(5) // 02F00451
  cmp cl, #2 // 02F00453
  je near fps_loc_02F00988 // 02F00456
  fld dword ptr [fps_dialogue_name_floats+18] // 02F0045C
  mov ecx, #6 // 02F00462
  fadd st(0), st(6) // 02F00467
  fstp dword ptr [esp + 0x20] // 02F00469
  fxch st(1) // 02F0046D
  fst dword ptr [esp + 0x24] // 02F0046F
  fld dword ptr [fps_dialogue_name_floats+1C] // 02F00473
  fadd st(0), st(4) // 02F00479
  fstp dword ptr [esp + 0x28] // 02F0047B
  fstp dword ptr [esp + 0x2c] // 02F0047F
  fxch st(1) // 02F00483
  fstp dword ptr [esp + 0x30] // 02F00485
  fld dword ptr [fps_dialogue_name_floats+20] // 02F00489
  fadd st(0), st(3) // 02F0048F
  fstp dword ptr [esp + 0x34] // 02F00491
  fxch st(1) // 02F00495
  fadd dword ptr [fps_dialogue_name_floats+28] // 02F00497
  fstp dword ptr [esp + 0x38] // 02F0049D
  fld dword ptr [fps_dialogue_name_floats+24] // 02F004A1
  fadd st(0), st(2) // 02F004A7
  fstp dword ptr [esp] // 02F004A9
  fld dword ptr [fps_dialogue_name_floats+2C] // 02F004AC
  movss xmm0, dword ptr [esp] // 02F004B2
  movss dword ptr [esp + 0x3c], xmm0 // 02F004B7
  fadd st(0), st(3) // 02F004BD
  movss dword ptr [esp + 0x44], xmm0 // 02F004BF
  fstp dword ptr [esp + 0x40] // 02F004C5
  fstp dword ptr [esp + 0x48] // 02F004C9
  fld dword ptr [fps_dialogue_name_floats+8] // 02F004CD
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
  fadd dword ptr [fps_dialogue_name_floats+30] // 02F0050C
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
  fadd dword ptr [fps_dialogue_name_floats+4] // 02F00534
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
  movss xmm3, dword ptr [fps_dialogue_name_floats+34] // 02F00627
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
  fld dword ptr [fps_dialogue_name_floats+38] // 02F00797
  fcomip st(1) // 02F0079D
  jbe short fps_loc_02F007B8 // 02F0079F
  fld dword ptr [fps_dialogue_name_floats+3C] // 02F007A1
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
  fld dword ptr [fps_dialogue_name_floats+14] // 02F009A9
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
  fld dword ptr [fps_dialogue_name_floats+44] // 02F00AE4
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
  fld dword ptr [fps_dialogue_name_floats+C] // 02F00D32
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
  fld dword ptr [fps_dialogue_name_floats+40] // 02F00DB0
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

// Private RW state; reference 02EFFE40..02EFFEBF.
dialogue_corners:
// Two zero-initialized 64-byte pending corner records, containing transient dialogue pointers and quads.
// Allocation bytes start at zero; no debugger state is copied.
  db 00

[DISABLE]
// Restoration evidence only; settings take effect on a fresh launch.

// Dialogue timing
TOS.exe+1755E8:
  db 8D,0C,C5,00,00,00,00
TOS.exe+17671F:
  db BA,FE,FF,00,00
TOS.exe+176799:
  db 66,83,86,24,28,00,00,FE

// Dialogue rendering
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
dealloc(fps_dialogue_rendering_code)
dealloc(dialogue_corners)
