\version "2.24.0"

% Brahms, Symphony No. 4 in E minor, Op. 98 - I. Allegro non troppo
% Two-stave reduction (leading melodic voice + bass line), bars 1-147
% (= the first 10 pages of the full score).

#(set-global-staff-size 17)

\paper {
  #(set-paper-size "a4")
  top-margin = 12\mm
  bottom-margin = 12\mm
  left-margin = 14\mm
  right-margin = 14\mm
  indent = 0
  ragged-last-bottom = ##t
  system-system-spacing.basic-distance = #17
  system-system-spacing.padding = #3
  markup-system-spacing.padding = #4
  print-page-number = ##t
}

\header {
  title = "Symphony No. 4 in E minor, Op. 98"
  subtitle = "I. Allegro non troppo"
  subsubtitle = "Two-stave reduction: leading melodic voice and bass line (bars 1–147)"
  composer = "Johannes Brahms"
  tagline = ##f
}

% ---- helpers ---------------------------------------------------------------
cue = #(define-event-function (txt) (markup?)
  #{ ^\markup { \small \italic #txt } #})
txtD = #(define-event-function (txt) (markup?)
  #{ _\markup { \italic #txt } #})
pdolce = #(make-dynamic-script
  #{ \markup { \dynamic p \normal-text \italic "dolce" } #})
plegg = #(make-dynamic-script
  #{ \markup { \dynamic p \normal-text \italic "legg." } #})
fmarc = #(make-dynamic-script
  #{ \markup { \dynamic f \normal-text \italic "marc." } #})
ppmarc = #(make-dynamic-script
  #{ \markup { \dynamic pp \normal-text \italic "ma ben marc." } #})
piuf = #(make-dynamic-script
  #{ \markup { \normal-text \italic "più" \dynamic f } #})
T = #(define-music-function (m) (ly:music?) #{ \tuplet 3/2 { #m } #})

global = {
  \key e \minor
  \time 2/2
  \tempo "Allegro non troppo"
  \set Score.rehearsalMarkFormatter = #format-mark-box-alphabet
  \override Score.BarNumber.break-visibility = ##(#f #f #t)
  \partial 4 s4
  s1*18  \mark \default   % A  (bar 19)
  s1*26  \mark \default   % B  (bar 45)
  s1*12  \mark \default   % C  (bar 57)
  s1*30  \mark \default   % D  (bar 87)
  s1*23  \mark \default   % E  (bar 110)
  s1*27  \mark \default   % F  (bar 137)
  s1*11  \bar "||"
}

