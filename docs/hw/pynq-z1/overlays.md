---
tags:
- hardware
- Xilinx
- PYNQ-Z1
---
# Overlays
By default, an overlay (bitstream) called base is downloaded into the PL at boot time. The base overlay can be considered like a reference design for a board. New overlays can be installed or copied to the board and can be loaded into the PL as the system is running.

An overlay usually includes:

- A bitstream to configure the FPGA fabric
- A Vivado design Tcl file to determine the available IP
- Python API that exposes the IPs as attributes

## Loading
### Instantiates

``` python
from pynq import Overlay
# instantiates the overlay and downloads it to the PL
overlay = Overlay("base.bit")
```

### Full Redownload

``` python
# for a full download of the bitstream
overlay.download()
```

### Partial Redownload

``` python
# set region
overlay.set_partial_region('block_0')

# download region
overlay.download('rm_0_partial.bit')
```

## Help

Once a overlas is instantiated the `help()` method can be used to discover its function.

``` python
from pynq.overlays.base import BaseOverlay
base_overlay = BaseOverlay("base.bit")

help(base_overlay)

help(base_overlay.leds)
```

## Existing Xilinx Overlays
### Computer PYNQ-ComputerVision

- [Github Repo PYNQ-ComputerVision](https://github.com/Xilinx/PYNQ-ComputerVision)

``` bash
# in my case Cython needed to be upgraded beforehands
pip3 install -U Cython

sudo pip3 install --upgrade git+https://github.com/Xilinx/PYNQ-ComputerVision.git
```

### QNN MO

- [Github Repo QNN-MO-PYNQ](https://github.com/Xilinx/QNN-MO-PYNQ)

``` bash
sudo pip3 install git+https://github.com/Xilinx/QNN-MO-PYNQ.git
```