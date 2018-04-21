# Astrotools for Scilab

Astronomy functions for [Scilab](http://www.scilab.org/). Some may based on the [CelestLab](https://atoms.scilab.org/toolboxes/celestlab/)-Toolbox from [CNES](https://cnes.fr/en) (French space agency).

> Developed just for my own needs. Under permanent development. Use it if you find it helpful. No warranty, no service but bug reports welcome. **Use it with Scilab 5.5.2 only.**

Functions make use of [SI units](https://en.wikipedia.org/wiki/International_System_of_Units "") only.

## Function's description

Refer [`doc-table.csv`](https://github.com/haniibrahim/scilab-astrotools/blob/master/doc-table.csv "") as a quick reference manual (open in LibreOffice/OpenOffice is recommended). 
Astrotools' functions provide documentation in their header which are [uman](https://atoms.scilab.org/toolboxes/uman/2.1) compatible. If toolbox "uman" is installed, type `uman AT_[function]`, e.g. `uman AT_gravity`for help.

## Usage

Astrotools works on all platforms Scilab supports (Windows, Linux, macOS).

 1. Save the (sci-)files in an arbitrary directory. 
 2. Load all sci-files into Scilab by typing  `getd('/path/to/astrotools-sci-files/')` in the Scilab console
 3. To use the physical and astromical constants, type `AT_astroconst()` in the Scilab console. 

>E.g. to get the radius of the earth you get it by `%earth.r`. Open the file `AT_astroconst.sci` for details.

**Get started:**

```
// init
getd('/path/to/astrotools-sci-files')
AT_astroconst()
// calculation
AT_gravity(%earth.mass, %earth.r, 400000) // Gravity @ISS in m/s²
```

**Easy initialization:**

Execute the `init.sce` script before you start calculating or after `clear()`. The script call `getd()`, `AT_astroconst()`, etc. in one command.

>You have to repeat calling `init.sce` or the init commands above after each restart of Scilab or after each `clear()`. If you want to avoid this, use the [library functionality](https://help.scilab.org/doc/5.3.3/en_US/lib.html "") of Scilab.

## Dependencies

* [Scilab](http://www.scilab.org/) Application ( Scilab 5.5.2 only) 
* [CelestLab](https://atoms.scilab.org/toolboxes/celestlab/) Toolbox
* [uman](https://atoms.scilab.org/toolboxes/uman/2.1)  Toolbox (Recommended but not mandatory)

**IMPORTANT NOTE:** Use Scilab 5.5.2 instead of version 6.0.0. The current Celestlab 3.2.1 is _not compatible_ with Scilab 6!

## License

These scripts are free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

These scripts are distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.