# NeoGeoFPGA-sim
Simulation project for a NeoGeo hardware definition. This does not go in a FPGA yet :)
This is being made possible by neogeodev contributors cited in neogeo_mvs.v and Patreon donators: Valérianne Lagrange, Mahen, Ange Albertini, Cyrille Jouineau, Artemio Urbina, Charly, Alexis Bezverkhyy.

![Diagram](ngfpgad1.png)

Green is what this project is all about. Yellow is simulation/testbench files. Grey are results from simulation.

Converted ROM files for the cartridge model aren't provided for obvious reasons, get them from any ROM download website and convert them with rom2verilog.c. I'm using joyjoy for now (small, simple game).

Top file is neogeo_mvs.v, currently used testbench is testbench_1.v .

# Cartridge model (MVS for now)

* cha_board.v : MVS cartridge model CHA board (C ROMs, S ROM, M ROM)
 * rom_c1.v : Sprite graphics ROM
 * rom_c2.v : Sprite graphics ROM
 * rom_s1.v : Fix graphics ROM
 * neo_273.v : SNK latch chip
* prog_board.v : MVS cartridge model PROG board (V ROMs, P ROM)
 * rom_p1.v : 68k program ROM
* mvs_cart.v : Just wires both CHA and PROG boards into a cartridge model

# Memory card model

* memcard.v : Just some RAM :)

# NeoGeo model

* ao68000.v : AO68000 Motorola 68000 CPU core (https://github.com/alfikpl/ao68000)
* clocks.v : Clock divider (parts of NEO-D0 and LSPC merged together)
* neo_zmc2.v : SNK graphics chip (most of it done by Kyuusaku)
* neo_c1.v : SNK address decoding, joypad inputs, system maestro chip
* neo_d0.v : SNK memory card and joypad outputs chip
* neo_f0.v : SNK MVS cab I/O chip
* lspc_a2.v : Where the magic lives
 * videosync.v : Video sync and "ticks" generation
 * videocycle.v : Rendering cycle sequencer
 * irq.v : 68000 IRQ gen/ack
 * autoanim.v : Auto-animation specifics
 * vram_l.v : Slow VRAM chip (2x)
 * vram_u.v : Fast VRAM chip (2x)
* neo_b1.v : SNK graphics buffer chip
* neo_i0.v : SNK MVS cab I/O chip
* syslatch.v : System latch/register
* rom_l0.v : Shrink lookup table (L0) ROM
* rom_sp.v : System program (SP-S2 BIOS) ROM
* rom_sfix.v : Embeded fix graphics (SFIX) ROM
* palram.v : Palette RAM chip (2x)
* videout.v : Video output latch
