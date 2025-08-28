\version "2.22.1"
\language "deutsch"

\paper {
  #(define fonts
    (set-global-fonts
     #:music "beethoven"
     #:brace "beethoven"
     #:roman "nepomuk"
     #:factor (/ staff-height pt 20)
   ))
}


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


winger = { fis8 h a }
keeper = { c8 c c }

\new PianoStaff <<
  \new Staff {
    \clef bass \time 6/8 \relative {
      \partial 4. fis8 h a | r2. | r4 fis8 fis h a |
      r2. | r2. | \repeat unfold 3 { \winger r4. } | 
      \retrograde { \winger r4. } | 
      \retrograde \winger \transpose fis a \retrograde \winger | 
      r4. |
      \repeat unfold 3 { \transpose fis a \winger r4. } |
      r4. r4. r4. | 
      \clef treble \repeat unfold 4 { r4. r4 \grace { a'16 } gis8 }
      
    }
  }
  \new Dynamics {
    \textLengthOn
    \tempo "Allegro moderato" 
    s4.\f | s2.\> | 
    s16 s16\! s8 s8\f s4. |
    \once \override Hairpin.minimum-length=20 
    s2.\>  | s2. | 
    \tempo "animato" s2.\mp | s2.*3 | s4. s4.\sfz | s4.\f |
    s2.\mp | s2.*2 | s4.\f s4. s4. | 
  }
  \new Staff {
    \clef bass \relative {
      r4. | c,2.->-\tweak minimum-length 15 ( |
      c4.) r4. | c2.-> ( | c2.) |
      \repeat unfold 3 { r4. \keeper } | 
      \retrograde { r4. \keeper } | 
      r4. gis'8 r4 | \time 3/8 c,8 c c |
      \time 6/8 \repeat unfold 3 { r4. \transpose c gis, \keeper } |
      \time 9/8 \keeper \transpose c gis, \keeper \keeper |
      \time 6/8 \repeat unfold 4 { c4\sustainOn  \grace { fisis16 } gis8 cis4. } |
    }
  }
>>
