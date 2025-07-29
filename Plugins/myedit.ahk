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

; OneNoteへ入力する時だけに適用される設定
#IfWinActive, ahk_class Framework::CFrame
    vk1D & i::dllcall("keybd_event", int, 0x26, int, 0, int, 1, int, 0) ;Up
    vk1D & k::dllcall("keybd_event", int, 0x28, int, 0, int, 1, int, 0) ;Down
#IfWinActive

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



; ; 半角英数
; vk1D & vkF2::Send, {vkF2}{vkF3}

; ; 矢印入力
; vk1D & Up::Send, {vkF2}{vkF3}↑{vkF2}
; vk1D & Down::Send, {vkF2}{vkF3}↓{vkF2}
; vk1D & Left::Send, {vkF2}{vkF3}←{vkF2}
; vk1D & Right::Send, {vkF2}{vkF3}→{vkF2}

; Scroll Lockキーを「ろ」キーとして割り当て
ScrollLock::Send, {sc073}
; Shift + Scroll Lockキーでアンダーバーを入力
+ScrollLock::Send, {_}
; Scroll Lock機能を無効化
SetScrollLockState, Off

; アプリケーションキー + ファンクションキーで音量操作
AppsKey & F12::Send, {Volume_Up}
AppsKey & F11::Send, {Volume_Down}
AppsKey & F10::Send, {Volume_Mute}

; PrintScreenキーを単体で押した場合は無効化（スクリーンショット画面を表示しない）
PrintScreen::return

; Windows + PrintScreenの組み合わせは通常通り機能させる（画面を保存）
LWin & PrintScreen::Send, {LWin down}{PrintScreen}{LWin up}
RWin & PrintScreen::Send, {RWin down}{PrintScreen}{RWin up}

; 無変換キー + s で画面全体をスクリーンショット（Shiftキー押下時）
vk1D & s::
  If (GetKeyState("Shift", "P")) {
    Send, {LWin down}{PrintScreen}{LWin up}
  }
Return







