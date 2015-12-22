

 
 
 




window new WaveWindow  -name  "Waves for BMG Example Design"
waveform  using  "Waves for BMG Example Design"

      waveform add -signals /background_attribute_table_tb/status
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/CLKA
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/ADDRA
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/DINA
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/WEA
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/RSTB
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/CLKB
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/ADDRB
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/ENB
      waveform add -signals /background_attribute_table_tb/background_attribute_table_synth_inst/bmg_port/DOUTB

console submit -using simulator -wait no "run"
