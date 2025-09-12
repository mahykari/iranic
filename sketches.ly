\version "2.22.1"
\language "deutsch"

\new PianoStaff <<
  \new Staff {
    \relative {
      \shape #'((0 . 0)(6 . 4)(0 . 2)(0 . 0)) Slur
      d''4.\mp ( e16 f e8 d c h! | c4 h?8 c16 d c2) |
    }
  }
  \new Staff {
    \clef treble
    \relative {
      \tuplet 3/2 { d'8_\markup {\italic {quasi legato, á 3}}  <a' f> d, }
      \override TupletBracket.transparent = ##t
      \override TupletNumber.transparent = ##t
      \tuplet 3/2 { \repeat unfold 2 { cis <a' f> cis, } cis <g' f> cis, | 
        \repeat unfold 2 { b <e as> b } \repeat unfold 2 { a <f' as?> a, }
      }
    }
  }
>>

\new PianoStaff <<
  \new Staff = "up" {
    \clef bass \relative {
      c'8 e dis c h a r4. |
      { \stemUp c,8 e dis} c h a r4. |
      \time 6/8 r4. r4
        \override TupletBracket.transparent = ##t
        \override TupletNumber.transparent = ##t
        \tuplet 3/2 {
          \ottava #-1 s16 \stemDown g, h} |
      e8-^\!\f \ottava #0 r4 r4. |
    }
  }

  \new Dynamics { 
    s16 s16\f s4 s2. | 
    s16 s16\mf s4 s2. | 
    s4. s8 s8_\markup {eruptiv} s8 | 
    s4. s4. |}

  \new Staff = "down" {
    \clef bass \time 9/8 \relative {
      r2. fis!8-> fis-> fis-> | 
      r2. f,!8-> f!-> f!-> | 
      r4. r4
      \override TupletBracket.transparent = ##t
      \override TupletNumber.transparent = ##t
      \tempo \markup {á 3} \ottava #-1 
      << { \tuplet 3/2 {\voiceOne es,!16\p s8} }
             \new Voice { \voiceTwo es!8}
      >> | 
      << {\voiceOne s8} \new Voice { \voiceTwo g8\mf } >>\oneVoice r4 r4. |
    }
  }
>>