% ---------------------------------------------------------------------------
%  UPPER STAFF: leading melodic voice
% ---------------------------------------------------------------------------
upper = {
  \clef treble
  % --- bars 1-18: theme, Violin I
  b''4\p\cue "Vl. I" ( |
  g''2) r4 e''4( |
  c'''2) r4 a''4( |
  fis''2) r4 dis''4( |
  b''2) r4 e'''4(\> |
  e''2)\! r4 g''4( |                                   % 5
  b''2) r4 d'''4(\> |
  d''2)\! r4 f''4( |
  a''2) r4 c'''4( |
  c''2)\espressivo(~ c''8 b' c'' a')\< |
  c'''2\espressivo(~ c'''8 a'' e'' d'') |              % 10
  c''2\espressivo(~ c''8 b' c'' a') |
  c'''2\espressivo\>(~ c'''8 a'' ees'' d'') |
  c''4\p r8 e''!8(\> b'4)\! r8 d''8(\> |
  a'4)\! r8 c''8(\> gis'4)\! r8 b'8( |
  a'4)(\< g'! fis' e') |                               % 15
  ais'4( g' fis' e') |
  b4.\f\<( b'8)\! b'2~ |
  % --- bar 18-19: Vl. I closes while Vl. II starts the varied theme
  <<
    { \voiceTwo b'4 a'8.(\> b'32 a' g'4 fis'4) | e'4\! }
    \new Voice { \voiceOne s2. b''8\p\<\cue "Vl. II" ( b'8 | g''8\> g'8)\! }
  >> \oneVoice
  % --- bars 19-26 (A): theme in broken octaves shared by Vl. I / Vl. II
  r4 r4 e'8\<\cue "Vl. I" ( e''8 |
  c''8\> c'''8)\! r4 r4 a''8\<\cue "Vl. II" ( a'8 |    % 20
  fis''8\> fis'8)\! r4 r4 dis'8\<\cue "Vl. I" ( dis''8 |
  b'8\> b''8)\! r4 r4 e'''8\>( dis''8 |
  e''8 e'8)\! r4 r4 g'8\<\cue "Vl. II" ( g''8 |
  b'8\> b''8)\! r4 r4 d'''8\>\cue "Vl. I" ( cis''8 |
  d''8 d'8)\! r4 r4 f'8\<\cue "Vl. II" ( f''8 |        % 25
  a'8\> a''8)\! r4 r4 c'''4-.\cue "Vl. I" |
  c''2\txtD "cresc. poco a poco" (~ c''8 b' c'' a') |
  c'''2(~ c'''8 a'' fis'' c'') |
  cis''2(~ cis''8 bis' cis'' a') |
  d'''2(~ d'''8 a'' fis'' d'') |                       % 30
  dis''4 r8 g''8( c''4) r8 fis''8( |
  b'4) r8 e''8( a'4) r8 dis''8( |
  b'4)\txtD "cresc." b''4.\espressivo( ais''8 b'' g'') |
  r4 g'''4.\espressivo( e'''8 cis''' g'') |
  r4 g''4.\espressivo( fis''8 g'' e'') |               % 35
  r4 e'''4.\espressivo( cis'''8 ais'' e'') |
  dis''4\f r8 g''8( c''!4) r8 fis''8( |
  b'4) r8 e''8( a'4) r8 dis''8( |
  b''4) e'''2 d'''!4~ |
  d'''4 c'''2 b''4~ |                                  % 40
  b''8 ais'' ais'' d'''( g''4) r8 cis'''8( |
  fis''4) r8 b''8( e''8) a''!8\<( d''8) g''8( |
  cis''8) fis''8( b'8) e''8( ais'4.) ais'8 |
  b'4-.\! d''4\f( ais'4.) ais'8 |
  % --- B
  b'4-. d'''4\f( cis''' b'' |                          % 45
  a''4 g'') d''2~ |
  d''4 cis''4( ais'4. b'8) |
  d''4.\<( fis''8) b''4.( d'''8) |
  fis'''4-.\! g'''4\f( fis''' e''' |
  d'''4 c'''!) g''2~ |                                 % 50
  g''4 a''4\<( c'''4. b''8) |
  g''4.( d''8) b'4.( g'8)\! |
  % --- bars 53-56: fanfare figure, woodwinds and horns, answered by tutti
  fis'4.\fmarc\cue "Ob., Cl., Fg., Hn." fis'16( ais' \T { cis''4-.) ais'-. d''-. } |
  cis''4.-> ais'8-. fis'4-. fis''4-. |
  d''4.-> cis''8-. cis''4-.
  << { \voiceOne fis'''4-.\f\cue "tutti" } \new Voice { \voiceTwo ais'4-. } >> \oneVoice |   % 55
  d'''4.-> cis'''8-. cis'''4-. ais''4-. |
  % --- C: second theme, cellos and horns
  \clef bass
  fis2\f\cue "Vc., Hn." ( e'2)~ |
  e'4 fis'4( e' d') |
  g'2 fis'2~ |
  fis'4 cis'4( d' e') |                                % 60
  ais2 b2~ |
  b4 cis'4( d' ais) |
  cis'2 b2~ |
  b4 cis'4( d' b) |
  % --- bars 65-72: the same theme, violins
  \clef treble
  fis''2\f\cue "Vl. I" ( e'''2)~ |                     % 65
  e'''4 fis'''4( e''' d''') |
  a'''2 g'''2~ |
  g'''4 fis'''4( cis''' d''') |
  ais''2 b''2~ |
  b''4 cis'''4( d''' ais'') |                          % 70
  cis'''2 b''2~ |
  b''4 e'''4( d''' ais'') |
  % --- bars 73-80: fanfare figure, winds; tutti answers
  g'4.\fmarc\cue "Ob., Cl., Fg., Hn." g'16( b' \T { d''4-.) b'-. ees''\sf } |
  d''4. g'16( b' \T { d''4-.) b'-. ees''\sf } |
  \T { d''4-. b'-. ees''\sf }
  << { \voiceTwo \T { d''4-. b'-. r4 } }
     \new Voice { \voiceOne s4 c'''!4->\cue "Str., Fl." } >> \oneVoice |      % 75
  b''4-> a''-> g''-> dis''-> |
  c''!4.\cue "Ww., Hn." c''16( e'' \T { g''4-.) e''-. aes''\sf } |
  g''4. c''16( e'' \T { g''4-.) e''-. aes''\sf } |
  \T { g''4-. e''-. aes''\sf }
  << { \voiceTwo \T { g''4-. e''-. r4 } }
     \new Voice { \voiceOne s4 aes''4-.\cue "Str." } >> \oneVoice |
  g''4-. r r b'4\f\cue "Str. pizz." |                  % 80
  % --- bars 81-86: dialogue, strings pizz. (beats 4-1) / winds stacc. (beats 2-3)
  ais'4 cis''4-.\cue "Ww." e''4-. g''4\cue "Str." |
  fis''4 d''4-. b'4-. a'!4 |
  gis'4 b'4-. d''4-. fis''4 |
  g'!4 b'4-. d''4-. fis''4 |
  g'4 ais'4-. cis''4-. e''4 |                          % 85
  fis'4 ais'4-. cis''4-. e''4 |
  % --- D: woodwinds
  r4 dis'''2\f\cue "Fl., Ob., Cl." cis'''4~ |
  cis'''4 b''2 ais''4 |
  gis'''2.\sf( g'''!4) |
  fis'''2.( dis'''4)\f\cue "Vl. I arco" ( |            % 90
  \ottava #1
  b'''4. ais'''8 gis'''4. fis'''8) |
  eis'''4.( dis'''8 cis'''4. gis'''8) |
  fis'''4.( dis'''8) cis'''2\txtD "dim." ~ |
  cis'''4.\>(
  \ottava #0
  dis''8) cis''4.( cisis''8)\! |
  % --- bars 95-106: lyrical B major theme, woodwinds / horn
  dis'''2\mf\cue "Fl., Cl., Hn." \T { e'''4-.\<( eis'''-. fis'''-.)\! } |   % 95
  fis'''4\>( e'''!2 dis'''4)\! |
  bis''2 \T { cis'''4-.( dis'''-. e'''-.) } |
  <<
    { \voiceOne ais''2 b''!2 }
    \new Voice { \voiceTwo s2 \T { b'4-.\p\<\cue "Ob." ( dis''-. fis''-.)\! } }
  >> \oneVoice |
  b''4.\>( a''!8 gis''4.\! fis''8 |
  e''4. d''!8 cis''4. gis''8) |                        % 100
  cis'''4.( b''8 ais''4. gis''8 |
  fis''4. e''8\txtD "dim." dis''4. e''8) |
  dis''4.\txtD "più dolce" ( e''8 dis''4. e''8 |
  cis''4. dis''8 cis''4. b'8) |
  cis''4.( dis''8 cis''4. dis''8 |                     % 105
  b'4. cis''8 b'4. cis''8) |
  % --- bars 107-109: strings
  <<
    { \voiceTwo r8 b8\pp\cue "Vl. I" ( d'! e' g'! e' f'! b' }
    \new Voice { \voiceOne d''!4 s2. }
  >> \oneVoice |
  d''8 e'' g'' e'' f''! b'' d''' b'' |
  f''!8 d'' b' e' f'! d' b8) r8 |
  % --- E: fanfare figure pp, woodwinds
  r4 r8 b'16-.\ppmarc\cue "Ob. (Ww.)" cis''-. dis''2 |  % 110
  r4 r8 cis''16-. dis''-. e''2 |
  r4 r8 dis''16-. e''-. \T { fis''4-. dis''-. gis''-. } |
  \T { fis''4-. dis''-. b''-. } \T { fis''4-. cis''-. fis''-. } |
  % --- bars 114-118: strings
  r8 gis8\pp\cue "Vl. I" ( b cis' e' cis' d' gis' |
  b'8 cis'' e'' cis'' d'' gis'' b'' gis'' |            % 115
  d''8 b' gis' cis' d'8) r8 r8 e''8( |
  dis''8\txtD "cresc." b' gis' dis' e'8) r8 r8 e''8( |
  eis''8\< b' gis' eis')( b''8 gis'' e'' cis'' |
  % --- bars 119-122: fanfare figure, strings
  b'8)\! r8 r8 b'16\f cis'' dis''2~ |
  dis''4 r8 cis''16 dis'' e''2~ |                      % 120
  e''4 r8 dis''16 e'' \T { fis''4-. dis''-. gis''-.\sf } |
  \T { fis''4-. dis''-. b''-.\sf } \T { fis''4-. dis''-. b'-. } |
  cis''4. r8 \T { fis''4\f\cue "Fl. (Ww.)" ( b'' cis''' } |
  \T { dis'''4\< fis''' b''' } \T { fis'''4\> dis''' b'' } |
  cis'''4.)\! d''!16\piuf\cue "Vl. I" e'' fis''2~ |    % 125
  fis''4 r8 e''16 fis'' g''2~ |
  g''4 r8 fis''16 g'' \T { a''4-. fis''-. b''-.\sf } |
  \T { a''4-. fis''-. d'''-.\sf } \T { a''4-. fis''-. d'''-.\sf } |
  \T { cis'''4 ais'' fis'''\sf } \T { cis'''4 ais'' fis'''\ff } |
  \T { e'''4 cis''' fis''' } \T { e'''4 cis''' fis''' } |      % 130
  \T { e'''4 cis''' fis''' } \T { dis'''4 b'' fis''' } |
  \T { dis'''4 b'' fis''' } \T { dis'''4 b'' b''' } |
  gis'''4.-> fis'''8 fis'''4. gis'''8 |
  gis'''4.-> fis'''8 fis'''4. gis'''8 |
  gis'''4-. r r2 |                                     % 135
  fis'''4-. r r dis'''4\p\cue "Fl." ( |
  % --- F: head of the theme in the woodwinds, then Violin I
  b''2) r4 dis'''4( |
  b''2) r4 dis'''4( |
  << { b''1)~ } { s2\< s2\> } >> |
  b''4\! r r c'''!4( |                                 % 140
  a''2) r4 c'''4( |
  a''2) r4 c'''4( |
  << { a''1)~ } { s2\< s2\> } >> |
  a''4\! r r b''4\p\cue "Vl. I" ( |
  g''2) r4 e''4( |                                     % 145
  c'''2) r4 a''4( |
  fis''2) r4 dis''4 |
}

% ---------------------------------------------------------------------------
%  LOWER STAFF: bass line
% ---------------------------------------------------------------------------
lower = {
  \clef bass
  r4 |
  e2\p r2 |
  e2 r2 |
  e2 r2 |
  e2 r2 |
  c2 r2 |                                              % 5
  g,2 r2 |
  d2 r2 |
  a,2 r2 |
  dis2. dis4\< |
  e2. e4 |                                             % 10
  f2. f4 |
  fis2.\> fis4 |
  g4\p r gis r |
  a4 r b, r |
  c2.\< c4 |                                           % 15
  fis,2. fis,4 |
  b,2\f b,2 |
  b4 r r2 |
  % --- A
  r4 e4-.\p( r c-.) |
  r4 a,4-.( r fis-.) |                                 % 20
  r4 dis4-.( r b,-.) |
  r4 g,4-.( r e-.) |
  r4 c'4-.( r a,-.) |
  r4 g,4-.( r g-.) |
  r4 d'4-.( r d-.) |                                   % 25
  r4 a,4-.( r a-.) |
  dis2.\txtD "cresc. poco a poco" dis4 |
  d!2. d4 |
  cis2. cis4 |
  c!2. c4 |                                            % 30
  b,2 b2~ |
  b2 b,2 |
  g2.\txtD "cresc." g4 |
  a2. a4 |
  ais2. ais4 |                                         % 35
  fis2. fis,4 |
  b,4\f b2 b4~ |
  b4 b2 a,4-. |
  g,4-. r8 c'8( fis4) r8 b8( |
  e4) r8 a8( d4) r8 g8( |                              % 40
  cis4) g2 fis,4~ |
  fis,4\< fis fis, fis |
  fis,4 fis fis, fis |
  g4->\f b,-> d-> d,-> |
  % --- B
  g,4-. g2\f a4~ |                                     % 45
  a4 d'4( cis' b |
  a4 g) d2\f~ |
  d2\< d'2~ |
  d'4-.\! c!2\f d4~ |
  d4 e2.~ |                                            % 50
  e4 ees4\< d2 |
  b,2 f,!2 |
  fis,4-.\f r r2 |
  R1 |
  r2 r4 fis,4-.\f |                                    % 55
  b,4.-> cis8-. cis4-. fis,4-. |
  % --- C
  fis4-.\f r8 cis'8-. cis'4-. ais4-. |
  fis4-. d-. b,-. r |
  r4 r8 d'8-. d'4-. b4-. |
  g4-. e-. cis-. r |                                   % 60
  r4 r8 g8-. g4-. e4-. |
  cis4-. a,-. fis,-. r |
  r4 r8 g'8-. g'4-. e'4-. |
  cis'4-. ais-. fis-. r |
  r4 r8 ais,8-. ais,4-. fis,4-. |                      % 65
  d4-. b,-. g-. r |
  r4 r8 cis8-. cis4-. a,!4-. |
  fis4-. d-. b-. r |
  r4 r8 g,8-. g,4-. e,4-. |
  cis4-. ais,-. fis-. r |                              % 70
  r4 r8 g,8-. g,4-. e,4-. |
  cis4-. ais,-. fis-. d-. |
  g2.\f d4\sf |
  g2. d4\sf |
  g4 d\sf g d-> |                                      % 75
  g4-> dis-> b-> g-> |
  c'2. g4\sf |
  c'2. g4\sf |
  c'4 g\sf c' aes-. |
  g4-. r r b,4\f^\markup { \small \italic "pizz." } |  % 80
  ais,4 cis4-. e4-. g4 |
  fis4 d4-. b,4-. a,!4 |
  gis,4 b,4-. d4-. fis4 |
  g,!4 b,4-. d4-. fis4 |
  g,4 ais,4-. cis4-. e4 |                              % 85
  fis,4 ais,4-. cis4-. fis,4 |
  % --- D
  b,4\< fis, cis fis, |
  d!4 fis, dis fis, |
  e4\! fis, e fis, |
  fis4 fis, r b,4-.^\markup { \small \italic "arco" } |    % 90
  gis,2\f gis2 |
  cis2 cis2 |
  fis,1\txtD "dim." |
  fis,1 |
  b,4-.\plegg r r b,4-. |                              % 95
  b,4-. r r b,4-. |
  e4-. r r cis4-. |
  e4-. r r dis4-. |
  d!4-. r r b,4-. |
  gis,4-. r r cis4-. |                                 % 100
  e4-. r r cis4-. |
  ais,4-. r r cis4-.\txtD "dim." |
  bis,4-. r r gis,4-. |
  cis4-. r r b,!4-. |
  ais,4-.\> r r fis,4-. |                              % 105
  b,4-. r r ais,4-. |
  gis,1\pp~ |
  gis,1~ |
  gis,2 g,!2~ |
  % --- E
  g,8 r r dis16-.\ppmarc dis-. dis4-. r4 |             % 110
  r4 r8 dis16-. dis-. dis4-. r |
  r4 r8 fis,16-. fis,-. b,4-. e,4-. |
  b,4-. dis-. fis-. fis,-. |
  eis,1\pp~ |
  eis,1~ |                                             % 115
  eis,2 e2 |
  dis2\txtD "cresc." d!2 |
  cis2\< eis,2~ |
  eis,4\! r8 fis,16-.\f fis,-. fis2~ |
  fis4 r8 fis,16-. fis,-. fis2~ |                      % 120
  fis4 r8 b,16-. b,-. b4-. e4-.\sf |
  b4-. gis-.\sf b-. dis-. |
  fis4. r8 r2 |
  R1 |
  r2 r4 r8 d,16\piuf d, |                              % 125
  a,2 r4 r8 a,16 a, |
  d2 r4 g,4-.\sf |
  d4-. b,-.\sf d-. b,-.\sf |
  fis4-. d-.\sf fis-. fis,-.\ff |
  ais,4-. cis-. fis-. ais-. |                          % 130
  cis'4-. fis,-. b,-. dis-. |
  fis4-. b-. dis'-. b,-. |
  e4.-> fis8 fis4. e8 |
  e4.-> fis8 fis4. e8 |
  e4-. r r2 |                                          % 135
  fis4-. r r2 |
  % --- F
  b,2\p r2 |
  b,2 r2 |
  << { e1~ } { s2\< s2\> } >> |
  e2\! r2 |                                            % 140
  d!2 r2 |
  d2 r2 |
  << { dis1~ } { s2\< s2\> } >> |
  dis2\! r2 |
  e2\p r2 |                                            % 145
  e2 r2 |
  e2 r2 |
}

\score {
  \new PianoStaff <<
    \new Staff = "up" << \global \upper >>
    \new Staff = "down" << \global \lower >>
  >>
  \layout {
    \context {
      \Score
      \override SpacingSpanner.base-shortest-duration = #(ly:make-moment 1/12)
      \override TupletBracket.bracket-visibility = ##f
      \override Hairpin.minimum-length = #6
    }
  }
}
