# Turok: Evolution - 2-Player Split-Screen Co-op for Windows PC

Play the entire **Turok: Evolution** single-player campaign with a friend in local split-screen co-op, as a native Windows program.

Made by **DanDinosaur**. Looking for the Xbox 360 / original Xbox version? That's a separate project: [turok-evolution-coop](https://github.com/DanDinosaur/turok-evolution-coop).

A native Windows build of the co-op mod. It runs on its own: no Xbox, no emulator. It's built on the EvolutionRecomp static recompilation of the Xbox game, and was tested on a ROG Ally docked to a TV.

> **No game files are included.** You need your own copy of *Turok: Evolution* for the **original Xbox, USA / NTSC release**, as a disc image (`.iso`) or as extracted files (`default.xbe` plus the `supertree*.tre` files). The game checks your `default.xbe`; PAL, European and other releases are refused. The PC release of the game does not work either: the port runs the Xbox code.

### What you need

- Windows 10 or 11, 64-bit, with a DirectX 11 graphics card.
- Your own USA Xbox copy of Turok: Evolution (see above).
- Two controllers (Xbox-style; they work wired or Bluetooth). One controller plays single player.
- About 2.5 GB of free disk space for the extracted game.

### Install

1. Download **[turok-evolution-coop-pc-v1.0.zip](turok-evolution-coop-pc-v1.0.zip)**: click it, then click the **Download raw file** button (the download icon on the right).
2. Before unzipping, right-click the zip, choose **Properties**, tick **Unblock** if you see it, then click **OK**.
3. Unzip it to a folder of its own, for example `C:\Games\TurokCoop`.
4. Put your game next to the program:
   - **Disc image:** copy your `.iso` into that folder, then double-click **`Play_Turok_Coop.bat`** once. The game extracts the image into a `game` folder there (this takes a few minutes, once), then says *default_coop.xbe is missing*. Click OK.
   - **Already extracted files:** make a folder named `game` in that folder and copy the game's files into it (`default.xbe` and all `supertree*.tre` files).
5. Double-click **`Patch_Turok_Coop_PC.bat`**. It makes `game\default_coop.xbe` from your own `default.xbe` and says **Done**. Your original `default.xbe` is not changed. If Windows shows *"Windows protected your PC"*, click **More info → Run anyway**.
   - Mac/Linux users preparing the files: `python3 turok_coop_pc_patch.py game`
6. You can delete the `.iso` afterwards; the game uses the `game` folder.

### Play

- Double-click **`Play_Turok_Coop.bat`**.
- **Co-op:** connect a second controller and start or continue the campaign. The screen splits automatically when a level loads; with one controller it's normal single player.
- **Mod menu:** press **D-pad Right + Right Bumper** in a level. It has animal / enemy spawns, pets that fight for you, god mode, all weapons + ammo, full / max health, "bring player 2 to me", invisibility, a friendly-fire switch and save / load slots. Each player opens it with their own controller.
- **Video options** (resolution, fullscreen, frame limit, draw distance and more) are in the game's own Options menu and are saved in `turok_settings.ini` next to the program.
- **Saves** are kept next to the program.

### Known issues

- The mod menu does not open on the flying missions yet.
- Rare crash or a stuck music loop when loading a checkpoint; restarting the game fixes it.
- Third-person view and a side-by-side (vertical) split are not in yet.

### If something goes wrong

- *"not the USA release"*: your copy is a different region; only the USA Xbox release works.
- *"default_coop.xbe is missing"*: run `Patch_Turok_Coop_PC.bat` (step 5).
- When reporting a problem in the **Issues** tab, attach `turok_log.txt` from the program's folder.


## Credits and legal

Co-op mod and PC port by **DanDinosaur**. Built on **EvolutionRecomp** (phobos665) and the **xboxrecomp** toolchain (sp00nznet); thanks to their authors.

*Turok: Evolution* is © its respective owners. This is an unofficial fan project, not affiliated with or endorsed by the game's publishers or rights holders. No game assets (levels, models, textures, sounds, music) are included: you supply them from a copy of the game you own. `turok_evolution_coop.exe` is built with the EvolutionRecomp static recompiler, which translates the Xbox program's code to Windows code, so the program contains code translated from the game; it runs only with your own USA game files. `turok_evolution_coop_pc.tecp` holds only the mod's changes to your `default.xbe`.

The patcher scripts are released under the MIT License (see `LICENSE`).
