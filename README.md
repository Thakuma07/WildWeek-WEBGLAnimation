# Wild Week - Cursor-Driven Material Spotlight

A high-fidelity WebGL experience built with **Three.js** and **Vite**, featuring an interactive, cursor-driven spotlight effect on a highly detailed 3D scan. As you move your cursor, a dynamic "spotlight" follows, altering the material properties in real-time through custom GLSL shader injection.

![Project Preview](https://raw.githubusercontent.com/Thakuma07/WildWeek-WEBGLAnimation/main/preview.png) *(Note: Placeholder for actual preview image)*

## ✨ Features

- **High-Performance 3D Rendering**: Utilizes Three.js with ACESFilmic Tone Mapping and `RoomEnvironment` for realistic material response.
- **Dynamic GLSL Shaders**: Custom shader injection using `onBeforeCompile`, overriding standard materials to create localized visual effects.
- **Auto-Scaling Spotlight**: The spotlight radius and softness automatically adjust based on the loaded model's bounding box, ensuring consistent interaction across different assets.
- **Interactive Masking**: Uses raycasting against a mathematical plane to track the cursor in 3D space with smooth linear interpolation (lerp).
- **Optimized for Vite**: Leverage lightning-fast HMR and native GLSL module imports (`?raw`).

## 📁 Project Structure

```
.
├── model/                     # 3D assets (GLB/GLTF)
│   └── discobolus_the_discus_thrower.glb
├── shaders/                   # GLSL shader chunks
│   ├── vertexPars.glsl        # Varying definitions
│   ├── vertexMain.glsl        # World position calculation
│   ├── fragmentPars.glsl      # Uniforms and parameters
│   └── fragmentMain.glsl      # Masking and material logic
├── index.html                 # Main entry point
├── script.js                  # Application core
├── styles.css                 # Responsive layout
├── vite.config.js             # Asset handling configuration
└── package.json               # Dependencies and scripts
```

## 🛠️ Technologies Used

- **Three.js**: WebGL framework for 3D graphics.
- **GLSL**: Custom shader programming for material effects.
- **Vite**: Modern build tool for fast development.
- **Node.js**: Dependency management and build environment.

## 🚀 Getting Started

### Prerequisites

You will need [Node.js](https://nodejs.org/) installed.

### Installation

1. Clone the repository.
2. Install dependencies:
   ```bash
   npm install
   ```

### Development

Run the local development server:
```bash
npm run dev
```

### Production Build

Build for deployment:
```bash
npm run build
```

## 🎨 Technical Overview

1. **Model Centering**: Automatically centers any loaded GLB model at the origin `(0,0,0)` and fits the camera to its size.
2. **Shader Hooks**: Replaces standard Three.js shader chunks (`#include <metalnessmap_fragment>`, etc.) with custom logic.
3. **Smoothstep Mask**: Calculates a mask based on the distance from the world-space cursor position:
   ```glsl
   float reveal = 1.0 - smoothstep(uRadius, uRadius + uSoftness, d);
   ```
4. **Material Modulation**: Dynamically adjusts `roughnessFactor` and `diffuseColor` within the masked area to create the localized spotlight effect.

## 📜 Credits

- **3D Model**: [Discobolus the Discus Thrower](https://skfb.ly/VO9W)
- **Model Editor**: [Model Viewer Editor](https://modelviewer.dev/editor/)
- **Inspiration**: [Wild.Plus - Athens 2026](https://week.wild.plus/athens-26)

---
Developed by [Thakuma07](https://github.com/Thakuma07)
