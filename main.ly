\version "2.22.1"
\language "deutsch"

\header {
  tagline = ##f
}

\paper {
  #(define fonts
    (set-global-fonts
     #:music "beethoven"
     #:brace "beethoven"
     #:roman "old music standard"
     #:factor (/ staff-height pt 20)
   ))
}

winger = { fis8 h a }
keeper = { c8 c c }
ringer = { b8.( e16 cis!8-.) }

ffRisoluto = \markup { \dynamic ff \normal-text { risoluto } }
ffRisolutoDynamic = #(make-dynamic-script ffRisoluto)


\new PianoStaff <<
  \new Staff = "up" {
    \clef bass \time 6/8 \relative {
      \partial 4. fis8 h a | r2. | r4 fis8 fis h a |
      r2. | r2. | \repeat unfold 3 { \winger r4. } |
      \retrograde { \winger r4. } |
      \retrograde \winger \transpose fis a \retrograde \winger |
      r4. |
      \repeat unfold 3 { \transpose fis a \winger r4. } |
      r4. r4. r4. |
      \clef treble \repeat unfold 4 { r4. r4 \grace { a'16 } gis8 } |
      r4. r8. a16( gis8-.) |
      g! e cis \ringer |
      r4. \ringer |
      r4. \ringer |
      r4. r4. r4. |
      r8. a'16( gis8-.) g! e cis |
      \ringer e, a4-- |
      r4. a8. a16 a8 |
      r4. a'8. a16 a8 |
      \repeat unfold 3 { <a a'>8. <gis gis'>16 <a a'>8 } r4. |
      << {
        \voiceOne fis'8.-> his16 a8 b8.-> e16 cis8 |
        cis8.-> fisis16 e?8 b8.-> e16 cis8 }
        \new Voice {
          \voiceTwo r4. \repeat unfold 3 { <fis,, b e>4 <fis b e>8 }
        }
      >> |
      \grace {
        fisis''32^\markup { \tiny r.h. }^[e cis ais]
        gis_\markup { \tiny l.h. }_[e d b]
        fisis32^\markup { \tiny r.h. }^[e cis ais]
      }
      s2. |
      f'8^\markup { non legato } c f \transpose fis c' \winger |
      \repeat unfold 8 \transpose fis c' \winger |
      \transpose fis c' \winger heses,8 as' es |
      heses8 as' es heses8 as' es |
      a! h! c d e f | g a h c b, g' |
      \repeat unfold 13 { c b, g' }
      \temporary \override NoteHead.extra-spacing-width = #'(-4 . 4)
      c^\markup { momentan streckend }  b, g' |
      c \revert NoteHead.extra-spacing-width
      \repeat unfold 5 <g, g'>8 |
      \time 4/4 <fis fis'>4. <g g'>16 <a a'>
        <g g'>8 <fis fis'> <e e'> <d d'> |
      <e e'>4 g4\glissando \ottava 1 g'''4 \ottava 0 r4\fermata
    }
  }
  \new Dynamics {
    \tempo "Allegro moderato"
    s4.\f | s2. |
    s16 s16\! s8 s8\f s4. |
    s2.  | s2. |
    \tempo "animato" s2.\mp | s2.*3 | s4. s4.\sfz | s4.\f |
    s2.\mp | s2.*2 | s4.\f s4. s4. |
    s2.*8 | s4. s4. s4. | s2.*4 | s2.\ff | s4. s4.\mf |
    s2.*3 | s2.\mp | s2.*6 | s2.\mp \cresc |
    s4. s4\endcresc s8\ffRisolutoDynamic |
    s2.*8 | \tempo "moderato" s1 |
  }
  \new Staff = "down" {
    \clef bass \relative {
      r4. | c,2.->-\tweak minimum-length 15 ( |
      c4.) r4. | c2.-> ( | c2.) |
      \repeat unfold 3 { r4. \keeper } |
      \retrograde { r4. \keeper } |
      r4. gis'8 r4 | \time 3/8 c,8 c c |
      \time 6/8 \repeat unfold 3 { r4. \transpose c gis, \keeper } |
      \time 9/8 \keeper \transpose c gis, \keeper \keeper |
      \time 6/8 c4\sustainOn  \grace { fisis16 } gis8 cis4. |
      \repeat unfold 3 {
        c,4\sustainOff\sustainOn  \grace { fisis16 } gis8 cis4. } |
      c,8. \noBeam fisis16 gis8 d'4. |
      r2. | h!8 h! h! r4. |
      \repeat unfold 3 { <dis, f!>8 } r4. |
      \time 9/8
        \transpose c h, \keeper
        \repeat unfold 3 { <dis f!>8 }
        \transpose c h, \keeper |
      \time 6/8 f'8-^ r4 r4. |
      r2. |
      gis,4.-- r4. |
      gis8. gis16 gis8 r4. |
      <a, a'>8.\sustainOn <gis gis'>16 <a a'>8
        <a a'>8. <gis gis'>16 <a a'>8 |
      <a a'>8. <gis gis'>16 <a a'>8\sustainOff
      \tuplet 4/3 {
        \set tieWaitForNote = ##t gis!8 ~ fis' ~ e'! ~ dis' ~
      } |
      <gis,,,! ~ fis'! ~ e'! ~ dis'!>2. ~ | <gis! fis'! e'! dis'!>2. |
      \once \override NoteHead.extra-spacing-width = #'(0 . 8)
      <fis' fis'>2.\fermata |
      \grace { f16_[gis a]  h^[c es] f_[gis a] h^[c es] }
        r4. r4 <a,,, a'>8_\mf\cresc |
      <h h'>4. r4 <a a'>8 |
      <h h'>4.\endcresc r4. |
      \slurDashed
      <a a'>8( <h h'>4 <h h'>4 ) <c c'>8( |
      <dis dis'> <c c'>4 <h h'>4 ) <a a'>8( |
      <gis gis'>8 <a a'>4 <h h'>4.~ ) | <h h'>2. |
      \change Staff = "up" \stemDown <ges''' b>4. <as c>4. |
      <b d>4. \change Staff = "down" r4 <fis,,, fis'>8 |
      <gis gis'>4. r4 <fis fis'>8 | <gis gis'>4. r4. |
      \slurDashed
      <fis fis'>8( <gis gis'>4 <gis gis'>4 ) <a a'>8( |
      <his his'>8 <a a'>4 <gis gis'>4) <fis fis'>8( |
      <eis eis'>8 <fis fis'>4 <gis gis'>4. ~ ) |
      <gis gis'>4. r4 <e e'>8 |
      <fis fis'>4. r4 <e e'>8 |
      <fis fis'>4. r4 <e e'>8 \bar "||"
      \time 4/4 <fis fis'>4. <g g'>16 <a a'>
        <g g'>8 <fis fis'> <e e'> <d d'> |
      <e e'>4 <b b'>2 r4\fermata   
    }
  }
>>

\new PianoStaff <<
  \new Staff = "up" {
    \clef treble \time 4/4 \relative {
      d''4.^\markup { langsam aufkommend }
        ( e16 f e8 d c h | c4 h?8 c16 d c2 ) |
      g4.( c16 h c8 h c d | b8. c16 b8 a16 g a2 ) |
      <<
        { \voiceOne d4.( e16 f e8 d c h | c4 h?8 c16 d c2 ) }
        \new Voice { \voiceTwo s1 | as2 g }
      >>
      g4. c16 h c8 e16 g c8 ges16 es |
      b8. cis16 b8. e16 a8. b16 a8. cis16 |
      d4. e8 d2 |
      \ottava 1 d2
        \temporary \override NoteColumn.X-offset = #'-8
        \temporary \override NoteHead.extra-spacing-width = #'( 1 . 2 )
        \grace { es16 d cis e g b e }
        \revert NoteColumn.X-offset d2 
        
    }
  }
  
  \new Dynamics {
    s1\p
  }

  \new Staff = "down" {
    \clef treble \relative {
      \repeat unfold 2 <f' a>8 \repeat unfold 4 <f as> <e as!> <e as> |
      \repeat unfold 4 <e g> \repeat unfold 4 <dis fis> |
      \repeat unfold 4 <c f>
        \repeat unfold 2 <cis fis>
        \repeat unfold 2 <d fis> |
      \repeat unfold 4 <e fis> \repeat unfold 4 <dis f> |
      \clef bass <<
        { \voiceOne \repeat unfold 2 <gis, e'>
            \repeat unfold 4 <fisis dis'>
            \repeat unfold 2 <fis dis'> |
          <f! d'!> \repeat unfold 3 <f d'>
            \repeat unfold 4 <e d'>
        }
        \new Voice { \voiceTwo c2 s | s a' }
      >> |
      \repeat unfold 4 <es as des>8
      \repeat unfold 4 <e a d> |
      \improvisationOn
      \repeat unfold 8 <fis h e> |
      \improvisationOff
      \repeat unfold 2 {
        \repeat unfold 4 <ges ces fes>
        \repeat unfold 4 <f b es>
      }
    }
  }
>>
