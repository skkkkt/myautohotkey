﻿; 英数キー無効
vkF0::Return
; ↑
vk1D & i::Send, {Blind}{Up}

; ↓
vk1D & k::Send, {Blind}{Down}

; ←
vk1D & j::Send, {Blind}{Left}

; →
vk1D & l::Send, {Blind}{Right}

; Home
vk1D & h::Send, {Blind}{Home}

; End
vk1D & vkBB::Send, {Blind}{End}

; PgUp
vk1D & o::Send, {Blind}{PgUp}

; PgDn
vk1D & p::Send, {Blind}{PgDn}

; ↑↑↑↑
vk1D & u::Send, {Blind}{Up 4}

; ↓↓↓↓
vk1D & ,::Send, {Blind}{Down 4}

; →→→→
vk1D & .::Send, {Blind}^{Right}

; ←←←←
vk1D & m::Send, {Blind}^{Left}
; Enter
vk1D & Space::Send, {Blind}{Enter}


; Backspace
vk1D & n::Send, {Blind}{Backspace}

; Delete
vk1D & /::Send,{Blind}{Delete}

; 行挿入
vk1D & Enter::
  If (GetKeyState("Ctrl", "P")) {
    Send, {Up}{End}{Enter}
  } Else {
    Send, {End}{Enter}
  }
Return

; 半角英数
vk1D & vkF2::Send, {vkF2}{vkF3}

; 矢印入力
vk1D & Up::Send, {vkF2}{vkF3}↑{vkF2}
vk1D & Down::Send, {vkF2}{vkF3}↓{vkF2}
vk1D & Left::Send, {vkF2}{vkF3}←{vkF2}
vk1D & Right::Send, {vkF2}{vkF3}→{vkF2}

