

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /background_pattern_table_tb/status
      waveform add -signals /background_pattern_table_tb/background_pattern_table_synth_inst/bmg_port/CLKA
      waveform add -signals /background_pattern_table_tb/background_pattern_table_synth_inst/bmg_port/ADDRA
      waveform add -signals /background_pattern_table_tb/background_pattern_table_synth_inst/bmg_port/DOUTA

console submit -using simulator -wait no "run"
