;first.csd
;pays a sine wave for 3 seconds
<CsoundSynthesiser>
<CsInstruments>
sr=44100
ksmps=1
nchnls=1
instr 1
aout poscil 15000,440,1
out aout
endin
</CsInstruments>
<CsScore>
f1 0 65536 10 1
i1 0 3
e
</CsScore>
</CsoundSynthesiser>
