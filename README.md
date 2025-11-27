# 🎙️ Halo Voice Satellite

**A beautiful, curved enclosure for ESP32-based voice assistants**

[![Status](https://img.shields.io/badge/status-in%20development-orange)]()
[![Version](https://img.shields.io/badge/version-0.1.0--alpha-blue)]()
[![License](https://img.shields.io/badge/license-MIT-green)]()

---

## 🌟 Overview

Halo is a redesigned enclosure for Wyoming Protocol voice satellites, featuring:

- **Curved minimalist aesthetic** - Gentle 40mm radius front panel
- **Concentric mesh pattern** - Creates beautiful light diffusion with LED ring
- **Tapered profile** - Floating appearance (90mm front → 75mm back)
- **Tool-free assembly** - Press-fit clip system, no visible screws
- **Built-in USB access** - Chamfered cutout in bottom edge
- **Wall-mountable** - Integrated keyhole slots (50mm spacing)

This project is a complete redesign of the original rectangular voice satellite enclosure, addressing issues with aesthetics, assembly, and functionality.

---

## 📸 Preview

*Renderings coming soon!*

---

## 🎯 Project Goals

1. ✨ Create a visually stunning enclosure that doesn't look "3D printed"
2. 🔧 Simplify assembly with press-fit design (no glue required)
3. 🔊 Optimize acoustics with proper mesh pattern
4. 💡 Integrate LED ring for dynamic lighting effects
5. 📦 Minimize print time and material usage
6. 🛠️ Enable easy maintenance and servicing

---

## 📦 What You'll Need

### Electronics (Same as Original)
- ESP32-WROOM DevKit V1
- INMP441 MEMS Microphone Module
- WS2812B RGB LED Ring (37mm, 12 LEDs)
- MAX98357A I2S Amplifier
- Speaker (52mm, 4Ω, 3W)
- Jumper wires
- USB cable for power

### 3D Printed Parts
- `halo_front_panel.stl` (~25g, 3-4 hours)
- `halo_body.stl` (~45g, 3-4 hours)

### Hardware (Minimal!)
- 2× Wall mounting screws with anchors
- Optional: Hot glue for securing electronics

**That's it!** No standoffs, no assembly screws, no countersunk fasteners.

---

## 🖨️ Print Settings

**Recommended Settings:**
- **Layer Height**: 0.2mm
- **Infill**: 20% (body), 100% (front panel structural edges)
- **Supports**: Tree supports (front panel back side only)
- **Walls**: 3 perimeters minimum
- **Material**: PLA or PETG

**Front Panel:**
- Print face-down for best surface finish
- Enable supports for curved overhang
- Print time: ~3-4 hours

**Body:**
- Print with keyhole slots facing down
- No supports required
- Print time: ~3-4 hours

---

## 🔧 Assembly

*Detailed assembly guide coming soon!*

**Quick Overview:**
1. Mount electronics to body using hot glue
2. Wire all components according to wiring diagram
3. Mount LED ring and microphone to front panel
4. Connect front panel wiring
5. Press front panel into body (6 clips engage)
6. Hang on wall using keyhole slots

**Assembly time**: ~20 minutes

---

## 📊 Project Status

See [FEATURES.md](FEATURES.md) for complete feature tracking.

**Current Phase**: Design & CAD Modeling  
**Progress**: 0% (43 features marked FAILING)

---

## 🗂️ Repository Structure

```
halo-voice-satellite/
├── README.md              # This file
├── FEATURES.md            # Feature tracking and status
├── PROGRESS.md            # Development log
├── LICENSE                # MIT License
├── docs/                  # Documentation
│   ├── assembly_guide.md
│   ├── wiring_diagram.md
│   ├── print_settings.md
│   └── troubleshooting.md
├── cad/                   # CAD source files
│   ├── halo_front_panel.FCStd
│   ├── halo_body.FCStd
│   └── mesh_generator.py
├── stl/                   # Ready-to-print STL files
│   ├── halo_front_panel.stl
│   ├── halo_body.stl
│   └── halo_complete_assembly.stl
├── images/                # Photos and renderings
│   ├── renders/
│   └── build_photos/
└── firmware/              # ESPHome configuration
    └── halo_satellite.yaml
```

---

## 🤝 Contributing

This project is currently in active development. Contributions, ideas, and feedback are welcome!

**Ways to contribute:**
- Test prints on different printers
- Suggest design improvements
- Report issues or fitment problems
- Share your build photos
- Improve documentation

---

## 📄 License

This project is licensed under the MIT License - see [LICENSE](LICENSE) file for details.

**TL;DR**: You can use, modify, and distribute this design freely. Attribution appreciated but not required.

---

## 🙏 Acknowledgments

- Original voice satellite design team
- Home Assistant and ESPHome communities
- Wyoming Protocol developers

---

## 📞 Contact

- **Issues**: Use GitHub Issues for bug reports and feature requests
- **Discussions**: Use GitHub Discussions for questions and ideas

---

## 🔗 Related Projects

- [Wyoming Protocol](https://github.com/rhasspy/wyoming)
- [ESPHome](https://esphome.io/)
- [Home Assistant](https://www.home-assistant.io/)

---

**Built with ❤️ for the Home Assistant community**
