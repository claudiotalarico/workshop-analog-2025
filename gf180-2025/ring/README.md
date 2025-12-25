- `inv.sch`
  - xschem's schematic of inverter (by M. Koefinger)
- `inv.sym`
  - xschem's symbol of inverter
- `inv_tb.sch`
  - xschem's testbench for simulating the inverter behavior <br>
    OP, DC-sweep and TRAN analysis (the setup for the TRAN analysis is too simplistic)
- `inv_tb_dynamic.sch`
  - xschem's testbench for simulating the inverter behavior <br>
  TRAN analysis with improved setup
- `inv_tb_stat_enh.sch`
  - xschem's testbench for simulating the inverter behavior <br>
    DC-sweep analysis enabling post processing of the simulation data <br>
    The simulation data are saved in the file `inv_tb_stat_enh.txt`
- `pp_inv_tb_stat_enh.ipynb`
  - python's notebook for post processing the DC-sweep data of the inverter
- `pp_sim.py`
  - python's script for post processing the DC-sweep data of the inverter
- `inv.gds`
  - layout of inverter
- `ring.sch`
  - xschem's schematic of ring oscillator
- `ring.sym`
  - xschem's symbol of ring oscillator    
- `ring_tb.sch`
  - xschem's testbench for simulating the ring oscillator behavior <br>
  TRAN analysis
- `ring.gds`
  - layout of ring oscillator
- `ring_pex.sym`
  - xschem's symbol for post-layout simulation of ring oscillator
- `ring_pex_tb.sch`
  - xschem's testbench for post-layout simulation of ring oscillator <br>
  TRAN analysis
- `ring_pex.spc`
  - spice netlist of ring oscillator after pex (parasitic extraction)    
