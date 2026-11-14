import react from "@vitejs/plugin-react";
import { defineConfig } from "vite";

// https://vite.dev/config/
export default defineConfig({
  plugins: [react()],
  server: {
    proxy: {
      "/api": {
        target: "https://parmigiano-api.albert-krdoyan1.workers.dev",
        changeOrigin: true,
        secure: false,
      },
      "/img": {
        target: "https://pub-8d9b22e7eae042c0a88908f3d798b6bb.r2.dev",
        changeOrigin: true,
        rewrite: (path) =>
          path.replace(
            /^\/img/,
            "/%D5%8A%D5%A1%D6%80%D5%B4%D5%AB%D5%BB%D5%A1%D5%B6%D5%B8",
          ),
      },
    },
  },
});
