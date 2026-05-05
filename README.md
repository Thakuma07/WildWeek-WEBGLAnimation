# Wild Week - Cursor-Driven Material Spotlight

A creative WebGL experience built with **Three.js** and **Vite**, featuring an interactive, cursor-driven spotlight effect on a 3D model. As the user moves their cursor over the canvas, a smooth spotlight follows the cursor, dynamically adjusting the material's roughness and diffuse color via custom GLSL shaders to reveal the underlying model.

## ✨ Features

- **Three.js Integration:** Implements robust 3D rendering with a carefully tuned environment map (`RoomEnvironment`) and ACESFilmic Tone Mapping.
- **GLTF Model Loading:** Seamlessly loads and displays a GLTF/GLB model (`model.glb`).
- **Custom GLSL Shaders:** Overrides the default Three.js materials using `onBeforeCompile` to inject custom vertex and fragment shaders.
- **Interactive Cursor Masking:** Casts a ray from the camera to an invisible mathematical plane, finding exact cursor intersection points to smoothly animate a visual "spotlight" using linear interpolation (lerp).
- **Vite Setup:** Lightning-fast HMR and optimized build setup with Vite. Native support for importing `.glsl` files natively via the `?raw` suffix.

## 📁 Project Structure

```
.
├── shaders/                   # Custom GLSL shader injection files
│   ├── vertexPars.glsl        # Vertex shader parameters
│   ├── vertexMain.glsl        # Vertex shader main logic
│   ├── fragmentPars.glsl      # Fragment shader parameters
│   └── fragmentMain.glsl      # Fragment shader main logic
├── index.html                 # Entry point HTML
├── script.js                  # Main Three.js application logic
├── styles.css                 # Base styling for full-screen rendering
├── package.json               # NPM dependencies and Vite scripts
└── README.md                  # Project documentation
```

## 🛠️ Technologies Used

- **HTML5 & CSS3**
- **JavaScript (ES6 Modules)**
- **Three.js** (WebGL Library)
- **Vite** (Build Tool and Development Server)

## 🚀 Getting Started

### Prerequisites

Ensure you have [Node.js](https://nodejs.org/) installed on your machine.

### Installation

1. Clone or download this repository.
2. Open your terminal in the project directory.
3. Install the dependencies:
   ```bash
   npm install
   ```

### Running the Development Server

Start the local Vite development server:

```bash
npm run dev
```

The terminal will output a local URL (usually `http://localhost:5173/`). Open that link in your browser to interact with the experience.

### Building for Production

To create an optimized production build:

```bash
npm run build
```
This will generate a `dist` folder containing the minified and optimized assets.

## 🎨 How it Works

1. **Raycasting**: A mathematical `THREE.Plane` is established on the Z-axis. As the mouse moves, a `THREE.Raycaster` projects from the camera and intersects the plane to retrieve accurate 3D world coordinates.
2. **Shader Injection**: The loaded model's materials are hooked using `onBeforeCompile`. Custom uniforms (`uHitPoint`, `uActive`, `uRadius`, `uSoftness`) are passed into the shaders.
3. **Smoothstep Masking**: The fragment shader uses the `distance` between the current pixel (`vWPos`) and the cursor's hit point (`uHitPoint`), creating a mask with `smoothstep`.
4. **Material Alteration**: Where the mask is active, the roughness decreases (making it shinier) and the diffuse color brightens, achieving the localized spotlight effect.
