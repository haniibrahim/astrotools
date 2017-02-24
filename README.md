# Astrotools for Scilab
Astronomy functions for [Scilab](http://www.scilab.org/). Based on the [CelestLab](https://atoms.scilab.org/toolboxes/celestlab/)-Toolbox from [CNES](https://cnes.fr/en) (French space agency).

> Just for my own purpose. Still under development. Use it if you find it useful.

## Functions

| function              | Description                                                | Input                                                                                                                                                                                           | Output                                               | Examples                                                                 | Comments                                                                                                    |
|-----------------------|------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------------------------------------------------|--------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| AT_astroconst()       | Physical constants                                         |                                                                                                                                                                                                 |                                                      | AT_astroconst(); earth.mass                                              | Saved as structs. Need to be called once to use the constants                                               |
| AT_atmosphAdsorbCoeff | Atmosheric adsorption coefficient                          | dist  = Visual distance in m                                                                                                                                                                    | sigma = Atmosheric adsorption coefficient in m**(-1) | AT_atmosphAdsorbCoeff(10.3)                                              |                                                                                                             |
| AT_fallvelo           | Fall velocity                                              | h = Height in mA = Acceleration in m/s² (optional), if not specified a = 9.80665                                                                                                                | v = fall velocity in m/s                             | AT_fallvelo(40000)                                                       |                                                                                                             |
| AT_gravity            | Gravity of a body in a specific height                     | m = Mass of the body in kgr = Radius of the body in mh = Height above the body in m                                                                                                             |                                                      | AT_astroconst(); AT_gravity(earth.mass, earth.r, 400000) // Gravity @ISS |                                                                                                             |
| AT_isCelestlab        | Checks if CelestLab toolbox is installed and loaded        |                                                                                                                                                                                                 |                                                      | AT_isCelestlab()                                                         |                                                                                                             |
| AT_orbitalspeed       | Orbitalspeed in m/s                                        | m = Mass of the heaviest object in kgr = distance at which the speed is to be calculated in mA = length of the semi-major axis of the elliptical orbit. For the Earth at perihelion in m        | v = orbital speed in m/s                             | AT_astroconst(); AT_orbitalspeed(earth.mass, 400000, earth.per)          |                                                                                                             |
| AT_refraction_add     | Atmospheric refraction of an apparent altitude             | h_s: apparent altitude of the astronomical body in °t:   temperatur in K (OPTIONAL), if not specified t=283KP:   pressure in hPa (OPTIONAL), if not specified p=1010hPa                         | R:   Atmospheric refraction correction in °          | AT_refraction(25)                                                        | You have to add the value to a calculated/real altitude to get the the observed altitude                    |
| AT_refraction_del     | Atmospheric refraction elimination of an observed altitude | h_o: observed altitude of the astronomical body in °t:   temperatur in K (OPTIONAL), if not specified t=283KP:   pressure in hPa (OPTIONAL), if not specified p=1010hPa                         | Atmospheric refraction in °                          | AT_refraction_del(25)                                                    | You have to substract the value to a observed altitude to get the real altitude w/o atmospheric influence.  |
| AT_visualRange        | Visual range w/ or w/o terrestrial refraction              | height1 = height of eye/instrument in mheight2 = height of distant object in mRefr = terrestrial refraction (OPTIONAL), set to 1 (no refraction) if not committed, refr = 1.08 is common value. | range = visual range of sight in m                   | AT_visualRange(1.7, 12, 1.08)                                            | Calculate how far you can see w/ or W/o terrestrial refraction correction. Mostly used for terestial views. |

## Usage

 * Save the files in an arbitrary directory. 
 * Load all sci-files with `getd('/path/to/sci-files')` 
 * To use the physical and astromical constants type `AT_astroconst()`. E.g. to get the radius of the earth you get it by `earth.r`. Open the file `AT_astroconst.sci` for details.

You have to repeat this procedure after every restart of Scilab. If you want to avoid this, use the [library functionality](https://help.scilab.org/doc/5.3.3/en_US/lib.html "") of Scilab.


  

## Licence

These scripts are free software: you can redistribute it and/or modify it under the terms of the GNU General Public License as published by the Free Software Foundation, either version 3 of the License, or (at your option) any later version.

These scripts are distributed in the hope that it will be useful, but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public License for more details.

You should have received a copy of the GNU General Public License along with this program. If not, see http://www.gnu.org/licenses/.