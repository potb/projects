/// <reference types="vite/client" />
/// <reference types="vite-plugin-pwa/info" />

declare module '*as=meta' {
  export const src: string;

  export const width: number;

  export const height: number;
}

declare global {
  namespace App {}
}
