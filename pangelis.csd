Pangelis:
A vangelis inspered synthesizer built specificallly for the Raspberry Pi.
By Paul Batchelor
March 2013
<CsoundSynthesiser>
<CsOptions>
-odeac:hw:0 -+rtaudio=alsa -B 2048 -b 2048 -+rtmidi=alsa -Ma
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 256
0dbfs = 1
nchnls = 2

alwayson 1
alwayson 999
gisine ftgen 0, 0, 4096, 10, 1

garvbL init 0
garvbR init 0

initc7 1, 11, 0
initc7 1, 18, 1
initc7 1, 12, 0
initc7 1, 13, 0
initc7 1, 14, 0

maxalloc 1, 12

instr 1 ;Pangelis
iamp = .2
icps cpsmidi

kbend linseg 1, 6, .75
kbend port kbend, 0.001

;vibratro level CC 12
klev ctrl7 1, 12, 0, 0.02
;manual bend amount CC 11
kbend2 ctrl7 1, 11, 1, 1.3
;modulation index CC 14
kmod ctrl7 1, 14, 1, 5
;attack time CC 13
iatk ctrl7 1, 13, 0.01, 1.1
kvib oscil klev, 5, gisine
kjit jitter 0.002, 6, 3
kenv expsegr .1, iatk, 1, 2, 0.0001, 2, 0.0001
a1 foscil iamp*kenv, icps*kbend*(1+kjit)*(1+kvib)*kbend2, 2, 3, kenv*kmod, gisine
outs a1, a1
garvbL = garvbL + (a1 * .5)
garvbR = garvbR + (a1 * .5)
endin

instr 999 ;reverb
;reverb level 18
krev ctrl7 1, 18, 0, 1
aL, aR reverbsc garvbL, garvbR, .95, 15000
outs aL *krev, aR *krev
garvbL = 0
garvbR = 0
endin
</CsInstruments>
<CsScore>

t 0 180
f 0 999

</CsScore>
</CsoundSynthesiser> 
